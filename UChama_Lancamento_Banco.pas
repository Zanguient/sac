unit UChama_Lancamento_Banco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Lancamento_Banco = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_lancamentoCodigo: TAutoIncField;
    qrychama_lancamentoCodigo_Empresa: TIntegerField;
    qrychama_lancamentoN_Documento: TIntegerField;
    qrychama_lancamentoData_Lancamento: TDateTimeField;
    qrychama_lancamentoCodigo_Conta: TIntegerField;
    qrychama_lancamentoCodigo_Operacao: TIntegerField;
    qrychama_lancamentoCodigo_Plano: TIntegerField;
    qrychama_lancamentoDescricao: TStringField;
    qrychama_lancamentoValor: TFloatField;
    qrychama_lancamentoConta: TStringField;
    qrychama_lancamentoOperacao: TStringField;
    qrychama_lancamentoPlano: TStringField;
    qrychama_lancamentoTipo: TStringField;
    qrychama_lancamentoStatus: TStringField;
    qrychama_lancamentoCodigo_Cheque: TIntegerField;
    qrychama_lancamentoN_Cheque: TStringField;
    qrychama_lancamentoTransferencia: TIntegerField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Lancamento_Banco: TFrmChama_Lancamento_Banco;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, ULancamento_Banco;

{$R *.dfm}

procedure TFrmChama_Lancamento_Banco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Lancamento_Banco.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Banco(EdtConsulta.Text);
end;

procedure TFrmChama_Lancamento_Banco.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmLancamento_Banco <> Nil) and (FrmLancamento_Banco.ativo = true) then
  begin
    FrmLancamento_Banco.EdtCodigo.Text:= qrychama_lancamentoCodigo.AsString;
    if (qrychama_lancamentoStatus.AsString = 'BLOQUEADO') then
      FrmLancamento_Banco.RGStatus.ItemIndex:= 0
    else
      FrmLancamento_Banco.RGStatus.ItemIndex:= 1;

    if (qrychama_lancamentoTransferencia.AsInteger = 0) then
      FrmLancamento_Banco.CBTransferencia.Checked:= True
    else
      FrmLancamento_Banco.CBTransferencia.Checked:= False;

    FrmLancamento_Banco.EdtDocumento.Text:= qrychama_lancamentoN_Documento.AsString;
    FrmLancamento_Banco.MEdtData_Lancamento.Text:= qrychama_lancamentoData_Lancamento.AsString;
    FrmLancamento_Banco.EdtCodigo_Conta.Text:= qrychama_lancamentoCodigo_Conta.AsString;
    FrmLancamento_Banco.EdtConta.Text:= qrychama_lancamentoConta.AsString;
    FrmLancamento_Banco.EdtCodigo_Operacao.Text:= qrychama_lancamentoCodigo_Operacao.AsString;
    FrmLancamento_Banco.EdtOperacao_Bancaria.Text:= qrychama_lancamentoOperacao.AsString;
    FrmLancamento_Banco.EdtTipo_Operacao.Text:= qrychama_lancamentoTipo.AsString;
    FrmLancamento_Banco.EdtDescricao.Text:= qrychama_lancamentoDescricao.AsString;
    FrmLancamento_Banco.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_lancamentoValor.AsFloat);
    FrmLancamento_Banco.EdtValor.Text:= StringReplace(FrmLancamento_Banco.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

    if (qrychama_lancamentoCodigo_Plano.AsString = '0') then
    begin
      FrmLancamento_Banco.EdtCodigo_Plano.Text:= '';
      FrmLancamento_Banco.EdtPlano.Text:= '';
    end
    else
    begin
      FrmLancamento_Banco.EdtCodigo_Plano.Text:= qrychama_lancamentoCodigo_Plano.AsString;
      FrmLancamento_Banco.EdtPlano.Text:= qrychama_lancamentoPlano.AsString;
    end;

    FrmLancamento_Banco.EdtCodigo_Cheque.Text:= qrychama_lancamentoCodigo_Cheque.AsString;
    FrmLancamento_Banco.EdtCheque.Text:= qrychama_lancamentoN_Cheque.AsString;
    FrmLancamento_Banco.EdtPlano.Text:= qrychama_lancamentoPlano.AsString;
    FrmChama_Lancamento_Banco.Close;
    FrmLancamento_Banco.BBtnSalvar.Enabled:= true;
    FrmLancamento_Banco.BBtnExcluir.Enabled:= true;
    FrmLancamento_Banco.BBtnPesquisar.Enabled:= true;
    FrmLancamento_Banco.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmLancamento_Banco);
    FrmLancamento_Banco.achei:= true;
  end;
end;

procedure TFrmChama_Lancamento_Banco.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Lancamento_Banco.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
    if (FrmLancamento_Banco <> Nil) and (FrmLancamento_Banco.ativo = true) then
    begin
      FrmLancamento_Banco.EdtCodigo.Text:= qrychama_lancamentoCodigo.AsString;
      if (qrychama_lancamentoStatus.AsString = 'BLOQUEADO') then
        FrmLancamento_Banco.RGStatus.ItemIndex:= 0
      else
        FrmLancamento_Banco.RGStatus.ItemIndex:= 1;
      FrmLancamento_Banco.EdtDocumento.Text:= qrychama_lancamentoN_Documento.AsString;
      FrmLancamento_Banco.MEdtData_Lancamento.Text:= qrychama_lancamentoData_Lancamento.AsString;
      FrmLancamento_Banco.EdtCodigo_Conta.Text:= qrychama_lancamentoCodigo_Conta.AsString;
      FrmLancamento_Banco.EdtConta.Text:= qrychama_lancamentoConta.AsString;
      FrmLancamento_Banco.EdtCodigo_Operacao.Text:= qrychama_lancamentoCodigo_Operacao.AsString;
      FrmLancamento_Banco.EdtOperacao_Bancaria.Text:= qrychama_lancamentoOperacao.AsString;
      FrmLancamento_Banco.EdtTipo_Operacao.Text:= qrychama_lancamentoTipo.AsString;
      FrmLancamento_Banco.EdtDescricao.Text:= qrychama_lancamentoDescricao.AsString;
      FrmLancamento_Banco.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_lancamentoValor.AsFloat);
      FrmLancamento_Banco.EdtValor.Text:= StringReplace(FrmLancamento_Banco.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmLancamento_Banco.EdtCodigo_Plano.Text:= qrychama_lancamentoCodigo_Plano.AsString;
      FrmLancamento_Banco.EdtPlano.Text:= qrychama_lancamentoPlano.AsString;
      FrmChama_Lancamento_Banco.Close;
      FrmLancamento_Banco.BBtnSalvar.Enabled:= true;
      FrmLancamento_Banco.BBtnExcluir.Enabled:= true;
      FrmLancamento_Banco.BBtnPesquisar.Enabled:= true;
      FrmLancamento_Banco.BBtnCancelar.Enabled:= true;
      Util.Habilita_Campos(FrmLancamento_Banco);
      achei:= true;
    end;
    end;
end;

procedure TFrmChama_Lancamento_Banco.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_lancamento, Column);
end;

procedure TFrmChama_Lancamento_Banco.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Lancamento_Banco(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Lancamento_Banco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Lancamento_Banco.Release;
end;

procedure TFrmChama_Lancamento_Banco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
