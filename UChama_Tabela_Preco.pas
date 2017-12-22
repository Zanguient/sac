unit UChama_Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tabela_Preco = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_tabela: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_tabelaCodigo: TIntegerField;
    qrychama_tabelaDescricao: TStringField;
    qrychama_tabelaData_Cadastro: TDateTimeField;
    qrychama_tabelaData_Validade: TDateTimeField;
    qrychama_tabelaTipo: TStringField;
    qrychama_tabelaCodigo_Empresa: TIntegerField;
    qrychama_tabelaTipo_Calculo: TStringField;
    qrychama_tabelaPercentual_Vista: TFloatField;
    qrychama_tabelaPercentual_Prazo: TFloatField;
    qrychama_tabelaAtalho: TStringField;
    qrychama_tabelaTipo_Valor: TIntegerField;
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
  FrmChama_Tabela_Preco: TFrmChama_Tabela_Preco;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Tabela_Preco, UConfiguracao_Sistema, UTabela_Produto,
  UConsulta_Tabela_Preco, UConsulta_Venda, UConsulta_Preco_Produto,
  UConsulta_Custo_Venda, Conexao.TConexao;

{$R *.dfm}

procedure TFrmChama_Tabela_Preco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tabela_Preco.BBtnFiltrarClick(Sender: TObject);
begin
  if (FrmCadastro_Tabela_Preco <> nil) and (FrmCadastro_Tabela_Preco.ativo = true) then
    Consulta.Chama_Tabela_Preco_Cadastro
  else
    Consulta.Chama_Tabela_Preco;
end;

