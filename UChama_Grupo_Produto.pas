unit UChama_Grupo_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Grupo_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_grupo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_grupoCodigo: TAutoIncField;
    qrychama_grupoCodigo_Grupo_ICMS: TIntegerField;
    qrychama_grupoCodigo_Grupo_IPI: TIntegerField;
    qrychama_grupoCodigo_Grupo_PIS: TIntegerField;
    qrychama_grupoCodigo_Grupo_COFINS: TIntegerField;
    qrychama_grupoData_Cadastro: TDateTimeField;
    qrychama_grupoICMS: TStringField;
    qrychama_grupoCOFINS: TStringField;
    qrychama_grupoIPI: TStringField;
    qrychama_grupoPIS: TStringField;
    qrychama_grupoPercentual_Vista: TFloatField;
    qrychama_grupoPercentual_Prazo: TFloatField;
    qrychama_grupoPercentual_Desconto_Vista: TFloatField;
    qrychama_grupoPercentual_Desconto_Prazo: TFloatField;
    qrychama_grupoCodigo_Sub_Grupo: TIntegerField;
    qrychama_grupoSub_Grupo: TStringField;
    qrychama_grupoSub: TStringField;
    qrychama_grupoDescricao: TStringField;
    qrychama_grupoCodigo_Pai: TIntegerField;
    qrychama_grupoPercentual_Comissao_Vista: TFloatField;
    qrychama_grupoPercentual_Comissao_Prazo: TFloatField;
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
  FrmChama_Grupo_Produto: TFrmChama_Grupo_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Grupo_Produto, UCadastro_Produto, UCadastro_Tabela_Preco,
  UConsulta_Reposicao_Estoque, UConsulta_Produto_Cadastrado,
  UCadastro_Grupo_Produto_Tributacao, UDeclaracao;

{$R *.dfm}

procedure TFrmChama_Grupo_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Grupo_Produto.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Grupo_Produto(EdtConsulta.Text);
end;

