unit UAlteracao_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient;

type
  TFrmAlteracao_Produto = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnFechar: TToolButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ImgImagens_Comandos: TImageList;
    DBGrid1: TDBGrid;
    RGTipo: TRadioGroup;
    EdtPesquisa: TEdit;
    RGPesquisa: TRadioGroup;
    BBtnAtualiza: TToolButton;
    CBMostra: TCheckBox;
    LblPerc: TLabel;
    EdtPerc: TEdit;
    RGPerc: TRadioGroup;
    BBtnAtivaDesativa: TToolButton;
    BbtnNovo: TToolButton;
    ADOQuery1Codigo: TAutoIncField;
    ADOQuery1Codigo_Original: TStringField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Codigo_Similar: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1NCM: TStringField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Valor_Compra: TFloatField;
    ADOQuery1Codigo_Grupo_Tributacao: TIntegerField;
    ADOQuery1Estoque_Maximo: TFloatField;
    ADOQuery1Estoque_Minimo: TFloatField;
    ADOQuery1Codigo_Marca: TIntegerField;
    ADOQuery1Marca: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientDataSet1BeforeInsert(DataSet: TDataSet);
    procedure EdtPesquisaChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RGTipoClick(Sender: TObject);
    procedure CBMostraClick(Sender: TObject);
    procedure EdtPercKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnAtualizaClick(Sender: TObject);
    procedure ADOQuery1Codigo_VendaChange(Sender: TField);
    procedure BBtnAtivaDesativaClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
  private
    Tabela: URegistro.TCadastro_Tabela_Preco;
    Util: TUtil;
    custo: double;

    procedure Atualiza_Custo;
    procedure Libera_Itens;
    procedure Bloqueia_Itens;
    procedure Altera_Preco_Tabela;
    procedure Altera_Custo;
    procedure Altera_Custo_Medio;
    procedure UpdateGrupo(Produto: Integer);
    procedure Gera_Codigo_Venda;
    procedure Atualiza_Marcas;
  public
    ativo, escolha, achei, liberado: Boolean;
    lib: integer;
    procedure Atualiza_Dados;
    procedure Exclui_Produto_Tabela;
  protected
    function Confira: Boolean; virtual;
  end;

var
  FrmAlteracao_Produto: TFrmAlteracao_Produto;

implementation

uses UDM, UDeclaracao, USenha_ADM;
{$R *.dfm}
{ TFrmPadrao }

procedure TFrmAlteracao_Produto.ADOQuery1Codigo_VendaChange(Sender: TField);
var
  aux, aux2, cod_prod: AnsiString;
begin
  if (gera_codigo_ean = 0) then
  begin
    if (Length(Sender.AsString) < 12) then
    begin
      cod_prod := Sender.AsString;
      aux2 := StringOfChar('0', 12 - Length(cod_prod)) + cod_prod;

      if (Length(aux2) = 12) then
      begin
        aux:= CalculaDigEAN13(aux2);
        Sender.AsString:= aux2 + aux;
      end;
    end;
  end;
end;

procedure TFrmAlteracao_Produto.Gera_Codigo_Venda;
begin

end;

procedure TFrmAlteracao_Produto.Altera_Custo;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('update Produto set Valor_Compra = :Valor_Compra');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Valor_Compra').Value := custo;
      Parameters.ParamByName('Codigo').Value := ADOQuery1Codigo.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAlteracao_Produto.Altera_Custo_Medio;
var
  qAux, qAux2: TADOQuery;
  saldo_estoque, estoque, custo_medio, total_bruto: double;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  try
    with qAux2, sql do
    begin
      close;
      Connection := dm.ADOConnection1;                               ////não fiz, está incompleto
      clear;
      add('select P.Saldo_Estoque, P.Estoque');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := ADOQuery1Codigo.AsInteger;
      ExecSQL;
    end;
    saldo_estoque:= qAux2.FieldByName('Saldo_Estoque').AsFloat;
    estoque:= qAux2.FieldByName('Estoque').AsFloat;
    total_bruto:= estoque * custo;     //saldo estoque
    custo:= (saldo_estoque + total_bruto) / estoque;

    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('update Produto set Valor_Medio = :Valor_Medio');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Valor_Medio').Value := custo_medio;
      Parameters.ParamByName('Codigo').Value := ADOQuery1Codigo.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAlteracao_Produto.Altera_Preco_Tabela;
var
  qAux, qAux2: TADOQuery;
  perc, valor1_vista, valor1_prazo, valor2, calculo_perc: double;
