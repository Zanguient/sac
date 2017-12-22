unit UChama_DAV_Converter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, Vcl.DBCtrls;

type
  TFrmChama_DAV_Converter = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_dav: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_davN_Pedido: TStringField;
    qrychama_davData_Venda: TDateTimeField;
    qrychama_davNome_Nome_Fantasia: TStringField;
    qrychama_davTotal_Pedido: TFloatField;
    qrychama_davPlaca: TStringField;
    qrychama_davVeiculo: TStringField;
    LblStatus: TLabel;
    CmbStatus: TDBLookupComboBox;
    qrychama_davStatusOS: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_DAV_Converter: TFrmChama_DAV_Converter;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UPedido_Venda, UNFE, UDeclaracao;

{$R *.dfm}

procedure TFrmChama_DAV_Converter.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_DAV_Converter.BBtnFiltrarClick(Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex = 0) then
    EdtConsulta.Text:= StringOfChar('0', 12-Length(EdtConsulta.Text)) + EdtConsulta.Text;
  Consulta.Chama_DAV_Converter(EdtConsulta.Text);
end;

procedure TFrmChama_DAV_Converter.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmPedido_Venda <> NIl) and (FrmPedido_Venda.ativo = true) then
  begin
    FrmPedido_Venda.EdtN_Pedido.Text:= qrychama_davN_Pedido.AsString;
    FrmChama_DAV_Converter.Close;
  end
  else if (FrmNFE <> nil) and (FrmNFE.ativo) then
  begin
    //FrmNFE.EdtPedido.Text:= qrychama_davN_Pedido.AsString;
    FrmChama_DAV_Converter.Close;
  end;
end;

procedure TFrmChama_DAV_Converter.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmChama_DAV_Converter.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_DAV_Converter.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_dav, Column);
end;

procedure TFrmChama_DAV_Converter.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (RGConsulta_Por.ItemIndex = 0) then
      EdtConsulta.Text:= StringOfChar('0', 12-Length(EdtConsulta.Text)) + EdtConsulta.Text;
    Consulta.Chama_DAV_Converter(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_DAV_Converter.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_DAV_Converter.Release;
end;

procedure TFrmChama_DAV_Converter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_DAV_Converter.FormShow(Sender: TObject);
begin
  if (gera_os = '0101') then
  begin
    DBGrid1.Columns[4].Visible:= true;
    DBGrid1.Columns[5].Visible:= true;
    DBGrid1.Columns[6].Visible:= true;
    LblStatus.Visible:= true;
    CmbStatus.Visible:= true;
    TRadioGroup(RGConsulta_Por.Controls[2]).Visible:= true;
    TRadioGroup(RGConsulta_Por.Controls[3]).Visible:= true;
  end
  else
  begin
    DBGrid1.Columns[4].Visible:= false;
    DBGrid1.Columns[5].Visible:= false;
    DBGrid1.Columns[6].Visible:= false;
    LblStatus.Visible:= false;
    CmbStatus.Visible:= false;
    TRadioGroup(RGConsulta_Por.Controls[2]).Visible:= false;
    TRadioGroup(RGConsulta_Por.Controls[3]).Visible:= false;
  end;
end;

end.
