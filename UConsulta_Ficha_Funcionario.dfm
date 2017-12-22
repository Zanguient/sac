object FrmConsulta_Ficha_Funcionario: TFrmConsulta_Ficha_Funcionario
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Ficha de Funcion'#225'rios'
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
  object LblConsulta: TLabel
    Left = 233
    Top = 43
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
  object DBGrid1: TDBGrid
    Left = 113
    Top = 78
    Width = 838
    Height = 458
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
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
        FieldName = 'Nome'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Salario'
        Title.Caption = 'Sal'#225'rio'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Comissao'
        Title.Caption = 'Comiss'#227'o'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Logradouro'
        Title.Caption = 'Endere'#231'o'
        Width = 373
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Setor'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Celular'
        Visible = True
      end>
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
    TabOrder = 4
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
    Top = 0
    Width = 114
    Height = 78
    Caption = 'Consulta Por'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Funcion'#225'rio')
    TabOrder = 3
  end
  object EdtCodigo: TEdit
    Left = 233
    Top = 60
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
    Left = 293
    Top = 60
    Width = 204
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
  object qryconsulta_funcionario: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select F.Nome, F.CPF, F.RG, F.Salario, F.Comissao, L.Descricao a' +
        's Logradouro,'
      
        'S.Descricao as Setor, C.Descricao as Cidade, F.Numero, F.Telefon' +
        'e, F.Celular from Funcionario F'
      'left join Logradouro L on (F.Codigo_Logradouro = L.Codigo)'
      'left join Setor S on (F.Codigo_Setor = S.Codigo)'
      'left join Cidade C on (F.Codigo_Cidade = C.Codigo)')
    Left = 469
    Top = 272
    object qryconsulta_funcionarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_funcionarioCPF: TStringField
      FieldName = 'CPF'
    end
    object qryconsulta_funcionarioRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object qryconsulta_funcionarioSalario: TFloatField
      FieldName = 'Salario'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_funcionarioComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qryconsulta_funcionarioLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 200
    end
    object qryconsulta_funcionarioSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qryconsulta_funcionarioCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qryconsulta_funcionarioNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qryconsulta_funcionarioTelefone: TStringField
      FieldName = 'Telefone'
      Size = 13
    end
    object qryconsulta_funcionarioCelular: TStringField
      FieldName = 'Celular'
      Size = 13
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_funcionario
    Left = 501
    Top = 272
  end
end
