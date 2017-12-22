object FrmConsulta_Saldo_Estoque: TFrmConsulta_Saldo_Estoque
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Saldo do Estoque'
  ClientHeight = 536
  ClientWidth = 952
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
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 352
    Top = 71
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
  object Label4: TLabel
    Left = 412
    Top = 71
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 98
    Caption = 'ToolBar1'
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
    HotTrackColor = clMenu
    Images = DM.ImgImagens_Consulta
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 2
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFiltrarClick
    end
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para limpar a pesquisa realizada e iniciar outra'
      Caption = 'Li&mpar'
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnLimparClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para imprimir a pesquisa realizada'
      Caption = 'Imp&rimir'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnImprimirClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object RGNatureza: TRadioGroup
    Left = 233
    Top = -2
    Width = 114
    Height = 106
    Caption = 'Natureza'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Entrada'
      'Sa'#237'da')
    TabOrder = 3
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 352
    Top = 86
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object MEdtData_Final: TMaskEdit
    Left = 412
    Top = 86
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = -2
    Width = 114
    Height = 106
    Caption = 'Consulta por'
    ItemIndex = 0
    Items.Strings = (
      'Geral'
      'Geral 2'
      'Produto'
      'Produto/Data')
    TabOrder = 4
  end
  object PageControl1: TPageControl
    Left = 113
    Top = 109
    Width = 840
    Height = 427
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = 'Geral'
      DesignSize = (
        832
        396)
      object DBGrid2: TDBGrid
        Left = 3
        Top = 3
        Width = 829
        Height = 393
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        DataSource = DataSource1
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Sigla'
            Title.Caption = 'UM'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Est'
            Title.Caption = 'Estoque Total'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Val_Compra'
            Title.Caption = 'Custo Total'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total'
            Title.Caption = 'Saldo Total'
            Width = 90
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Geral 2'
      ImageIndex = 3
      DesignSize = (
        832
        396)
      object DBGrid3: TDBGrid
        Left = 3
        Top = 3
        Width = 829
        Height = 393
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        DataSource = DataSource2
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Estoque'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Width = 100
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Produto'
      ImageIndex = 1
      object Label1: TLabel
        Left = 272
        Top = 47
        Width = 320
        Height = 25
        Caption = 'Relat'#243'rio em Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Produto/Data'
      ImageIndex = 2
      DesignSize = (
        832
        396)
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 829
        Height = 393
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        DataSource = ds_qry_consulta_padrao
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo_Venda'
            Title.Caption = 'Codigo Venda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Estoque_Atual'
            Title.Caption = 'Estoque'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Compra'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Total'
            Title.Caption = 'Valor Total'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Custo_Medio'
            Title.Caption = 'Custo M'#233'dio'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Saldo_Quantidade'
            Title.Caption = 'Saldo Atual (Qtde)'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Saldo_Valor'
            Title.Caption = 'Saldo Atual (R$)'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Natureza'
            Width = 92
            Visible = True
          end>
      end
    end
  end
  object qryconsulta_saldo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select ME.* from Movimentacao_Estoque ME')
    Left = 469
    Top = 272
    object qryconsulta_saldoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryconsulta_saldoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_saldoNatureza: TStringField
      FieldName = 'Natureza'
    end
    object qryconsulta_saldoData: TDateTimeField
      FieldName = 'Data'
    end
    object qryconsulta_saldoEstoque_Atual: TFloatField
      FieldName = 'Estoque_Atual'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoCusto_Medio: TFloatField
      FieldName = 'Custo_Medio'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoSaldo_Quantidade: TFloatField
      FieldName = 'Saldo_Quantidade'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoSaldo_Valor: TFloatField
      FieldName = 'Saldo_Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_saldo
    Left = 501
    Top = 272
  end
  object qryconsulta_saldo_geral: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select UM.Sigla, sum(Estoque) as Est, sum(Valor_Compra) as Val_C' +
        'ompra, '
      '(sum(Estoque) * sum(Valor_Compra)) as Total from Produto P'
      
        'left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Cod' +
        'igo)'
      'group by UM.Sigla')
    Left = 525
    Top = 40
    object qryconsulta_saldo_geralTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldo_geralEst: TFloatField
      FieldName = 'Est'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldo_geralVal_Compra: TFloatField
      FieldName = 'Val_Compra'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldo_geralSigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = qryconsulta_saldo_geral
    Left = 557
    Top = 40
  end
  object qryconsulta_saldo_geral2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select sum(Estoque) as Estoque, sum(Estoque * Valor_Compra) as T' +
        'otal from Produto P')
    Left = 637
    Top = 40
    object qryconsulta_saldo_geral2Estoque: TFloatField
      FieldName = 'Estoque'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldo_geral2Total: TFloatField
      FieldName = 'Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource2: TDataSource
    DataSet = qryconsulta_saldo_geral2
    Left = 669
    Top = 40
  end
end
