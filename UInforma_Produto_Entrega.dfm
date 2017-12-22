object FrmInforma_Produto_Entrega: TFrmInforma_Produto_Entrega
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento de Entrega'
  ClientHeight = 496
  ClientWidth = 909
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LblProduto: TLabel
    Left = 839
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 909
    Height = 457
    Hint = 'Aviso|Pressione Delete para remover o item selecionado|6'
    BorderStyle = bsNone
    DataSource = ds_itens_venda
    DrawingStyle = gdsGradient
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Pedido'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Venda'
        Title.Caption = 'Codigo Produto'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UN'
        Title.Caption = 'Un.'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICMS'
        Title.Caption = 'ST.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_Entregue'
        Title.Caption = 'Qtde. Ent.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_Restante'
        Title.Caption = 'Qtde. Res.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_S_Previsao'
        Title.Caption = 'Qtde. S. Prev.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Original'
        Title.Caption = 'Val. Orig.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Total'
        Title.Caption = 'Sub Total'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cancelado'
        Title.Caption = 'Can.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Entrega'
        Title.Caption = 'Entrega'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Entrega'
        Title.Caption = 'Hora'
        Visible = True
      end>
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 454
    Width = 909
    Height = 42
    Align = alBottom
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 75
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
    Images = DM.ImgImagens_Chama
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 1
    object BBtnOK: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Caption = '&OK'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = False
      OnClick = BBtnOKClick
    end
  end
  object qryitens_venda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    BeforeInsert = qryitens_vendaBeforeInsert
    BeforeScroll = qryitens_vendaBeforeScroll
    Parameters = <>
    SQL.Strings = (
      'select IP.*, M.Descricao as Marca from Itens_Pedido IP'
      'left join Produto P on (IP.Codigo_Produto = P.Codigo)'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)')
    Left = 616
    Top = 176
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
    end
    object qryitens_vendaQtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object qryitens_vendaQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qryitens_vendaData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qryitens_vendaQtde_S_Previsao: TFloatField
      FieldName = 'Qtde_S_Previsao'
    end
    object qryitens_vendaHora_Entrega: TStringField
      FieldName = 'Hora_Entrega'
      Size = 8
    end
  end
  object ds_itens_venda: TDataSource
    DataSet = qryitens_venda
    Left = 656
    Top = 176
  end
  object rs: TRSPrinter
    PageSize = pzLegal
    PageLength = 0
    FastPrinter = Epson_LX
    FastFont = [Compress]
    FastPort = 'LPT1'
    Mode = pmWindows
    SaveConfToRegistry = False
    Preview = ppNo
    Left = 792
    Top = 64
  end
  object qAux_Separacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    BeforeScroll = qryitens_vendaBeforeScroll
    Parameters = <>
    SQL.Strings = (
      'select IP.*, M.Descricao as Marca from Itens_Pedido IP'
      'left join Produto P on (IP.Codigo_Produto = P.Codigo)'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)')
    Left = 696
    Top = 176
    object qAux_SeparacaoCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qAux_SeparacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qAux_SeparacaoN_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object qAux_SeparacaoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qAux_SeparacaoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qAux_SeparacaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qAux_SeparacaoNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qAux_SeparacaoOrigem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object qAux_SeparacaoCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qAux_SeparacaoUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qAux_SeparacaoTipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object qAux_SeparacaoTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 10
    end
    object qAux_SeparacaoICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object qAux_SeparacaoCST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object qAux_SeparacaoCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object qAux_SeparacaoBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object qAux_SeparacaoBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 5
    end
    object qAux_SeparacaoBC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object qAux_SeparacaoValor_ICMS: TStringField
      FieldName = 'Valor_ICMS'
    end
    object qAux_SeparacaoTipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object qAux_SeparacaoMVAST: TStringField
      FieldName = 'MVAST'
      Size = 10
    end
    object qAux_SeparacaoICMS_ST: TStringField
      FieldName = 'ICMS_ST'
      Size = 10
    end
    object qAux_SeparacaoCST_ST: TStringField
      FieldName = 'CST_ST'
      Size = 10
    end
    object qAux_SeparacaoBase_Reduzida_ST: TStringField
      FieldName = 'Base_Reduzida_ST'
      Size = 5
    end
    object qAux_SeparacaoBase_Acrescida_ST: TStringField
      FieldName = 'Base_Acrescida_ST'
      Size = 5
    end
    object qAux_SeparacaoBC_ST: TStringField
      FieldName = 'BC_ST'
      Size = 10
    end
    object qAux_SeparacaoValor_ICMS_ST: TStringField
      FieldName = 'Valor_ICMS_ST'
    end
    object qAux_SeparacaoAliquota_Calculo_Credito: TStringField
      FieldName = 'Aliquota_Calculo_Credito'
      Size = 10
    end
    object qAux_SeparacaoCredito_ICMS: TStringField
      FieldName = 'Credito_ICMS'
    end
    object qAux_SeparacaoTipo_Calculo_IPI: TStringField
      FieldName = 'Tipo_Calculo_IPI'
    end
    object qAux_SeparacaoIPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object qAux_SeparacaoCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object qAux_SeparacaoBase_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object qAux_SeparacaoBase_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object qAux_SeparacaoBC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object qAux_SeparacaoValor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
    object qAux_SeparacaoTipo_Calculo_PIS: TStringField
      FieldName = 'Tipo_Calculo_PIS'
    end
    object qAux_SeparacaoPIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object qAux_SeparacaoCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object qAux_SeparacaoBase_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object qAux_SeparacaoBase_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object qAux_SeparacaoBC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object qAux_SeparacaoValor_PIS: TFloatField
      FieldName = 'Valor_PIS'
    end
    object qAux_SeparacaoTipo_Calculo_COFINS: TStringField
      FieldName = 'Tipo_Calculo_COFINS'
    end
    object qAux_SeparacaoCOFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object qAux_SeparacaoCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object qAux_SeparacaoBase_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object qAux_SeparacaoBase_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object qAux_SeparacaoBC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object qAux_SeparacaoValor_COFINS: TFloatField
      FieldName = 'Valor_COFINS'
    end
    object qAux_SeparacaoQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qAux_SeparacaoQtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object qAux_SeparacaoQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qAux_SeparacaoValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
    end
    object qAux_SeparacaoValor_Original: TFloatField
      FieldName = 'Valor_Original'
    end
    object qAux_SeparacaoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qAux_SeparacaoDesc_Acr: TFloatField
      FieldName = 'Desc_Acr'
    end
    object qAux_SeparacaoTipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object qAux_SeparacaoValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qAux_SeparacaoValor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object qAux_SeparacaoOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qAux_SeparacaoSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qAux_SeparacaoSub_Total_Liquido: TFloatField
      FieldName = 'Sub_Total_Liquido'
    end
    object qAux_SeparacaoCancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object qAux_SeparacaoIndica_Valor_Total: TStringField
      FieldName = 'Indica_Valor_Total'
      Size = 1
    end
    object qAux_SeparacaoData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qAux_SeparacaoTipo_Entrega: TStringField
      FieldName = 'Tipo_Entrega'
      Size = 1
    end
    object qAux_SeparacaoMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qAux_SeparacaoTipo_Venda: TStringField
      FieldName = 'Tipo_Venda'
      Size = 1
    end
  end
end
