object FrmConsulta_Comissao: TFrmConsulta_Comissao
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Comiss'#227'o'
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
    Left = 333
    Top = 45
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
    Left = 393
    Top = 45
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
  object Label2: TLabel
    Left = 460
    Top = 45
    Width = 65
    Height = 13
    Caption = 'Funcion'#225'rio'
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
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 2
    Width = 104
    Height = 76
    Caption = 'Consulta por'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Funcion'#225'rio')
    TabOrder = 3
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 333
    Top = 60
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
    Left = 393
    Top = 60
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
  object EdtFuncionario: TEdit
    Left = 517
    Top = 60
    Width = 200
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnKeyPress = EdtFuncionarioKeyPress
  end
  object EdtCodigo_Funcionario: TEdit
    Left = 460
    Top = 60
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
    TabOrder = 5
    OnKeyDown = EdtCodigo_FuncionarioKeyDown
    OnKeyPress = EdtCodigo_FuncionarioKeyPress
  end
  object RGTipo_Calculo: TRadioGroup
    Left = 223
    Top = 2
    Width = 104
    Height = 76
    Caption = 'Tipo de Calc.'
    ItemIndex = 0
    Items.Strings = (
      'Valor Maior'
      'Lucratividade')
    TabOrder = 6
  end
  object PageControl1: TPageControl
    Left = 113
    Top = 82
    Width = 845
    Height = 454
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 7
    object TabSheet1: TTabSheet
      Caption = 'Valor Maior'
      DesignSize = (
        837
        423)
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 837
        Height = 423
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
            FieldName = 'Nome'
            Width = 281
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Salario'
            Title.Caption = 'Sal'#225'rio'
            Width = 120
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Pedido'
            Title.Caption = 'Total Pedido'
            Width = 120
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Comissao'
            Title.Caption = 'Total Comiss'#227'o'
            Width = 120
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Salario'
            Title.Caption = 'Total Sal'#225'rio'
            Width = 120
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Lucratividade'
      ImageIndex = 1
      DesignSize = (
        837
        423)
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 837
        Height = 423
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
            FieldName = 'Nome'
            Title.Caption = 'Vendedor'
            Width = 323
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Compra'
            Title.Caption = 'Custo Total'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Venda'
            Title.Caption = 'Venda Total'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Title.Caption = '%'
            Visible = True
          end>
      end
    end
  end
  object qryconsulta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Fun.Nome, Fun.Salario, sum(IP.Valor_Unitario * IP.Qtde) a' +
        's Total_Pedido, '
      
        'sum(IP.Valor_Unitario * IP.Qtde * (IP.Comissao / 100)) as Total_' +
        'Comissao,'
      
        '(Fun.Salario + sum((IP.Valor_Unitario * IP.Qtde) * (IP.Comissao ' +
        '/ 100))) as Total_Salario from Pedido Ped'
      'left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)'
      
        'left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codig' +
        'o)'
      'group by Fun.Nome, Fun.Salario')
    Left = 469
    Top = 272
    object qryconsultaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsultaSalario: TFloatField
      FieldName = 'Salario'
      DisplayFormat = 'R$ #0.0,0'
    end
    object qryconsultaTotal_Comissao: TFloatField
      FieldName = 'Total_Comissao'
      ReadOnly = True
      DisplayFormat = 'R$ #0.0,0'
    end
    object qryconsultaTotal_Salario: TFloatField
      FieldName = 'Total_Salario'
      ReadOnly = True
      DisplayFormat = 'R$ #0.0,0'
    end
    object qryconsultaTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      ReadOnly = True
      DisplayFormat = 'R$ #0.0,0'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta
    Left = 501
    Top = 272
  end
  object qrylucratividade: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select F.Nome, sum(IP.Valor_Compra * IP.Qtde) as Valor_Compra, s' +
        'um(IP.Valor_Unitario * IP.Qtde) as Valor_Venda,'
      
        '( (sum(IP.Valor_Unitario * IP.Qtde) - sum(IP.Valor_Compra * IP.Q' +
        'tde)) / sum(IP.Valor_Unitario * IP.Qtde) *100 ) as Total from It' +
        'ens_Pedido IP'
      'left join Pedido P on (IP.Codigo = P.Codigo) '
      'left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)'
      'group by P.Codigo_Funcionario, F.Nome')
    Left = 469
    Top = 336
    object qrylucratividadeNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrylucratividadeValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qrylucratividadeValor_Venda: TFloatField
      FieldName = 'Valor_Venda'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qrylucratividadeTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource1: TDataSource
    DataSet = qrylucratividade
    Left = 501
    Top = 336
  end
end
