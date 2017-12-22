object FrmChama_Fabricante: TFrmChama_Fabricante
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Fabricante'
  ClientHeight = 553
  ClientWidth = 942
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 252
    Top = 40
    Width = 61
    Height = 13
    Caption = 'Par'#226'metro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 941
    Height = 473
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Fantasia'
        Title.Caption = 'Nome Fantasia'
        Width = 322
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razao_Social'
        Title.Caption = 'Raz'#227'o Social'
        Width = 326
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Insc_Estadual_Municipal'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Logradouro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Referencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Setor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Cidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Celular'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Email'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Site'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Logradouro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = False
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Nome Fantasia')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 252
    Top = 56
    Width = 289
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyDown = EdtConsultaKeyDown
  end
  object RGOrdena_Por: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Nome Fantasia')
    TabOrder = 3
  end
  object ToolBar1: TToolBar
    Left = 751
    Top = 31
    Width = 190
    Height = 42
    Align = alCustom
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
    Images = DM.ImgImagens_Chama
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 4
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Localizar'
      ImageIndex = 1
      OnClick = BBtnFiltrarClick
    end
    object BBtnFechar: TToolButton
      Left = 97
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Fechar'
      ImageIndex = 0
      OnClick = BBtnFecharClick
    end
  end
  object qrychama_fabricante: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Tipo'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'select Forn.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L' +
        '.Tipo_Logradouro, L.CEP from Fornecedor Forn'
      'left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)'
      'left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)'
      'left join Logradouro L on (Forn.Codigo_Logradouro = L.Codigo)'
      'where Tipo = :Tipo')
    Left = 464
    Top = 272
    object qrychama_fabricanteCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_fabricanteTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qrychama_fabricanteNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qrychama_fabricanteRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrychama_fabricanteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qrychama_fabricanteInsc_Estadual_Municipal: TStringField
      FieldName = 'Insc_Estadual_Municipal'
      Size = 15
    end
    object qrychama_fabricanteCodigo_Logradouro: TIntegerField
      FieldName = 'Codigo_Logradouro'
    end
    object qrychama_fabricanteNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrychama_fabricanteReferencia: TStringField
      FieldName = 'Referencia'
      Size = 70
    end
    object qrychama_fabricanteCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_fabricanteCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_fabricanteTelefone: TStringField
      FieldName = 'Telefone'
      Size = 13
    end
    object qrychama_fabricanteCelular: TStringField
      FieldName = 'Celular'
      Size = 13
    end
    object qrychama_fabricanteEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qrychama_fabricanteSite: TStringField
      FieldName = 'Site'
      Size = 50
    end
    object qrychama_fabricanteData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_fabricanteObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qrychama_fabricanteDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qrychama_fabricanteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_fabricanteDescricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 40
    end
    object qrychama_fabricanteDescricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 70
    end
    object qrychama_fabricanteTipo_Logradouro: TStringField
      FieldName = 'Tipo_Logradouro'
    end
    object qrychama_fabricanteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrychama_fabricanteCPF: TStringField
      FieldName = 'CPF'
    end
    object qrychama_fabricanteRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object qrychama_fabricanteOrgao_Expedidor: TStringField
      FieldName = 'Orgao_Expedidor'
      Size = 10
    end
    object qrychama_fabricanteData_Emissao_RG: TDateTimeField
      FieldName = 'Data_Emissao_RG'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_fabricante
    Left = 496
    Top = 272
  end
end
