object FrmChama_Empresa: TFrmChama_Empresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Empresa'
  ClientHeight = 553
  ClientWidth = 943
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
        Width = 356
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razao_Social'
        Title.Caption = 'Raz'#227'o Social'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Proprietario'
        Visible = False
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
        FieldName = 'Fax'
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
  object qrychama_empresa: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Emp.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio' +
        ', Se.Descricao as Setor from Empresa Emp'
      'left join Cidade Ci on (Emp.Codigo_Cidade = Ci.Codigo)'
      'left join Setor Se on (Emp.Codigo_Setor = Se.Codigo)')
    Left = 464
    Top = 272
    object qrychama_empresaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_empresaNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qrychama_empresaRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrychama_empresaProprietario: TStringField
      FieldName = 'Proprietario'
      Size = 50
    end
    object qrychama_empresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qrychama_empresaInsc_Estadual: TStringField
      FieldName = 'Insc_Estadual'
    end
    object qrychama_empresaInsc_Municipal: TStringField
      FieldName = 'Insc_Municipal'
    end
    object qrychama_empresaSuframa: TStringField
      FieldName = 'Suframa'
      Size = 30
    end
    object qrychama_empresaCNAE: TStringField
      FieldName = 'CNAE'
      Size = 10
    end
    object qrychama_empresaRegime_Tributario: TIntegerField
      FieldName = 'Regime_Tributario'
    end
    object qrychama_empresaEnquadramento: TStringField
      FieldName = 'Enquadramento'
      Size = 5
    end
    object qrychama_empresaAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qrychama_empresaCusto_OP: TFloatField
      FieldName = 'Custo_OP'
    end
    object qrychama_empresaNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrychama_empresaComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrychama_empresaCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_empresaCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_empresaTelefone: TStringField
      FieldName = 'Telefone'
      Size = 13
    end
    object qrychama_empresaFax: TStringField
      FieldName = 'Fax'
      Size = 13
    end
    object qrychama_empresaEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qrychama_empresaSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object qrychama_empresaSMTP: TStringField
      FieldName = 'SMTP'
      Size = 50
    end
    object qrychama_empresaPorta: TStringField
      FieldName = 'Porta'
      Size = 10
    end
    object qrychama_empresaSite: TStringField
      FieldName = 'Site'
      Size = 50
    end
    object qrychama_empresaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_empresaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qrychama_empresaContato: TStringField
      FieldName = 'Contato'
      Size = 50
    end
    object qrychama_empresaTelefone_Contato: TStringField
      FieldName = 'Telefone_Contato'
      Size = 15
    end
    object qrychama_empresaEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrychama_empresaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrychama_empresaCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qrychama_empresaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_empresaCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qrychama_empresaSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_empresa
    Left = 496
    Top = 272
  end
  object qrychama_contabilista: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Cont.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Se' +
        'tor, Ci.Codigo_Municipio from Contabilista Cont'
      'left join Cidade Ci on (Cont.Codigo_Cidade = Ci.Codigo)'
      'left join Setor Se on (Cont.Codigo_Setor = Se.Codigo)')
    Left = 528
    Top = 272
    object qrychama_contabilistaCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_contabilistaNome_Contador: TStringField
      FieldName = 'Nome_Contador'
      Size = 50
    end
    object qrychama_contabilistaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qrychama_contabilistaCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object qrychama_contabilistaCRC: TStringField
      FieldName = 'CRC'
      Size = 15
    end
    object qrychama_contabilistaNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrychama_contabilistaComplemento: TStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object qrychama_contabilistaCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_contabilistaCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_contabilistaEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qrychama_contabilistaTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychama_contabilistaEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrychama_contabilistaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrychama_contabilistaCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qrychama_contabilistaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_contabilistaSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qrychama_contabilistaCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
  end
end
