object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 424
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 32
    Top = 152
    Width = 723
    Height = 264
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 208
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBNavigator1: TDBNavigator
    Left = 112
    Top = 121
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DDD'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Data_Cadastro'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 64
    Data = {
      370100009619E0BD010000001800000005000500000003000000A20006436F64
      69676F040001000200010007535542545950450200490008004175746F696E63
      000944657363726963616F0100490000000100055749445448020002001E0002
      5546010049000000010005574944544802000200020003444444010049000000
      01000557494454480200020002000D446174615F436164617374726F08000800
      00000000000000000001000000054A415441CD02474F0236340000FAE51ED5CC
      42000000020000000952494F20564552444502474F0236340000FAE51ED5CC42
      000000030000000952494F20434C41524F0253500231340000FAE51ED5CC4200
      0000040000000A4A415441495A494E484F02474F01000000FAE51ED5CC420000
      0005000000084A4F5649414E494102474F01000000FAE51ED5CC42}
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 88
    Top = 64
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_proj_fav;Data Source=FLAVIO-PC\SQLEX' +
      'PRESS'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cidade')
    Left = 136
    Top = 64
    object ADOQuery1Codigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object ADOQuery1UF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object ADOQuery1DDD: TStringField
      FieldName = 'DDD'
      Size = 2
    end
    object ADOQuery1Data_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
end