procedure TFrmChama_Grupo_Produto.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) and (FrmCadastro_Grupo_Produto.grupo = 0) then
  begin
    FrmCadastro_Grupo_Produto.Inicia_Itens;
    FrmCadastro_Grupo_Produto.EdtCodigo.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Grupo_Produto.codigo_grupo:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtDescricao.Text:= qrychama_grupoDescricao.AsString;
    FrmCadastro_Grupo_Produto.descricao_grupo:= qrychama_grupoDescricao.AsString;
    FrmCadastro_Grupo_Produto.MEdtData_Cadastro.Text:= qrychama_grupoData_Cadastro.AsString;

    FrmCadastro_Grupo_Produto.EdtCodigo_Sub_Grupo.Text:= qrychama_grupoCodigo_Sub_Grupo.AsString;
    FrmCadastro_Grupo_Produto.EdtSub.Text:= qrychama_grupoSub.AsString;

    FrmCadastro_Grupo_Produto.EdtSub_Grupo.Text:= qrychama_grupoSub_Grupo.AsString;

    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_ICMS.Text:= qrychama_grupoCodigo_Grupo_ICMS.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_ICMS.Text:= qrychama_grupoICMS.AsString;

    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_IPI.Text:= qrychama_grupoCodigo_Grupo_IPI.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_IPI.Text:= qrychama_grupoIPI.AsString;

    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_PIS.Text:= qrychama_grupoCodigo_Grupo_PIS.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_PIS.Text:= qrychama_grupoPIS.AsString;

    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_COFINS.Text:= qrychama_grupoCodigo_Grupo_COFINS.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_COFINS.Text:= qrychama_grupoCOFINS.AsString;

    FrmCadastro_Grupo_Produto.EdtPercentual_Vista.Text:= qrychama_grupoPercentual_Vista.AsString;
    FrmCadastro_Grupo_Produto.EdtPercentual_Prazo.Text:= qrychama_grupoPercentual_Prazo.AsString;

    FrmCadastro_Grupo_Produto.EdtPercentual_Desconto_Vista.Text:= qrychama_grupoPercentual_Desconto_Vista.AsString;
    FrmCadastro_Grupo_Produto.EdtPercentual_Desconto_Prazo.Text:= qrychama_grupoPercentual_Desconto_Prazo.AsString;

    FrmCadastro_Grupo_Produto.EdtPercentual_Comissao_Vista.Text:= qrychama_grupoPercentual_Comissao_Vista.AsString;
    FrmCadastro_Grupo_Produto.EdtPercentual_Comissao_Prazo.Text:= qrychama_grupoPercentual_Comissao_Prazo.AsString;

    FrmCadastro_Grupo_Produto.CBAtualiza_Preco.Checked:= false;
    FrmCadastro_Grupo_Produto.codigo_pai:= qrychama_grupoCodigo_Pai.AsInteger;
    FrmCadastro_Grupo_Produto.PageControl1.TabIndex:= 0;

    FrmCadastro_Grupo_Produto.Pega_Produto_Grupo;
    FrmChama_Grupo_Produto.Close;
    FrmCadastro_Grupo_Produto.BBtnSalvar.Enabled:= true;
    FrmCadastro_Grupo_Produto.BBtnExcluir.Enabled:= true;
    FrmCadastro_Grupo_Produto.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Grupo_Produto.BBtnCancelar.Enabled:= true;
    FrmCadastro_Grupo_Produto.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Grupo_Produto);
    FrmCadastro_Grupo_Produto.achei:= true;
  end
  else if (FrmCadastro_Grupo_Produto <> nil) and (FrmCadastro_Grupo_Produto.ativo = true) and (FrmCadastro_Grupo_Produto.grupo = 1) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_Destino.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_Destino.Text:= qrychama_grupoDescricao.AsString;

    FrmCadastro_Grupo_Produto.codigo_icms:= qrychama_grupoCodigo_Grupo_ICMS.AsInteger;
    FrmCadastro_Grupo_Produto.codigo_ipi:= qrychama_grupoCodigo_Grupo_IPI.AsInteger;
    FrmCadastro_Grupo_Produto.codigo_pis:= qrychama_grupoCodigo_Grupo_PIS.AsInteger;
    FrmCadastro_Grupo_Produto.codigo_cofins:= qrychama_grupoCodigo_Grupo_COFINS.AsInteger;

    FrmChama_Grupo_Produto.Close;
  end
  else if (FrmCadastro_Grupo_Produto <> nil) and (FrmCadastro_Grupo_Produto.ativo = true) and (FrmCadastro_Grupo_Produto.grupo = 2) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Sub_Grupo.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtSub.Text:= qrychama_grupoDescricao.AsString;
    FrmCadastro_Grupo_Produto.EdtDescricao.Text:= qrychama_grupoDescricao.AsString + ' : ' + FrmCadastro_Grupo_Produto.EdtDescricao.Text;
    FrmCadastro_Grupo_Produto.codigo_pai:= qrychama_grupoCodigo_Pai.AsInteger;

    if (qrychama_grupoSub_Grupo.AsString <> '') then
      FrmCadastro_Grupo_Produto.EdtSub_Grupo.Text:= qrychama_grupoSub_Grupo.AsString + '.' + FrmCadastro_Grupo_Produto.EdtSub_Grupo.Text
    else
      FrmCadastro_Grupo_Produto.EdtSub_Grupo.Text:= FrmCadastro_Grupo_Produto.EdtCodigo.Text;

    FrmChama_Grupo_Produto.Close;
  end
  else if (FrmCadastro_Produto <> NIl) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo.Text:= qrychama_grupoDescricao.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao.Text:= qrychama_grupoCodigo_Grupo_ICMS.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao.Text:= qrychama_grupoICMS.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_IPI.Text:= qrychama_grupoCodigo_Grupo_IPI.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_IPI.Text:= qrychama_grupoIPI.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PIS.Text:= qrychama_grupoCodigo_Grupo_PIS.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_PIS.Text:= qrychama_grupoPIS.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINS.Text:= qrychama_grupoCodigo_Grupo_COFINS.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_COFINS.Text:= qrychama_grupoCOFINS.AsString;

    FrmCadastro_Produto.p_vista:= qrychama_grupoPercentual_Vista.AsFloat;
    FrmCadastro_Produto.p_prazo:= qrychama_grupoPercentual_Prazo.AsFloat;
    FrmCadastro_Produto.p_des_vista:= qrychama_grupoPercentual_Desconto_Vista.AsFloat;
    FrmCadastro_Produto.p_des_prazo:= qrychama_grupoPercentual_Desconto_Prazo.AsFloat;

    if (busca_parametro_calculo_preco = 1) then
    begin
      FrmCadastro_Produto.EdtPercentual_Lucro_Vista.Text:= qrychama_grupoPercentual_Vista.AsString;
      FrmCadastro_Produto.EdtPercentual_Lucro_Prazo.Text:= qrychama_grupoPercentual_Prazo.AsString;
    end;

    FrmCadastro_Produto.EdtPercentual_Desconto_Vista.Text:= qrychama_grupoPercentual_Desconto_Vista.AsString;
    FrmCadastro_Produto.EdtPercentual_Desconto_Prazo.Text:= qrychama_grupoPercentual_Desconto_Prazo.AsString;
    FrmCadastro_Produto.EdtPercentual_Comissao_Vista.Text:= qrychama_grupoPercentual_Comissao_Vista.AsString;
    FrmCadastro_Produto.EdtPercentual_Comissao_Prazo.Text:= qrychama_grupoPercentual_Comissao_Prazo.AsString;
    FrmChama_Grupo_Produto.Close;
  end
  else if (FrmCadastro_Tabela_Preco <> nil) and (FrmCadastro_Tabela_Preco.ativo = true) then
  begin
    FrmCadastro_Tabela_Preco.EdtCodigo_Grupo.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Tabela_Preco.EdtGrupo.Text:= qrychama_grupoDescricao.AsString;
    FrmChama_Grupo_Produto.Close;
  end
  else if (FrmConsulta_Reposicao_Estoque <> nil) and (FrmConsulta_Reposicao_Estoque.ativo = true) then
  begin
    FrmConsulta_Reposicao_Estoque.EdtCodigo.Text:= qrychama_grupoCodigo.AsString;
    FrmConsulta_Reposicao_Estoque.EdtDescricao.Text:= qrychama_grupoDescricao.AsString;
    FrmChama_Grupo_Produto.Close;
  end
  else if (FrmConsulta_Produto_Cadastrado <> nil) and (FrmConsulta_Produto_Cadastrado.ativo = true) then
  begin
    FrmConsulta_Produto_Cadastrado.EdtCodigo.Text:= qrychama_grupoCodigo.AsString;
    FrmConsulta_Produto_Cadastrado.EdtDescricao.Text:= qrychama_grupoDescricao.AsString;
    FrmChama_Grupo_Produto.Close;
  end;
end;

procedure TFrmChama_Grupo_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Grupo_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Grupo_Produto.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Grupo_Produto(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Grupo_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Grupo_Produto.Release;
end;

procedure TFrmChama_Grupo_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
