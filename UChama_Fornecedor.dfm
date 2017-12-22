object FrmChama_Fornecedor: TFrmChama_Fornecedor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Fornecedor'
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
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
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Width = 126
        Visible = True
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
    ItemIndex = 2
    Items.Strings = (
      'C'#243'digo'
      'Nome Fantasia'
      'Raz'#227'o Social'
      'CNPJ')
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
    ItemIndex = 2
    Items.Strings = (
      'C'#243'digo'
      'Nome Fantasia'
      'Raz'#227'o Social'
      'CNPJ')
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
  object qrychama_fornecedor: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Forn.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Se' +
        'tor from Fornecedor Forn'
      'left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)'
      'left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)')
    Left = 464
    Top = 272
    object qrychama_fornecedorCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_fornecedorCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_fornecedorTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qrychama_fornecedorNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qrychama_fornecedorRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrychama_fornecedorCPF: TStringField
      FieldName = 'CPF'
    end
    object qrychama_fornecedorRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object qrychama_fornecedorOrgao_Expedidor: TStringField
      FieldName = 'Orgao_Expedidor'
      Size = 10
    end
    object qrychama_fornecedorData_Emissao_RG: TDateTimeField
      FieldName = 'Data_Emissao_RG'
    end
    object qrychama_fornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qrychama_fornecedorInsc_Estadual_Municipal: TStringField
      FieldName = 'Insc_Estadual_Municipal'
      Size = 15
    end
    object qrychama_fornecedorNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrychama_fornecedorReferencia: TStringField
      FieldName = 'Referencia'
      Size = 70
    end
    object qrychama_fornecedorCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_fornecedorCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_fornecedorTelefone: TStringField
      FieldName = 'Telefone'
      Size = 13
    end
    object qrychama_fornecedorCelular: TStringField
      FieldName = 'Celular'
      Size = 13
    end
    object qrychama_fornecedorEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qrychama_fornecedorSite: TStringField
      FieldName = 'Site'
      Size = 50
    end
    object qrychama_fornecedorData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_fornecedorObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qrychama_fornecedorEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrychama_fornecedorCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrychama_fornecedorCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qrychama_fornecedorUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_fornecedorSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_fornecedor
    Left = 496
    Top = 272
  end
end
