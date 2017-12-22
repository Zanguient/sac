unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids,
  UGeral;

type
  TFrmPadrao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnNovo: TToolButton;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblMarca: TLabel;
    EdtDescricao: TEdit;
    ToolButton1: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
  private
    DataSource: TDataSource;
    Campo: String;
    FDataSet: TADOQuery;
    FStoredProc: TADOStoredProc;
    procedure SetDataSet(const Value: TADOQuery);
    procedure SetStoredProc(const Value: TADOStoredProc);
  public
    property DataSet: TADOQuery read FDataSet write SetDataSet;
    property StoredProc: TADOStoredProc read FStoredProc write SetStoredProc;
    procedure Habilita_Botao(const llBotao: array of boolean);
    procedure Estado(const llEstado: Controle);
  protected
    procedure Limpa_Campos; virtual;
    procedure Busca_Campos; virtual;
    procedure Incluir; virtual;
    procedure Alterar; virtual;
    procedure Excluir; virtual;
    function Existe_Registro: boolean; virtual;
    function Valida: boolean; virtual;
    procedure SetRegistro; virtual;
  end;

var
  FrmPadrao: TFrmPadrao;
  confira: boolean;
implementation

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmPadrao.Alterar;
begin

end;

procedure TFrmPadrao.BBtnSalvarClick(Sender: TObject);
begin
  if (confira = true) then
    begin
      if not Valida then
        exit;
      Incluir;
    end
    else
    begin
      if not Valida then
        exit;
      Alterar;
    end;
    TUtil.Limpa_Campos(Self);
end;

procedure TFrmPadrao.Busca_Campos;
begin

end;

procedure TFrmPadrao.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;

procedure TFrmPadrao.Excluir;
begin

end;

function TFrmPadrao.Existe_Registro: boolean;
begin

end;

procedure TFrmPadrao.Habilita_Botao(const llBotao: array of boolean);
begin

end;

procedure TFrmPadrao.Incluir;
begin
  try
    SetRegistro;
    Controle(Inserir);
  except
    on E: Exception do
      ShowMessage(Mensagem_Erro(E, Self.Name, ' Incluir'));
  end;
end;

procedure TFrmPadrao.SetDataSet(const Value: TADOQuery);
begin
  FDataSet := Value;
end;

procedure TFrmPadrao.SetStoredProc(const Value: TADOStoredProc);
begin
  FStoredProc := Value;
end;

end.
