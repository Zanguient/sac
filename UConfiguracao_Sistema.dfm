object FrmConfiguracao_Sistema: TFrmConfiguracao_Sistema
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es do Sistema'
  ClientHeight = 418
  ClientWidth = 769
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 644
    Height = 418
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet13: TTabSheet
      Caption = 'Geral'
      ImageIndex = 4
      object Label41: TLabel
        Left = 215
        Top = 19
        Width = 63
        Height = 13
        Caption = 'Dias Avisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label52: TLabel
        Left = 345
        Top = 18
        Width = 72
        Height = 13
        Caption = 'Tempo Atua.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label54: TLabel
        Left = 215
        Top = 218
        Width = 164
        Height = 26
        Caption = 'C - C'#243'digo / T - Total a Pagar '#13#10'P - Peso / Q - Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 280
        Top = 19
        Width = 49
        Height = 13
        Caption = 'Dias Or'#231'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 209
        Height = 243
        Caption = 'Avisos'
        TabOrder = 0
        object CBTabela_Preco: TCheckBox
          Left = 16
          Top = 24
          Width = 121
          Height = 17
          Caption = 'Tabela de Pre'#231'os'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CBLancamento_Financeiro: TCheckBox
          Left = 16
          Top = 47
          Width = 153
          Height = 17
          Caption = 'Lan'#231'amentos Financeiros'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBCheque: TCheckBox
          Left = 16
          Top = 70
          Width = 121
          Height = 17
          Caption = 'Cheques'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object CBPedido_Compra: TCheckBox
          Left = 16
          Top = 93
          Width = 169
          Height = 17
          Caption = 'Pedido de Compra Pendente'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object CBAniversario_Cliente: TCheckBox
          Left = 16
          Top = 116
          Width = 121
          Height = 17
          Caption = 'Anivers'#225'rio Clientes'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object CBAniversario_Funcionario: TCheckBox
          Left = 16
          Top = 139
          Width = 137
          Height = 17
          Caption = 'Anivers'#225'rio Funcion'#225'rio'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object CBProduto_Vencido: TCheckBox
          Left = 16
          Top = 162
          Width = 137
          Height = 17
          Caption = 'Produtos Vencidos'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object CBConta_Fixa: TCheckBox
          Left = 16
          Top = 187
          Width = 137
          Height = 17
          Caption = 'Contas Fixas'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object CBCotacao_Preco: TCheckBox
          Left = 16
          Top = 210
          Width = 137
          Height = 17
          Caption = 'Cota'#231#227'o de Pre'#231'os'
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
      end
      object EdtDias_Avisar: TEdit
        Left = 215
        Top = 33
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = EdtDias_AvisarKeyPress
      end
      object EdtTempo_Atualizacao: TEdit
        Left = 345
        Top = 33
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
        OnKeyPress = EdtTempo_AtualizacaoKeyPress
      end
      object RGEAN: TRadioGroup
        Left = 215
        Top = 59
        Width = 177
        Height = 158
        Caption = 'EAN Balan'#231'a'
        ItemIndex = 0
        Items.Strings = (
          '2 C C C C 0 T T T T T T DV'
          '2 C C C C 0 0 P P P P P DV'
          '2 C C C C 0 0 Q Q Q Q Q DV'
          '2 C C C C C T T T T T T DV'
          '2 C C C C C 0 P P P P P DV'
          '2 C C C C C 0 Q Q Q Q Q DV'
          '2 C C C C C C P P P P P  DV'
          '2 C C C C C C Q Q Q Q Q DV'
          '2 C C C C C C T T T T T DV')
        TabOrder = 4
      end
      object EdtDias_Orcamento_Vencido: TEdit
        Left = 280
        Top = 33
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 2
        OnKeyPress = EdtDias_AvisarKeyPress
      end
      object CBFechar_Caixa: TCheckBox
        Left = 16
        Top = 266
        Width = 177
        Height = 17
        Caption = 'Fechar caixa ao sair do sistema'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object CBCalcula_Juro: TCheckBox
        Left = 16
        Top = 283
        Width = 177
        Height = 17
        Caption = 'Calcula juros contas a receber'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object CBOrcamento_Vencido: TCheckBox
        Left = 16
        Top = 300
        Width = 177
        Height = 17
        Caption = 'Atualiza Or'#231'amento Vencido'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object RGConsulta_Produto_Por: TRadioGroup
        Left = 396
        Top = 59
        Width = 121
        Height = 111
        Caption = 'Cons. padr'#227'o de prod.'
        ItemIndex = 4
        Items.Strings = (
          'C'#243'digo Sistema'
          'C'#243'digo Original'
          'C'#243'digo Venda'
          'C'#243'digo Similar'
          'Descri'#231#227'o'
          'Aplica'#231#227'o')
        TabOrder = 5
      end
      object RGTipoDesc_Acr_Fechamento: TRadioGroup
        Left = 523
        Top = 59
        Width = 82
        Height = 56
        Caption = 'Tipo D/A'
        ItemIndex = 1
        Items.Strings = (
          '%'
          'R$')
        TabOrder = 6
      end
      object CBBloqueia_Cliente: TCheckBox
        Left = 199
        Top = 249
        Width = 97
        Height = 17
        Caption = 'Bloqueia Cliente'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object CBBackup: TCheckBox
        Left = 199
        Top = 283
        Width = 145
        Height = 17
        Caption = 'Backup ao fechar sistema'
        Checked = True
        State = cbChecked
        TabOrder = 15
      end
      object RGUsar_Comissao: TRadioGroup
        Left = 523
        Top = 114
        Width = 82
        Height = 56
        Caption = 'Usar comiss'#227'o'
        ItemIndex = 1
        Items.Strings = (
          'Vendedor'
          'Produto')
        TabOrder = 7
      end
      object CBOpcao_Servico_Marcada: TCheckBox
        Left = 16
        Top = 249
        Width = 145
        Height = 17
        Caption = 'Op'#231#227'o Servi'#231'o Marcada'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object CBDesbloqueia_Cliente: TCheckBox
        Left = 199
        Top = 266
        Width = 130
        Height = 17
        Caption = 'Desbloqueia Cliente'
        Checked = True
        State = cbChecked
        TabOrder = 14
      end
      object CBControla_Credito: TCheckBox
        Left = 199
        Top = 300
        Width = 145
        Height = 17
        Caption = 'Controla Cr'#233'dito Cliente'
        Checked = True
        State = cbChecked
        TabOrder = 16
      end
      object RGBusca_Parametros_Calcular_Preco: TRadioGroup
        Left = 396
        Top = 169
        Width = 209
        Height = 48
        Hint = 
          'Op'#231#227'o para escolher em qual dos locais o sistema vai buscar os p' +
          'ar'#226'metros (% Lucro, Desconto e Comiss'#227'o) no momento de cadastrar' +
          ' um produto.'
        Caption = 'Para calcular pre'#231'o de venda'
        ItemIndex = 1
        Items.Strings = (
          'Tabela de Pre'#231'o'
          'Grupo de Produto')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object CBGera_Codigo_EAN: TCheckBox
        Left = 344
        Top = 249
        Width = 145
        Height = 17
        Caption = 'Gera C'#243'digo EAN13 v'#225'lido'
        Checked = True
        State = cbChecked
        TabOrder = 17
      end
      object CBTrazer_Cond_Pag_ECF: TCheckBox
        Left = 344
        Top = 266
        Width = 169
        Height = 17
        Caption = 'Trazer cond. pag. somente ECF'
        Checked = True
        State = cbChecked
        TabOrder = 18
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'ECF/Etiqueta/Balan'#231'a'
      object Label1: TLabel
        Left = 0
        Top = 27
        Width = 104
        Height = 13
        Caption = 'Mensagem Cupom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label42: TLabel
        Left = 163
        Top = 27
        Width = 34
        Height = 13
        Caption = 'ISSQN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 3
        Top = 212
        Width = 44
        Height = 13
        Caption = 'Balan'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label34: TLabel
        Left = 95
        Top = 212
        Width = 31
        Height = 13
        Caption = 'Porta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 154
        Top = 212
        Width = 55
        Height = 13
        Caption = 'Baud rate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label36: TLabel
        Left = 223
        Top = 212
        Width = 51
        Height = 13
        Caption = 'Data Bits'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 284
        Top = 212
        Width = 34
        Height = 13
        Caption = 'Parity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 3
        Top = 256
        Width = 50
        Height = 13
        Caption = 'Stop Bits'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label39: TLabel
        Left = 79
        Top = 256
        Width = 73
        Height = 13
        Caption = 'Handshaking'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label56: TLabel
        Left = 164
        Top = 256
        Width = 48
        Height = 13
        Caption = 'TimeOut'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtMensagem_Cupom: TEdit
        Left = 0
        Top = 42
        Width = 164
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object EdtISSQN: TEdit
        Left = 163
        Top = 42
        Width = 71
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = EdtISSQNKeyPress
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 633
        Height = 25
        BorderStyle = bsSingle
        Caption = 'ECF'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 11
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 98
        Width = 391
        Height = 79
        Caption = 'Configura'#231#227'o da Impressora'
        TabOrder = 2
        object Label12: TLabel
          Left = 91
          Top = 14
          Width = 20
          Height = 13
          Caption = 'DPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 163
          Top = 14
          Width = 69
          Height = 13
          Caption = 'Avan'#231'o Etiq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 235
          Top = 14
          Width = 31
          Height = 13
          Caption = 'Porta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 307
          Top = 14
          Width = 75
          Height = 13
          Caption = 'Temperatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 8
          Top = 14
          Width = 41
          Height = 13
          Caption = 'Modelo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CBLimpar_Memoria: TCheckBox
          Left = 14
          Top = 57
          Width = 97
          Height = 17
          Caption = 'Limpar Mem'#243'ria'
          TabOrder = 5
        end
        object EdtAvanco_Etiqueta: TEdit
          Left = 163
          Top = 30
          Width = 73
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 2
          OnKeyPress = EdtAvanco_EtiquetaKeyPress
        end
        object EdtPorta_Impressora_Etiqueta: TEdit
          Left = 235
          Top = 30
          Width = 73
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object EdtTemperatura_Impressora_Etiqueta: TEdit
          Left = 307
          Top = 30
          Width = 73
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 4
          OnKeyPress = EdtTemperatura_Impressora_EtiquetaKeyPress
        end
        object CBDPI_Impressora_Etiqueta: TComboBox
          Left = 91
          Top = 30
          Width = 73
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = 'dpi203'
          Items.Strings = (
            'dpi203'
            'dpi300'
            'dpi600')
        end
        object CBModelo_Etiqueta: TComboBox
          Left = 8
          Top = 30
          Width = 84
          Height = 21
          Style = csDropDownList
          ItemIndex = 4
          TabOrder = 0
          Text = 'etqEpl2'
          Items.Strings = (
            'etqNenhuma'
            'etqPpla'
            'etqPPlb'
            'etqZPLII'
            'etqEpl2')
        end
      end
      object cmbBalanca: TComboBox
        Left = 3
        Top = 231
        Width = 90
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Nenhuma'
          'Filizola'
          'Toledo'
          'Toledo2180'
          'Urano'
          'LucasTec'
          'Magna'
          'Digitron'
          'Magellan'
          'UranoPOP'
          'Lider')
      end
      object EdtPorta_Balanca: TEdit
        Left = 95
        Top = 231
        Width = 58
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 4
        Text = 'COM1'
      end
      object cmbBaudRate: TComboBox
        Left = 154
        Top = 231
        Width = 63
        Height = 21
        Style = csDropDownList
        ItemIndex = 6
        TabOrder = 5
        Text = '9600'
        Items.Strings = (
          '110'
          '300'
          '600'
          '1200'
          '2400'
          '4800'
          '9600'
          '14400'
          '19200'
          '38400'
          '56000'
          '57600')
      end
      object cmbDataBits: TComboBox
        Left = 223
        Top = 231
        Width = 55
        Height = 21
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 6
        Text = '8'
        Items.Strings = (
          '5'
          '6'
          '7'
          '8')
      end
      object cmbParity: TComboBox
        Left = 284
        Top = 231
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = 'none'
        Items.Strings = (
          'none'
          'odd'
          'even'
          'mark'
          'space')
      end
      object cmbStopBits: TComboBox
        Left = 3
        Top = 271
        Width = 70
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 8
        Text = 's1'
        Items.Strings = (
          's1'
          's1,5'
          's2'
          '')
      end
      object cmbHandShaking: TComboBox
        Left = 78
        Top = 271
        Width = 80
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 9
        Text = 'Nenhum'
        Items.Strings = (
          'Nenhum'
          'XON/XOFF'
          'RTS/CTS'
          'DTR/DSR')
      end
      object EdtTimeOut_Balanca: TEdit
        Left = 164
        Top = 271
        Width = 58
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 10
        Text = '2000'
      end
      object Panel1: TPanel
        Left = 0
        Top = 67
        Width = 633
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Etiqueta'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
      end
      object Panel2: TPanel
        Left = 2
        Top = 183
        Width = 455
        Height = 25
        BorderStyle = bsSingle
        Caption = 
          'Apenas para exemplos de dados para serem inseridos no arquivo Ba' +
          'lanca.INI'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 13
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Fiscal'
      ImageIndex = 1
      object Label3: TLabel
        Left = 0
        Top = 13
        Width = 110
        Height = 13
        Caption = 'Perfil Arquivo Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 0
        Top = 50
        Width = 53
        Height = 13
        Caption = 'Tipo Ativ.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 120
        Top = 13
        Width = 62
        Height = 13
        Caption = 'Vers'#227'o EFD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtPerfil: TEdit
        Left = 0
        Top = 28
        Width = 121
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object EdtCodigo_Tipo_Atividade: TEdit
        Left = 0
        Top = 65
        Width = 53
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object EdtTipo_Atividade: TEdit
        Left = 52
        Top = 65
        Width = 221
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object EdtVersao_EFD: TEdit
        Left = 120
        Top = 28
        Width = 62
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'NF-e'
      ImageIndex = 3
      TabVisible = False
    end
    object TabSheet3: TTabSheet
      Caption = 'Estoque/Financeiro'
      ImageIndex = 2
      object Label40: TLabel
        Left = 0
        Top = 3
        Width = 133
        Height = 13
        Caption = 'Tabela de Pre'#231'o Padr'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label43: TLabel
        Left = 439
        Top = 167
        Width = 139
        Height = 13
        Caption = 'TABSheet4 - Tab da NF-e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label74: TLabel
        Left = 0
        Top = 40
        Width = 37
        Height = 13
        Caption = 'C.F.O.P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtTabela_Preco: TEdit
        Left = 65
        Top = 20
        Width = 313
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = EdtTabela_PrecoKeyPress
      end
      object EdtCodigo_Tabela_Preco: TEdit
        Left = 0
        Top = 20
        Width = 65
        Height = 17
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        TabOrder = 0
        OnKeyDown = EdtCodigo_Tabela_PrecoKeyDown
        OnKeyPress = EdtCodigo_Tabela_PrecoKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 84
        Width = 616
        Height = 129
        Caption = 'Lan'#231'amentos Financeiros a Receber (Vendas)'
        TabOrder = 6
        object Label44: TLabel
          Left = 7
          Top = 16
          Width = 51
          Height = 13
          Caption = 'Tipo Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 7
          Top = 92
          Width = 50
          Height = 13
          Caption = 'Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 287
          Top = 15
          Width = 42
          Height = 13
          Caption = 'Depart.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 7
          Top = 53
          Width = 67
          Height = 13
          Caption = 'Plano Finan.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtTipo_Documento: TEdit
          Left = 67
          Top = 32
          Width = 221
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnKeyPress = EdtTipo_DocumentoKeyPress
        end
        object EdtCodigo_Tipo_Documento: TEdit
          Left = 7
          Top = 32
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
          OnKeyDown = EdtCodigo_Tipo_DocumentoKeyDown
          OnKeyPress = EdtCodigo_Tipo_DocumentoKeyPress
        end
        object EdtHistorico: TEdit
          Left = 7
          Top = 107
          Width = 281
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
        end
        object EdtDepartamento: TEdit
          Left = 347
          Top = 32
          Width = 221
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnKeyPress = EdtDepartamentoKeyPress
        end
        object EdtCodigo_Departamento: TEdit
          Left = 287
          Top = 32
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
          TabOrder = 2
          OnKeyDown = EdtCodigo_DepartamentoKeyDown
          OnKeyPress = EdtCodigo_DepartamentoKeyPress
        end
        object EdtPlano: TEdit
          Left = 67
          Top = 70
          Width = 501
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          OnKeyPress = EdtPlanoKeyPress
        end
        object EdtCodigo_Plano: TEdit
          Left = 7
          Top = 70
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
          TabOrder = 4
          OnKeyDown = EdtCodigo_PlanoKeyDown
          OnKeyPress = EdtCodigo_PlanoKeyPress
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 217
        Width = 616
        Height = 129
        Caption = 'Lan'#231'amentos Financeiros a Pagar'
        TabOrder = 7
        object Label48: TLabel
          Left = 7
          Top = 16
          Width = 51
          Height = 13
          Caption = 'Tipo Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 7
          Top = 92
          Width = 50
          Height = 13
          Caption = 'Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 287
          Top = 15
          Width = 42
          Height = 13
          Caption = 'Depart.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 7
          Top = 53
          Width = 67
          Height = 13
          Caption = 'Plano Finan.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtTipo_Documento_Pagar: TEdit
          Left = 67
          Top = 32
          Width = 221
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnKeyPress = EdtTipo_Documento_PagarKeyPress
        end
        object EdtCodigo_Tipo_Documento_Pagar: TEdit
          Left = 7
          Top = 32
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
          OnKeyDown = EdtCodigo_Tipo_Documento_PagarKeyDown
          OnKeyPress = EdtCodigo_Tipo_Documento_PagarKeyPress
        end
        object EdtHistorico_Pagar: TEdit
          Left = 7
          Top = 107
          Width = 281
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
        end
        object EdtDepartamento_Pagar: TEdit
          Left = 347
          Top = 32
          Width = 221
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnKeyPress = EdtDepartamento_PagarKeyPress
        end
        object EdtCodigo_Departamento_Pagar: TEdit
          Left = 287
          Top = 32
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
          TabOrder = 2
          OnKeyDown = EdtCodigo_Departamento_PagarKeyDown
          OnKeyPress = EdtCodigo_Departamento_PagarKeyPress
        end
        object EdtPlano_Pagar: TEdit
          Left = 67
          Top = 70
          Width = 501
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          OnKeyPress = EdtPlano_PagarKeyPress
        end
        object EdtCodigo_Plano_Pagar: TEdit
          Left = 7
          Top = 70
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
          TabOrder = 4
          OnKeyDown = EdtCodigo_Plano_PagarKeyDown
          OnKeyPress = EdtCodigo_Plano_PagarKeyPress
        end
      end
      object RGGerar_Financeiro: TRadioGroup
        Left = 384
        Top = -2
        Width = 97
        Height = 55
        Caption = 'Gerar Financeiro'
        ItemIndex = 0
        Items.Strings = (
          'Cupom Fiscal'
          'NFe'
          'N'#227'o Gerar')
        TabOrder = 4
      end
      object RGGerar_Estoque: TRadioGroup
        Left = 487
        Top = -2
        Width = 97
        Height = 55
        Caption = 'Gerar Estoque'
        ItemIndex = 0
        Items.Strings = (
          'Cupom Fiscal'
          'Nota Fiscal')
        TabOrder = 5
      end
      object EdtCodigo_CFOP: TEdit
        Left = 0
        Top = 55
        Width = 65
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
        TabOrder = 2
        OnKeyDown = EdtCodigo_CFOPKeyDown
        OnKeyPress = EdtCodigo_CFOPKeyPress
      end
      object EdtCFOP: TEdit
        Left = 65
        Top = 55
        Width = 313
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
        OnKeyPress = EdtCFOPKeyPress
      end
    end
    object TabSheet14: TTabSheet
      Caption = 'Pedido/NFe'
      ImageIndex = 5
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 636
        Height = 387
        Cursor = crHandPoint
        ActivePage = TabSheet6
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet5: TTabSheet
          Caption = 'NFe/NFCe'
          object GBConfiguracao_NFE: TGroupBox
            Left = 3
            Top = 3
            Width = 622
            Height = 350
            Caption = 'Configura'#231#227'o da NF-e'
            TabOrder = 0
            object Label9: TLabel
              Left = 14
              Top = 176
              Width = 63
              Height = 13
              Caption = 'Logomarca'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 14
              Top = 216
              Width = 62
              Height = 13
              Caption = 'Salvar XML'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label89: TLabel
              Left = 208
              Top = 101
              Width = 92
              Height = 13
              Caption = 'N'#186' de S'#233'rie Cert.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label90: TLabel
              Left = 208
              Top = 137
              Width = 35
              Height = 13
              Caption = 'Senha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label53: TLabel
              Left = 14
              Top = 257
              Width = 103
              Height = 13
              Caption = 'Caminho Schemas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 328
              Top = 137
              Width = 36
              Height = 13
              Caption = 'Id CSC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 392
              Top = 137
              Width = 37
              Height = 13
              Caption = 'N'#186' CSC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RGAmbiente: TRadioGroup
              Left = 14
              Top = 21
              Width = 185
              Height = 36
              Caption = 'Ambiente'
              Columns = 2
              ItemIndex = 1
              Items.Strings = (
                'Produ'#231#227'o'
                'Homologa'#231#227'o')
              TabOrder = 0
            end
            object RGDanfe: TRadioGroup
              Left = 14
              Top = 63
              Width = 185
              Height = 36
              Caption = 'Impress'#227'o'
              Columns = 2
              ItemIndex = 1
              Items.Strings = (
                'Retrato'
                'Paisagem')
              TabOrder = 1
            end
            object RGForma_Emissao: TRadioGroup
              Left = 208
              Top = 21
              Width = 249
              Height = 78
              Caption = 'Tipo de Emiss'#227'o'
              Columns = 2
              DoubleBuffered = False
              ItemIndex = 0
              Items.Strings = (
                'Normal'
                'Conting'#234'ncia'
                'SCAN'
                'DPEC'
                'FSDA')
              ParentDoubleBuffered = False
              TabOrder = 2
            end
            object EdtLogomarca: TEdit
              Left = 14
              Top = 192
              Width = 443
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = bsNone
              CharCase = ecUpperCase
              TabOrder = 3
            end
            object EdtSalva_XML: TEdit
              Left = 14
              Top = 232
              Width = 443
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = bsNone
              CharCase = ecUpperCase
              TabOrder = 4
            end
            object Button1: TButton
              Left = 463
              Top = 191
              Width = 26
              Height = 18
              Caption = '...'
              TabOrder = 5
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 463
              Top = 231
              Width = 26
              Height = 18
              Caption = '...'
              TabOrder = 6
              OnClick = Button2Click
            end
            object EdtN_Certificado: TEdit
              Left = 208
              Top = 117
              Width = 249
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = bsNone
              TabOrder = 7
            end
            object EdtSenha_Certificado: TEdit
              Left = 208
              Top = 153
              Width = 121
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = bsNone
              PasswordChar = '*'
              TabOrder = 8
            end
            object Button3: TButton
              Left = 463
              Top = 117
              Width = 26
              Height = 18
              Caption = '...'
              TabOrder = 11
              OnClick = Button3Click
            end
            object EdtCaminho_Schema: TEdit
              Left = 14
              Top = 273
              Width = 443
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = bsNone
              CharCase = ecUpperCase
              TabOrder = 12
            end
            object Button4: TButton
              Left = 463
              Top = 272
              Width = 26
              Height = 18
              Caption = '...'
              TabOrder = 13
              OnClick = Button4Click
            end
            object EdtIdCSC: TEdit
              Left = 328
              Top = 153
              Width = 65
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = bsNone
              TabOrder = 9
            end
            object EdtNumero_CSC: TEdit
              Left = 392
              Top = 153
              Width = 177
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = bsNone
              TabOrder = 10
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Pedido/Carn'#234
          ImageIndex = 1
          object Label7: TLabel
            Left = 0
            Top = 1
            Width = 97
            Height = 13
            Caption = 'Gerar PDF Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 224
            Top = 56
            Width = 37
            Height = 13
            Caption = 'C'#243'pias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 0
            Top = 103
            Width = 92
            Height = 13
            Caption = 'Gerar PDF Carn'#234
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 0
            Top = 146
            Width = 109
            Height = 13
            Caption = 'Observa'#231#245'es Carn'#234
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtCaminho_PDF_Pedido: TEdit
            Left = 0
            Top = 17
            Width = 443
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 500
            TabOrder = 0
          end
          object Button5: TButton
            Left = 449
            Top = 16
            Width = 26
            Height = 18
            Caption = '...'
            TabOrder = 1
            OnClick = Button5Click
          end
          object RGImpressao_Pedido: TRadioGroup
            Left = 0
            Top = 37
            Width = 106
            Height = 52
            Caption = 'Impress'#227'o Pedido'
            ItemIndex = 1
            Items.Strings = (
              'Matricial'
              'Jato de Tinta')
            TabOrder = 2
          end
          object RGTamanho_Impressao: TRadioGroup
            Left = 112
            Top = 37
            Width = 106
            Height = 52
            Caption = 'Tamanho Impress'#227'o'
            ItemIndex = 1
            Items.Strings = (
              'Normal'
              'Meia p'#225'gina')
            TabOrder = 3
          end
          object EdtQtde_Copias: TEdit
            Left = 224
            Top = 71
            Width = 66
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 4
            OnKeyPress = EdtTempo_AtualizacaoKeyPress
          end
          object EdtCaminho_PDF_Carne: TEdit
            Left = 0
            Top = 119
            Width = 443
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 500
            TabOrder = 5
          end
          object Button6: TButton
            Left = 449
            Top = 118
            Width = 26
            Height = 18
            Caption = '...'
            TabOrder = 6
            OnClick = Button6Click
          end
          object MmoObservacoes_Carne: TMemo
            Left = 0
            Top = 162
            Width = 475
            Height = 69
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 800
            ScrollBars = ssVertical
            TabOrder = 7
          end
          object RGTipo_Dias: TRadioGroup
            Left = 498
            Top = 114
            Width = 82
            Height = 55
            Caption = 'Dias'
            ItemIndex = 1
            Items.Strings = (
              #218'teis'
              'Corridos'
              'Mesmo Dia')
            TabOrder = 8
          end
        end
      end
    end
    object TabSheet15: TTabSheet
      Caption = 'Campos Obrigat'#243'rios'
      ImageIndex = 6
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 121
        Height = 265
        Caption = 'Cadastro de Clientes'
        TabOrder = 0
        object CBCliente_Nome: TCheckBox
          Left = 16
          Top = 24
          Width = 49
          Height = 17
          Caption = 'Nome'
          TabOrder = 0
        end
        object CBCliente_Razao_Social: TCheckBox
          Left = 16
          Top = 41
          Width = 89
          Height = 17
          Caption = 'Raz'#227'o Social'
          TabOrder = 1
        end
        object CBCliente_CPF: TCheckBox
          Left = 16
          Top = 59
          Width = 89
          Height = 17
          Caption = 'CPF'
          TabOrder = 2
        end
        object CBCliente_RG: TCheckBox
          Left = 16
          Top = 76
          Width = 89
          Height = 17
          Caption = 'RG'
          TabOrder = 3
        end
        object CBCliente_CNPJ: TCheckBox
          Left = 16
          Top = 93
          Width = 89
          Height = 17
          Caption = 'CNPJ'
          TabOrder = 4
        end
        object CBCliente_Insc_Estadual: TCheckBox
          Left = 16
          Top = 110
          Width = 89
          Height = 17
          Caption = 'Insc. Estadual'
          TabOrder = 5
        end
        object CBCliente_Endereco: TCheckBox
          Left = 16
          Top = 127
          Width = 89
          Height = 17
          Caption = 'Endere'#231'o'
          TabOrder = 6
        end
        object CBCliente_Cidade: TCheckBox
          Left = 16
          Top = 198
          Width = 89
          Height = 17
          Caption = 'Cidade'
          TabOrder = 7
        end
        object CBCliente_Setor: TCheckBox
          Left = 16
          Top = 163
          Width = 89
          Height = 17
          Caption = 'Setor'
          TabOrder = 8
        end
        object CBCliente_Numero: TCheckBox
          Left = 16
          Top = 145
          Width = 89
          Height = 17
          Caption = 'N'#250'mero'
          TabOrder = 9
        end
        object CBCliente_Email: TCheckBox
          Left = 16
          Top = 181
          Width = 89
          Height = 17
          Caption = 'Email'
          TabOrder = 10
        end
        object CBCliente_Telefone: TCheckBox
          Left = 16
          Top = 233
          Width = 89
          Height = 17
          Caption = 'Telefone'
          TabOrder = 11
        end
        object CBCliente_Data_Nascimento: TCheckBox
          Left = 16
          Top = 215
          Width = 89
          Height = 17
          Caption = 'Data Nasc.'
          TabOrder = 12
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Configura'#231#245'es FAV'
      ImageIndex = 7
      object lbl1: TLabel
        Left = 128
        Top = 9
        Width = 73
        Height = 13
        Caption = 'Qt. M'#225'quinas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 0
        Top = 165
        Width = 53
        Height = 13
        Caption = 'N'#186' Fabric.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 115
        Top = 165
        Width = 73
        Height = 13
        Caption = 'Grande Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 195
        Top = 165
        Width = 57
        Height = 13
        Caption = 'Marca ECF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 286
        Top = 165
        Width = 31
        Height = 13
        Caption = 'Porta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 329
        Top = 165
        Width = 31
        Height = 13
        Caption = 'CIECF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 401
        Top = 165
        Width = 25
        Height = 13
        Caption = 'MD5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 128
        Top = 107
        Width = 116
        Height = 22
        Caption = 'Buscar Dados ECF'
        Glyph.Data = {
          0A020000424D0A0200000000000036000000280000000C0000000D0000000100
          180000000000D4010000C40E0000C40E00000000000000000000FFFFFFCBB78F
          AA8845A58139A58139A58139A58139A58139A58139AA88456A4B0D6A4B0DCBB7
          8FC2AB7FE5E5E5E9E9E7E5E5E5E5E5E5E5E5E5E5E5E5E6DCC78566286A4B0DD5
          B472A58139E9E9E7EBEBEAEBEBEAE9E9E7E9E9E7E9E9E7E6DCC78566286A4B0D
          D5B472DABB7DA58139F1EFEBE9E9E7D3C4A7B6A583B6A583CBB78FB596586A4B
          0DC6A563FDEAC5A58139A58139F2F2F2D3C4A7B59658FFE4AFFDEAC5D5B4726A
          4B0DDABB7DFDEAC5EBEBEAA58139A58139F8F8F8AA8845FFEFD2FFFFFFFDFCFA
          FFEFD2C6A563CBB78FF1EFEBF2F2F2A58139A58139FDFCFAAA8845FFFFFFFFFF
          FFFFF6E7FDEAC5FDDC9CB7A176E9E9E7F2F2F2A58139A58139FFFFFFAA8845FC
          FAF6FFF4DFFFEFD2FDEAC5FDEAC5B59F72F1EFEBF8F8F8A58139A58139FFFFFF
          AA8845FFEFD2FDEAC5FDDC9CFFF6E7FDEAC5C2AB7FF1EFEBFDFCFAA58139A581
          39FFFFFFCBB78FA58139FFE4AFFFF6E7FDEAC5B59658E5D6B7FDFCFAFFFFFFA5
          8139A58139FDFCFAF9F6F2C2AB7FA58139856628A58139D3C4A7FCFAF6FFFFFF
          FDFCFAA58139CBB78FCBB78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFCBB78FCBB78FFFFFFFCBB78FA58139A58139A58139A58139A58139A5
          8139A58139A58139CBB78FFFFFFF}
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 250
        Top = 107
        Width = 91
        Height = 22
        Caption = 'Procurar ECF'
        Glyph.Data = {
          0A020000424D0A0200000000000036000000280000000C0000000D0000000100
          180000000000D4010000C40E0000C40E00000000000000000000FFFFFFCBB78F
          AA8845A58139A58139A58139A58139A58139A58139AA88456A4B0D6A4B0DCBB7
          8FC2AB7FE5E5E5E9E9E7E5E5E5E5E5E5E5E5E5E5E5E5E6DCC78566286A4B0DD5
          B472A58139E9E9E7EBEBEAEBEBEAE9E9E7E9E9E7E9E9E7E6DCC78566286A4B0D
          D5B472DABB7DA58139F1EFEBE9E9E7D3C4A7B6A583B6A583CBB78FB596586A4B
          0DC6A563FDEAC5A58139A58139F2F2F2D3C4A7B59658FFE4AFFDEAC5D5B4726A
          4B0DDABB7DFDEAC5EBEBEAA58139A58139F8F8F8AA8845FFEFD2FFFFFFFDFCFA
          FFEFD2C6A563CBB78FF1EFEBF2F2F2A58139A58139FDFCFAAA8845FFFFFFFFFF
          FFFFF6E7FDEAC5FDDC9CB7A176E9E9E7F2F2F2A58139A58139FFFFFFAA8845FC
          FAF6FFF4DFFFEFD2FDEAC5FDEAC5B59F72F1EFEBF8F8F8A58139A58139FFFFFF
          AA8845FFEFD2FDEAC5FDDC9CFFF6E7FDEAC5C2AB7FF1EFEBFDFCFAA58139A581
          39FFFFFFCBB78FA58139FFE4AFFFF6E7FDEAC5B59658E5D6B7FDFCFAFFFFFFA5
          8139A58139FDFCFAF9F6F2C2AB7FA58139856628A58139D3C4A7FCFAF6FFFFFF
          FDFCFAA58139CBB78FCBB78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFCBB78FCBB78FFFFFFFCBB78FA58139A58139A58139A58139A58139A5
          8139A58139A58139CBB78FFFFFFF}
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 347
        Top = 107
        Width = 95
        Height = 22
        Caption = 'Gravar dados ECF'
        OnClick = SpeedButton3Click
      end
      object Label17: TLabel
        Left = 518
        Top = 165
        Width = 41
        Height = 13
        Caption = 'Modelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 568
        Top = 165
        Width = 47
        Height = 13
        Caption = 'N'#186' Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBGerar: TGroupBox
        Left = 0
        Top = 0
        Width = 116
        Height = 127
        Caption = 'Gerar'
        TabOrder = 0
        object cbPre_Venda: TCheckBox
          Left = 16
          Top = 22
          Width = 97
          Height = 17
          Caption = 'Pr'#233' Venda'
          TabOrder = 0
        end
        object cbOS: TCheckBox
          Left = 16
          Top = 40
          Width = 97
          Height = 17
          Caption = 'O.S'
          TabOrder = 1
          OnClick = cbOSClick
        end
        object cbDAV: TCheckBox
          Left = 16
          Top = 59
          Width = 97
          Height = 17
          Caption = 'D.A.V'
          TabOrder = 2
        end
        object cbNFe: TCheckBox
          Left = 16
          Top = 80
          Width = 97
          Height = 17
          Caption = 'NFe'
          TabOrder = 3
        end
        object cbCupomFiscal: TCheckBox
          Left = 16
          Top = 100
          Width = 97
          Height = 17
          Caption = 'Cupom Fiscal'
          TabOrder = 4
        end
      end
      object edtQuantidade_Maquinas: TEdit
        Left = 128
        Top = 24
        Width = 73
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = EdtTempo_AtualizacaoKeyPress
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 204
        Width = 630
        Height = 180
        BorderStyle = bsNone
        DataSource = ds1
        DrawingStyle = gdsGradient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = dbgrd1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Fabricacao'
            Title.Caption = 'N'#186' Fabrica'#231#227'o'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Marca'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Porta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIECF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MD5'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Ativacao'
            Title.Caption = 'Ativacao'
            Width = 83
            Visible = True
          end>
      end
      object edtN_Fabricacao: TEdit
        Left = 0
        Top = 181
        Width = 116
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object edtGT: TEdit
        Left = 115
        Top = 181
        Width = 82
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtPorta: TEdit
        Left = 286
        Top = 181
        Width = 44
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 7
      end
      object edtCIECF: TEdit
        Left = 329
        Top = 181
        Width = 73
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 8
      end
      object edtMD5: TEdit
        Left = 401
        Top = 181
        Width = 118
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 9
      end
      object pnl1: TPanel
        Left = 0
        Top = 135
        Width = 636
        Height = 25
        BorderStyle = bsSingle
        Caption = 'ECF'#39's liberados para uso'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
      end
      object cbModelo: TComboBox
        Left = 196
        Top = 181
        Width = 90
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        Items.Strings = (
          'ecfBematech')
      end
      object RGTipo_OS: TRadioGroup
        Left = 228
        Top = 0
        Width = 173
        Height = 73
        Caption = 'Tipo de OS'
        ItemIndex = 0
        Items.Strings = (
          'Oficina Mec'#226'nica'
          'Oficina de consertos em geral'
          'Sem equipamentos')
        TabOrder = 2
      end
      object EdtModelo: TEdit
        Left = 518
        Top = 181
        Width = 51
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 10
      end
      object EdtN_Caixa: TEdit
        Left = 568
        Top = 181
        Width = 54
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 11
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 418
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
    TabOrder = 1
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Salvar'
      Enabled = False
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Excluir o registro selecionado'
      Caption = '&Excluir'
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnExcluirClick
    end
    object BBtnPesquisar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar um registro desejado'
      Caption = '&Pesquisar'
      ImageIndex = 5
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnPesquisarClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para Cancelar a Inser'#231#227'o ou Altera'#231#227'o de um registro'
      Caption = '&Cancelar'
      Enabled = False
      ImageIndex = 4
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnCancelarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 43
    Top = 320
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.IncluirQRCodeXMLNFCe = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 48
    Top = 288
  end
  object qryconfiguracao_ecf: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from configuracao_ecf')
    Left = 72
    Top = 368
    object qryconfiguracao_ecfCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object strngfld_ecfN_Fabricacao: TStringField
      FieldName = 'N_Fabricacao'
      Size = 30
    end
    object qryconfiguracao_ecfGT: TFloatField
      FieldName = 'GT'
    end
    object strngfld_ecfPorta: TStringField
      FieldName = 'Porta'
      Size = 5
    end
    object strngfld_ecfMarca: TStringField
      FieldName = 'Marca'
    end
    object strngfld_ecfCIECF: TStringField
      FieldName = 'CIECF'
      Size = 10
    end
    object strngfld_ecfMD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
    object qryconfiguracao_ecfData_Ativacao: TDateTimeField
      FieldName = 'Data_Ativacao'
    end
    object qryconfiguracao_ecfCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
  end
  object ds1: TDataSource
    DataSet = qryconfiguracao_ecf
    Left = 48
    Top = 360
  end
  object ACBrETQ1: TACBrETQ
    Porta = 'LPT1'
    Ativo = False
    Left = 56
    Top = 248
  end
end
