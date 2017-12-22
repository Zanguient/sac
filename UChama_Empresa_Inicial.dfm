object FrmChama_Empresa_Inicial: TFrmChama_Empresa_Inicial
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Informe uma empresa para come'#231'ar a trabalhar'
  ClientHeight = 467
  ClientWidth = 942
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 941
    Height = 465
    Hint = 'Selecione a empresa deseja e d'#234' duplo clique'
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
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
        Width = 445
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 23
        Visible = True
      end>
  end
  object qrychama_empresa: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select E.Codigo, E.Nome_Fantasia, E.Razao_Social, E.Suframa, E.P' +
        'roprietario, E.CNPJ, E.Complemento, E.Contato, E.Telefone_Contat' +
        'o,E.Aliquota, E.CNAE,'
      
        'E.Insc_Estadual, E.Insc_Municipal, E.Telefone, E.Numero, E.EMail' +
        ', E.Enquadramento, E.Regime_Tributario, L.Descricao, L.Tipo_Logr' +
        'adouro, L.CEP, Cid.Descricao, Cid.UF,'
      'Cid.Codigo_Municipio, S.Descricao from Empresa E'
      'inner join Logradouro L on (E.Codigo_Logradouro = L.Codigo)'
      'inner join Cidade Cid on (E.Codigo_Cidade = Cid.Codigo)'
      'inner join Setor S on (E.Codigo_Setor = S.Codigo)')
    Left = 464
    Top = 272
    object qrychama_empresaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
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
    object qrychama_empresaTelefone: TStringField
      FieldName = 'Telefone'
      Size = 13
    end
    object qrychama_empresaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 70
    end
    object qrychama_empresaTipo_Logradouro: TStringField
      FieldName = 'Tipo_Logradouro'
    end
    object qrychama_empresaNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrychama_empresaDescricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 30
    end
    object qrychama_empresaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_empresaComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrychama_empresaContato: TStringField
      FieldName = 'Contato'
      Size = 50
    end
    object qrychama_empresaTelefone_Contato: TStringField
      FieldName = 'Telefone_Contato'
      Size = 15
    end
    object qrychama_empresaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrychama_empresaDescricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 40
    end
    object qrychama_empresaEMail: TStringField
      FieldName = 'EMail'
      Size = 100
    end
    object qrychama_empresaCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qrychama_empresaSuframa: TStringField
      FieldName = 'Suframa'
      Size = 30
    end
    object qrychama_empresaEnquadramento: TStringField
      FieldName = 'Enquadramento'
      Size = 5
    end
    object qrychama_empresaAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qrychama_empresaRegime_Tributario: TIntegerField
      FieldName = 'Regime_Tributario'
    end
    object qrychama_empresaCNAE: TStringField
      FieldName = 'CNAE'
      Size = 10
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_empresa
    Left = 496
    Top = 272
  end
  object qrychama_webservice_1_producao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_1_Producao.* from WebService_1_Producao')
    Left = 464
    Top = 224
    object qrychama_webservice_1_producaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_1_producaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_1_producaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_1_producaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_1_producaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_1_producaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_1_producaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_1_producaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_1_producaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
  object qrychama_webservice_2_producao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_2_Producao.* from WebService_2_Producao')
    Left = 496
    Top = 224
    object qrychama_webservice_2_producaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_2_producaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_2_producaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_2_producaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_2_producaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_2_producaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_2_producaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_2_producaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_2_producaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
  object qrychama_webservice_1_homologacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_1_Homologacao.* from WebService_1_Homologacao')
    Left = 528
    Top = 224
    object qrychama_webservice_1_homologacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_1_homologacaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
  object qrychama_webservice_2_homologacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_2_Homologacao.* from WebService_2_Homologacao')
    Left = 560
    Top = 224
    object qrychama_webservice_2_homologacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_2_homologacaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
end
