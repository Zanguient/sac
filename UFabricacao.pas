unit UFabricacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils;

type
  TFrmFabricacao_Propria = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Fabricacao: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblNome: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    qryitens_fabricacao: TADOQuery;
    ds_qry_itens_venda: TDataSource;
    qryfabricacao: TADOQuery;
    qryfabricacaoCodigo: TIntegerField;
    qryfabricacaoCodigo_Empresa: TIntegerField;
    qryfabricacaoCodigo_Funcionario: TIntegerField;
    qryfabricacaoCodigo_Cliente: TIntegerField;
    qryfabricacaoData_Emissao: TDateTimeField;
    qryfabricacaoN_Ordem: TStringField;
    qryfabricacaoModelo: TStringField;
    qryfabricacaoN_Serie: TStringField;
    qryfabricacaoCaixa: TStringField;
    qryfabricacaoNome_Nome_Fantasia: TStringField;
    qryfabricacaoNome: TStringField;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    MEdtData_Validade: TMaskEdit;
    qryitens_fabricacaoCodigo: TIntegerField;
    qryitens_fabricacaoCodigo_Insumo: TIntegerField;
    qryitens_fabricacaoUnidade: TStringField;
    qryitens_fabricacaoQtde: TFloatField;
    qryitens_fabricacaoCodigo_Venda: TStringField;
    qryitens_fabricacaoDescricao: TStringField;
    qryitens_fabricacaoEstoque: TFloatField;
    LblProd: TLabel;
    LblEstoque: TLabel;
    BBtnCancelar: TToolButton;
    Label2: TLabel;
    EdtQtde: TEdit;
    Button1: TButton;
    qryitens_fabricacaoVolume: TFloatField;
    qryitens_fabricacaoVolume_Total: TFloatField;
    qryitens_fabricacaoValor_Medio: TFloatField;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_FabricacaoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_InsumoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limpa_Menor;
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_ValidadeEnter(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure EdtCodigo_ProdutoDblClick(Sender: TObject);
  private
    FP: URegistro.TFabricacao_Propria;
    IFP: URegistro.TItens_Fabricacao_Propria;
    Util: TUtil;
    qtde_itens: integer;
    pode: boolean;
    procedure Gera_Codigo;
  public
    ativo, iniciado, produto: boolean;
    sequencial: integer;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
  end;

var
  FrmFabricacao_Propria: TFrmFabricacao_Propria;
implementation

uses UDM, UChama_Produto, UDeclaracao, URel_Fabricacao_Propria;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmFabricacao_Propria.Atualiza_Dados;
begin
  with qryitens_fabricacao, sql do
  begin
    close;
    clear;
    add('select IFP.*, P.Codigo_Venda, P.Descricao, P.Estoque, P.Volume, P.Volume_Total, P.Valor_Medio');
    add('from Itens_Fabricacao_Propria IFP');
    add('inner join Produto P on (IFP.Codigo_Insumo = P.Codigo)');
    add('where IFP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    open;
  end;
end;

procedure TFrmFabricacao_Propria.BBtnCancelarClick(Sender: TObject);
begin
  iniciado:= false;
  IFP.Excluir_Tudo(IFP);
  Atualiza_Dados;
  Util.Limpa_Campos(FrmFabricacao_Propria);
  Util.Desabilita_Campos(FrmFabricacao_Propria);
  BBtnSalvar.Enabled:= false;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmFabricacao_Propria.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    FP.Excluir(FP);
    IFP.Excluir(IFP);
    BBtnSalvar.Enabled:= false;
    Util.Desabilita_Campos(FrmFabricacao_Propria);
  end;
end;

procedure TFrmFabricacao_Propria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmFabricacao_Propria.BBtnSalvarClick(Sender: TObject);
var
  saldo, estoque, gasto, volume, volume_total, total: double;
begin
  if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      begin
        FP.Inserir(FP);

        qryitens_fabricacao.First;
        while not qryitens_fabricacao.Eof do
        begin
          estoque:= qryitens_fabricacaoEstoque.AsFloat;
          gasto:= (qryitens_fabricacaoQtde.AsFloat * StrToFloat(EdtQtde.Text));
          volume:= qryitens_fabricacaoVolume.AsFloat;
          volume_total:= qryitens_fabricacaoVolume_Total.AsFloat;

          total:= ( (gasto * estoque) / volume_total);
          saldo:= (qryitens_fabricacaoValor_Medio.AsFloat * (estoque - total));

          Atualiza_Saldo_Estoque(dm.ADOConnection1, qryitens_fabricacaoCodigo_Insumo.AsInteger, saldo);
          Atualiza_Estoque(dm.ADOConnection1, (estoque - total), qryitens_fabricacaoCodigo_Insumo.AsInteger);
          Atualiza_Volume(dm.ADOConnection1, (volume_total - gasto), qryitens_fabricacaoCodigo_Insumo.AsInteger);
          qryitens_fabricacao.Next;
        end;

        Atualiza_Estoque(dm.ADOConnection1, StrToFloat(LblEstoque.Caption) + StrToFloat(EdtQtde.Text), StrToInt(LblProd.Caption));
        UDeclaracao.Insere_Historico(usuario, 'REALIZOU REGISTRO DE FABRICAÇÃO PRÓPRIA.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmFabricacao_Propria);
    FrmRel_Fabricacao_Propria:= TFrmRel_Fabricacao_Propria.create(self);
    FrmRel_Fabricacao_Propria.Release;
    FrmRel_Fabricacao_Propria:= Nil;
end;

procedure TFrmFabricacao_Propria.Button1Click(Sender: TObject);
var
  qAux, qAux2: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select R.*, IR.* from Receita R');
      add('inner join Itens_Receita IR on (R.Codigo = IR.Codigo)');
      add('where R.Codigo_Produto = :Produto');
      Parameters.ParamByName('Produto').Value:= StrToInt(LblProd.Caption);
      open;
    end;

    if (qAux.IsEmpty = false) then
    begin
      while not qAux.Eof do
      begin
        with qAux2, SQL do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('Insert into Itens_Fabricacao_Propria (Codigo, Codigo_Insumo, Unidade, Qtde)');
            add('values (:Codigo, :Codigo_Insumo, :Unidade, :Qtde)');
            Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
            Parameters.ParamByName('Codigo_Insumo').Value:= qAux.FieldByName('Codigo_Insumo').AsInteger;
            Parameters.ParamByName('Unidade').Value:= qAux.FieldByName('Unidade').AsString;
            Parameters.ParamByName('Qtde').Value:= qAux.FieldByName('Qtde').AsFloat;
            ExecSQL;
          end;
          qAux.Next;
      end;
    end
    else
    begin
      Mensagem_Nao_E_PP;
      abort;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
  end;
  Atualiza_Dados;
  BBtnSalvar.Enabled:= true;
end;

function TFrmFabricacao_Propria.Confira_Itens_Pedido: boolean;
begin
  Confira_Itens_Pedido:= false;

  {if (EdtCodigo_Insumo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Insumo.SetFocus;
    abort;
  end;

  if (EdtQuantidade.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtQuantidade.SetFocus;
    abort;
  end;

  if (EdtUnidade.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtUnidade.SetFocus;
    abort;
  end; }

  Confira_Itens_Pedido:= true;
end;

function TFrmFabricacao_Propria.Confira_Pedido: boolean;
begin
  Confira_Pedido:= false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
    abort;
  end;

  if (EdtQtde.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtQtde.SetFocus;
    abort;
  end;

  if (EdtCodigo_Produto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  if (MEdtData_Fabricacao.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Fabricacao.SetFocus;
    abort;
  end;

  if (MEdtData_Validade.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Validade.SetFocus;
    abort;
  end;

  Confira_Pedido:= true;
end;

procedure TFrmFabricacao_Propria.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmFabricacao_Propria.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Confirma_Delete = true) then
      begin
        IFP.Excluir(IFP);
        Atualiza_Dados;
        Limpa_Menor;
      end;
  end;
end;

procedure TFrmFabricacao_Propria.EdtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFabricacao_Propria.EdtCodigo_ProdutoDblClick(Sender: TObject);
begin
  produto:= true;
  Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
  FrmChama_Produto.ShowModal;
  FrmChama_Produto.Free;
end;

procedure TFrmFabricacao_Propria.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    produto:= true;
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmFabricacao_Propria.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFabricacao_Propria.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFabricacao_Propria.EdtCodigo_InsumoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    produto:= false;
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmFabricacao_Propria.EdtQuantidadeExit(Sender: TObject);
begin
  {if (EdtQuantidade.Text = '') then
  begin
    Valor_Invalido;
    EdtQuantidade.SetFocus;
    abort;
  end
  else
  begin
    EdtQuantidade.Text:= FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
    EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;}
end;

procedure TFrmFabricacao_Propria.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmFabricacao_Propria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (iniciado = false) then
    begin
      FrmFabricacao_Propria.Free;
      FrmFabricacao_Propria:= Nil;
    end
    else
    begin
      Salve;
      Abort;
    end;
end;

procedure TFrmFabricacao_Propria.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmFabricacao_Propria);
  Util.Limpa_Campos(FrmFabricacao_Propria);
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmFabricacao_Propria);
  PageControl2.TabIndex:= 0;
  Centraliza_Form(FrmFabricacao_Propria);
  qryitens_fabricacao.Close;
  LblEstoque.Caption:= '';
end;

procedure TFrmFabricacao_Propria.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmFabricacao_Propria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = true) then
      begin
        Mensagem_Venda_Andamento;
        abort;
      end;
      Util.Habilita_Campos(FrmFabricacao_Propria);
      Util.Limpa_Campos(FrmFabricacao_Propria);
      iniciado:= true;
      BBtnSalvar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      PageControl2.TabIndex:= 0;
      Gera_Codigo;
      MEdtData_Fabricacao.SetFocus;
      qryitens_fabricacao.Close;
      LblEstoque.Caption:= '';
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmFabricacao_Propria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmFabricacao_Propria.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Fabricacao_Propria');
      open;
    end;
      codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
      EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFabricacao_Propria.Limpa_Menor;
begin
  {EdtCodigo_Insumo.Clear;
  EdtInsumo.Clear;
  EdtUnidade.Clear;
  EdtQuantidade.Clear;
  LblInsumo.Caption:= '';

  EdtCodigo_Insumo.SetFocus;}
end;

procedure TFrmFabricacao_Propria.MEdtData_FabricacaoEnter(Sender: TObject);
begin
  MEdtData_Fabricacao.Text:= DateToStr(date);
end;

procedure TFrmFabricacao_Propria.MEdtData_ValidadeEnter(Sender: TObject);
begin
  MEdtData_Validade.Text:= DateToStr(date);
end;

end.
