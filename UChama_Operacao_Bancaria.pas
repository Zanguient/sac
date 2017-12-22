unit UChama_Operacao_Bancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Operacao_Bancaria = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_operacao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_operacaoCodigo: TAutoIncField;
    qrychama_operacaoOperacao: TStringField;
    qrychama_operacaoTipo: TStringField;
    qrychama_operacaoData_Cadastro: TDateTimeField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Operacao_Bancaria: TFrmChama_Operacao_Bancaria;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Operacao_Bancaria, UBaixar_Titulo, ULancamento_Banco,
  Modelo.Entidade.TOperacaoBancaria, ULancamento_Caixa;

{$R *.dfm}

procedure TFrmChama_Operacao_Bancaria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Operacao_Bancaria.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Operacao_Bancaria(EdtConsulta.Text);
end;

procedure TFrmChama_Operacao_Bancaria.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Operacao_Bancaria <> Nil) and (FrmCadastro_Operacao_Bancaria.ativo = true) then
  begin
    FrmCadastro_Operacao_Bancaria.EdtCodigo.Text:= qrychama_operacaoCodigo.AsString;
    FrmCadastro_Operacao_Bancaria.EdtOperacao.Text:= qrychama_operacaoOperacao.AsString;
    if (qrychama_operacaoTipo.AsString = 'CRÉDITO') then
      FrmCadastro_Operacao_Bancaria.RGTipo.ItemIndex:= 0
    else
      FrmCadastro_Operacao_Bancaria.RGTipo.ItemIndex:= 1;
    FrmCadastro_Operacao_Bancaria.MEdtData_Cadastro.Text:= qrychama_operacaoData_Cadastro.AsString;
    FrmChama_Operacao_Bancaria.Close;
    FrmCadastro_Operacao_Bancaria.BBtnSalvar.Enabled:= true;
    FrmCadastro_Operacao_Bancaria.BBtnExcluir.Enabled:= true;
    FrmCadastro_Operacao_Bancaria.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Operacao_Bancaria.BBtnCancelar.Enabled:= true;
    FrmCadastro_Operacao_Bancaria.BBtnNovo.Enabled:= False;
    Util.Habilita_Campos(FrmCadastro_Operacao_Bancaria);
    FrmCadastro_Operacao_Bancaria.achei:= true;
  end
  else if (FrmBaixar_Titulo <> nil) then
  begin
    FrmBaixar_Titulo.EdtCodigo_Operacao.Text:= qrychama_operacaoCodigo.AsString;
    FrmBaixar_Titulo.EdtOperacao_Bancaria.Text:= qrychama_operacaoOperacao.AsString;
    FrmBaixar_Titulo.EdtTipo_Operacao.Text:= qrychama_operacaoTipo.AsString;

    FrmBaixar_Titulo.OperacaoBancaria:= TOperacaoBancariaEntidade.Create;

    FrmBaixar_Titulo.OperacaoBancaria.Codigo:= qrychama_operacaoCodigo.AsInteger;
    FrmBaixar_Titulo.OperacaoBancaria.Operacao:= qrychama_operacaoOperacao.AsString;
    FrmBaixar_Titulo.OperacaoBancaria.Tipo:= qrychama_operacaoTipo.AsString;

    FrmChama_Operacao_Bancaria.Close;
  end
  else if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
  begin
    FrmLancamento_Banco.EdtCodigo_Operacao.Text:= qrychama_operacaoCodigo.AsString;
    FrmLancamento_Banco.EdtOperacao_Bancaria.Text:= qrychama_operacaoOperacao.AsString;
    FrmLancamento_Banco.EdtTipo_Operacao.Text:= qrychama_operacaoTipo.AsString;

    FrmLancamento_Banco.OperacaoBancaria:= TOperacaoBancariaEntidade.Create;

    FrmLancamento_Banco.OperacaoBancaria.Codigo:= qrychama_operacaoCodigo.AsInteger;
    FrmLancamento_Banco.OperacaoBancaria.Operacao:= qrychama_operacaoOperacao.AsString;
    FrmLancamento_Banco.OperacaoBancaria.Tipo:= qrychama_operacaoTipo.AsString;

    FrmChama_Operacao_Bancaria.Close;
  end
  else if (FrmLancamento_Caixa <> nil) and (FrmLancamento_Caixa.ativo = true) then
  begin
    FrmLancamento_Caixa.EdtCodigo_Operacao.Text:= qrychama_operacaoCodigo.AsString;
    FrmLancamento_Caixa.EdtOperacao_Bancaria.Text:= qrychama_operacaoOperacao.AsString;
    FrmLancamento_Caixa.EdtTipo_Operacao.Text:= qrychama_operacaoTipo.AsString;

    FrmLancamento_Caixa.OperacaoBancaria:= TOperacaoBancariaEntidade.Create;

    FrmLancamento_Caixa.OperacaoBancaria.Codigo:= qrychama_operacaoCodigo.AsInteger;
    FrmLancamento_Caixa.OperacaoBancaria.Operacao:= qrychama_operacaoOperacao.AsString;
    FrmLancamento_Caixa.OperacaoBancaria.Tipo:= qrychama_operacaoTipo.AsString;

    FrmChama_Operacao_Bancaria.Close;
  end;
end;

procedure TFrmChama_Operacao_Bancaria.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Operacao_Bancaria.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    DBGrid1DblClick(Self);
  end;
end;

procedure TFrmChama_Operacao_Bancaria.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Operacao_Bancaria(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Operacao_Bancaria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Operacao_Bancaria.Release;
end;

procedure TFrmChama_Operacao_Bancaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
