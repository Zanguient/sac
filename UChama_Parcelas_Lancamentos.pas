unit UChama_Parcelas_Lancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Parcelas_Lancamentos = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    RGTipo: TRadioGroup;
    qrychama_lancamentoCodigo: TAutoIncField;
    qrychama_lancamentoTipo: TStringField;
    qrychama_lancamentoN_Documento: TIntegerField;
    qrychama_lancamentoCodigo_Empresa: TIntegerField;
    qrychama_lancamentoCodigo_Forma_Pagamento: TIntegerField;
    qrychama_lancamentoCodigo_Cli_For: TIntegerField;
    qrychama_lancamentoCodigo_Tipo_Documento: TIntegerField;
    qrychama_lancamentoHistorico: TStringField;
    qrychama_lancamentoCodigo_Departamento: TIntegerField;
    qrychama_lancamentoCodigo_Plano: TIntegerField;
    qrychama_lancamentoData_Lancamento: TDateTimeField;
    qrychama_lancamentoData_Vencimento: TDateTimeField;
    qrychama_lancamentoValor_Documento: TFloatField;
    qrychama_lancamentoDesconto: TFloatField;
    qrychama_lancamentoMulta: TFloatField;
    qrychama_lancamentoValor_Cobrado: TFloatField;
    qrychama_lancamentoObservacoes: TStringField;
    qrychama_lancamentoStatus: TStringField;
    qrychama_lancamentoCondicao_Pagamento: TStringField;
    qrychama_lancamentoNome: TStringField;
    qrychama_lancamentoTipo_Documento: TStringField;
    qrychama_lancamentoDepartamento: TStringField;
    qrychama_lancamentoPlano_Financeiro: TStringField;
    qrychama_lancamentoConta_Fixa: TIntegerField;
    qrychama_lancamentoCalcula_Juro: TIntegerField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure RGTipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Parcelas_Lancamentos: TFrmChama_Parcelas_Lancamentos;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, ULancamento_Financeiro, UDeclaracao, Conexao.TConexao;

{$R *.dfm}

procedure TFrmChama_Parcelas_Lancamentos.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Parcelas_Lancamentos.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Financeiro_Alterar;
end;

procedure TFrmChama_Parcelas_Lancamentos.DBGrid1DblClick(
  Sender: TObject);
