object FrmConsulta_Historico_Movimentacao: TFrmConsulta_Historico_Movimentacao
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Hist'#243'rico de Movimenta'#231#245'es'
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
  DesignSize = (
    952
    536)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 233
    Top = 36
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 233
    Top = 75
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
    Left = 293
    Top = 75
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
  object DBGrid1: TDBGrid
    Left = 113
    Top = 110
    Width = 838
    Height = 426
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo_Reg'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Codigo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 228
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Funcion'#225'rio'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CliForn'
        Title.Caption = 'Cli./Forn.'
        Width = 157
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtde_Estoque_Atual'
        Title.Caption = 'Estoque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Title.Caption = 'Qtde.'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd'
        Title.Caption = 'Estoque Atual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 109
        Visible = True
      end>
  end
  object EdtProduto: TEdit
    Left = 290
    Top = 52
    Width = 269
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 1
    Width = 114
    Height = 107
    Caption = 'Consulta por'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Produto')
    TabOrder = 5
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
    TabOrder = 6
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
  object EdtCodigo_Produto: TEdit
    Left = 233
    Top = 52
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtCodigo_ProdutoKeyDown
    OnKeyPress = EdtCodigo_ProdutoKeyPress
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 233
    Top = 90
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  object MEdtData_Final: TMaskEdit
    Left = 293
    Top = 90
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
  end
  object qryconsulta_historico: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Codigo_Reg, Codigo, Descricao, Quantidade, Qtde_Estoque_A' +
        'tual, Data, Tipo, Nome, CliForn, Qtd from'
      
        '( select IE.Codigo as Codigo_Reg, P.Codigo, P.Descricao, (IE.Qua' +
        'ntidade) as Quantidade, IE.Qtde_Estoque_Atual, (IE.Qtde_Estoque_' +
        'Atual + ( IE.Quantidade * IE.Quantidade_Volume)) as Qtd, EP.Data' +
        '_Entrada as Data, '#39'ENTRADA'#39' as Tipo , '
      'F.Nome, Fo.Nome_Fantasia as CliForn from Itens_Entrada IE'
      'left join Produto P on (IE.Codigo_Produto = P.Codigo)'
      'left join Entrada_Produtos EP on (EP.Codigo = IE.Codigo)'
      'left join Fornecedor Fo on (EP.Codigo_Fornecedor = Fo.Codigo)'
      'left join Funcionario F on (EP.Codigo_Funcionario = F.Codigo)'
      ''
      'Union'
      ''
      
        'select IP.Codigo as Codigo_Reg, IP.Codigo_Produto, IP.Descricao,' +
        ' (IP.Qtde) as Qtde, IP.Qtde_Estoque_Atual, (IP.Qtde_Estoque_Atua' +
        'l - IP.Qtde) as Qtd, P.Data_Venda as Data,  '#39'SA'#205'DA'#39' as Tipo,'
      'F.Nome, Cli.Nome_Nome_Fantasia as CliForn from Itens_Pedido IP'
      'left join Pedido P on (IP.Codigo = P.Codigo) '
      'left join Funcionario F on (P.Codigo_Funcionario = F.Codigo) '
      'left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo) '
      ''
      ''
      'Union'
      ''
      
        'select ME.Codigo_Registro as Codigo_Reg, ME.Codigo_Produto, ME.D' +
        'escricao, ME.Quantidade as Qtde, ME.Estoque_Atual, '
      'Qtd = case when (ME.Natureza = '#39'ENTRADA MANUAL'#39') then'
      '    (ME.Estoque_Atual + ME.Quantidade)'
      '    when (ME.Natureza = '#39'SA'#205'DA MANUAL'#39') then'
      '    (ME.Estoque_Atual - ME.Quantidade) end, '
      ''
      'ME.Data, ME.Natureza, '
      'F.Nome, F2.Nome from Movimentacao_Estoque ME'
      'left join Funcionario F on (ME.Codigo_Funcionario = F.Codigo) '
      'left join Funcionario F2 on (ME.Codigo_Funcionario = F.Codigo) '
      ''
      ') X order by Codigo')
    Left = 669
    Top = 56
    object qryconsulta_historicoCodigo: TIntegerField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsulta_historicoDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Size = 300
    end
    object qryconsulta_historicoQuantidade: TFloatField
      Alignment = taCenter
      FieldName = 'Quantidade'
      ReadOnly = True
    end
    object qryconsulta_historicoData: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data'
      ReadOnly = True
    end
    object qryconsulta_historicoTipo: TStringField
      Alignment = taCenter
      FieldName = 'Tipo'
      ReadOnly = True
    end
    object qryconsulta_historicoNome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 50
    end
    object qryconsulta_historicoCliForn: TStringField
      FieldName = 'CliForn'
      ReadOnly = True
      Size = 50
    end
    object qryconsulta_historicoQtde_Estoque_Atual: TFloatField
      FieldName = 'Qtde_Estoque_Atual'
      ReadOnly = True
    end
    object qryconsulta_historicoCodigo_Reg: TIntegerField
      FieldName = 'Codigo_Reg'
      ReadOnly = True
    end
    object qryconsulta_historicoQtd: TFloatField
      FieldName = 'Qtd'
      ReadOnly = True
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_historico
    Left = 701
    Top = 56
  end
end
