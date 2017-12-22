object FrmChama_Veiculo: TFrmChama_Veiculo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Ve'#237'culo'
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
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Veiculo'
        Title.Caption = 'Ve'#237'culo'
        Width = 246
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Nome_Fantasia'
        Title.Caption = 'Cliente'
        Width = 384
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Cliente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Marca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Modelo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ano_Fabricacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Placa'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chassi'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Renavam'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
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
      'Descri'#231#227'o'
      'Placa')
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
  object qrychama_veiculo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select V.*, M.Descricao, C.Nome_Nome_Fantasia from Veiculo V'
      'inner join Marca M on (V.Codigo_Marca = M.Codigo)'
      'inner join Cliente C on (V.Codigo_Cliente = C.Codigo)')
    Left = 464
    Top = 272
    object qrychama_veiculoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_veiculoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_veiculoVeiculo: TStringField
      FieldName = 'Veiculo'
      Size = 50
    end
    object qrychama_veiculoCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qrychama_veiculoCodigo_Marca: TIntegerField
      FieldName = 'Codigo_Marca'
    end
    object qrychama_veiculoModelo: TStringField
      FieldName = 'Modelo'
      Size = 30
    end
    object qrychama_veiculoAno_Fabricacao: TStringField
      FieldName = 'Ano_Fabricacao'
      Size = 15
    end
    object qrychama_veiculoPlaca: TStringField
      FieldName = 'Placa'
      Size = 10
    end
    object qrychama_veiculoChassi: TStringField
      FieldName = 'Chassi'
    end
    object qrychama_veiculoRenavam: TStringField
      FieldName = 'Renavam'
      Size = 40
    end
    object qrychama_veiculoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qrychama_veiculoNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qrychama_veiculoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_veiculoANTT: TStringField
      FieldName = 'ANTT'
      Size = 30
    end
    object qrychama_veiculoTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_veiculo
    Left = 496
    Top = 272
  end
end