procedure TFrmChama_Tabela_Preco.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Tabela_Preco <> Nil) and (FrmCadastro_Tabela_Preco.ativo = true) and (FrmCadastro_Tabela_Preco.escolha = false) then
  begin
    FrmCadastro_Tabela_Preco.achei:= true;
    FrmCadastro_Tabela_Preco.EdtCodigo.Text:= qrychama_tabelaCodigo.AsString;
    FrmCadastro_Tabela_Preco.EdtDescricao.Text:= qrychama_tabelaDescricao.AsString;
    FrmCadastro_Tabela_Preco.MEdtData_Cadastro.Text:= qrychama_tabelaData_Cadastro.AsString;
    FrmCadastro_Tabela_Preco.MEdtData_Validade.Text:= qrychama_tabelaData_Validade.AsString;
    FrmCadastro_Tabela_Preco.EdtPercentual_Vista.Text:= qrychama_tabelaPercentual_Vista.AsString;
    FrmCadastro_Tabela_Preco.EdtPercentual_Prazo.Text:= qrychama_tabelaPercentual_Prazo.AsString;
    FrmCadastro_Tabela_Preco.EdtAtalho.Text:= qrychama_tabelaAtalho.AsString;
    FrmCadastro_Tabela_Preco.RGValor.ItemIndex:= qrychama_tabelaTipo_Valor.AsInteger;

    if (qrychama_tabelaTipo.AsString = 'TUDO') then
      FrmCadastro_Tabela_Preco.RGTipo.ItemIndex:= 0
    else if (qrychama_tabelaTipo.AsString = 'PRODUTO') then
      FrmCadastro_Tabela_Preco.RGTipo.ItemIndex:= 1
    else if (qrychama_tabelaTipo.AsString = 'SERVIÇO') then
      FrmCadastro_Tabela_Preco.RGTipo.ItemIndex:= 2;

    if (qrychama_tabelaTipo_Calculo.AsString = 'MARGEM BRUTA') then
      FrmCadastro_Tabela_Preco.RGTipo_Calculo.ItemIndex:= 0
    else if (qrychama_tabelaTipo_Calculo.AsString = 'MARGEM LIQUIDA') then
      FrmCadastro_Tabela_Preco.RGTipo_Calculo.ItemIndex:= 1;

    {if (FrmCadastro_Tabela_Preco.Conexao.InTransaction = false) then
    begin
      FrmCadastro_Tabela_Preco.Cria_Conexao;
    end;}
    //FrmCadastro_Tabela_Preco.Cria_Conexao;
    FrmCadastro_Tabela_Preco.Conexao:= TConexao.NovaConexao(FrmCadastro_Tabela_Preco.Conexao);
    TConexao.IniciaQuerys([FrmCadastro_Tabela_Preco.ADOQuery1, FrmCadastro_Tabela_Preco.ADOQuery2], FrmCadastro_Tabela_Preco.Conexao);

    FrmChama_Tabela_Preco.Close;
    FrmCadastro_Tabela_Preco.BBtnSalvar.Enabled:= true;
    FrmCadastro_Tabela_Preco.BBtnExcluir.Enabled:= true;
    FrmCadastro_Tabela_Preco.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Tabela_Preco.BBtnCancelar.Enabled:= true;
    FrmCadastro_Tabela_Preco.BBtnNovo.Enabled:= false;
    FrmCadastro_Tabela_Preco.BBtnChama_Produto.Enabled:= true;
    FrmCadastro_Tabela_Preco.Pega_Produtos(FrmCadastro_Tabela_Preco.Conexao);
    //FrmCadastro_Tabela_Preco.ADOQuery1.Edit;
    //FrmCadastro_Tabela_Preco.ClientDataSet1.Close;
    //FrmCadastro_Tabela_Preco.ClientDataSet1.Open;
    FrmCadastro_Tabela_Preco.ADOQuery1Descricao.ReadOnly:= true;
    //FrmCadastro_Tabela_Preco.ADOQuery1Valor_Compra.ReadOnly:= true;
    FrmCadastro_Tabela_Preco.Atualiza_Query2(FrmCadastro_Tabela_Preco.Conexao);
    Util.Habilita_Campos(FrmCadastro_Tabela_Preco);
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo = true) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Tabela_Preco.Text:= qrychama_tabelaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtTabela_Preco.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmCadastro_Cliente <> nil) and (FrmCadastro_Cliente.ativo = true) then
  begin
    FrmCadastro_Cliente.EdtCodigo_Tabela_Preco.Text:= qrychama_tabelaCodigo.AsString;
    FrmCadastro_Cliente.EdtTabela_Preco.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmTabela_Produto <> nil) and (FrmTabela_Produto.ativo = true) then
  begin
    FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text:= qrychama_tabelaCodigo.AsString;
    FrmTabela_Produto.EdtTabela_Preco.Text:= qrychama_tabelaDescricao.AsString;
    FrmTabela_Produto.tipo:= qrychama_tabelaTipo.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmCadastro_Tabela_Preco <> Nil) and (FrmCadastro_Tabela_Preco.ativo = true) and (FrmCadastro_Tabela_Preco.escolha = true) then
  begin
    FrmCadastro_Tabela_Preco.EdtCodigo_Grupo.Text:= qrychama_tabelaCodigo.AsString;
    FrmCadastro_Tabela_Preco.EdtGrupo.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmConsulta_Tabela_Preco <> Nil) and (FrmConsulta_Tabela_Preco.ativo = true) then
  begin
    FrmConsulta_Tabela_Preco.EdtCodigo_Tabela.Text:= qrychama_tabelaCodigo.AsString;
    FrmConsulta_Tabela_Preco.EdtTabela.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmConsulta_Venda <> NIl) and (FrmConsulta_Venda.ativo = true) then
  begin
    FrmConsulta_Venda.EdtCodigo.Text:= qrychama_tabelaCodigo.AsString;
    FrmConsulta_Venda.EdtConsulta.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmConsulta_Preco_Produto <> Nil) and (FrmConsulta_Preco_Produto.ativo = true) and (FrmConsulta_Preco_Produto.tabela = 1) then
  begin
    FrmConsulta_Preco_Produto.EdtCodigo_Tabela1.Text:= qrychama_tabelaCodigo.AsString;
    FrmConsulta_Preco_Produto.EdtTabela1.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmConsulta_Preco_Produto <> Nil) and (FrmConsulta_Preco_Produto.ativo = true) and (FrmConsulta_Preco_Produto.tabela = 2) then
  begin
    FrmConsulta_Preco_Produto.EdtCodigo_Tabela2.Text:= qrychama_tabelaCodigo.AsString;
    FrmConsulta_Preco_Produto.EdtTabela2.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end
  else if (FrmConsulta_Custo_Venda <> NIl) and (FrmConsulta_Custo_Venda.ativo = true) then
  begin
    FrmConsulta_Custo_Venda.EdtCodigo_Tabela_Preco.Text:= qrychama_tabelaCodigo.AsString;
    FrmConsulta_Custo_Venda.EdtTabela_Preco.Text:= qrychama_tabelaDescricao.AsString;
    FrmChama_Tabela_Preco.Close;
  end;
end;

procedure TFrmChama_Tabela_Preco.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tabela_Preco.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tabela_Preco.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (FrmCadastro_Tabela_Preco <> nil) and (FrmCadastro_Tabela_Preco.ativo = true) then
      Consulta.Chama_Tabela_Preco_Cadastro
    else
      Consulta.Chama_Tabela_Preco;

    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tabela_Preco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tabela_Preco.Release;
end;

procedure TFrmChama_Tabela_Preco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
