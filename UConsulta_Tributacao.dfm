object FrmConsulta_Tributacao: TFrmConsulta_Tributacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Grupos de Tributa'#231#245'es'
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
  object Label2: TLabel
    Left = 361
    Top = 21
    Width = 19
    Height = 13
    Caption = 'P.F.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 361
    Top = 68
    Width = 55
    Height = 13
    Caption = 'Dia Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 433
    Top = 68
    Width = 47
    Height = 13
    Caption = 'Dia Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 113
    Top = 136
    Width = 838
    Height = 75
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
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
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
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
        FieldName = 'Codigo_Plano'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dia_Vencimento'
        Title.Caption = 'Dia'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 0
    Width = 122
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Dia'
      'Descri'#231#227'o'
      'Plano Financeiro')
    TabOrder = 3
  end
  object EdtConsulta: TEdit
    Left = 417
    Top = 38
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
    OnKeyDown = EdtConsultaKeyDown
  end
  object RGOrdena_Por: TRadioGroup
    Left = 240
    Top = 0
    Width = 114
    Height = 54
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Descri'#231#227'o'
      'Dia')
    TabOrder = 4
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 97
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 93
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
    TabOrder = 5
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
  object EdtCodigo_Plano: TEdit
    Left = 361
    Top = 38
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object EdtDia_Ini: TEdit
    Left = 361
    Top = 87
    Width = 51
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    OnKeyDown = EdtConsultaKeyDown
  end
  object EdtDia_Fim: TEdit
    Left = 433
    Top = 87
    Width = 51
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    OnKeyDown = EdtConsultaKeyDown
  end
  object RGTipo: TRadioGroup
    Left = 240
    Top = 54
    Width = 114
    Height = 53
    Caption = 'Tipo Conta:'
    ItemIndex = 0
    Items.Strings = (
      'Cr'#233'dito'
      'D'#233'bito')
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 113
    Top = 110
    Width = 838
    Height = 24
    BorderStyle = bsSingle
    Caption = 'ICMS'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
  end
  object DBGrid2: TDBGrid
    Left = 114
    Top = 240
    Width = 838
    Height = 75
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
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
        FieldName = 'Codigo_Plano'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dia_Vencimento'
        Title.Caption = 'Dia'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 113
    Top = 215
    Width = 838
    Height = 24
    BorderStyle = bsSingle
    Caption = 'IPI'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object DBGrid3: TDBGrid
    Left = 113
    Top = 345
    Width = 838
    Height = 75
    BorderStyle = bsNone
    DataSource = DataSource2
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid3DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
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
        FieldName = 'Codigo_Plano'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dia_Vencimento'
        Title.Caption = 'Dia'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 113
    Top = 319
    Width = 838
    Height = 24
    BorderStyle = bsSingle
    Caption = 'PIS'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 13
  end
  object DBGrid4: TDBGrid
    Left = 113
    Top = 449
    Width = 838
    Height = 75
    BorderStyle = bsNone
    DataSource = DataSource3
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid4DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
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
        FieldName = 'Codigo_Plano'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dia_Vencimento'
        Title.Caption = 'Dia'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 113
    Top = 423
    Width = 838
    Height = 24
    BorderStyle = bsSingle
    Caption = 'COFINS'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 15
  end
  object qryconsulta_regra_icms: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Grupo'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select '
      ''
      
        'P.Codigo_Grupo, RI.Codigo, RI.Aliquota, RI.Base_Reduzida, RI.Bas' +
        'e_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acresci' +
        'da,'
      
        'COF.Descricao, CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao ' +
        'from Produto Pro'
      ''
      
        'inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tri' +
        'butacao = GPT.Codigo)'
      
        'inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = T' +
        'I.Codigo)'
      'inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      
        'inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Cod' +
        'igo)'
      
        'inner join Cadastro_Observacao_Fiscal COF on (RI.Codigo_Observac' +
        'ao_Fiscal = COF.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situac' +
        'ao_Tributaria = CST.Codigo)'
      'where P.Codigo_Grupo = :Grupo')
    Left = 437
    Top = 168
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_regra_icms
    Left = 469
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = qryconsulta_regra_ipi
    Left = 469
    Top = 264
  end
  object qryconsulta_regra_ipi: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      ''
      
        'P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_IPI, P.Codi' +
        'go_Grupo_Tributacao_PIS, P.Codigo_Grupo_Tributacao_COFINS, '
      ''
      
        'RI.Codigo, RI.Aliquota, RI.Base_Reduzida, RI.Base_Acrescida, RI.' +
        'Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,'
      
        'COF.Descricao, CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao ' +
        'from Produto Pro'
      ''
      ''
      
        'inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tri' +
        'butacao = GPT.Codigo)'
      
        'inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = T' +
        'I.Codigo)'
      'inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      
        'inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Cod' +
        'igo)'
      
        'inner join Cadastro_Observacao_Fiscal COF on (RI.Codigo_Observac' +
        'ao_Fiscal = COF.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situac' +
        'ao_Tributaria = CST.Codigo)')
    Left = 437
    Top = 264
  end
  object qryconsulta_regra_pis: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      ''
      
        'P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_IPI, P.Codi' +
        'go_Grupo_Tributacao_PIS, P.Codigo_Grupo_Tributacao_COFINS, '
      ''
      
        'RI.Codigo, RI.Aliquota, RI.Base_Reduzida, RI.Base_Acrescida, RI.' +
        'Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,'
      
        'COF.Descricao, CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao ' +
        'from Produto Pro'
      ''
      ''
      
        'inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tri' +
        'butacao = GPT.Codigo)'
      
        'inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = T' +
        'I.Codigo)'
      'inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      
        'inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Cod' +
        'igo)'
      
        'inner join Cadastro_Observacao_Fiscal COF on (RI.Codigo_Observac' +
        'ao_Fiscal = COF.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situac' +
        'ao_Tributaria = CST.Codigo)')
    Left = 437
    Top = 368
  end
  object DataSource2: TDataSource
    DataSet = qryconsulta_regra_pis
    Left = 469
    Top = 368
  end
  object DataSource3: TDataSource
    DataSet = qryconsulta_regra_cofins
    Left = 469
    Top = 480
  end
  object qryconsulta_regra_cofins: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      ''
      
        'P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_IPI, P.Codi' +
        'go_Grupo_Tributacao_PIS, P.Codigo_Grupo_Tributacao_COFINS, '
      ''
      
        'RI.Codigo, RI.Aliquota, RI.Base_Reduzida, RI.Base_Acrescida, RI.' +
        'Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,'
      
        'COF.Descricao, CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao ' +
        'from Produto Pro'
      ''
      ''
      
        'inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tri' +
        'butacao = GPT.Codigo)'
      
        'inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = T' +
        'I.Codigo)'
      'inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      
        'inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Cod' +
        'igo)'
      
        'inner join Cadastro_Observacao_Fiscal COF on (RI.Codigo_Observac' +
        'ao_Fiscal = COF.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situac' +
        'ao_Tributaria = CST.Codigo)')
    Left = 437
    Top = 480
  end
end
