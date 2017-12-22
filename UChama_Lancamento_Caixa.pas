unit UChama_Lancamento_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, Vcl.Mask;

type
  TFrmChama_Lancamento_Caixa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qrychama_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_lancamentoCodigo: TIntegerField;
    qrychama_lancamentoCodigo_Empresa: TIntegerField;
    qrychama_lancamentoCodigo_Caixa: TIntegerField;
    qrychama_lancamentoCodigo_Usuario: TIntegerField;
    qrychama_lancamentoForma_Pagamento: TStringField;
    qrychama_lancamentoValor: TFloatField;
    qrychama_lancamentoTroco: TFloatField;
    qrychama_lancamentoData: TDateTimeField;
    qrychama_lancamentoTipo_Documento: TStringField;
    qrychama_lancamentoStatus: TStringField;
    qrychama_lancamentoAcerto: TIntegerField;
    qrychama_lancamentoTipo: TStringField;
    qrychama_lancamentoMovimenta: TIntegerField;
    qrychama_lancamentoN_Documento: TIntegerField;
    qrychama_lancamentoParcela: TIntegerField;
    Label8: TLabel;
    MEdtData_Lancamento: TMaskEdit;
    qrychama_lancamentoCodigo_Registro: TAutoIncField;
    qrychama_lancamentoDescricao: TStringField;
    qrychama_lancamentoTransferencia: TIntegerField;
    qrychama_lancamentoCodigo_Conta: TIntegerField;
    qrychama_lancamentoCodigo_Operacao: TIntegerField;
    qrychama_lancamentoCodigo_Lancamento_Banco: TIntegerField;
    qrychama_lancamentoConta: TStringField;
    qrychama_lancamentoOperacao: TStringField;
    qrychama_lancamentoTipoOperacao: TStringField;
    strngfld_lancamentoNomeFuncionario: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure MEdtData_LancamentoExit(Sender: TObject);
    procedure MEdtData_LancamentoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Lancamento_Caixa: TFrmChama_Lancamento_Caixa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, ULancamento_Caixa;

{$R *.dfm}

procedure TFrmChama_Lancamento_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Lancamento_Caixa.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Caixa;
end;

procedure TFrmChama_Lancamento_Caixa.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmLancamento_Caixa <> Nil) and (FrmLancamento_Caixa.ativo = true) then
  begin
    if (qrychama_lancamentoStatus.AsString = 'ESTORNADO') then
    begin
      ShowMessage('Este lançamento já se encontra estornado!');
      Abort;
    end;
    FrmLancamento_Caixa.EdtCodigo.Text:= qrychama_lancamentoCodigo_Registro.AsString;
    FrmLancamento_Caixa.MEdtData_Lancamento.Text:= qrychama_lancamentoData.AsString;
    FrmLancamento_Caixa.EdtDescricao.Text:= qrychama_lancamentoDescricao.AsString;

    FrmLancamento_Caixa.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_lancamentoValor.AsFloat);
    FrmLancamento_Caixa.EdtValor.Text:= StringReplace(FrmLancamento_Caixa.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

    if (qrychama_lancamentoTipo.AsString = '+') then
      FrmLancamento_Caixa.RGTipoMovimento.ItemIndex:= 0
    else
      FrmLancamento_Caixa.RGTipoMovimento.ItemIndex:= 1;

    if (qrychama_lancamentoForma_Pagamento.AsString = 'DINHEIRO') then
      FrmLancamento_Caixa.RGCondPag.ItemIndex:= 0
    else if (qrychama_lancamentoForma_Pagamento.AsString = 'CHEQUE') then
      FrmLancamento_Caixa.RGCondPag.ItemIndex:= 1
    else if (qrychama_lancamentoForma_Pagamento.AsString = 'CARTÃO') then
      FrmLancamento_Caixa.RGCondPag.ItemIndex:= 2;

    if (qrychama_lancamentoTransferencia.AsInteger = 0) then
    begin
      FrmLancamento_Caixa.CBTransferencia.Checked:= true;
      FrmLancamento_Caixa.GBTransferencia.Visible:= true;
      FrmLancamento_Caixa.EdtCodigo_Conta.Text:= qrychama_lancamentoCodigo_Conta.AsString;
      FrmLancamento_Caixa.EdtConta.Text:= qrychama_lancamentoConta.AsString;
      FrmLancamento_Caixa.EdtCodigo_Operacao.Text:= qrychama_lancamentoCodigo_Operacao.AsString;
      FrmLancamento_Caixa.EdtOperacao_Bancaria.Text:= qrychama_lancamentoOperacao.AsString;
      FrmLancamento_Caixa.EdtTipo_Operacao.Text:= qrychama_lancamentoTipoOperacao.AsString;
      FrmLancamento_Caixa.EdtCodigo_Lancamento_Banco.Text:= qrychama_lancamentoCodigo_Lancamento_Banco.AsString;
    end
    else
    begin
      FrmLancamento_Caixa.CBTransferencia.Checked:= false;
      FrmLancamento_Caixa.GBTransferencia.Visible:= false;
    end;

    FrmChama_Lancamento_Caixa.Close;
    FrmLancamento_Caixa.BBtnSalvar.Enabled:= true;
    FrmLancamento_Caixa.BBtnExcluir.Enabled:= true;
    FrmLancamento_Caixa.BBtnPesquisar.Enabled:= true;
    FrmLancamento_Caixa.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmLancamento_Caixa);
    FrmLancamento_Caixa.achei:= true;
  end;
end;

procedure TFrmChama_Lancamento_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Lancamento_Caixa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    DBGrid1DblClick(self);
  end;
end;

procedure TFrmChama_Lancamento_Caixa.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_lancamento, Column);
end;

procedure TFrmChama_Lancamento_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Lancamento_Caixa.Release;
end;

procedure TFrmChama_Lancamento_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Lancamento_Caixa.MEdtData_LancamentoEnter(Sender: TObject);
begin
  MEdtData_Lancamento.Text:= DateToStr(date);
end;

procedure TFrmChama_Lancamento_Caixa.MEdtData_LancamentoExit(Sender: TObject);
begin
  if (MEdtData_Lancamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Lancamento);
end;

end.