begin
  qAux := TADOQuery.Create(nil);
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux2, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select TP.Tipo_Calculo, ITP.* from Tabela_Preco TP');
      add('left join Itens_Tabela_Preco ITP on (TP.Codigo = ITP.Codigo)');
      add('where TP.Codigo = :Codigo and ITP.Codigo_Produto = :Codigo_Produto');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
      Parameters.ParamByName('Codigo_Produto').Value := ADOQuery1Codigo.AsInteger;
      open;
    end;
    valor1_vista:= custo;
    valor1_prazo:= custo;

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc:= qAux2.FieldByName('Percentual_Lucro_Vista').AsFloat / 100;
      valor2:= valor1_vista * perc;
      valor1_vista:= valor1_vista + valor2;
      valor1_vista:= Calcula_Valor(FloatToStr(valor1_vista));
    end
    else
    begin
      calculo_perc:= (100 - qAux2.FieldByName('Percentual_Lucro_Vista').AsFloat) / 100;
      valor1_vista:= valor1_vista / calculo_perc;
      valor1_vista:= Calcula_Valor(FloatToStr(valor1_vista));
    end;

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc:= qAux2.FieldByName('Percentual_Lucro_Prazo').AsFloat / 100;
      valor2:= valor1_prazo * perc;
      valor1_prazo:= valor1_prazo + valor2;
      valor1_prazo:= Calcula_Valor(FloatToStr(valor1_prazo));
    end
    else
    begin
      calculo_perc:= (100 - qAux2.FieldByName('Percentual_Lucro_Prazo').AsFloat) / 100;
      valor1_prazo:= valor1_prazo / calculo_perc;
      valor1_prazo:= Calcula_Valor(FloatToStr(valor1_prazo));
    end;

    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Preco_Prazo = :Preco_Prazo');
      add('where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');

      Parameters.ParamByName('Codigo').Value := qAux2.FieldByName('Codigo').AsInteger;
      Parameters.ParamByName('Codigo_Produto').Value := ADOQuery1Codigo.AsInteger;
      Parameters.ParamByName('Preco_Vista').Value := valor1_vista;
      Parameters.ParamByName('Preco_Prazo').Value := valor1_prazo;
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAlteracao_Produto.Atualiza_Custo;
var
  qAux: TADOQuery;
  caux: double;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Item_Selecionado_DBGrid;
    abort;
  end;

  if (EdtPerc.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPerc.SetFocus;
    abort;
  end;

  if (Confirma_Processo) then
  begin
    ADOQuery1.First;
    try
      while not ADOQuery1.Eof do
      begin
        if (DBGrid1.SelectedRows.CurrentRowSelected) then
        begin
          caux:= 0;
          custo:= 0;
          caux:= ADOQuery1Valor_Compra.AsFloat * ( StrToFloat(EdtPerc.Text) / 100);

          if (RGPerc.ItemIndex = 0) then
            custo:= ADOQuery1Valor_Compra.AsFloat + caux
          else
            custo:= ADOQuery1Valor_Compra.AsFloat - caux;

          Altera_Preco_Tabela;
          Altera_Custo;
          ADOQuery1.Next;
        end
        else
          ADOQuery1.Next;
      end;
    finally
      Processo_Concluido;
      Atualiza_Dados;
    end;
  end;
end;

procedure TFrmAlteracao_Produto.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.Codigo_Original, P.Codigo_Venda, P.Codigo_Similar, P.Descricao, P.NCM,');
    add('P.Estoque, P.Valor_Compra, P.Codigo_Grupo_Tributacao, P.Estoque_Maximo, P.Estoque_Minimo, P.Codigo_Marca from Produto P');

    if (RGPesquisa.ItemIndex = 0) then
      add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo like ''' + EdtPesquisa.Text + '%'' order by P.Descricao')
    else if (RGPesquisa.ItemIndex = 1) then
      add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Original like '''+ EdtPesquisa.Text + '%'' order by P.Descricao')
    else if (RGPesquisa.ItemIndex = 2) then
      add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Venda like ''' + EdtPesquisa.Text + '%'' order by P.Descricao')
    else if (RGPesquisa.ItemIndex = 3) then
      add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Similar like ''' + EdtPesquisa.Text + '%'' order by P.Descricao')
    else if (RGPesquisa.ItemIndex = 4) then
      add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Descricao like ''' + EdtPesquisa.Text + '%'' order by P.Descricao');

    Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;

    if (RGTipo.ItemIndex = 0) then
      Parameters.ParamByName('Status').Value := 'ATIVO'
    else
      Parameters.ParamByName('Status').Value := 'INATIVO';
    open;
  end;
end;

procedure TFrmAlteracao_Produto.Atualiza_Marcas;
begin
  With dm.qrymarca, SQL do
  begin
    close;
    Clear;
    Add('select * from marca');
    open;
  end;
end;

procedure TFrmAlteracao_Produto.BBtnAtivaDesativaClick(Sender: TObject);
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('Informe pelo menos um produto para continuar', 'Produto não selecionado', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (Application.MessageBox('Confirma a ativação/desativação dos produtos selecionados?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = IDYES then
  begin
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        UpdateGrupo(ADOQuery1Codigo.AsInteger);
      end;
      ADOQuery1.Next;
    end;
    Atualiza_Dados;
    Processo_Concluido;
  end;
end;

procedure TFrmAlteracao_Produto.UpdateGrupo(Produto: Integer);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Produto set Status = :Status ');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Produto;
      if (RGTipo.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'INATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'ATIVO';

      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('update Produto set Status = :Status ');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Produto;
      if (RGTipo.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'INATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'ATIVO';
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAlteracao_Produto.BBtnAtualizaClick(Sender: TObject);
begin
  Atualiza_Custo;
end;

procedure TFrmAlteracao_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAlteracao_Produto.BbtnNovoClick(Sender: TObject);
begin
  Atualiza_Dados;
  BBtnAtualiza.Enabled:= true;
  BBtnAtivaDesativa.Enabled:= true;
  CBMostra.Checked:= false;
  RGPerc.ItemIndex:= 0;
  BBtnNovo.Enabled:= false;
  Atualiza_Marcas;
  Bloqueia_Itens;
end;

procedure TFrmAlteracao_Produto.Bloqueia_Itens;
begin
  LblPerc.Visible:= false;
  EdtPerc.Visible:= false;
  RGPerc.Visible:= false;
end;

procedure TFrmAlteracao_Produto.CBMostraClick(Sender: TObject);
begin
  if (CBMostra.Checked) then
  begin
    liberado:= false;
    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;

    if (liberado) then
    begin
      DBGrid1.Columns[7].Visible:= true;
      Libera_Itens;
    end
    else
    begin
      DBGrid1.Columns[7].Visible:= false;
      Bloqueia_Itens;
    end;
  end
  else
  begin
    DBGrid1.Columns[7].Visible:= false;
    Bloqueia_Itens;
  end;
end;

procedure TFrmAlteracao_Produto.ClientDataSet1BeforeInsert(DataSet: TDataSet);
begin
  if (ADOQuery1.Eof) then
  begin
    EdtPesquisa.clear;
    abort;
  end;
end;

function TFrmAlteracao_Produto.Confira: Boolean;
begin
end;

procedure TFrmAlteracao_Produto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect,
    TDBGrid(Sender).columns[DataCol].field, State)
end;

procedure TFrmAlteracao_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_delete) then
  begin
    if (Confirma_Exclusao) then
    begin
      UDeclaracao.Insere_Historico(usuario, 'EXCLUIU PRODUTO ' + ADOQuery1Descricao.AsString + '.', TimeToStr(time), exclusao, date);
      Exclui_Produto_Tabela;
      ADOQuery1.Delete;
      Atualiza_Dados;
      Inicializa_Dados_Principais_Movimentacao(0, dm.qrychama_produto);
    end;
  end;
end;

procedure TFrmAlteracao_Produto.EdtPercKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmAlteracao_Produto.EdtPesquisaChange(Sender: TObject);
begin
  Atualiza_Dados;
end;

procedure TFrmAlteracao_Produto.Exclui_Produto_Tabela;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('delete from Itens_Tabela_Preco where Codigo = :Codigo and Codigo_Produto = :Produto');
      Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_padrao;
      Parameters.ParamByName('Produto').Value:= ADOQuery1Codigo.AsInteger;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('delete from Itens_Tabela_Preco_Aux where Codigo = :Codigo and Codigo_Produto = :Produto');
      Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_padrao;
      Parameters.ParamByName('Produto').Value:= ADOQuery1Codigo.AsInteger;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('delete from Produto_Aux where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= ADOQuery1Codigo.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

{ procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
  begin
  case llEstado of
  Inserir: Habilita_Botao([false, true, false, true]);
  //Alterar: Habilita_Botao([false, true, false, true]);
  Consultar: Habilita_Botao([false, true, true, true]);
  end;
  end; }

procedure TFrmAlteracao_Produto.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmAlteracao_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //Delete_Produto_Aux;
  //Insere_Produto_Aux;

  //Cria_Arquivo_Atualiza_Produto;
  //Inicializa_Dados_Principais_Movimentacao(0, dm.qrychama_produto);
  {if (tipo_local = '0202') then
  begin
    Atualiza_Produto;
  end;}

  Cria_Arquivo_Atualiza_Dados('AProd');

  FrmAlteracao_Produto.Free;
  FrmAlteracao_Produto := Nil;
end;

procedure TFrmAlteracao_Produto.FormCreate(Sender: TObject);
begin
  //Util.Habilita_Campos(FrmAlteracao_Produto);
  //Util.Limpa_Campos(FrmAlteracao_Produto);
  //Util.Desabilita_Campos(FrmAlteracao_Produto);
  RGPesquisa.ItemIndex:= consulta_padrao_produto;
  EdtPesquisa.Clear;
  BBtnAtualiza.Enabled:= false;
  BBtnAtivaDesativa.Enabled:= false;
  CBMostra.Checked:= false;
  RGPerc.ItemIndex:= 0;
  Bloqueia_Itens;
  ADOQuery1.close;
end;

procedure TFrmAlteracao_Produto.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmAlteracao_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f2) then
  begin

  end;

  if (Key = vk_escape) then
    close;
end;

procedure TFrmAlteracao_Produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmAlteracao_Produto.Libera_Itens;
begin
  LblPerc.Visible:= true;
  EdtPerc.Visible:= true;
  RGPerc.Visible:= true;
end;

procedure TFrmAlteracao_Produto.RGTipoClick(Sender: TObject);
begin
  Atualiza_Dados;
end;

end.

