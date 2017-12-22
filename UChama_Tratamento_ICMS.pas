unit UChama_Tratamento_ICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tratamento_ICMS = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_tratamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_tratamentoCodigo: TIntegerField;
    qrychama_tratamentoDescricao: TStringField;
    qrychama_tratamentoData_Cadastro: TDateTimeField;
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
  FrmChama_Tratamento_ICMS: TFrmChama_Tratamento_ICMS;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UTratamento_ICMS, UCadastro_Grupo_Produto_Tributacao,
  UCadastro_Grupo_Produto, UCadastro_Produto;

{$R *.dfm}

procedure TFrmChama_Tratamento_ICMS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tratamento_ICMS.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tratamento_ICMS;
end;

procedure TFrmChama_Tratamento_ICMS.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmTratamento_ICMS <> NIl) and (FrmTratamento_ICMS.ativo = true) then
  begin
    FrmTratamento_ICMS.EdtCodigo.Text:= qrychama_tratamentoCodigo.AsString;
    FrmTratamento_ICMS.MEdtData_Cadastro.Text:= qrychama_tratamentoData_Cadastro.AsString;
    FrmTratamento_ICMS.EdtDescricao.Text:= qrychama_tratamentoDescricao.AsString;

    if (FrmTratamento_ICMS.Conexao.InTransaction = false) then
    begin
      FrmTratamento_ICMS.Cria_Conexao;
    end;

    FrmChama_Tratamento_ICMS.Close;
    FrmTratamento_ICMS.BBtnSalvar.Enabled:= true;
    FrmTratamento_ICMS.BBtnSalvar_Itens.Enabled:= true;
    FrmTratamento_ICMS.BBtnExcluir.Enabled:= true;
    FrmTratamento_ICMS.BBtnExcluir_Item.Enabled:= true;
    FrmTratamento_ICMS.BBtnPesquisar.Enabled:= true;
    FrmTratamento_ICMS.BBtnCancelar.Enabled:= true;
    FrmTratamento_ICMS.BBtnNovo.Enabled:= false;
    FrmTratamento_ICMS.PageControl2.TabIndex:= 0;
    Util.Habilita_Campos(FrmTratamento_ICMS);
    FrmTratamento_ICMS.achei:= true;
  end
  else if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_ICMS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_ICMS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_ICMS.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_ICMS.Close;
  end
  else if (FrmCadastro_Grupo_Produto_Tributacao <> Nil) and (FrmCadastro_Grupo_Produto_Tributacao.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto_Tributacao.EdtCodigo_Tratamento_ICMS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto_Tributacao.EdtTratamento_ICMS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_ICMS.Close;
  end;
end;

procedure TFrmChama_Tratamento_ICMS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tratamento_ICMS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tratamento_ICMS.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Tratamento_ICMS;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tratamento_ICMS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tratamento_ICMS.Release;
end;

procedure TFrmChama_Tratamento_ICMS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
