object FrmConsulta_Patrimonio: TFrmConsulta_Patrimonio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Patrim'#244'nios'
  ClientHeight = 501
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
  object LblMarca: TLabel
    Left = 593
    Top = 70
    Width = 229
    Height = 13
    Caption = 'N'#186' Bem/Identifica'#231#227'o/Descri'#231#227'o/Modelo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblConsulta: TLabel
    Left = 385
    Top = 70
    Width = 102
    Height = 13
    Caption = 'Tipo/Local/Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 114
    Top = 110
    Width = 837
    Height = 386
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
        FieldName = 'N_Bem'
        Title.Caption = 'N'#186' Bem'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Identificacao'
        Title.Caption = 'N'#186' Identifica'#231#227'o'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 315
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Marca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Marca'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Modelo'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Tipo_Bem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Bem'
        Title.Caption = 'Tipo'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Local_Bem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Local'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Cadastro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Aquisicao'
        Title.Caption = 'Aquisi'#231#227'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Baixa'
        Title.Caption = 'Baixa'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Bem'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'Observa'#231#227'o'
        Width = 593
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 114
    Top = 0
    Width = 137
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'N'#186' Bem'
      'N'#186' Identifica'#231#227'o'
      'Descri'#231#227'o'
      'Modelo'
      'Tipo'
      'Local'
      'Status')
    TabOrder = 4
  end
  object EdtConsulta: TEdit
    Left = 593
    Top = 87
    Width = 147
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    OnKeyDown = EdtConsultaKeyDown
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 501
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
  object RGAgrupa_Impressao: TRadioGroup
    Left = 257
    Top = 0
    Width = 122
    Height = 107
    Caption = 'Agrupa Impress'#227'o'
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Tipo'
      'Local'
      'Status')
    TabOrder = 5
  end
  object EdtCodigo: TEdit
    Left = 385
    Top = 87
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
    TabOrder = 0
    OnKeyDown = EdtCodigoKeyDown
    OnKeyPress = EdtCodigoKeyPress
  end
  object EdtDescricao: TEdit
    Left = 445
    Top = 87
    Width = 149
    Height = 17
    TabStop = False
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnKeyPress = EdtDescricaoKeyPress
  end
  object qryconsulta_bem: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.*, M.Descricao as Marca, TBP.Descricao as Tipo_Bem, LP.' +
        'Local, CS.Descricao as Status'
      'from Patrimonio P'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)'
      
        'left join Tipo_Bem_Patrimonial TBP on (P.Codigo_Tipo_Bem = TBP.C' +
        'odigo)'
      
        'left join Localidade_Produto LP on (P.Codigo_Local_Bem = LP.Codi' +
        'go)'
      'left join Cadastro_Status CS on (P.Codigo_Status = CS.Codigo)')
    Left = 470
    Top = 272
    object qryconsulta_bemCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsulta_bemN_Bem: TStringField
      FieldName = 'N_Bem'
      Size = 50
    end
    object qryconsulta_bemN_Identificacao: TStringField
      FieldName = 'N_Identificacao'
      Size = 50
    end
    object qryconsulta_bemDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qryconsulta_bemCodigo_Marca: TIntegerField
      FieldName = 'Codigo_Marca'
    end
    object qryconsulta_bemModelo: TStringField
      FieldName = 'Modelo'
      Size = 100
    end
    object qryconsulta_bemCodigo_Tipo_Bem: TIntegerField
      FieldName = 'Codigo_Tipo_Bem'
    end
    object qryconsulta_bemCodigo_Local_Bem: TIntegerField
      FieldName = 'Codigo_Local_Bem'
    end
    object qryconsulta_bemData_Aquisicao: TDateTimeField
      FieldName = 'Data_Aquisicao'
    end
    object qryconsulta_bemData_Baixa: TDateTimeField
      FieldName = 'Data_Baixa'
    end
    object qryconsulta_bemValor_Bem: TFloatField
      FieldName = 'Valor_Bem'
      currency = True
    end
    object qryconsulta_bemCodigo_Status: TIntegerField
      FieldName = 'Codigo_Status'
    end
    object qryconsulta_bemObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object qryconsulta_bemData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryconsulta_bemMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qryconsulta_bemTipo_Bem: TStringField
      FieldName = 'Tipo_Bem'
      Size = 50
    end
    object qryconsulta_bemLocal: TStringField
      FieldName = 'Local'
    end
    object qryconsulta_bemStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_bem
    Left = 502
    Top = 272
  end
end
