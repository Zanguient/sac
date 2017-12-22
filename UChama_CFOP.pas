unit UChama_CFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_CFOP = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_cfop: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_cfopCodigo: TAutoIncField;
    qrychama_cfopCFOP: TStringField;
    qrychama_cfopDescricao: TStringField;
    qrychama_cfopData_Cadastro: TDateTimeField;
    qrychama_cfopMostrar_Imposto: TIntegerField;
    qrychama_cfopGera_Financeiro: TIntegerField;
    qrychama_cfopControla_Estoque: TIntegerField;
    qrychama_cfopEstoque: TIntegerField;
    qrychama_cfopFaturar_NFe: TIntegerField;
    ADOQuery1: TADOQuery;
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
    procedure qrychama_cfopMostrar_ImpostoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qrychama_cfopGera_FinanceiroGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qrychama_cfopControla_EstoqueGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_CFOP: TFrmChama_CFOP;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_CFOP, UEntrada_Produtos, UNFE, UPedido_Venda,
  UConfiguracao_Sistema, UDeclaracao;

{$R *.dfm}

procedure TFrmChama_CFOP.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_CFOP.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_CFOP(EdtConsulta.Text);
end;

procedure TFrmChama_CFOP.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_CFOP <> NIL) and (FrmCadastro_CFOP.ativo = true) then
  begin
    FrmCadastro_CFOP.EdtCodigo.Text:= qrychama_cfopCodigo.AsString;
    FrmCadastro_CFOP.MEdtCFOP.Text:= qrychama_cfopCFOP.AsString;
    FrmCadastro_CFOP.EdtDescricao.Text:= qrychama_cfopDescricao.AsString;
    FrmCadastro_CFOP.MEdtData_Cadastro.Text:= qrychama_cfopData_Cadastro.AsString;

    if (qrychama_cfopMostrar_Imposto.AsInteger = 0) then
      FrmCadastro_CFOP.CBMostra_Imposto.Checked:= true
    else
      FrmCadastro_CFOP.CBMostra_Imposto.Checked:= false;

    if (qrychama_cfopGera_Financeiro.AsInteger = 0) then
      FrmCadastro_CFOP.CBGera_Financeiro.Checked:= true
    else
      FrmCadastro_CFOP.CBGera_Financeiro.Checked:= false;

    if (qrychama_cfopControla_Estoque.AsInteger = 0) then
      FrmCadastro_CFOP.CBControla_Estoque.Checked:= true
    else
      FrmCadastro_CFOP.CBControla_Estoque.Checked:= false;

    FrmCadastro_CFOP.RGEstoque.ItemIndex:= qrychama_cfopEstoque.AsInteger;

    if (qrychama_cfopFaturar_NFe.AsInteger = 0) then
      FrmCadastro_CFOP.CBFatura.Checked:= true
    else
      FrmCadastro_CFOP.CBFatura.Checked:= false;

    FrmChama_CFOP.Close;
    FrmCadastro_CFOP.BBtnSalvar.Enabled:= true;
    FrmCadastro_CFOP.BBtnExcluir.Enabled:= true;
    FrmCadastro_CFOP.BBtnPesquisar.Enabled:= true;
    FrmCadastro_CFOP.BBtnCancelar.Enabled:= true;
    FrmCadastro_CFOP.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_CFOP);
    FrmCadastro_CFOP.achei:= true;
  end
  else if (FrmEntrada_Produtos <> Nil) and (FrmEntrada_Produtos.ativo = true) and (FrmEntrada_Produtos.cfop = 1) then
  begin
    FrmEntrada_Produtos.EdtCodigo_CFOP.Text:= qrychama_cfopCodigo.AsString;
    FrmEntrada_Produtos.EdtCFOP.Text:= qrychama_cfopCFOP.AsString + ' - ' + qrychama_cfopDescricao.AsString;
    FrmEntrada_Produtos.EdtCFOP2.Text:= qrychama_cfopCFOP.AsString;
    FrmChama_CFOP.Close;
  end
  else if (FrmNFE <> Nil) and (FrmNFE.ativo = true) then
  begin
    FrmNFE.EdtCodigo_CFOP.Text:= qrychama_cfopCodigo.AsString;
    FrmNFE.EdtCFOP.Text:= qrychama_cfopCFOP.AsString + ' - ' + qrychama_cfopDescricao.AsString;
    cfop:= StringReplace(qrychama_cfopCFOP.AsString, '.', '', []);
    gera_fi:= qrychama_cfopGera_Financeiro.AsInteger;
    mostra_imposto:= qrychama_cfopMostrar_Imposto.AsInteger;
    controla_estoque:= qrychama_cfopControla_Estoque.AsInteger;
    estoque:= qrychama_cfopEstoque.AsInteger;

    if (qrychama_cfopGera_Financeiro.AsInteger = 0) then
    begin
      FrmNFE.BtnGerarParcela.Enabled:= true;
      FrmNFE.BtnExcluirParcela.Enabled:= true;
    end
    else
    begin
      FrmNFE.BtnGerarParcela.Enabled:= false;
      FrmNFE.BtnExcluirParcela.Enabled:= false;
    end;

    FrmChama_CFOP.Close;
  end
  else if (FrmEntrada_Produtos <> Nil) and (FrmEntrada_Produtos.ativo = true) and (FrmEntrada_Produtos.cfop = 2) then
  begin
    FrmEntrada_Produtos.EdtCFOP2.Text:= qrychama_cfopCFOP.AsString;
    FrmChama_CFOP.Close;
  end
  else if (FrmConfiguracao_Sistema <> Nil) and (FrmConfiguracao_Sistema.ativo = true) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_CFOP.Text:= qrychama_cfopCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCFOP.Text:= qrychama_cfopCFOP.AsString + ' - ' + qrychama_cfopDescricao.AsString;
    FrmChama_CFOP.Close;
  end
end;

procedure TFrmChama_CFOP.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_CFOP.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_CFOP.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_CFOP(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_CFOP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_CFOP.Release;
end;

procedure TFrmChama_CFOP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_CFOP.qrychama_cfopControla_EstoqueGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '0') then
    Text:= 'SIM'
  else
    Text:= 'NÃO';
end;

procedure TFrmChama_CFOP.qrychama_cfopGera_FinanceiroGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '0') then
    Text:= 'SIM'
  else
    Text:= 'NÃO';
end;

procedure TFrmChama_CFOP.qrychama_cfopMostrar_ImpostoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '0') then
    Text:= 'SIM'
  else
    Text:= 'NÃO';
end;

end.
