unit UChama_Propriedade_Inicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Cheque = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_cheque: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_chequeCodigo: TAutoIncField;
    qrychama_chequeEmitente: TStringField;
    qrychama_chequeFavorecido: TStringField;
    qrychama_chequeOrigem: TStringField;
    qrychama_chequeCodigo_Banco: TIntegerField;
    qrychama_chequeAgencia: TStringField;
    qrychama_chequeTitular: TStringField;
    qrychama_chequeN_Cheque: TStringField;
    qrychama_chequeValor: TFloatField;
    qrychama_chequeData_Cadastro: TDateTimeField;
    qrychama_chequeData_Vencimento: TDateTimeField;
    qrychama_chequeData_Saida: TDateTimeField;
    qrychama_chequeObservacoes: TStringField;
    qrychama_chequeStatus: TStringField;
    qrychama_chequeNome: TStringField;
    qrychama_chequeTipo: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Cheque: TFrmChama_Cheque;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cheque;

{$R *.dfm}

procedure TFrmChama_Cheque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cheque.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Cheque(EdtConsulta.Text);
end;

procedure TFrmChama_Cheque.DBGrid1DblClick(Sender: TObject);
begin
    if (FrmCadastro_Cheque <> Nil) and (FrmCadastro_Cheque.ativo = true) then
    begin
      FrmCadastro_Cheque.EdtCodigo.Text:= qrychama_chequeCodigo.AsString;
      if (qrychama_chequeTipo.AsString = 'EMITIDO') then
        FrmCadastro_Cheque.RadioGroup1.ItemIndex:= 0
      else
        FrmCadastro_Cheque.RadioGroup1.ItemIndex:= 1;
      FrmCadastro_Cheque.EdtEmitente.Text:= qrychama_chequeEmitente.AsString;
      FrmCadastro_Cheque.EdtFavorecido.Text:= qrychama_chequeFavorecido.AsString;
      FrmCadastro_Cheque.EdtOrigem.Text:= qrychama_chequeOrigem.AsString;
      FrmCadastro_Cheque.EdtCodigo_Banco.Text:= qrychama_chequeCodigo_Banco.AsString;
      FrmCadastro_Cheque.EdtBanco.Text:= qrychama_chequeNome.AsString;
      FrmCadastro_Cheque.EdtAgencia.Text:= qrychama_chequeAgencia.AsString;
      FrmCadastro_Cheque.EdtTitular.Text:= qrychama_chequeTitular.AsString;
      FrmCadastro_Cheque.EdtN_Cheque.Text:= qrychama_chequeN_Cheque.AsString;

      FrmCadastro_Cheque.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_chequeValor.AsFloat);
      FrmCadastro_Cheque.EdtValor.Text:= StringReplace(FrmCadastro_Cheque.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmCadastro_Cheque.MEdtData_Cadastro.Text:= qrychama_chequeData_Cadastro.AsString;
      if (qrychama_chequeData_Vencimento.AsString = '30/12/1899') then
        FrmCadastro_Cheque.MEdtData_Vencimento.Text:= ''
      else
        FrmCadastro_Cheque.MEdtData_Vencimento.Text:= qrychama_chequeData_Vencimento.AsString;

      if (qrychama_chequeData_Saida.AsString = '30/12/1899') then
        FrmCadastro_Cheque.MEdtData_Saida.Text:= ''
      else
        FrmCadastro_Cheque.MEdtData_Saida.Text:= qrychama_chequeData_Saida.AsString;
      FrmCadastro_Cheque.MmoObservacoes.Text:= qrychama_chequeObservacoes.AsString;

      FrmChama_Cheque.Close;
      FrmCadastro_Cheque.BBtnSalvar.Enabled:= true;
      FrmCadastro_Cheque.BBtnExcluir.Enabled:= true;
      FrmCadastro_Cheque.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Cheque.BBtnCancelar.Enabled:= true;
      Util.Habilita_Campos(FrmCadastro_Cheque);
      achei:= true;
    end;
end;

procedure TFrmChama_Cheque.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
    if (FrmCadastro_Cheque <> Nil) and (FrmCadastro_Cheque.ativo = true) then
    begin
      FrmCadastro_Cheque.EdtCodigo.Text:= qrychama_chequeCodigo.AsString;
      if (qrychama_chequeTipo.AsString = 'EMITIDO') then
        FrmCadastro_Cheque.RadioGroup1.ItemIndex:= 0
      else
        FrmCadastro_Cheque.RadioGroup1.ItemIndex:= 1;
      FrmCadastro_Cheque.EdtEmitente.Text:= qrychama_chequeEmitente.AsString;
      FrmCadastro_Cheque.EdtFavorecido.Text:= qrychama_chequeFavorecido.AsString;
      FrmCadastro_Cheque.EdtOrigem.Text:= qrychama_chequeOrigem.AsString;
      FrmCadastro_Cheque.EdtCodigo_Banco.Text:= qrychama_chequeCodigo_Banco.AsString;
      FrmCadastro_Cheque.EdtBanco.Text:= qrychama_chequeNome.AsString;
      FrmCadastro_Cheque.EdtAgencia.Text:= qrychama_chequeAgencia.AsString;
      FrmCadastro_Cheque.EdtTitular.Text:= qrychama_chequeTitular.AsString;
      FrmCadastro_Cheque.EdtN_Cheque.Text:= qrychama_chequeN_Cheque.AsString;

      FrmCadastro_Cheque.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_chequeValor.AsFloat);
      FrmCadastro_Cheque.EdtValor.Text:= StringReplace(FrmCadastro_Cheque.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmCadastro_Cheque.MEdtData_Cadastro.Text:= qrychama_chequeData_Cadastro.AsString;
      if (qrychama_chequeData_Vencimento.AsString = '30/12/1899') then
        FrmCadastro_Cheque.MEdtData_Vencimento.Text:= ''
      else
        FrmCadastro_Cheque.MEdtData_Vencimento.Text:= qrychama_chequeData_Vencimento.AsString;

      if (qrychama_chequeData_Saida.AsString = '30/12/1899') then
        FrmCadastro_Cheque.MEdtData_Saida.Text:= ''
      else
        FrmCadastro_Cheque.MEdtData_Saida.Text:= qrychama_chequeData_Saida.AsString;
      FrmCadastro_Cheque.MmoObservacoes.Text:= qrychama_chequeObservacoes.AsString;

      FrmChama_Cheque.Close;
      FrmCadastro_Cheque.BBtnSalvar.Enabled:= true;
      FrmCadastro_Cheque.BBtnExcluir.Enabled:= true;
      FrmCadastro_Cheque.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Cheque.BBtnCancelar.Enabled:= true;
      Util.Habilita_Campos(FrmCadastro_Cheque);
      achei:= true;
    end;
    end;
end;

procedure TFrmChama_Cheque.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    Consulta.Chama_Cheque(EdtConsulta.Text);
end;

procedure TFrmChama_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cheque.Release;
end;

procedure TFrmChama_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
