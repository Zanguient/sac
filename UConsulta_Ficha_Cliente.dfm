object FrmConsulta_Ficha_Cliente: TFrmConsulta_Ficha_Cliente
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Ficha de Clientes'
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
  object DBGrid1: TDBGrid
    Left = 113
    Top = 80
    Width = 838
    Height = 455
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
        FieldName = 'Nome_Nome_Fantasia'
        Title.Caption = 'Nome/Nome Fantasia'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razao_Social'
        Title.Caption = 'Raz'#227'o Social'
        Width = 219
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
        FieldName = 'CNPJ'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Insc_Estadual'
        Title.Caption = 'Insc. Estadual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Title.Caption = 'Endere'#231'o'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Title.Caption = 'N'#250'mero'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Setor'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Celular'
        Width = 83
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
      'Cliente')
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
  object qryconsulta_cliente: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select C.Nome_Nome_Fantasia, C.Razao_Social, C.CPF, C.RG, C.CNPJ' +
        ', C.Insc_Estadual, C.Endereco,'
      
        'S.Descricao as Setor, Ci.Descricao as Cidade, C.Numero, C.Telefo' +
        'ne, C.Celular from Cliente C'
      'left join Setor S on (C.Codigo_Setor = S.Codigo)'
      'left join Cidade Ci on (C.Codigo_Cidade = Ci.Codigo)')
    Left = 469
    Top = 272
    object qryconsulta_clienteNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qryconsulta_clienteRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qryconsulta_clienteCPF: TStringField
      FieldName = 'CPF'
    end
    object qryconsulta_clienteRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object qryconsulta_clienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qryconsulta_clienteInsc_Estadual: TStringField
      FieldName = 'Insc_Estadual'
      Size = 15
    end
    object qryconsulta_clienteSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qryconsulta_clienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qryconsulta_clienteNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qryconsulta_clienteTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qryconsulta_clienteCelular: TStringField
      FieldName = 'Celular'
    end
    object qryconsulta_clienteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_cliente
    Left = 501
    Top = 272
  end
end
