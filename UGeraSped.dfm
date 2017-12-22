object FrmGerarSped: TFrmGerarSped
  Left = 0
  Top = 0
  Anchors = [akTop, akRight]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Ocorr'#234'ncias de Cobran'#231'a'
  ClientHeight = 489
  ClientWidth = 670
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 489
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DockSite = True
    DragCursor = crHandPoint
    DragKind = dkDock
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
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = DM.ImgImagens_Comandos
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 0
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Gerar'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object Panel1: TPanel
    Left = 125
    Top = 0
    Width = 545
    Height = 489
    Caption = 'Panel1'
    TabOrder = 1
    OnExit = Panel1Exit
    object Label1: TLabel
      Left = 4
      Top = 58
      Width = 92
      Height = 13
      Caption = 'Selecione os Blocos'
    end
    object Label7: TLabel
      Left = 6
      Top = 380
      Width = 63
      Height = 13
      Caption = 'Buffer Linhas'
      Color = clBtnFace
      ParentColor = False
    end
    object Label8: TLabel
      Left = 96
      Top = 380
      Width = 61
      Height = 13
      Caption = 'Buffer Notas'
      Color = clBtnFace
      ParentColor = False
    end
    object Label6: TLabel
      Left = 185
      Top = 379
      Width = 53
      Height = 13
      Caption = 'Num.Notas'
      Color = clBtnFace
      ParentColor = False
    end
    object GroupBox4: TGroupBox
      Left = -2
      Top = 8
      Width = 139
      Height = 46
      Caption = ' C'#243'd.Empresa '
      TabOrder = 0
      object EdtCodEmp: TEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 149
      Top = 9
      Width = 321
      Height = 44
      Caption = ' Per'#237'odo '
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 13
        Height = 13
        Caption = 'De'
      end
      object Label4: TLabel
        Left = 156
        Top = 20
        Width = 6
        Height = 13
        Caption = #224
      end
      object Datai: TDateTimePicker
        Left = 32
        Top = 16
        Width = 120
        Height = 24
        Date = 40539.615467442120000000
        Time = 40539.615467442120000000
        TabOrder = 0
      end
      object Dataf: TDateTimePicker
        Left = 169
        Top = 16
        Width = 120
        Height = 24
        Date = 40539.615481307870000000
        Time = 40539.615481307870000000
        TabOrder = 1
      end
    end
    object ListaBlocos: TCheckListBox
      Left = 3
      Top = 79
      Width = 461
      Height = 169
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 18
      Items.Strings = (
        'Bloco 0 - Abertura, Identifica'#231#227'o e Refer'#234'ncia'
        'Bloco C - Documentos Fiscais I - Mercadorias (ICMS/IPI)'
        'Bloco D - Documentos Fiscais II - Servi'#231'os (ICMS)'
        'Bloco E - Apura'#231#227'o do ICMS e do IPI'
        'Bloco G - Credito de ICMS do Ativo Permanente CIAP'
        'Bloco H - Invent'#225'rio F'#237'sico'
        'Bloco K - Controle da produ'#231#227'o e estoque'
        'Bloco 1 - Outras Informa'#231#245'es'
        'Bloco 9 - Controle e encerramento do arquivo Digital')
      ParentFont = False
      TabOrder = 2
    end
    object ChSTIPI: TCheckBox
      Left = 3
      Top = 253
      Width = 457
      Height = 17
      Caption = 'N'#227'o Apresentar ST e IPI da Nota quando n'#227'o calculado no Item'
      TabOrder = 3
    end
    object ChDespesasAcessorias: TCheckBox
      Left = 3
      Top = 268
      Width = 451
      Height = 17
      Caption = 'Calcular indice para despesas acess'#243'rias'
      TabOrder = 4
    end
    object ChEntradasEFD: TCheckBox
      Left = 4
      Top = 283
      Width = 369
      Height = 17
      Caption = 'Desconsiderar notas de entradas'
      TabOrder = 5
    end
    object GrpDtInvent: TGroupBox
      Left = 3
      Top = 318
      Width = 459
      Height = 50
      Caption = ' Dados Invent'#225'rio '
      TabOrder = 6
      object DataInvent: TDateTimePicker
        Left = 10
        Top = 18
        Width = 101
        Height = 24
        Date = 41380.801514386570000000
        Time = 41380.801514386570000000
        TabOrder = 0
      end
      object ChBensConsumo: TCheckBox
        Left = 120
        Top = 21
        Width = 321
        Height = 17
        Caption = 'Adicinar Bens de Consumo'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object ChTruncado: TCheckBox
      Left = 262
      Top = 398
      Width = 177
      Height = 17
      Caption = 'Truncar valor do ICMS'
      TabOrder = 7
    end
    object edNotas: TEdit
      Left = 185
      Top = 396
      Width = 70
      Height = 21
      TabOrder = 8
      Text = '10'
    end
    object edBufNotas: TEdit
      Left = 96
      Top = 396
      Width = 84
      Height = 21
      TabOrder = 9
      Text = '1000'
    end
    object edBufLinhas: TEdit
      Left = 6
      Top = 399
      Width = 87
      Height = 21
      TabOrder = 10
      Text = '1000'
    end
    object GroupBox5: TGroupBox
      Left = 6
      Top = 429
      Width = 433
      Height = 47
      Caption = ' Pasta para grava'#231#227'o do arquivo '
      TabOrder = 11
      object SpeedButton3: TSpeedButton
        Left = 404
        Top = 18
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton3Click
      end
      object EdtPath: TEdit
        Left = 10
        Top = 17
        Width = 389
        Height = 21
        TabOrder = 0
      end
    end
  end
  object ACBrSPEDFiscal1: TACBrSPEDFiscal
    Path = 'C:\Program Files\Embarcadero\RAD Studio\9.0\bin\'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 624
    Top = 72
  end
  object OpenDialog1: TOpenDialog
    Left = 620
    Top = 32
  end
  object qrySped: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT PE.Nome, PE.Codigo_Municipio, PE.Endereco, PE.CPF_CNPJ, P' +
        'E.Numero, PE.Inscricao_Estadual, PE.Complemento, PE.Setor,'
      
        'PE.N_Pedido, P.Codigo_Cliente, P.Data_Venda FROM Pedido_Endereco' +
        '_Cliente PE INNER JOIN Pedido P on(PE.N_Pedido = P.N_Pedido)')
    Left = 568
    Top = 264
    object qrySpedNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrySpedCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qrySpedEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object qrySpedCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object qrySpedNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qrySpedInscricao_Estadual: TStringField
      FieldName = 'Inscricao_Estadual'
    end
    object qrySpedComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrySpedSetor: TStringField
      FieldName = 'Setor'
      Size = 30
    end
    object qrySpedN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object qrySpedData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qrySpedCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
  end
  object daSped: TDataSource
    DataSet = qrySped
    Left = 616
    Top = 264
  end
  object qry0200: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT P.NCM, P.Codigo as codigo_produto, P.Codigo_Original, P.C' +
        'odigo_Venda, P.Descricao as descricao_produto, P.Codigo_Barra, P' +
        '.Codigo_Fabricante, P.Codigo_Unidade_Medida, '
      
        'Un.Codigo as codigo_unidade, Un.Descricao as descricao_unidade, ' +
        'Un.Sigla FROM Produto P inner join Unidade_Medida Un on(P.Codigo' +
        '_Unidade_Medida = Un.Codigo)'
      ''
      '')
    Left = 552
    Top = 376
    object qry0200codigo_produto: TAutoIncField
      FieldName = 'codigo_produto'
      ReadOnly = True
    end
    object qry0200Codigo_Original: TStringField
      FieldName = 'Codigo_Original'
    end
    object qry0200Codigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qry0200descricao_produto: TStringField
      FieldName = 'descricao_produto'
      Size = 300
    end
    object qry0200Codigo_Barra: TStringField
      FieldName = 'Codigo_Barra'
    end
    object qry0200Codigo_Fabricante: TIntegerField
      FieldName = 'Codigo_Fabricante'
    end
    object qry0200Codigo_Unidade_Medida: TIntegerField
      FieldName = 'Codigo_Unidade_Medida'
    end
    object qry0200codigo_unidade: TAutoIncField
      FieldName = 'codigo_unidade'
      ReadOnly = True
    end
    object qry0200descricao_unidade: TStringField
      FieldName = 'descricao_unidade'
      Size = 30
    end
    object qry0200Sigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
    object qry0200NCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
  end
  object ds0200: TDataSource
    DataSet = qry0200
    Left = 584
    Top = 376
  end
end
