unit UChama_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Fornecedor = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_fornecedor: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_fornecedorCodigo: TAutoIncField;
    qrychama_fornecedorCodigo_Empresa: TIntegerField;
    qrychama_fornecedorTipo: TStringField;
    qrychama_fornecedorNome_Fantasia: TStringField;
    qrychama_fornecedorRazao_Social: TStringField;
    qrychama_fornecedorCPF: TStringField;
    qrychama_fornecedorRG: TStringField;
    qrychama_fornecedorOrgao_Expedidor: TStringField;
    qrychama_fornecedorData_Emissao_RG: TDateTimeField;
    qrychama_fornecedorCNPJ: TStringField;
    qrychama_fornecedorInsc_Estadual_Municipal: TStringField;
    qrychama_fornecedorNumero: TStringField;
    qrychama_fornecedorReferencia: TStringField;
    qrychama_fornecedorCodigo_Setor: TIntegerField;
    qrychama_fornecedorCodigo_Cidade: TIntegerField;
    qrychama_fornecedorTelefone: TStringField;
    qrychama_fornecedorCelular: TStringField;
    qrychama_fornecedorEmail: TStringField;
    qrychama_fornecedorSite: TStringField;
    qrychama_fornecedorData_Cadastro: TDateTimeField;
    qrychama_fornecedorObservacoes: TStringField;
    qrychama_fornecedorEndereco: TStringField;
    qrychama_fornecedorCEP: TStringField;
    qrychama_fornecedorCidade: TStringField;
    qrychama_fornecedorUF: TStringField;
    qrychama_fornecedorSetor: TStringField;
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
  FrmChama_Fornecedor: TFrmChama_Fornecedor;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Forn_Fab, UCadastro_Produto, ULancamento_Financeiro,
  UChama_Lancamentos_Financeiros, UEntrada_Produtos, UCompra, UConsulta_Compra,
  UConsulta_Entrada, UConsulta_Lancamentos_Financeiros, UCotacao_Preco_Produto,
  URetorno_Cotacao, UConsulta_Retorno_Cotacao_Preco,
  UConsulta_Comparativo_Preco_Cotacao, UConsulta_Produto_Cadastrado,
  UConsulta_Reposicao_Estoque, UConsulta_Contagem_Estoque;

{$R *.dfm}

procedure TFrmChama_Fornecedor.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Fornecedor.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Fornecedor(EdtConsulta.Text);
end;

