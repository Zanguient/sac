object FrmConsulta_Custo_Empresa: TFrmConsulta_Custo_Empresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Custos'
  ClientHeight = 536
  ClientWidth = 952
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 295
    Top = 35
    Width = 20
    Height = 13
    Caption = 'Fim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 237
    Top = 35
    Width = 31
    Height = 13
    Caption = 'Inicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RGConsulta_Por: TRadioGroup
    Left = 117
    Top = -1
    Width = 114
    Height = 69
    Caption = 'Consulta por'
    ItemIndex = 0
    Items.Strings = (
      'Custos'
      'Ponto de Eq.')
    TabOrder = 2
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 98
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
    Images = DM.ImgImagens_Consulta
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 3
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFiltrarClick
    end
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para limpar a pesquisa realizada e iniciar outra'
      Caption = 'Li&mpar'
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnLimparClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para imprimir a pesquisa realizada'
      Caption = 'Imp&rimir'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnImprimirClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object MEdtData_Final: TMaskEdit
    Left = 295
    Top = 50
    Width = 59
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/9999;1;_'
    MaxLength = 7
    TabOrder = 1
    Text = '  /    '
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 237
    Top = 50
    Width = 59
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/9999;1;_'
    MaxLength = 7
    TabOrder = 0
    Text = '  /    '
  end
  object PageControl1: TPageControl
    Left = 114
    Top = 73
    Width = 834
    Height = 457
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'Custos'
      object DBGrid1: TDBGrid
        Left = 1
        Top = 0
        Width = 823
        Height = 196
        BorderStyle = bsNone
        DataSource = ds_qry_consulta_padrao
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'MES_ANO'
            Title.Caption = 'M'#234's/Ano'
            Width = 53
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALORTOTAL'
            Title.Caption = 'Valor Total'
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALOR_FIXO'
            Title.Caption = 'Valor Fixo'
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALOR_VARIAVEL'
            Title.Caption = 'Valor Vari'#225'vel'
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PFIXO'
            Title.Caption = '% Fixo'
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PVARIAVEL'
            Title.Caption = '% Vari'#225'vel'
            Width = 115
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ponto de Equilibrio'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = -1
        Top = 0
        Width = 838
        Height = 426
        BorderStyle = bsNone
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
      end
    end
  end
  object qryconsulta_custo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT MES_ANO,'
      #9'   VALOR_FIXO,'
      #9'   VALOR_VARIAVEL,'
      #9'   VALORTOTAL,'
      #9'   (VALOR_FIXO / VALORTOTAL) * 100 as PFIXO,'
      #9'   (VALOR_VARIAVEL / VALORTOTAL) * 100 as PVARIAVEL'
      'FROM ('#9'   '
      
        'SELECT  convert(varchar(2),month(h.Data_Lancamento)) + '#39'/'#39' + con' +
        'vert(varchar(4),year(h.Data_Lancamento)) as Mes_ano,'
      '        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL '
      
        '          left join Lancamento_Financeiro LF on (PL.Codigo = LF.' +
        'Codigo)'
      
        '          where LF.Conta_Fixa = 0 AND (convert(varchar(2),month(' +
        'h.Data_Lancamento)) + '#39'/'#39' + '
      '        convert(varchar(4),year(h.Data_Lancamento))) = '
      '        convert(varchar(2),month(LF.Data_Lancamento)) + '#39'/'#39' + '
      
        '        convert(varchar(4),year(LF.Data_Lancamento))) AS VALOR_F' +
        'IXO,'
      '        '
      '        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL '
      
        '          left join Lancamento_Financeiro LF on (PL.Codigo = LF.' +
        'Codigo)'
      
        '          where LF.Conta_Fixa = 1 AND (convert(varchar(2),month(' +
        'h.Data_Lancamento)) + '#39'/'#39' + '
      '        convert(varchar(4),year(h.Data_Lancamento))) = '
      '        convert(varchar(2),month(LF.Data_Lancamento)) + '#39'/'#39' + '
      
        '        convert(varchar(4),year(LF.Data_Lancamento))) AS VALOR_V' +
        'ARIAVEL,'
      '        '
      '        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL '
      
        '          left join Lancamento_Financeiro LF on (PL.Codigo = LF.' +
        'Codigo)'
      
        '          where (convert(varchar(2),month(h.Data_Lancamento)) + ' +
        #39'/'#39' + '
      '        convert(varchar(4),year(h.Data_Lancamento))) = '
      '        convert(varchar(2),month(LF.Data_Lancamento)) + '#39'/'#39' + '
      
        '        convert(varchar(4),year(LF.Data_Lancamento))) AS VALORTO' +
        'TAL'
      '        '
      '        FROM Lancamento_Financeiro H '
      
        '        where month(H.Data_Lancamento) between '#39'01'#39' and '#39'12'#39' and' +
        ' year(H.Data_Lancamento) between '#39'2012'#39' and '#39'2012'#39
      
        '          group by convert(varchar(2),month(h.Data_Lancamento)) ' +
        '+ '#39'/'#39' + '
      '          convert(varchar(4),year(h.Data_Lancamento))) AS TB')
    Left = 661
    Top = 48
    object qryconsulta_custoMES_ANO: TStringField
      FieldName = 'MES_ANO'
      ReadOnly = True
      Size = 7
    end
    object qryconsulta_custoVALOR_FIXO: TFloatField
      FieldName = 'VALOR_FIXO'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custoVALOR_VARIAVEL: TFloatField
      FieldName = 'VALOR_VARIAVEL'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custoVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custoPFIXO: TFloatField
      FieldName = 'PFIXO'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custoPVARIAVEL: TFloatField
      FieldName = 'PVARIAVEL'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_custo
    Left = 693
    Top = 48
  end
end
