object FrmChama_Funcionario: TFrmChama_Funcionario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Funcion'#225'rio'
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
        FieldName = 'Nome'
        Width = 441
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RG'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Orgao_Expedidor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Emissao_RG'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Salario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Comissao'
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
        FieldName = 'Codigo_Cargo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Departamento'
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
        FieldName = 'Contato'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Telefone_Contato'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Email'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Nascimento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Estado_Civil'
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
        FieldName = 'Descricao_3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_4'
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
      'Nome')
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
      'Nome')
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
  object qrychama_funcionario: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Fun.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao Setor,' +
        ' Car.Descricao as Cargo, Dep.Descricao as Departamento from Func' +
        'ionario Fun'
      'left join Cidade Ci on (Fun.Codigo_Cidade = Ci.Codigo)'
      'left join Setor Se on (Fun.Codigo_Setor = Se.Codigo)'
      'left join Cargo Car on (Fun.Codigo_Cargo = Car.Codigo)'
      
        'left join Departamento Dep on (Fun.Codigo_Departamento = Dep.Cod' +
        'igo)')
    Left = 464
    Top = 272
    object qrychama_funcionarioCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_funcionarioCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_funcionarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychama_funcionarioCPF: TStringField
      FieldName = 'CPF'
    end
    object qrychama_funcionarioRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object qrychama_funcionarioOrgao_Expedidor: TStringField
      FieldName = 'Orgao_Expedidor'
      Size = 10
    end
    object qrychama_funcionarioData_Emissao_RG: TDateTimeField
      FieldName = 'Data_Emissao_RG'
    end
    object qrychama_funcionarioSalario: TFloatField
      FieldName = 'Salario'
    end
    object qrychama_funcionarioComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qrychama_funcionarioDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qrychama_funcionarioNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrychama_funcionarioReferencia: TStringField
      FieldName = 'Referencia'
      Size = 70
    end
    object qrychama_funcionarioCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_funcionarioCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_funcionarioCodigo_Cargo: TIntegerField
      FieldName = 'Codigo_Cargo'
    end
    object qrychama_funcionarioCodigo_Departamento: TIntegerField
      FieldName = 'Codigo_Departamento'
    end
    object qrychama_funcionarioTelefone: TStringField
      FieldName = 'Telefone'
      Size = 13
    end
    object qrychama_funcionarioCelular: TStringField
      FieldName = 'Celular'
      Size = 13
    end
    object qrychama_funcionarioContato: TStringField
      FieldName = 'Contato'
      Size = 50
    end
    object qrychama_funcionarioTelefone_Contato: TStringField
      FieldName = 'Telefone_Contato'
      Size = 13
    end
    object qrychama_funcionarioEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qrychama_funcionarioData_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object qrychama_funcionarioEstado_Civil: TStringField
      FieldName = 'Estado_Civil'
    end
    object qrychama_funcionarioData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_funcionarioObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qrychama_funcionarioComissao_Servico: TFloatField
      FieldName = 'Comissao_Servico'
    end
    object qrychama_funcionarioEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrychama_funcionarioCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrychama_funcionarioCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qrychama_funcionarioUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_funcionarioSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qrychama_funcionarioCargo: TStringField
      FieldName = 'Cargo'
      Size = 30
    end
    object qrychama_funcionarioDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 30
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_funcionario
    Left = 496
    Top = 272
  end
  object qrychama_usuario: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CU.*, PU.Perfil from Cadastro_Usuario CU'
      'inner join Perfil_Usuario PU on (CU.Codigo_Perfil = PU.Codigo)')
    Left = 464
    Top = 224
    object qrychama_usuarioCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_usuarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychama_usuarioLogin: TStringField
      FieldName = 'Login'
      Size = 50
    end
    object qrychama_usuarioSenha: TStringField
      FieldName = 'Senha'
    end
    object qrychama_usuarioAdministrador: TStringField
      FieldName = 'Administrador'
      Size = 3
    end
    object qrychama_usuarioCodigo_Perfil: TIntegerField
      FieldName = 'Codigo_Perfil'
    end
    object qrychama_usuarioData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_usuarioPerfil: TStringField
      FieldName = 'Perfil'
      Size = 30
    end
    object qrychama_usuarioAtualiza_Preco_Orcamento: TStringField
      FieldName = 'Atualiza_Preco_Orcamento'
      Size = 3
    end
    object qrychama_usuarioSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
    end
  end
  object qrychama_outros: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionario_Outros')
    Left = 464
    Top = 184
    object qrychama_outrosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_outrosData_Admissao: TDateTimeField
      FieldName = 'Data_Admissao'
    end
    object qrychama_outrosData_Demissao: TDateTimeField
      FieldName = 'Data_Demissao'
    end
    object qrychama_outrosCTPS_N: TStringField
      FieldName = 'CTPS_N'
      Size = 50
    end
    object qrychama_outrosCTPS_Serie: TStringField
      FieldName = 'CTPS_Serie'
      Size = 50
    end
    object qrychama_outrosTitulo_N: TStringField
      FieldName = 'Titulo_N'
      Size = 50
    end
    object qrychama_outrosTitulo_Cidade: TStringField
      FieldName = 'Titulo_Cidade'
      Size = 100
    end
    object qrychama_outrosTitulo_Zona: TStringField
      FieldName = 'Titulo_Zona'
      Size = 50
    end
    object qrychama_outrosTitulo_Secao: TStringField
      FieldName = 'Titulo_Secao'
      Size = 50
    end
    object qrychama_outrosCertificado_Militar_N: TStringField
      FieldName = 'Certificado_Militar_N'
      Size = 50
    end
    object qrychama_outrosCertificado_Militar_Serie: TStringField
      FieldName = 'Certificado_Militar_Serie'
      Size = 50
    end
    object qrychama_outrosCertificado_Militar_Categoria: TStringField
      FieldName = 'Certificado_Militar_Categoria'
      Size = 50
    end
    object qrychama_outrosNome_Pai: TStringField
      FieldName = 'Nome_Pai'
      Size = 100
    end
    object qrychama_outrosNome_Mae: TStringField
      FieldName = 'Nome_Mae'
      Size = 100
    end
    object qrychama_outrosNacionalidade: TStringField
      FieldName = 'Nacionalidade'
      Size = 100
    end
    object qrychama_outrosNaturalidade: TStringField
      FieldName = 'Naturalidade'
      Size = 100
    end
    object qrychama_outrosConjuge: TStringField
      FieldName = 'Conjuge'
      Size = 100
    end
    object qrychama_outrosGrau_Instrucao: TStringField
      FieldName = 'Grau_Instrucao'
      Size = 100
    end
    object qrychama_outrosCNH_N: TStringField
      FieldName = 'CNH_N'
      Size = 50
    end
    object qrychama_outrosCNH_Categoria: TStringField
      FieldName = 'CNH_Categoria'
      Size = 10
    end
    object qrychama_outrosCNH_Cidade: TStringField
      FieldName = 'CNH_Cidade'
      Size = 100
    end
    object qrychama_outrosPIS_N: TStringField
      FieldName = 'PIS_N'
      Size = 50
    end
    object qrychama_outrosPIS_Data_Cadastro: TDateTimeField
      FieldName = 'PIS_Data_Cadastro'
    end
    object qrychama_outrosPIS_Banco: TStringField
      FieldName = 'PIS_Banco'
      Size = 100
    end
    object qrychama_outrosPIS_Codigo_Banco: TStringField
      FieldName = 'PIS_Codigo_Banco'
      Size = 50
    end
    object qrychama_outrosPIS_Codigo_Agencia: TStringField
      FieldName = 'PIS_Codigo_Agencia'
      Size = 50
    end
    object qrychama_outrosPIS_Endereco_Agencia: TStringField
      FieldName = 'PIS_Endereco_Agencia'
      Size = 300
    end
  end
end