procedure TFrmChama_Fornecedor.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Forn_Fab <> NIL) and (FrmCadastro_Forn_Fab.ativo = true) then
    begin
      FrmCadastro_Forn_Fab.EdtCodigo.Text:= qrychama_fornecedorCodigo.AsString;
      if (qrychama_fornecedorTipo.AsString = 'FORNECEDOR') then
        FrmCadastro_Forn_Fab.RGOpcao.ItemIndex := 0
      else
        FrmCadastro_Forn_Fab.RGOpcao.ItemIndex := 1;
      FrmCadastro_Forn_Fab.EdtNome.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmCadastro_Forn_Fab.EdtRazao_Social.Text:= qrychama_fornecedorRazao_Social.AsString;
      FrmCadastro_Forn_Fab.EdtCPF.Text:= qrychama_fornecedorCPF.AsString;
      FrmCadastro_Forn_Fab.EdtRG.Text:= qrychama_fornecedorRG.AsString;
      FrmCadastro_Forn_Fab.EdtOrgao_Expedidor.Text:= qrychama_fornecedorOrgao_Expedidor.AsString;

      if (qrychama_fornecedorData_Emissao_RG.AsString = '30/12/1899') then
        FrmCadastro_Forn_Fab.EdtData_Emissao.Clear
      else
        FrmCadastro_Forn_Fab.EdtData_Emissao.Text:= qrychama_fornecedorData_Emissao_RG.AsString;

      FrmCadastro_Forn_Fab.EdtCNPJ.Text:= qrychama_fornecedorCNPJ.AsString;
      FrmCadastro_Forn_Fab.EdtInsc_Estadual_Municipal.Text:= qrychama_fornecedorInsc_Estadual_Municipal.AsString;

      FrmCadastro_Forn_Fab.EdtEndereco.Text:= qrychama_fornecedorEndereco.AsString;
      FrmCadastro_Forn_Fab.EdtCEP.Text:= qrychama_fornecedorCEP.AsString;
      FrmCadastro_Forn_Fab.achou_endereco:= true;

        FrmCadastro_Forn_Fab.EdtNumero.Text:= qrychama_fornecedorNumero.AsString;
      if (qrychama_fornecedorCodigo_Setor.AsString = '0') then
        begin
          FrmCadastro_Forn_Fab.EdtCodigo_Setor.Text:= '';
          FrmCadastro_Forn_Fab.EdtSetor.Text:= '';
          FrmCadastro_Forn_Fab.achou_setor:= false;
        end
        else
        begin
          FrmCadastro_Forn_Fab.EdtCodigo_Setor.Text:= qrychama_fornecedorCodigo_Setor.AsString;
          FrmCadastro_Forn_Fab.EdtSetor.Text:= qrychama_fornecedorSetor.AsString;
          FrmCadastro_Forn_Fab.achou_setor:= true;
        end;

      if (qrychama_fornecedorCodigo_Cidade.AsString = '0') then
        begin
          FrmCadastro_Forn_Fab.EdtCodigo_Cidade.Text:= '';
          FrmCadastro_Forn_Fab.EdtCidade.Text:= '';
          FrmCadastro_Forn_Fab.EdtUF.Text:= '';
          FrmCadastro_Forn_Fab.achou_cidade:= false;
        end
        else
        begin
          FrmCadastro_Forn_Fab.EdtCodigo_Cidade.Text:= qrychama_fornecedorCodigo_Cidade.AsString;
          FrmCadastro_Forn_Fab.EdtCidade.Text:= qrychama_fornecedorCidade.AsString;
          FrmCadastro_Forn_Fab.EdtUF.Text:= qrychama_fornecedorUF.AsString;
          FrmCadastro_Forn_Fab.achou_cidade:= true;
        end;

      FrmCadastro_Forn_Fab.EdtReferencia.Text:= qrychama_fornecedorReferencia.AsString;
      FrmCadastro_Forn_Fab.EdtEmail.Text:= qrychama_fornecedorEmail.AsString;
      FrmCadastro_Forn_Fab.EdtSite.Text:= qrychama_fornecedorSite.AsString;

      if (qrychama_fornecedorData_Cadastro.AsString = '30/12/1899') then
        FrmCadastro_Forn_Fab.MEdtData_Cadastro.Clear
      else
        FrmCadastro_Forn_Fab.MEdtData_Cadastro.Text:= qrychama_fornecedorData_Cadastro.AsString;

      FrmCadastro_Forn_Fab.MEdtTelefone.Text:= qrychama_fornecedorTelefone.AsString;
      FrmCadastro_Forn_Fab.MEdtCelular.Text:= qrychama_fornecedorCelular.AsString;
      FrmCadastro_Forn_Fab.MmoObservacoes.Text:= qrychama_fornecedorObservacoes.AsString;
      FrmChama_Fornecedor.Close;
      FrmCadastro_Forn_Fab.BBtnSalvar.Enabled:= true;
      FrmCadastro_Forn_Fab.BBtnExcluir.Enabled:= true;
      FrmCadastro_Forn_Fab.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Forn_Fab.BBtnCancelar.Enabled:= true;
      FrmCadastro_Forn_Fab.BBtnNovo.Enabled:= false;
      Util.Habilita_Campos(FrmCadastro_Forn_Fab);
      FrmCadastro_Forn_Fab.achei:= true;
    end
    else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
    begin
      FrmCadastro_Produto.EdtCodigo_Fornecedor.Text:= qrychama_fornecedorCodigo.AsString;
      FrmCadastro_Produto.EdtFornecedor.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
    begin
      FrmLancamento_Financeiro.EdtCodigo_Cli_Forn.Text:= qrychama_fornecedorCodigo.AsString;
      FrmLancamento_Financeiro.EdtCli_Forn.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmChama_Lancamentos_Financeiros <> NIl) and (FrmChama_Lancamentos_Financeiros.ativo = true) then
    begin
      FrmChama_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_fornecedorCodigo.AsString;
      FrmChama_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmEntrada_Produtos <> NIl) and (FrmEntrada_Produtos.ativo = true) then
    begin
      FrmEntrada_Produtos.EdtCodigo_Fornecedor.Text:= qrychama_fornecedorCodigo.AsString;
      FrmEntrada_Produtos.EdtFornecedor.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmEntrada_Produtos.uf_destino:= qrychama_fornecedorUF.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmCompra <> NIl) and (FrmCompra.ativo = true) then
    begin
      FrmCompra.EdtCodigo_Fornecedor.Text:= qrychama_fornecedorCodigo.AsString;
      FrmCompra.EdtFornecedor.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmCompra.LblCPF.Caption:= qrychama_fornecedorCNPJ.AsString;
      {FrmCompra.LblEndereco.Caption:= qrychama_fornecedorDescricao_2.AsString;
      FrmCompra.LblTipo_Logradouro.Caption:= qrychama_fornecedorTipo_Logradouro.AsString;
      FrmCompra.LblCidade.Caption:= qrychama_fornecedorDescricao.AsString;
      FrmCompra.LblUF.Caption:= qrychama_fornecedorUF.AsString;
      FrmCompra.LblSetor.Caption:= qrychama_fornecedorDescricao_1.AsString;}
      FrmCompra.LblNumero.Caption:= qrychama_fornecedorNumero.AsString;
      FrmCompra.LblTelefone.Caption:= qrychama_fornecedorTelefone.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Compra <> Nil) and (FrmConsulta_Compra.ativo = true) then
    begin
      FrmConsulta_Compra.EdtCodigo_Fornecedor.Text:= qrychama_fornecedorCodigo.AsString;
      FrmConsulta_Compra.EdtFornecedor.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Entrada <> Nil) and (FrmConsulta_Entrada.ativo = true) then
    begin
      FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text:= qrychama_fornecedorCodigo.AsString;
      FrmConsulta_Entrada.EdtFornecedor.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> NIl) and (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
    begin
      FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_fornecedorCodigo.AsString;
      FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmRetorno_Cotacao <> NIl) and (FrmRetorno_Cotacao.ativo = true) then
    begin
      FrmRetorno_Cotacao.EdtCodigo_Fornecedor.Text:= qrychama_fornecedorCodigo.AsString;
      FrmRetorno_Cotacao.EdtFornecedor.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco <> NIl) and (FrmConsulta_Retorno_Cotacao_Preco.ativo = true) then
    begin
      FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text:= qrychama_fornecedorCodigo.AsString;
      FrmConsulta_Retorno_Cotacao_Preco.EdtFuncionario.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Comparativo_Preco_Cotacao <> NIl) and (FrmConsulta_Comparativo_Preco_Cotacao.ativo = true) then
    begin
      FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text:= qrychama_fornecedorCodigo.AsString;
      FrmConsulta_Comparativo_Preco_Cotacao.EdtConsulta.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Produto_Cadastrado <> NIl) and (FrmConsulta_Produto_Cadastrado.ativo = true) then
    begin
      FrmConsulta_Produto_Cadastrado.EdtCodigo.Text:= qrychama_fornecedorCodigo.AsString;
      FrmConsulta_Produto_Cadastrado.EdtDescricao.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Reposicao_Estoque <> NIl) and (FrmConsulta_Reposicao_Estoque.ativo = true) then
    begin
      FrmConsulta_Reposicao_Estoque.EdtCodigo.Text:= qrychama_fornecedorCodigo.AsString;
      FrmConsulta_Reposicao_Estoque.EdtDescricao.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end
    else if (FrmConsulta_Contagem_Estoque <> NIl) and (FrmConsulta_Contagem_Estoque.ativo = true) then
    begin
      //FrmConsulta_Contagem_Estoque.EdtCodigo.Text:= qrychama_fornecedorCodigo.AsString;
      //FrmConsulta_Contagem_Estoque.EdtConsulta.Text:= qrychama_fornecedorNome_Fantasia.AsString;
      FrmChama_Fornecedor.Close;
    end;
end;

procedure TFrmChama_Fornecedor.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Fornecedor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Fornecedor.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_fornecedor, Column);
end;

procedure TFrmChama_Fornecedor.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Fornecedor(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Fornecedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Fornecedor.Release;
end;

procedure TFrmChama_Fornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
