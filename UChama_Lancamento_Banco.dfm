object FrmChama_Lancamento_Banco: TFrmChama_Lancamento_Banco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Lan'#231'amentos Banc'#225'rios'
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
    Left = 127
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
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Documento'
        Title.Caption = 'N Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Lancamento'
        Title.Caption = 'Data Lan'#231'amento'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Conta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Operacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Plano'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Conta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Operacao'
        Title.Caption = 'Opera'#231#227'o'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plano'
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
      'Documento'
      'Conta')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 127
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
  object qrychama_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Descricao as Pla' +
        'no, CCh.Codigo, CCh.N_Cheque from Lancamento_Banco LB'
      'left join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)'
      
        'left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codig' +
        'o)'
      'left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)'
      'left join Cheque CCh on (LB.Codigo_Cheque = CCh.Codigo)')
    Left = 464
    Top = 272
    object qrychama_lancamentoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_lancamentoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qrychama_lancamentoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qrychama_lancamentoCodigo_Conta: TIntegerField
      FieldName = 'Codigo_Conta'
    end
    object qrychama_lancamentoCodigo_Operacao: TIntegerField
      FieldName = 'Codigo_Operacao'
    end
    object qrychama_lancamentoCodigo_Plano: TIntegerField
      FieldName = 'Codigo_Plano'
    end
    object qrychama_lancamentoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_lancamentoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_lancamentoConta: TStringField
      FieldName = 'Conta'
    end
    object qrychama_lancamentoOperacao: TStringField
      FieldName = 'Operacao'
      Size = 30
    end
    object qrychama_lancamentoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qrychama_lancamentoPlano: TStringField
      FieldName = 'Plano'
      Size = 100
    end
    object qrychama_lancamentoStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qrychama_lancamentoCodigo_Cheque: TIntegerField
      FieldName = 'Codigo_Cheque'
    end
    object qrychama_lancamentoN_Cheque: TStringField
      FieldName = 'N_Cheque'
    end
    object qrychama_lancamentoTransferencia: TIntegerField
      FieldName = 'Transferencia'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_lancamento
    Left = 496
    Top = 272
  end
end
