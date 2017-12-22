unit UPAFECF_Registros_PAF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList, ACBrPAF,
  ACBrPAF_A, ACBrPAF_D, ACBrPAF_E, ACBrPAF_P, ACBrPAF_R, ACBrPAF_T, ACBrPaf_H,
  ACBrPAF_U, ACBrEAD,
  ADODB, ACBrPAFRegistros, URegistro, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPAFECF_Registros_PAF = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    RGTipoEstoque: TRadioGroup;
    dsEstoque: TDataSource;
    DBGrid2: TDBGrid;
    qE2: TADOQuery;
    qE2Codigo_Venda: TStringField;
    qE2MD5: TStringField;
    qE2Descricao: TStringField;
    qE2Status_Estoque_Data: TStringField;
    qE2Estoque: TFloatField;
    qE2Sigla: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGTipoEstoqueClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
  private
    { Private declarations }
  public

  end;

var
  FrmPAFECF_Registros_PAF: TFrmPAFECF_Registros_PAF;

implementation

uses UDeclaracao, UDM, ACBrPAF_U_Class;

{$R *.dfm}



procedure TFrmPAFECF_Registros_PAF.BBtnFecharClick(Sender: TObject);
begin
  close;
end;



procedure TFrmPAFECF_Registros_PAF.BBtnSalvarClick(Sender: TObject);
begin
  GerarRegistroPafEcf(MEdtData_Inicial.text, MEdtData_Final.text, 'RegPAF');
end;

procedure TFrmPAFECF_Registros_PAF.DBGrid2TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qE2, Column);
end;

procedure TFrmPAFECF_Registros_PAF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmPAFECF_Registros_PAF.Free;
  FrmPAFECF_Registros_PAF := Nil;
end;

procedure TFrmPAFECF_Registros_PAF.FormCreate(Sender: TObject);
begin
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
  FrmPAFECF_Registros_PAF.Height:= 113;
  dsEstoque.DataSet:= qE2;
end;

procedure TFrmPAFECF_Registros_PAF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_escape) then
    close;

  if (Key = vk_f2) then
  begin
    Carrega_Dados_EstoqueE2('RegPAF');
    BBtnSalvar.Enabled := true;
  end;
end;

procedure TFrmPAFECF_Registros_PAF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;



procedure TFrmPAFECF_Registros_PAF.RGTipoEstoqueClick(Sender: TObject);
begin
  if (RGTipoEstoque.ItemIndex = 0) then
  begin
    FrmPAFECF_Registros_PAF.Height:= 113;
  end
  else
  begin
    FrmPAFECF_Registros_PAF.Height:= 423;
  end;
end;

end.