begin
  if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
  begin
    FrmLancamento_Financeiro.EdtCodigo.Text:= qrychama_lancamentoCodigo.AsString;
    UDeclaracao.codigo_lancamento_financeiro:= qrychama_lancamentoCodigo.AsInteger;

    FrmLancamento_Financeiro.EdtDocumento.Text:= qrychama_lancamentoN_Documento.AsString;

    FrmLancamento_Financeiro.EdtCodigo_Condicao_Pagamento.Text:= qrychama_lancamentoCodigo_Forma_Pagamento.AsString;
    FrmLancamento_Financeiro.EdtCondicao_Pagamento.Text:= qrychama_lancamentoCondicao_Pagamento.AsString;

    if (qrychama_lancamentoTipo.AsString = 'RECEBER') then
      FrmLancamento_Financeiro.RGTipo.ItemIndex:= 0
     else
      FrmLancamento_Financeiro.RGTipo.ItemIndex:= 1;

     FrmLancamento_Financeiro.EdtCodigo_Cli_Forn.Text:= qrychama_lancamentoCodigo_Cli_For.AsString;
     FrmLancamento_Financeiro.EdtCli_Forn.Text:= qrychama_lancamentoNome.AsString;

     FrmLancamento_Financeiro.EdtCodigo_Tipo_Documento.Text:= qrychama_lancamentoCodigo_Tipo_Documento.AsString;
     FrmLancamento_Financeiro.EdtTipo_Documento.Text:= qrychama_lancamentoTipo_Documento.AsString;

     FrmLancamento_Financeiro.EdtHistorico.Text:= qrychama_lancamentoHistorico.AsString;

     FrmLancamento_Financeiro.EdtCodigo_Departamento.Text:= qrychama_lancamentoCodigo_Departamento.AsString;
     FrmLancamento_Financeiro.EdtDepartamento.Text:= qrychama_lancamentoDepartamento.AsString;

     FrmLancamento_Financeiro.EdtCodigo_Plano.Text:= qrychama_lancamentoCodigo_Plano.AsString;
     FrmLancamento_Financeiro.EdtPlano.Text:= qrychama_lancamentoPlano_Financeiro.AsString;

     FrmLancamento_Financeiro.MEdtData_Lancamento.Text:= qrychama_lancamentoData_Lancamento.AsString;
     FrmLancamento_Financeiro.MEdtData_Vencimento.Text:= qrychama_lancamentoData_Vencimento.AsString;

     FrmLancamento_Financeiro.EdtValor_Documento.Text:= FormatFloat('#0.0,0', qrychama_lancamentoValor_Documento.AsFloat);
     FrmLancamento_Financeiro.EdtValor_Documento.Text:= StringReplace(FrmLancamento_Financeiro.EdtValor_Documento.Text, ThousandSeparator, '', [rfReplaceAll]);

     FrmLancamento_Financeiro.EdtDesconto.Text:= FormatFloat('#0.0,0', qrychama_lancamentoDesconto.AsFloat);
     FrmLancamento_Financeiro.EdtDesconto.Text:= StringReplace(FrmLancamento_Financeiro.EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

     FrmLancamento_Financeiro.EdtMulta.Text:= FormatFloat('#0.0,0', qrychama_lancamentoMulta.AsFloat);
     FrmLancamento_Financeiro.EdtMulta.Text:= StringReplace(FrmLancamento_Financeiro.EdtMulta.Text, ThousandSeparator, '', [rfReplaceAll]);

     FrmLancamento_Financeiro.EdtValor_Cobrado.Text:= FormatFloat('#0.0,0', qrychama_lancamentoValor_Cobrado.AsFloat);
     FrmLancamento_Financeiro.EdtValor_Cobrado.Text:= StringReplace(FrmLancamento_Financeiro.EdtValor_Cobrado.Text, ThousandSeparator, '', [rfReplaceAll]);

     FrmLancamento_Financeiro.MmoObservacoes.Text:= qrychama_lancamentoObservacoes.AsString;

     if (qrychama_lancamentoConta_Fixa.AsInteger = 0) then
       FrmLancamento_Financeiro.CBConta_Fixa.Checked:= true
     else
       FrmLancamento_Financeiro.CBConta_Fixa.Checked:= false;

     if (qrychama_lancamentoCalcula_Juro.AsInteger = 0) then
       FrmLancamento_Financeiro.CBJuro.Checked:= true
     else
       FrmLancamento_Financeiro.CBJuro.Checked:= false;

      FrmLancamento_Financeiro.Conexao:= TConexao.NovaConexao(FrmLancamento_Financeiro.Conexao);
      TConexao.IniciaQuerys([FrmLancamento_Financeiro.ADOQuery1], FrmLancamento_Financeiro.Conexao);

     FrmLancamento_Financeiro.Chama_Parcelas;
     FrmChama_Lancamento_Financeiro_Alterar.Close;
     FrmLancamento_Financeiro.BBtnSalvar.Enabled:= true;
     FrmLancamento_Financeiro.BBtnExcluir.Enabled:= true;
     FrmLancamento_Financeiro.BBtnPesquisar.Enabled:= true;
     FrmLancamento_Financeiro.BBtnNovo.Enabled:= False;
     FrmLancamento_Financeiro.BBtnCancelar.Enabled:= true;

     if (qrychama_lancamentoTipo.AsString = 'RECEBER') then
     begin
      FrmLancamento_Financeiro.BBtnGerar_Carne.Enabled:= true;
      FrmLancamento_Financeiro.BBtnGerar_Promissoria.Enabled:= true;
     end
     else
     begin
      FrmLancamento_Financeiro.BBtnGerar_Carne.Enabled:= false;
      FrmLancamento_Financeiro.BBtnGerar_Promissoria.Enabled:= false;
     end;

     FrmLancamento_Financeiro.BBtnCancelar.Enabled:= true;
     Util.Habilita_Campos(FrmLancamento_Financeiro);
     FrmLancamento_Financeiro.achei:= true;
  end;
end;

procedure TFrmChama_Parcelas_Lancamentos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Parcelas_Lancamentos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Parcelas_Lancamentos.DBGrid1TitleClick(
  Column: TColumn);
begin
  if (qrychama_lancamento.Sort <> column.FieldName+ ' ASC') then
    qrychama_lancamento.Sort:=column.FieldName+ ' ASC'
  else
    qrychama_lancamento.sort:=column.fieldname+ ' DESC';
end;

procedure TFrmChama_Parcelas_Lancamentos.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Lancamento_Financeiro_Alterar;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Parcelas_Lancamentos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Lancamento_Financeiro_Alterar.Release;
end;

procedure TFrmChama_Parcelas_Lancamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Parcelas_Lancamentos.RGTipoClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Financeiro_Alterar;
end;

end.
