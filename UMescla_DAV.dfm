object FrmMescla_DAV: TFrmMescla_DAV
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informar Itens para o DAV'
  ClientHeight = 497
  ClientWidth = 900
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 3
    Top = 78
    Width = 892
    Height = 139
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Pedido'
        Title.Caption = 'DAV'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mesclada'
        Visible = True
      end>
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 455
    Width = 900
    Height = 42
    Align = alBottom
    ButtonHeight = 38
    ButtonWidth = 81
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
    TabOrder = 1
    object BBtnOK: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Caption = '&Inserir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = False
      OnClick = BBtnOKClick
    end
    object BBtnFechar: TToolButton
      Left = 81
      Top = 0
      Cursor = crHandPoint
      Caption = '&Fechar'
      ImageIndex = 1
      OnClick = BBtnFecharClick
    end
  end
  object Panel1: TPanel
    Left = 2
    Top = 49
    Width = 898
    Height = 28
    BorderStyle = bsSingle
    Caption = 'DAV'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 3
    Top = 246
    Width = 892
    Height = 203
    BorderStyle = bsNone
    DataSource = DataSource2
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Item'
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
        Title.Caption = 'C'#243'digo Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UN'
        Title.Caption = 'Un.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICMS'
        Title.Caption = 'ST'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IPI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Base_Reducao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'BC'
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Qtde_Restante'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desc_Acr'
        Title.Caption = 'Desc./Acr.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Desc_Acr'
        Title.Caption = 'T. Desc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Total'
        Title.Caption = 'Sub Total'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cancelado'
        Visible = False
      end>
  end
  object Panel2: TPanel
    Left = 2
    Top = 217
    Width = 898
    Height = 28
    BorderStyle = bsSingle
    Caption = 'Itens DAV'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object EdtDAV: TEdit
    Left = 0
    Top = 26
    Width = 164
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 5
    OnChange = EdtDAVChange
  end
  object RGTipo: TRadioGroup
    Left = 176
    Top = 1
    Width = 113
    Height = 43
    Caption = 'Tipo'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Selecionados')
    TabOrder = 6
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Ped.Codigo, Ped.N_Pedido, Ped.Status, Ped.Mesclada from P' +
        'edido Ped')
    Left = 224
    Top = 168
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1N_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object ADOQuery1Status: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object ADOQuery1Mesclada: TIntegerField
      FieldName = 'Mesclada'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 256
    Top = 168
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IP.* from Itens_Pedido IP')
    Left = 224
    Top = 216
    object ADOQuery2Codigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object ADOQuery2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery2N_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object ADOQuery2Codigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object ADOQuery2Codigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object ADOQuery2Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery2NCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object ADOQuery2Origem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object ADOQuery2CFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object ADOQuery2UN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object ADOQuery2Tipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object ADOQuery2Tipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 10
    end
    object ADOQuery2ICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object ADOQuery2CST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object ADOQuery2CSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object ADOQuery2Base_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object ADOQuery2BC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object ADOQuery2Valor_ICMS: TStringField
      FieldName = 'Valor_ICMS'
    end
    object ADOQuery2MVAST: TStringField
      FieldName = 'MVAST'
      Size = 10
    end
    object ADOQuery2ICMS_ST: TStringField
      FieldName = 'ICMS_ST'
      Size = 10
    end
    object ADOQuery2CST_ST: TStringField
      FieldName = 'CST_ST'
      Size = 10
    end
    object ADOQuery2Base_Reduzida_ST: TStringField
      FieldName = 'Base_Reduzida_ST'
      Size = 5
    end
    object ADOQuery2Base_Acrescida_ST: TStringField
      FieldName = 'Base_Acrescida_ST'
      Size = 5
    end
    object ADOQuery2BC_ST: TStringField
      FieldName = 'BC_ST'
      Size = 10
    end
    object ADOQuery2Aliquota_Calculo_Credito: TStringField
      FieldName = 'Aliquota_Calculo_Credito'
      Size = 10
    end
    object ADOQuery2Credito_ICMS: TStringField
      FieldName = 'Credito_ICMS'
    end
    object ADOQuery2Tipo_Calculo_IPI: TStringField
      FieldName = 'Tipo_Calculo_IPI'
    end
    object ADOQuery2IPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object ADOQuery2CST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object ADOQuery2Base_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object ADOQuery2Base_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object ADOQuery2BC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object ADOQuery2Valor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
    object ADOQuery2Tipo_Calculo_PIS: TStringField
      FieldName = 'Tipo_Calculo_PIS'
    end
    object ADOQuery2PIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object ADOQuery2CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object ADOQuery2Base_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object ADOQuery2Base_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object ADOQuery2BC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object ADOQuery2Valor_PIS: TFloatField
      FieldName = 'Valor_PIS'
    end
    object ADOQuery2Tipo_Calculo_COFINS: TStringField
      FieldName = 'Tipo_Calculo_COFINS'
    end
    object ADOQuery2COFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object ADOQuery2CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object ADOQuery2Base_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object ADOQuery2Base_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object ADOQuery2BC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object ADOQuery2Valor_COFINS: TFloatField
      FieldName = 'Valor_COFINS'
    end
    object ADOQuery2Qtde: TFloatField
      FieldName = 'Qtde'
    end
    object ADOQuery2Qtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object ADOQuery2Qtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object ADOQuery2Qtde_S_Previsao: TFloatField
      FieldName = 'Qtde_S_Previsao'
    end
    object ADOQuery2Valor_Compra: TFloatField
      FieldName = 'Valor_Compra'
    end
    object ADOQuery2Valor_Original: TFloatField
      FieldName = 'Valor_Original'
    end
    object ADOQuery2Valor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object ADOQuery2Desc_Acr: TFloatField
      FieldName = 'Desc_Acr'
    end
    object ADOQuery2Desc_Acr_P: TFloatField
      FieldName = 'Desc_Acr_P'
    end
    object ADOQuery2Tipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object ADOQuery2dOUa: TStringField
      FieldName = 'dOUa'
      Size = 1
    end
    object ADOQuery2Valor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object ADOQuery2Valor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object ADOQuery2Outras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object ADOQuery2Sub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object ADOQuery2Sub_Total_Liquido: TFloatField
      FieldName = 'Sub_Total_Liquido'
    end
    object ADOQuery2Cancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object ADOQuery2Indica_Valor_Total: TStringField
      FieldName = 'Indica_Valor_Total'
      Size = 1
    end
    object ADOQuery2Data_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object ADOQuery2Hora_Entrega: TStringField
      FieldName = 'Hora_Entrega'
      Size = 8
    end
    object ADOQuery2Tipo_Entrega: TStringField
      FieldName = 'Tipo_Entrega'
      Size = 1
    end
    object ADOQuery2Tipo_Venda: TStringField
      FieldName = 'Tipo_Venda'
      Size = 1
    end
    object ADOQuery2Comissao: TFloatField
      FieldName = 'Comissao'
    end
    object ADOQuery2Perc_Desc_Vista: TFloatField
      FieldName = 'Perc_Desc_Vista'
    end
    object ADOQuery2Perc_Desc_Prazo: TFloatField
      FieldName = 'Perc_Desc_Prazo'
    end
    object ADOQuery2Permite_Credito: TIntegerField
      FieldName = 'Permite_Credito'
    end
    object ADOQuery2Codigo_Obs_Fiscal: TIntegerField
      FieldName = 'Codigo_Obs_Fiscal'
    end
    object ADOQuery2Qtde_Estoque_Atual: TFloatField
      FieldName = 'Qtde_Estoque_Atual'
    end
    object ADOQuery2Valor_Compra_Nota: TFloatField
      FieldName = 'Valor_Compra_Nota'
    end
    object ADOQuery2Valor_ICMS_ST: TFloatField
      FieldName = 'Valor_ICMS_ST'
    end
    object ADOQuery2Tipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object ADOQuery2Ficha_Estoque_Codigo: TIntegerField
      FieldName = 'Ficha_Estoque_Codigo'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 256
    Top = 216
  end
end
