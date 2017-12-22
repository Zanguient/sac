unit Modelo.Visao.NFE.TConsultaNFParaReferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin,
  Modelo.Dominio.EntradaProdutos.IBuscaEntradaDominio, DB, ADODB;

type
  TformConsultaNFParaReferencia = class(TForm)
    RGOrdena_Por: TRadioGroup;
    RGConsulta_Por: TRadioGroup;
    DBGrid1: TDBGrid;
    LblMarca: TLabel;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBtnFecharClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);

  private

    FBuscaEntradaDominio : IBuscaEntradaDominio;
    FNotaSelecionada     : Integer;
    FQuery               : TADOQuery;
    FFornecedor          : string;
    FNumeroNotaFiscal    : Integer;
    //Conexao: TADOConnection;

    procedure preencherGrid;

  public
    //constructor Create(var Conexao: TADOConnection);
    property NotaSelecionada : Integer read FNotaSelecionada;
    property Fornecedor     : string read FFornecedor write FFornecedor;
    property NumeroNotaFiscal : Integer read FNumeroNotaFiscal;

  end;

var
  formConsultaNFParaReferencia: TformConsultaNFParaReferencia;

implementation

{$R *.dfm}

uses
 Modelo.Dominio.EntradaProdutos.TBuscaEntradaDominio, Util.TLog, UDM, UDeclaracao;

procedure TformConsultaNFParaReferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Close;
end;

procedure TformConsultaNFParaReferencia.FormCreate(Sender: TObject);
begin
  FBuscaEntradaDominio := TBuscaEntradaDominio.Create(dm.ADOConnection1);
  FQuery := TADOQuery.Create(Nil);
  FQuery.Connection := dm.ADOConnection1;
end;

procedure TformConsultaNFParaReferencia.BBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformConsultaNFParaReferencia.BBtnFiltrarClick(Sender: TObject);
begin
  preencherGrid;
  DBGrid1.SetFocus;
end;

{constructor TformConsultaNFParaReferencia.Create(var Conexao: TADOConnection);
begin
  Self.Conexao := Conexao;
end;}

procedure TformConsultaNFParaReferencia.DBGrid1DblClick(Sender: TObject);
begin
  try
    if FQuery.RecordCount > 0 then begin
      FNotaSelecionada  := FQuery.FieldByName('Codigo').AsInteger;
      FNumeroNotaFiscal := FQuery.FieldByName('N_Nota_Fiscal').AsInteger;
    end;
    Self.Close;
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - DBGrid1DblClick - '+E.Message);
  end;
end;

procedure TformConsultaNFParaReferencia.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  try
    if (Key = vk_return) then begin
      DBGrid1DblClick(self);
    end;
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - DBGrid1KeyDown - '+E.Message);
  end;
end;

procedure TformConsultaNFParaReferencia.DBGrid1TitleClick(Column: TColumn);
begin
  if (FQuery.Sort <> column.FieldName+ ' ASC') then
    FQuery.Sort:=column.FieldName+ ' ASC'
  else
    FQuery.sort:=column.fieldname+ ' DESC';
end;

procedure TformConsultaNFParaReferencia.EdtConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_return) then begin
    preencherGrid;
    DBGrid1.SetFocus;
  end;
end;

procedure TformConsultaNFParaReferencia.FormDestroy(Sender: TObject);
begin
  try
    FBuscaEntradaDominio := nil;
    FQuery.Close;
    FreeAndNil(FQuery);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - FormDestroy - '+E.Message);
  end;
end;

procedure TformConsultaNFParaReferencia.preencherGrid;
begin
  try
    if FFornecedor <> '' then begin
      FQuery := FBuscaEntradaDominio.buscarEntradaReferenciaDevolucao(Trim(EdtConsulta.Text), Fornecedor,
            RGConsulta_Por.ItemIndex, RGConsulta_Por.ItemIndex, FQuery);
    end else begin
      FQuery := FBuscaEntradaDominio.buscarEntradaProdutos(Trim(EdtConsulta.Text),
            RGConsulta_Por.ItemIndex, RGConsulta_Por.ItemIndex, FQuery);
    end;

    if FQuery.RecordCount > 0 then begin
      DataSource1.DataSet := FQuery;
      DBGrid1.DataSource := DataSource1;
    end else begin
      Mensagem_Fim_Pesquisa;
    end;

  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - preencherGrid - '+E.Message);
  end;
end;

end.
