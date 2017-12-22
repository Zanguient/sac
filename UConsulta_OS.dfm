object FrmConsulta_OS: TFrmConsulta_OS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta OS'
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
  object LblCli: TLabel
    Left = 572
    Top = 46
    Width = 39
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 716
    Top = 8
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
  object Label3: TLabel
    Left = 776
    Top = 8
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
  object Label4: TLabel
    Left = 823
    Top = 46
    Width = 43
    Height = 13
    Caption = 'DAV-OS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label24: TLabel
    Left = 571
    Top = 3
    Width = 37
    Height = 13
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RGConsulta_Por: TRadioGroup
    Left = 215
    Top = 0
    Width = 106
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'N'#186' DAV'
      'Cliente'
      'Atendente')
    TabOrder = 1
    OnClick = RGConsulta_PorClick
  end
  object EdtCliente: TEdit
    Left = 629
    Top = 61
    Width = 195
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
  end
  object RGOrdena_Por: TRadioGroup
    Left = 439
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Data Servi'#231'o'
      'Data Prev. Ent.'
      'Data Entrega'
      'Cliente')
    TabOrder = 3
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
    TabOrder = 10
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
    object BBtnExportar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = '&Exp. XLS'
      Enabled = False
      ImageIndex = 8
      Wrap = True
      OnClick = BBtnExportarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo_Cliente: TEdit
    Left = 572
    Top = 61
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
    TabOrder = 7
    OnKeyDown = EdtCodigo_ClienteKeyDown
    OnKeyPress = EdtCodigo_ClienteKeyPress
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 716
    Top = 23
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  object MEdtData_Final: TMaskEdit
    Left = 776
    Top = 23
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 6
    Text = '  /  /    '
  end
  object EdtDAV_OS: TEdit
    Left = 823
    Top = 61
    Width = 93
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnKeyDown = EdtCodigo_ClienteKeyDown
  end
  object RGTipo: TRadioGroup
    Left = 119
    Top = 0
    Width = 90
    Height = 107
    Caption = 'Tipo Rel.'
    ItemIndex = 0
    Items.Strings = (
      'Anal'#237'tico'
      'Sint'#233'tico'
      'Comiss'#227'o'
      'Agrupados')
    TabOrder = 0
    OnClick = RGTipoClick
  end
  object PageControl1: TPageControl
    Left = 119
    Top = 113
    Width = 829
    Height = 423
    Cursor = crHandPoint
    ActivePage = TabSheet4
    Style = tsFlatButtons
    TabOrder = 11
    object TabSheet1: TTabSheet
      Caption = 'Anal'#237'tico'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 23
        Width = 821
        Height = 113
        BorderStyle = bsNone
        DataSource = dsConsulta_OS
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
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Pedido'
            Title.Caption = 'N'#186' Pedido'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cliente'
            Width = 298
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Veiculo'
            Title.Caption = 'Ve'#237'culo'
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cond_Pag'
            Title.Caption = 'Cond. Pag.'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Funcionario'
            Title.Caption = 'Atendente'
            Width = 188
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Venda'
            Title.Caption = 'Servi'#231'o'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Vencimento'
            Title.Caption = 'Vencimento'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Previsao_Entrega'
            Title.Caption = 'Prev. Entrega'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Entrega'
            Title.Caption = 'Entrega'
            Width = 66
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde_Itens'
            Title.Caption = 'Qtde. Itens'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde_Servicos'
            Title.Caption = 'Qtde. Servi'#231'os'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Produtos'
            Title.Caption = 'Total Produtos'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Servicos'
            Title.Caption = 'Total Servi'#231'os'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Pedido'
            Title.Caption = 'Total Pedido'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Kilometragem'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 25
        BorderStyle = bsSingle
        Caption = 'OS(s)'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 164
        Width = 821
        Height = 117
        BorderStyle = bsNone
        DataSource = dsItens_OS
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid2DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Venda'
            Title.Caption = 'C'#243'digo Venda'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 367
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde'
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Sub_Total'
            Title.Caption = 'Sub Total'
            Width = 90
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 139
        Width = 821
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Produtos OS'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 311
        Width = 821
        Height = 78
        BorderStyle = bsNone
        DataSource = dsServicos_OS
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
        OnDrawColumnCell = DBGrid2DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Servico'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Mec'#226'nico'
            Width = 238
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Comissao'
            Title.Caption = 'Comiss'#227'o'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao_Servico'
            Title.Caption = 'Servi'#231'o'
            Width = 247
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ISS'
            Width = 34
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde'
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Desconto'
            Width = 68
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Tipo_Desconto'
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Sub_Total'
            Title.Caption = 'Sub Total'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Registro'
            Visible = False
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 283
        Width = 821
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Servi'#231'os OS'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sint'#233'tico'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 25
        BorderStyle = bsSingle
        Caption = 'OS(s)'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 31
        Width = 821
        Height = 366
        BorderStyle = bsNone
        DataSource = DataSource1
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Pedido'
            Title.Caption = 'N'#186' Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cliente'
            Width = 247
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Veiculo'
            Title.Caption = 'Ve'#237'culo'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Venda'
            Title.Caption = 'Data Venda'
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Produtos'
            Title.Caption = 'Total Produtos'
            Width = 110
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Servicos'
            Title.Caption = 'Total Servi'#231'os'
            Width = 110
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Pedido'
            Title.Caption = 'Total Pedido'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Funcionario'
            Title.Caption = 'Atendente'
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Comiss'#227'o'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Comiss'#227'o'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid5: TDBGrid
        Left = 0
        Top = 27
        Width = 821
        Height = 366
        BorderStyle = bsNone
        DataSource = DataSource2
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'N_Pedido'
            Title.Caption = 'N'#186' Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Nome_Fantasia'
            Title.Caption = 'Cliente'
            Width = 204
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Funcionario'
            Title.Caption = 'Funcion'#225'rio'
            Width = 217
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Comissao'
            Title.Caption = 'Comiss'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao_Servico'
            Title.Caption = 'Servi'#231'o'
            Width = 209
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 92
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Desconto'
            Width = 89
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Sub_Total'
            Title.Caption = 'Sub Total'
            Width = 100
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Agrupados'
      ImageIndex = 3
      object Panel6: TPanel
        Left = 816
        Top = 3
        Width = 821
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Servi'#231'os Agrupados'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid6: TDBGrid
        Left = 816
        Top = 29
        Width = 821
        Height = 366
        BorderStyle = bsNone
        DataSource = DataSource3
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Grupo'
            Width = 238
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao_Servico'
            Title.Caption = 'Servi'#231'o'
            Width = 226
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CodGrupo'
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde'
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Desconto'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Sub_Total'
            Title.Caption = 'Sub Total'
            Width = 89
            Visible = True
          end>
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 821
        Height = 392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = True
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = True
          Navigator.Buttons.GotoBookmark.Visible = True
          Navigator.Buttons.Filter.Visible = True
          FilterBox.CustomizeButtonAlignment = fbaLeft
          FilterBox.Position = fpTop
          FilterBox.Visible = fvNever
          DataController.DataSource = DataSource3
          DataController.Filter.Active = True
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              Column = cxGrid1DBTableView1Sub_Total
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              Column = cxGrid1DBTableView1Sub_Total
            end>
          DataController.Summary.SummaryGroups = <>
          DateTimeHandling.DateFormat = 'DD/MM/YYYY'
          FilterRow.InfoText = 'Clique para definir um filtro'
          FilterRow.Visible = True
          NewItemRow.InfoText = 'Clique para adicionar uma nova linha'
          NewItemRow.SeparatorColor = clMenu
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = 'N'#227'o h'#225' dados para visualizar'
          OptionsView.Footer = True
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.Indicator = True
          Preview.Visible = True
          Styles.ContentEven = DM.cxStyle1
          Styles.Footer = DM.cxStyle2
          Styles.GroupSummary = DM.cxStyle2
          Styles.Header = DM.cxStyle2
          object cxGrid1DBTableView1Grupo: TcxGridDBColumn
            DataBinding.FieldName = 'Grupo'
            Options.Editing = False
            Width = 261
          end
          object cxGrid1DBTableView1Data_Venda: TcxGridDBColumn
            Caption = 'Data Venda'
            DataBinding.FieldName = 'Data_Venda'
            Options.Editing = False
            Width = 87
          end
          object cxGrid1DBTableView1Descricao_Servico: TcxGridDBColumn
            Caption = 'Servi'#231'o'
            DataBinding.FieldName = 'Descricao_Servico'
            Options.Editing = False
            Width = 179
          end
          object cxGrid1DBTableView1Qtde: TcxGridDBColumn
            Caption = 'Qtde.'
            DataBinding.FieldName = 'Qtde'
            Options.Editing = False
            Width = 52
          end
          object cxGrid1DBTableView1Valor_Unitario: TcxGridDBColumn
            Caption = 'Valor Unit'#225'rio'
            DataBinding.FieldName = 'Valor_Unitario'
            Options.Editing = False
            Width = 95
          end
          object cxGrid1DBTableView1Desconto: TcxGridDBColumn
            DataBinding.FieldName = 'Desconto'
            Options.Editing = False
            Width = 85
          end
          object cxGrid1DBTableView1Sub_Total: TcxGridDBColumn
            Caption = 'Sub Total'
            DataBinding.FieldName = 'Sub_Total'
            Options.Editing = False
            Width = 79
          end
        end
        object cxGrid1TableView1: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1TableView1Column1: TcxGridColumn
          end
        end
        object cxGrid1DBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FilterBox.Visible = fvNever
          DataController.DetailKeyFieldNames = 'Codigo'
          DataController.KeyFieldNames = 'Codigo'
          DataController.MasterKeyFieldNames = 'Codigo'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsView.Footer = True
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.Indicator = True
          object cxGrid1DBTableView2Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'Codigo'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Codigo_Produto: TcxGridDBColumn
            Caption = 'C'#243'digo Sistema'
            DataBinding.FieldName = 'Codigo_Produto'
            Options.Editing = False
            Width = 80
          end
          object cxGrid1DBTableView2Codigo_Venda: TcxGridDBColumn
            Caption = 'C'#243'digo Venda'
            DataBinding.FieldName = 'Codigo_Venda'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
            Options.Editing = False
            Width = 400
          end
          object cxGrid1DBTableView2UN: TcxGridDBColumn
            Caption = 'Un.'
            DataBinding.FieldName = 'UN'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Qtde: TcxGridDBColumn
            Caption = 'Qtde.'
            DataBinding.FieldName = 'Qtde'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Valor_Original: TcxGridDBColumn
            Caption = 'Valor Tabela'
            DataBinding.FieldName = 'Valor_Original'
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Desc_Acr: TcxGridDBColumn
            Caption = 'Desconto'
            DataBinding.FieldName = 'Desc_Acr'
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Valor_Unitario: TcxGridDBColumn
            Caption = 'Valor Unit'#225'rio'
            DataBinding.FieldName = 'Valor_Unitario'
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Valor_Compra: TcxGridDBColumn
            Caption = 'Custo'
            DataBinding.FieldName = 'Valor_Compra'
            Visible = False
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Sub_Total: TcxGridDBColumn
            Caption = 'Sub Total'
            DataBinding.FieldName = 'Sub_Total'
            Options.Editing = False
            Width = 100
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object CmbStatus: TDBLookupComboBox
    Left = 572
    Top = 19
    Width = 134
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = DM.DataSource9
    TabOrder = 4
  end
  object RGData: TRadioGroup
    Left = 327
    Top = 0
    Width = 106
    Height = 107
    Caption = 'Datas'
    ItemIndex = 0
    Items.Strings = (
      'Data Servi'#231'o'
      'Data Prev. Ent.'
      'Data Entrega')
    TabOrder = 2
  end
  object qryconsulta_os: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo, P.N_Pedido, P.Data_Venda, P.Data_Vencimento, P.' +
        'Qtde_Itens, P.Qtde_Servicos,'
      
        'P.Total_Produtos, P.Total_Servicos, P.Total_Pedido, P.Data_Previ' +
        'sao_Entrega, P.Data_Entrega, '
      
        'P.Kilometragem, CP.Descricao as Cond_Pag, C.Nome_Nome_Fantasia a' +
        's Cliente, (V.Veiculo + '#39' - '#39' + V.Placa) as Veiculo, Fun.Nome as' +
        ' Funcionario from Pedido P'
      'left join Cliente C on (C.Codigo = P.Codigo_Cliente)'
      'left join Veiculo V on (V.Codigo = P.Codigo_Veiculo)'
      'left join Funcionario Fun on (P.Codigo_Funcionario = Fun.Codigo)'
      
        'left join Condicao_Pagamento CP on (P.Codigo_Forma_Pag = CP.Codi' +
        'go)')
    Left = 574
    Top = 88
    object qryconsulta_osCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_osN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qryconsulta_osData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryconsulta_osData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_osQtde_Itens: TIntegerField
      FieldName = 'Qtde_Itens'
    end
    object qryconsulta_osQtde_Servicos: TIntegerField
      FieldName = 'Qtde_Servicos'
    end
    object qryconsulta_osTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
      currency = True
    end
    object qryconsulta_osTotal_Servicos: TFloatField
      FieldName = 'Total_Servicos'
      currency = True
    end
    object qryconsulta_osTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      currency = True
    end
    object qryconsulta_osData_Previsao_Entrega: TDateTimeField
      FieldName = 'Data_Previsao_Entrega'
    end
    object qryconsulta_osData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qryconsulta_osKilometragem: TFloatField
      FieldName = 'Kilometragem'
    end
    object qryconsulta_osCond_Pag: TStringField
      FieldName = 'Cond_Pag'
      Size = 30
    end
    object qryconsulta_osCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object qryconsulta_osVeiculo: TStringField
      FieldName = 'Veiculo'
      Size = 50
    end
    object qryconsulta_osFuncionario: TStringField
      FieldName = 'Funcionario'
      Size = 50
    end
  end
  object dsConsulta_OS: TDataSource
    DataSet = qryconsulta_os
    Left = 606
    Top = 88
  end
  object qryitens_os: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = dsConsulta_OS
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select IP.Codigo, IP.Codigo_Venda, IP.Descricao, IP.NCM, IP.Qtde' +
        ', IP.Valor_Unitario,'
      'IP.Sub_Total from Itens_Pedido IP'
      'where Codigo = :Codigo and Cancelado = '#39'N'#39)
    Left = 643
    Top = 90
    object qryitens_osCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_osCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_osDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qryitens_osNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qryitens_osQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryitens_osValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      currency = True
    end
    object qryitens_osSub_Total: TFloatField
      FieldName = 'Sub_Total'
      currency = True
    end
  end
  object dsItens_OS: TDataSource
    DataSet = qryitens_os
    Left = 675
    Top = 90
  end
  object qryservicos_os: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = dsConsulta_OS
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select IOS.*, F.Nome from Itens_OS IOS'
      'left join Funcionario F on (IOS.Codigo_Mecanico = F.Codigo)'
      'where IOS.Codigo = :Codigo')
    Left = 835
    Top = 90
    object qryservicos_osCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryservicos_osCodigo_Servico: TIntegerField
      FieldName = 'Codigo_Servico'
    end
    object qryservicos_osValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      currency = True
    end
    object qryservicos_osDesconto: TFloatField
      FieldName = 'Desconto'
      currency = True
    end
    object qryservicos_osTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryservicos_osSub_Total: TFloatField
      FieldName = 'Sub_Total'
      currency = True
    end
    object qryservicos_osDescricao_Servico: TStringField
      FieldName = 'Descricao_Servico'
      Size = 300
    end
    object qryservicos_osISS: TStringField
      FieldName = 'ISS'
      Size = 10
    end
    object qryservicos_osQtde: TIntegerField
      FieldName = 'Qtde'
    end
    object qryservicos_osCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryservicos_osCodigo_Mecanico: TIntegerField
      FieldName = 'Codigo_Mecanico'
    end
    object qryservicos_osComissao: TFloatField
      FieldName = 'Comissao'
      DisplayFormat = '#0.0,0'
    end
    object qryservicos_osNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object dsServicos_OS: TDataSource
    DataSet = qryservicos_os
    Left = 867
    Top = 90
  end
  object qrysintetico_os: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo, P.N_Pedido, P.Data_Venda, P.Total_Pedido, P.Tot' +
        'al_Produtos, P.Total_Servicos,'
      
        'C.Nome_Nome_Fantasia as Cliente, (V.Veiculo +'#39' - '#39' + V.Placa) as' +
        ' Veiculo, Fun.Nome as Funcionario from Pedido P'
      'left join Cliente C on (C.Codigo = P.Codigo_Cliente)'
      'left join Veiculo V on (V.Codigo = P.Codigo_Veiculo)'
      'left join Funcionario Fun on (P.Codigo_Funcionario = Fun.Codigo)')
    Left = 734
    Top = 88
    object qrysintetico_osCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrysintetico_osN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qrysintetico_osData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qrysintetico_osTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      currency = True
    end
    object qrysintetico_osCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object qrysintetico_osVeiculo: TStringField
      FieldName = 'Veiculo'
      Size = 50
    end
    object qrysintetico_osFuncionario: TStringField
      FieldName = 'Funcionario'
      Size = 50
    end
    object qrysintetico_osTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
      currency = True
    end
    object qrysintetico_osTotal_Servicos: TFloatField
      FieldName = 'Total_Servicos'
      currency = True
    end
  end
  object DataSource1: TDataSource
    DataSet = qrysintetico_os
    Left = 766
    Top = 88
  end
  object qrycomissao_os: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = dsConsulta_OS
    Parameters = <>
    SQL.Strings = (
      
        'select IOS.Descricao_Servico, IOS.Qtde, IOS.Valor_Unitario, IOS.' +
        'Desconto, IOS.Sub_Total,'
      
        'IOS.Comissao, P.N_Pedido, F.Nome as Funcionario, C.Nome_Nome_Fan' +
        'tasia from Itens_OS IOS'
      'left join Pedido P on (IOS.Codigo = P.Codigo)'
      'left join Cliente C on (P.Codigo_Cliente = C.Codigo)'
      'left join Funcionario F on (IOS.Codigo_Mecanico = F.Codigo)')
    Left = 867
    Top = 130
    object qrycomissao_osDescricao_Servico: TStringField
      FieldName = 'Descricao_Servico'
      Size = 300
    end
    object qrycomissao_osQtde: TIntegerField
      FieldName = 'Qtde'
    end
    object qrycomissao_osValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      currency = True
    end
    object qrycomissao_osDesconto: TFloatField
      FieldName = 'Desconto'
      currency = True
    end
    object qrycomissao_osSub_Total: TFloatField
      FieldName = 'Sub_Total'
      currency = True
    end
    object qrycomissao_osComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qrycomissao_osN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qrycomissao_osFuncionario: TStringField
      FieldName = 'Funcionario'
      Size = 50
    end
    object qrycomissao_osNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = qrycomissao_os
    Left = 899
    Top = 130
  end
  object qryagrupado_grupo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = dsConsulta_OS
    Parameters = <>
    SQL.Strings = (
      
        'select Ped.Data_Venda, GP.Codigo as CodGrupo, GP.Descricao as Gr' +
        'upo, IOS.Descricao_Servico, IOS.Qtde, IOS.Valor_Unitario, IOS.De' +
        'sconto, IOS.Sub_Total'
      'from Itens_OS IOS'
      'left join Pedido Ped on (IOS.Codigo = Ped.Codigo)'
      'left join Produto P on (IOS.Codigo_Servico = P.Codigo)'
      'left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)')
    Left = 803
    Top = 250
    object qryagrupado_grupoCodGrupo: TAutoIncField
      FieldName = 'CodGrupo'
      ReadOnly = True
    end
    object qryagrupado_grupoGrupo: TStringField
      FieldName = 'Grupo'
      Size = 300
    end
    object qryagrupado_grupoDescricao_Servico: TStringField
      FieldName = 'Descricao_Servico'
      Size = 300
    end
    object qryagrupado_grupoQtde: TIntegerField
      FieldName = 'Qtde'
    end
    object qryagrupado_grupoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      currency = True
    end
    object qryagrupado_grupoSub_Total: TFloatField
      FieldName = 'Sub_Total'
      currency = True
    end
    object qryagrupado_grupoDesconto: TFloatField
      FieldName = 'Desconto'
      currency = True
    end
    object qryagrupado_grupoData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
  end
  object DataSource3: TDataSource
    DataSet = qryagrupado_grupo
    Left = 835
    Top = 250
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.Caption = 'Visualiza'#231#227'o de relat'#243'rio'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Impress'#227'o de relat'#243'rio'
    Version = 0
    Left = 264
    Top = 152
    object dxComponentPrinter1Link1: TdxGridReportLink
      Component = cxGrid1
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[Date Printed]')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        'P'#225'gina [Page #] de [Total Pages]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Time Printed]')
      PrinterPage.PageHeader.CenterTitle.Strings = (
        'FAV Sistemas')
      PrinterPage.PageHeader.LeftTitle.Strings = (
        'SAC - Sistema de Acompanhamento Comercial')
      PrinterPage.PageHeader.RightTitle.Strings = (
        '(64)3631-1926 / (64)9958-7272')
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Novo documento'
      ReportDocument.CreationDate = 42210.495096122690000000
      ReportDocument.Description = 'Teste de novo documento'
      ReportFootnotes.Font.Charset = ANSI_CHARSET
      ReportFootnotes.Font.Color = clBlack
      ReportFootnotes.Font.Height = -16
      ReportFootnotes.Font.Name = 'Tahoma'
      ReportFootnotes.Font.Style = [fsBold]
      ReportFootnotes.Mode = fnmOnLastPage
      ReportFootnotes.Text = 'Fim do Relat'#243'rio'
      ReportTitle.Font.Charset = ANSI_CHARSET
      ReportTitle.Font.Color = clBlack
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Tahoma'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Text = 'Ordens de Servi'#231'os'
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
  object cxPropertiesStore2: TcxPropertiesStore
    Components = <
      item
        Component = cxGrid1DBTableView1Data_Venda
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Desconto
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Descricao_Servico
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Grupo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Qtde
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Sub_Total
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Valor_Unitario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end>
    StorageName = 'ConfiguraGrid'
    Left = 304
    Top = 152
  end
end
