object FrmChama_Etiqueta: TFrmChama_Etiqueta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Etiquetas'
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 127
    Top = 33
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
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 1
  end
  object EdtConsulta: TEdit
    Left = 127
    Top = 49
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
    TabOrder = 2
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
  object PageControl1: TPageControl
    Left = 0
    Top = 79
    Width = 941
    Height = 474
    ActivePage = TabSheet2
    Style = tsFlatButtons
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Etiqueta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 931
        Height = 443
        BorderStyle = bsNone
        DataSource = ds_qry_consulta_padrao
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
        TabOrder = 0
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
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Cadastro'
            Visible = False
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Etiquetadora'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 931
        Height = 443
        BorderStyle = bsNone
        DataSource = ds_qry_consulta_etiquetadora
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        OnKeyDown = DBGrid2KeyDown
        OnTitleClick = DBGrid2TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Cadastro'
            Visible = False
          end>
      end
    end
  end
  object qrychama_etiqueta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cadastro_Etiqueta order by Descricao')
    Left = 656
    Top = 8
    object qrychama_etiquetaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_etiquetaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_etiquetaMargem_Superior: TFloatField
      FieldName = 'Margem_Superior'
    end
    object qrychama_etiquetaMargem_Inferior: TFloatField
      FieldName = 'Margem_Inferior'
    end
    object qrychama_etiquetaMargem_Esquerda: TFloatField
      FieldName = 'Margem_Esquerda'
    end
    object qrychama_etiquetaMargem_Direita: TFloatField
      FieldName = 'Margem_Direita'
    end
    object qrychama_etiquetaDistancia_Vertical: TFloatField
      FieldName = 'Distancia_Vertical'
    end
    object qrychama_etiquetaDistancia_Horizontal: TFloatField
      FieldName = 'Distancia_Horizontal'
    end
    object qrychama_etiquetaAltura_Etiqueta: TFloatField
      FieldName = 'Altura_Etiqueta'
    end
    object qrychama_etiquetaLargura_Etiqueta: TFloatField
      FieldName = 'Largura_Etiqueta'
    end
    object qrychama_etiquetaTamanho_Fonte: TFloatField
      FieldName = 'Tamanho_Fonte'
    end
    object qrychama_etiquetaLargura_Pagina: TFloatField
      FieldName = 'Largura_Pagina'
    end
    object qrychama_etiquetaAltura_Pagina: TFloatField
      FieldName = 'Altura_Pagina'
    end
    object qrychama_etiquetaEtiqueta_Linha: TFloatField
      FieldName = 'Etiqueta_Linha'
    end
    object qrychama_etiquetaLinha_Pagina: TFloatField
      FieldName = 'Linha_Pagina'
    end
    object qrychama_etiquetaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_etiqueta
    Left = 544
  end
  object ds_qry_consulta_etiquetadora: TDataSource
    DataSet = qrychama_etiquetadora
    Left = 760
    Top = 136
  end
  object qrychama_etiquetadora: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Etiquetadora')
    Left = 608
    Top = 128
    object qrychama_etiquetadoraCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_etiquetadoraData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_etiquetadoraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_etiquetadoraTipo_Barra_Etiqueta: TFloatField
      FieldName = 'Tipo_Barra_Etiqueta'
    end
    object qrychama_etiquetadoraLargura_Barra_Larga: TFloatField
      FieldName = 'Largura_Barra_Larga'
    end
    object qrychama_etiquetadoraLargura_Barra_Fina: TFloatField
      FieldName = 'Largura_Barra_Fina'
    end
    object qrychama_etiquetadoraDistancia_Horizontal_Etiqueta: TFloatField
      FieldName = 'Distancia_Horizontal_Etiqueta'
    end
    object qrychama_etiquetadoraDistancia_Vertical_Etiqueta: TFloatField
      FieldName = 'Distancia_Vertical_Etiqueta'
    end
    object qrychama_etiquetadoraAltura_Codigo: TFloatField
      FieldName = 'Altura_Codigo'
    end
    object qrychama_etiquetadoraHorizontal_Barra_Etiqueta: TFloatField
      FieldName = 'Horizontal_Barra_Etiqueta'
    end
    object qrychama_etiquetadoraVertical_Barra_Etiqueta: TFloatField
      FieldName = 'Vertical_Barra_Etiqueta'
    end
    object qrychama_etiquetadoraOrientacao_Impressao_Texto_Etiqueta: TStringField
      FieldName = 'Orientacao_Impressao_Texto_Etiqueta'
      Size = 10
    end
    object qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_1: TFloatField
      FieldName = 'Tamanho_Fonte_Texto_Etiqueta_Campo_1'
    end
    object qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_1: TFloatField
      FieldName = 'Multiplicador_V_Texto_Etiqueta_Campo_1'
    end
    object qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_1: TFloatField
      FieldName = 'Multiplicador_H_Texto_Etiqueta_Campo_1'
    end
    object qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_1: TFloatField
      FieldName = 'Horizontal_Texto_Etiqueta_Campo_1'
    end
    object qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_1: TFloatField
      FieldName = 'Vertical_Texto_Etiqueta_Campo_1'
    end
    object qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_2: TFloatField
      FieldName = 'Tamanho_Fonte_Texto_Etiqueta_Campo_2'
    end
    object qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_2: TFloatField
      FieldName = 'Multiplicador_V_Texto_Etiqueta_Campo_2'
    end
    object qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_2: TFloatField
      FieldName = 'Multiplicador_H_Texto_Etiqueta_Campo_2'
    end
    object qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_2: TFloatField
      FieldName = 'Horizontal_Texto_Etiqueta_Campo_2'
    end
    object qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_2: TFloatField
      FieldName = 'Vertical_Texto_Etiqueta_Campo_2'
    end
    object qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_3: TFloatField
      FieldName = 'Tamanho_Fonte_Texto_Etiqueta_Campo_3'
    end
    object qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_3: TFloatField
      FieldName = 'Multiplicador_V_Texto_Etiqueta_Campo_3'
    end
    object qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_3: TFloatField
      FieldName = 'Multiplicador_H_Texto_Etiqueta_Campo_3'
    end
    object qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_3: TFloatField
      FieldName = 'Horizontal_Texto_Etiqueta_Campo_3'
    end
    object qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_3: TFloatField
      FieldName = 'Vertical_Texto_Etiqueta_Campo_3'
    end
    object qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_4: TFloatField
      FieldName = 'Tamanho_Fonte_Texto_Etiqueta_Campo_4'
    end
    object qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_4: TFloatField
      FieldName = 'Multiplicador_V_Texto_Etiqueta_Campo_4'
    end
    object qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_4: TFloatField
      FieldName = 'Multiplicador_H_Texto_Etiqueta_Campo_4'
    end
    object qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_4: TFloatField
      FieldName = 'Horizontal_Texto_Etiqueta_Campo_4'
    end
    object qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_4: TFloatField
      FieldName = 'Vertical_Texto_Etiqueta_Campo_4'
    end
    object qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_5: TFloatField
      FieldName = 'Tamanho_Fonte_Texto_Etiqueta_Campo_5'
    end
    object qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_5: TFloatField
      FieldName = 'Multiplicador_V_Texto_Etiqueta_Campo_5'
    end
    object qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_5: TFloatField
      FieldName = 'Multiplicador_H_Texto_Etiqueta_Campo_5'
    end
    object qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_5: TFloatField
      FieldName = 'Horizontal_Texto_Etiqueta_Campo_5'
    end
    object qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_5: TFloatField
      FieldName = 'Vertical_Texto_Etiqueta_Campo_5'
    end
  end
end
