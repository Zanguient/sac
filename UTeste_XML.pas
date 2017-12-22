unit UTeste_XML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ADODB, ExtCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    DBNavigator1: TDBNavigator;
    ADOQuery1Codigo: TAutoIncField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1UF: TStringField;
    ADOQuery1DDD: TStringField;
    ADOQuery1Data_Cadastro: TDateTimeField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientDataSet1.SaveToFile(ExtractFilePath(Application.ExeName) + 'Teste.xml', dfXMLUTF8);
end;

end.
