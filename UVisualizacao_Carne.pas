unit UVisualizacao_Carne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Grids, DBGrids, DB,
  ADODB, UConsulta, Modelo.Entidade.TLancamentoFinanceiroEntidade;

type
  TFrmVisualizacao_Carne = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RGTipo: TRadioGroup;
    ADOQuery1: TADOQuery;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Lancamento: TDateTimeField;
    ADOQuery1Valor_Pagar: TFloatField;
    ADOQuery1Observacoes: TStringField;
    ADOQuery1Cliente: TStringField;
    ADOQuery1Endereco: TStringField;
    ADOQuery1CEP: TStringField;
    ADOQuery1Cidade: TStringField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Parcela: TStringField;
    procedure BBtnSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
  private
    { Private declarations }
    qAux2: TADOQuery;
    Consulta: TConsulta;
    oLF: TLancamentoFinanceiroEntidade;
    CodigoLancamentoFinanceiro: integer;
  public
    constructor Create(oLF: TLancamentoFinanceiroEntidade); overload;
    { Public declarations }
    var
      preview: boolean;
  end;

var
  FrmVisualizacao_Carne: TFrmVisualizacao_Carne;

implementation

uses UDM, UDeclaracao, UGeral, UCompra, ULancamento_Financeiro,
  URel_Carne_Selecionado, URel_Carne;

{$R *.dfm}

procedure TFrmVisualizacao_Carne.BBtnOKClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 0) then
  begin
    FrmRel_Carne:= TFrmRel_Carne.create(Self, oLF);
    FrmRel_Carne.Release;
    FrmRel_Carne:= Nil;
  end
  else
  begin
    FrmRel_Carne_Selecionado:= TFrmRel_Carne_Selecionado.create(self);
    FrmRel_Carne_Selecionado.Release;
    FrmRel_Carne_Selecionado:= Nil;
  end;
end;

procedure TFrmVisualizacao_Carne.BBtnSairClick(Sender: TObject);
begin
  close;
end;

constructor TFrmVisualizacao_Carne.Create(oLF: TLancamentoFinanceiroEntidade);
begin
  self.oLF := oLF;
  inherited Create(nil);
end;

procedure TFrmVisualizacao_Carne.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TFrmVisualizacao_Carne.FormCreate(Sender: TObject);
begin
  ADOQuery1.close;
  ADOQuery1.sql.Add(Consulta.Atualiza_Dados_Carne(oLF));
  ADOQuery1.open;

end;

end.
