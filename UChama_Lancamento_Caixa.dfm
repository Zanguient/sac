object FrmChama_Lancamento_Caixa: TFrmChama_Lancamento_Caixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Lan'#231'amentos no Caixa'
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
  object Label8: TLabel
    Left = 127
    Top = 36
    Width = 70
    Height = 13
    Caption = 'Lan'#231'amento'
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
        FieldName = 'Codigo_Registro'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Caixa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Usuario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Forma_Pagamento'
        Title.Caption = 'Forma Pagamento'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFuncionario'
        Title.Caption = 'Nome Funcion'#225'rio'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Troco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Documento'
        Title.Caption = 'Tipo Documento'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Acerto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Movimenta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Documento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Parcela'
        Visible = False
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Data Lan'#231'amento')
    TabOrder = 2
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
    TabOrder = 3
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
  object MEdtData_Lancamento: TMaskEdit
    Left = 127
    Top = 55
    Width = 80
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = '  /  /    '
    OnEnter = MEdtData_LancamentoEnter
    OnExit = MEdtData_LancamentoExit
  end
  object qrychama_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select FV.*, CC.Conta, OB.Operacao, OB.Tipo as TipoOperacao, Cod' +
        'igo_Usuario, FU.Nome as NomeFuncionario from Fechamento_Venda FV'
      'left join Conta_Corrente CC on (FV.Codigo_Conta = CC.Codigo)'
      
        'left join Operacao_Bancaria OB on (FV.Codigo_Operacao = OB.Codig' +
        'o)'
      'left join Funcionario FU on (FV.Codigo_Usuario = FU.Codigo)')
    Left = 464
    Top = 272
    object qrychama_lancamentoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_lancamentoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_lancamentoCodigo_Caixa: TIntegerField
      FieldName = 'Codigo_Caixa'
    end
    object qrychama_lancamentoCodigo_Usuario: TIntegerField
      FieldName = 'Codigo_Usuario'
    end
    object qrychama_lancamentoForma_Pagamento: TStringField
      FieldName = 'Forma_Pagamento'
      Size = 50
    end
    object qrychama_lancamentoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_lancamentoTroco: TFloatField
      FieldName = 'Troco'
    end
    object qrychama_lancamentoData: TDateTimeField
      FieldName = 'Data'
    end
    object qrychama_lancamentoTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 15
    end
    object qrychama_lancamentoStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qrychama_lancamentoAcerto: TIntegerField
      FieldName = 'Acerto'
    end
    object qrychama_lancamentoTipo: TStringField
      FieldName = 'Tipo'
      Size = 5
    end
    object qrychama_lancamentoMovimenta: TIntegerField
      FieldName = 'Movimenta'
    end
    object qrychama_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qrychama_lancamentoParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qrychama_lancamentoCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qrychama_lancamentoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qrychama_lancamentoTransferencia: TIntegerField
      FieldName = 'Transferencia'
    end
    object qrychama_lancamentoCodigo_Conta: TIntegerField
      FieldName = 'Codigo_Conta'
    end
    object qrychama_lancamentoCodigo_Operacao: TIntegerField
      FieldName = 'Codigo_Operacao'
    end
    object qrychama_lancamentoCodigo_Lancamento_Banco: TIntegerField
      FieldName = 'Codigo_Lancamento_Banco'
    end
    object qrychama_lancamentoConta: TStringField
      FieldName = 'Conta'
    end
    object qrychama_lancamentoOperacao: TStringField
      FieldName = 'Operacao'
      Size = 30
    end
    object qrychama_lancamentoTipoOperacao: TStringField
      FieldName = 'TipoOperacao'
      Size = 7
    end
    object strngfld_lancamentoNomeFuncionario: TStringField
      FieldName = 'NomeFuncionario'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_lancamento
    Left = 496
    Top = 272
  end
end
