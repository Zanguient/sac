object FrmChama_Lancamento_Financeiro_Alterar: TFrmChama_Lancamento_Financeiro_Alterar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Lan'#231'amentos Financeiros'
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
    Left = 254
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
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
        FieldName = 'Historico'
        Title.Caption = 'Hist'#243'rico'
        Width = 266
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Documento'
        Title.Caption = 'Documento'
        Width = 106
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 3
    Items.Strings = (
      'C'#243'digo'
      'Documento'
      'Hist'#243'rico'
      'Nome')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 254
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
  object RGTipo: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Tipo'
    ItemIndex = 1
    Items.Strings = (
      'Pagar'
      'Receber')
    TabOrder = 3
    OnClick = RGTipoClick
  end
  object qrychama_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select LF.*, CP.Descricao as Condicao_Pagamento, Forn.Nome_Fanta' +
        'sia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Depa' +
        'rtamento,'
      'PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF'
      
        'left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = ' +
        'CP.Codigo)'
      'left join Fornecedor Forn on (LF.Codigo_Cli_For = Forn.Codigo)'
      
        'left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Co' +
        'digo)'
      'left join Departamento D on (LF.Codigo_Departamento = D.Codigo)'
      'left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)')
    Left = 464
    Top = 328
    object qrychama_lancamentoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_lancamentoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qrychama_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qrychama_lancamentoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_lancamentoCodigo_Forma_Pagamento: TIntegerField
      FieldName = 'Codigo_Forma_Pagamento'
    end
    object qrychama_lancamentoCodigo_Cli_For: TIntegerField
      FieldName = 'Codigo_Cli_For'
    end
    object qrychama_lancamentoCodigo_Tipo_Documento: TIntegerField
      FieldName = 'Codigo_Tipo_Documento'
    end
    object qrychama_lancamentoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qrychama_lancamentoCodigo_Departamento: TIntegerField
      FieldName = 'Codigo_Departamento'
    end
    object qrychama_lancamentoCodigo_Plano: TIntegerField
      FieldName = 'Codigo_Plano'
    end
    object qrychama_lancamentoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qrychama_lancamentoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qrychama_lancamentoValor_Documento: TFloatField
      FieldName = 'Valor_Documento'
    end
    object qrychama_lancamentoDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qrychama_lancamentoMulta: TFloatField
      FieldName = 'Multa'
    end
    object qrychama_lancamentoValor_Cobrado: TFloatField
      FieldName = 'Valor_Cobrado'
    end
    object qrychama_lancamentoObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qrychama_lancamentoStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qrychama_lancamentoCondicao_Pagamento: TStringField
      FieldName = 'Condicao_Pagamento'
      Size = 30
    end
    object qrychama_lancamentoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychama_lancamentoTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 30
    end
    object qrychama_lancamentoDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 30
    end
    object qrychama_lancamentoPlano_Financeiro: TStringField
      FieldName = 'Plano_Financeiro'
      Size = 30
    end
    object qrychama_lancamentoConta_Fixa: TIntegerField
      FieldName = 'Conta_Fixa'
    end
    object qrychama_lancamentoCalcula_Juro: TIntegerField
      FieldName = 'Calcula_Juro'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_lancamento
    Left = 504
    Top = 328
  end
end
