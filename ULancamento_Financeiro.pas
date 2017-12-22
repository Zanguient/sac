unit ULancamento_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls,
  Modelo.Entidade.TLancamentoFinanceiroEntidade, Modelo.Dominio.Cliente.TClienteDominio,
  Modelo.Entidade.DocumentosFinanceiro.TPromissoriaEntidade,
  Modelo.Dominio.DocumentosFinanceiro.TPromissoriaDominio,
  Modelo.Entidade.Cliente.TCliente;

type
  TFrmLancamento_Financeiro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    BBtnPesquisar: TToolButton;
    Label2: TLabel;
    EdtCondicao_Pagamento: TEdit;
    EdtCodigo_Condicao_Pagamento: TEdit;
    LblMarca: TLabel;
    EdtDocumento: TEdit;
    CBReplicar: TCheckBox;
    RGTipo: TRadioGroup;
    Label1: TLabel;
    EdtCli_Forn: TEdit;
    EdtCodigo_Cli_Forn: TEdit;
    Label3: TLabel;
    EdtTipo_Documento: TEdit;
    EdtCodigo_Tipo_Documento: TEdit;
    EdtHistorico: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtDepartamento: TEdit;
    EdtCodigo_Departamento: TEdit;
    Label6: TLabel;
    EdtPlano: TEdit;
    EdtCodigo_Plano: TEdit;
    Label7: TLabel;
    LblValor_Total: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    MEdtData_Vencimento: TMaskEdit;
    EdtValor_Cobrado: TEdit;
    MEdtData_Lancamento: TMaskEdit;
    EdtValor_Documento: TEdit;
    EdtDesconto: TEdit;
    EdtMulta: TEdit;
    LblObservacoes: TLabel;
    MmoObservacoes: TMemo;
    ADOStoredProc1: TADOStoredProc;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Data_Pagamento: TDateTimeField;
    ADOQuery1Parcela: TIntegerField;
    ADOQuery1Status: TStringField;
    ADOQuery1Valor: TFloatField;
    CBConta_Fixa: TCheckBox;
    ADOQuery1Codigo_Conta: TIntegerField;
    ADOQuery1Codigo_Cheque: TIntegerField;
    ADOQuery1Data_Atualizacao: TDateTimeField;
    ADOQuery1Valor_Pagar: TFloatField;
    DBGrid1: TDBGrid;
    CBJuro: TCheckBox;
    ADOQuery1Codigo_Forma_Pagamento_Parcela: TIntegerField;
    ADOQuery1Forma_Pagamento: TStringField;
    ADOQuery1Valor_Restante: TFloatField;
    ADOQuery1Valor_Pago: TFloatField;
    BBtnGerar_Carne: TToolButton;
    BBtnGerar_Promissoria: TToolButton;
    BbtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Cli_FornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tipo_DocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_DepartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_LancamentoEnter(Sender: TObject);
    procedure EdtValor_DocumentoExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtMultaExit(Sender: TObject);
    procedure EdtValor_CobradoExit(Sender: TObject);
    procedure MEdtData_LancamentoExit(Sender: TObject);
    procedure MEdtData_VencimentoExit(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_CobradoEnter(Sender: TObject);
    procedure MEdtData_VencimentoEnter(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Cli_FornKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCli_FornKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tipo_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMultaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_CobradoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure ADOQuery1BeforeScroll(DataSet: TDataSet);
    procedure ADOQuery1Data_PagamentoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure EdtCodigo_Condicao_PagamentoDblClick(Sender: TObject);
    procedure EdtCodigo_Cli_FornDblClick(Sender: TObject);
    procedure EdtCodigo_Tipo_DocumentoDblClick(Sender: TObject);
    procedure EdtCodigo_DepartamentoDblClick(Sender: TObject);
    procedure EdtCodigo_PlanoDblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnGerar_CarneClick(Sender: TObject);
    procedure BBtnGerar_PromissoriaClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
  private
    Lancamento_Financeiro: URegistro.TLancamento_Financeiro;
    Parcela: URegistro.TParcelas;
    Util: TUtil;
    oLF: TLancamentoFinanceiroEntidade;

    oCli: TCliente;
    oCliDominio: TClienteDominio;
    oP: TPromissoriaEntidade;
    oPDominio: TPromissoriaDominio;

  public
    ativo, achei, liberado: boolean;
    Conexao : TADOConnection;

    procedure Chama_Parcelas;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmLancamento_Financeiro: TFrmLancamento_Financeiro;
implementation

uses UDM, UChama_Condicao_Pagamento, UChama_Cliente, UChama_Fornecedor,
  UChama_Tipo_Documento, UChama_Departamento, UChama_Plano_Financeiro,
  UDeclaracao, UChama_Lancamento_Financeiro_Alterar, URel_Carne,
  URel_Carne_Selecionado, UVisualizacao_Carne, Util.GeradorDeCodigo,
  URel_Promissoria, USenha_ADM, Conexao.TConexao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmLancamento_Financeiro.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  if (ADOQuery1.Eof) then
  begin
    //Chama_Parcelas;
    abort;
  end;
end;

procedure TFrmLancamento_Financeiro.ADOQuery1BeforeScroll(DataSet: TDataSet);
begin
  ADOQuery1.Edit;
  ADOQuery1.Post;
end;

procedure TFrmLancamento_Financeiro.ADOQuery1Data_PagamentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899 00:00:00') then
    Text := '';
end;

procedure TFrmLancamento_Financeiro.BBtnCancelarClick(Sender: TObject);
begin
  TConexao.CancelaConexao(Conexao);
  Util.Limpa_Campos(FrmLancamento_Financeiro);
  Util.Desabilita_Campos(FrmLancamento_Financeiro);
  ADOQuery1.Close;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
  BBtnGerar_Carne.Enabled:= false;
  BBtnGerar_Promissoria.Enabled:= false;
end;

procedure TFrmLancamento_Financeiro.BBtnExcluirClick(Sender: TObject);
begin
  if (CONFIRMA_EXCLUSAO) then
  BEGIN
    Lancamento_Financeiro.Excluir(Lancamento_Financeiro);
    Parcela.Excluir_Historico(Parcela);
    Parcela.Excluir(Parcela);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU LANÇAMENTO FINANCEIRO ' + EdtDocumento.Text + '.', TimeToStr(time), exclusao, date);
    TConexao.ConfirmaConexao(Conexao);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    BBtnGerar_Carne.Enabled:= false;
    BBtnGerar_Promissoria.Enabled:= false;
    Util.Desabilita_Campos(FrmLancamento_Financeiro);
  END;
end;

procedure TFrmLancamento_Financeiro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLancamento_Financeiro.BBtnGerar_CarneClick(Sender: TObject);
begin
  oLF:= TLancamentoFinanceiroEntidade.Create;
  oLF.Codigo:= StrToInt(EdtCodigo.Text);
  FrmVisualizacao_Carne:= TFrmVisualizacao_Carne.Create(oLF);
  FrmVisualizacao_Carne.ShowModal;
  FrmVisualizacao_Carne.Free;
  //FrmVisualizacao_Carne.Release;
  //FrmVisualizacao_Carne:= Nil;

  {Application.CreateForm(TFrmVisualizacao_Carne, FrmVisualizacao_Carne);
  FrmVisualizacao_Carne.ShowModal;
  FrmVisualizacao_Carne.Free;}

  {if (achei = false) then
  begin
    FrmRel_Carne:= TFrmRel_Carne.create(self);
    FrmRel_Carne.Release;
    FrmRel_Carne:= Nil;
  end
  else
  begin
    FrmRel_Carne_Selecionado:= TFrmRel_Carne_Selecionado.create(self);
    FrmRel_Carne_Selecionado.Release;
    FrmRel_Carne_Selecionado:= Nil;
  end; }
end;

procedure TFrmLancamento_Financeiro.BBtnGerar_PromissoriaClick(Sender: TObject);
begin
  FrmRel_Promissoria:= TFrmRel_Promissoria.Create( StrToInt(EdtCodigo.Text ));
  FrmRel_Promissoria.Release;
  FrmRel_Promissoria:= Nil;
//  oCliDominio:= TClienteDominio.Create;
//  oCli:= TCliente.Create;
//  oP:= TPromissoriaEntidade.Create;
//  oPDominio:= TPromissoriaDominio.Create;
//
//  oCli:= oCliDominio.buscarClientePorCodigo(StrToInt(EdtCodigo_Cli_Forn.Text));
//
//  ADOQuery1.First;
//  while not ADOQuery1.Eof do
//  begin
//    if (DBGrid1.SelectedRows.CurrentRowSelected) then
//    begin
//      oP.Data_Atual:= StrToDateTime(MEdtData_Lancamento.Text);
//      oP.DataVencimento:= ADOQuery1Data_Vencimento.AsDateTime;
//      oP.Valor:= ADOQuery1Valor_Pagar.AsFloat;
//
//      oP.NomeCliente:= razao_social;
//      oP.CPFCNPJ:= cnpj;
//      oP.Endereco:= tipo_endereco + ' ' + endereco + ', nº '+UDeclaracao.numero+', Setor '+ setor;
//
//      oPDominio.GeraPromissoria(oP);
//    end;
//    ADOQuery1.Next;
//  end;
end;

procedure TFrmLancamento_Financeiro.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Financeiro);
  Util.Limpa_Campos(FrmLancamento_Financeiro);
  Conexao:= TConexao.NovaConexao(Conexao);
  TConexao.IniciaQuerys([ADOQuery1], Conexao);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  BBtnGerar_Carne.Enabled:= false;
  BBtnGerar_Promissoria.Enabled:= false;
  achei:= false;
  EdtDocumento.SetFocus;
  EdtValor_Documento.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtMulta.Text:= '0,00';
  EdtValor_Cobrado.Text:= '0,00';
  ADOQuery1.Close;
end;

procedure TFrmLancamento_Financeiro.BBtnSalvarClick(Sender: TObject);
var
  cod_lancamento: integer;
begin
  //Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
  //FrmSenha_ADM.ShowModal;
  //FrmSenha_ADM.Free;

  //if (liberado) then
  //begin
    //liberado:= false;
    if (achei = false) then
      begin
        if (Confira = true) then
        begin
          cod_lancamento:= TGeradorDeCodigo.GeraCodigoSequenciaControlaCodigo('Controla_Codigo_Lancamento_Financeiro', dm.ADOConnection1);
          EdtCodigo.Text:= IntToStr(cod_lancamento);

          if (EdtDocumento.Text = '') then
            EdtDocumento.Text:= IntToStr(cod_lancamento);

          Lancamento_Financeiro.Inserir(Lancamento_Financeiro);
          UDeclaracao.Insere_Historico(usuario, 'EFETUOU LANÇAMENTO FINANCEIRO ' + EdtDocumento.Text + '.', TimeToStr(time), insercao, date);
          //Parcela.Inserir(Parcela);
        end
        else
          exit;
      end
      else
      begin
        if (Confira = true) then
        BEGIN
          //if (Application.MessageBox('Para alterar dados de uma conta já lançada, será excluido esse lançamento e todas as parcelas geradas. Deseja continuar?', 'Aviso', MB_YESNO+MB_ICONQUESTION)) = IDYES then
          //begin
            //Lancamento_Financeiro.Excluir(Lancamento_Financeiro);
            //Parcela.Excluir(Parcela);

            Lancamento_Financeiro.Alterar(Lancamento_Financeiro);
            UDeclaracao.Insere_Historico(usuario, 'ALTEROU LANÇAMENTO FINANCEIRO ' + EdtDocumento.Text + '.', TimeToStr(time), alteracao, date);
          //end;

        END
        else
          exit;
      end;
      TConexao.ConfirmaConexao(Conexao);
      Chama_Parcelas;
      BBtnSalvar.Enabled:= false;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= true;
      BBtnCancelar.Enabled:= false;
      BBtnNovo.Enabled:= true;

      if (RGTipo.ItemIndex = 0) then
      begin
        BBtnGerar_Carne.Enabled:= true;
        BBtnGerar_Promissoria.Enabled:= true;
      end
      else
      begin
        BBtnGerar_Carne.Enabled:= false;
        BBtnGerar_Promissoria.Enabled:= false;
      end;

      BBtnGerar_Carne.Enabled:= true;
      Util.Desabilita_Campos(FrmLancamento_Financeiro);
  //end;
end;

procedure TFrmLancamento_Financeiro.Chama_Parcelas;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select PL.* from Parcelas_Lancamentos PL');
    add('where PL.Codigo = :Codigo order by Parcela');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

function TFrmLancamento_Financeiro.Confira: boolean;
begin
    Confira:= false;
    {if EdtDocumento.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDocumento.SetFocus;
        abort;
      end;}

    if EdtCodigo_Condicao_Pagamento.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Condicao_Pagamento.SetFocus;
        abort;
      end;

    if EdtCodigo_Cli_Forn.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Cli_Forn.SetFocus;
        abort;
      end;

    if MEdtData_Vencimento.Text = '  /  /    ' then
      begin
        Mensagem_Falta_Dados;
        MEdtData_Vencimento.SetFocus;
        abort;
      end;

    if MEdtData_Lancamento.Text = '  /  /    ' then
      begin
        Mensagem_Falta_Dados;
        MEdtData_Lancamento.SetFocus;
        abort;
      end;

    if (EdtValor_Documento.Text = '0,00') or (EdtValor_Documento.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtValor_Documento.SetFocus;
        abort;
      end;

    if (EdtDesconto.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtDesconto.SetFocus;
        abort;
      end;

    if (EdtMulta.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtMulta.SetFocus;
        abort;
      end;

    if (EdtValor_Cobrado.Text = '0,00') or (EdtValor_Cobrado.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtValor_Cobrado.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmLancamento_Financeiro.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    if Confirma_Exclusao then
    begin
      ADOQuery1.Delete;
    end;
  end;
end;

procedure TFrmLancamento_Financeiro.EdtCli_FornKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Cli_FornDblClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 0) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end
    else if (RGTipo.ItemIndex = 1) then
    begin
      Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
      FrmChama_Fornecedor.ShowModal;
      FrmChama_Fornecedor.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Cli_FornKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
    if (RGTipo.ItemIndex = 0) then
      begin
        Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
        FrmChama_Cliente.ShowModal;
        FrmChama_Cliente.Free;
      end
      else if (RGTipo.ItemIndex = 1) then
      begin
        Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
        FrmChama_Fornecedor.ShowModal;
        FrmChama_Fornecedor.Free;
      end;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Cli_FornKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Condicao_PagamentoDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
  FrmChama_Condicao_Pagamento.ShowModal;
  FrmChama_Condicao_Pagamento.Free;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Condicao_PagamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
      FrmChama_Condicao_Pagamento.ShowModal;
      FrmChama_Condicao_Pagamento.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Condicao_PagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
    Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_DepartamentoDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
  FrmChama_Departamento.ShowModal;
  FrmChama_Departamento.Free;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_DepartamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
      FrmChama_Departamento.ShowModal;
      FrmChama_Departamento.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_DepartamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_PlanoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
  FrmChama_Plano_Financeiro.ShowModal;
  FrmChama_Plano_Financeiro.Free;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Tipo_DocumentoDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tipo_Documento, FrmChama_Tipo_Documento);
  FrmChama_Tipo_Documento.ShowModal;
  FrmChama_Tipo_Documento.Free;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Tipo_DocumentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tipo_Documento, FrmChama_Tipo_Documento);
      FrmChama_Tipo_Documento.ShowModal;
      FrmChama_Tipo_Documento.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Tipo_DocumentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCondicao_PagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtDepartamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtDescontoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtDesconto, StrToFloat(EdtDesconto.Text));
end;

procedure TFrmLancamento_Financeiro.EdtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLancamento_Financeiro.EdtDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmLancamento_Financeiro.EdtMultaExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtMulta, StrToFloat(EdtMulta.Text));
end;

procedure TFrmLancamento_Financeiro.EdtMultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLancamento_Financeiro.EdtPlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtTipo_DocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtValor_CobradoEnter(Sender: TObject);
  var
    valor_documento, desconto, multa, result: double;
begin
  valor_documento:= StrToFloat(EdtValor_Documento.Text);
  desconto:= StrToFloat(EdtDesconto.Text);
  multa:= StrToFloat(EdtMulta.Text);
  result:= valor_documento - desconto + multa;
  EdtValor_Cobrado.Text:= FloatToStr(result);
  Util.FormataFloat(2, EdtValor_Cobrado, StrToFloat(EdtValor_Cobrado.Text));
end;

procedure TFrmLancamento_Financeiro.EdtValor_CobradoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor_Cobrado, StrToFloat(EdtValor_Cobrado.Text));
end;

procedure TFrmLancamento_Financeiro.EdtValor_CobradoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLancamento_Financeiro.EdtValor_DocumentoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor_Documento, StrToFloat(EdtValor_Documento.Text));
end;

procedure TFrmLancamento_Financeiro.EdtValor_DocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmLancamento_Financeiro.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmLancamento_Financeiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      cancele;
      Abort;
    end
    else
      begin
        FrmLancamento_Financeiro.Free;
        FrmLancamento_Financeiro:= Nil;
      end;
end;

procedure TFrmLancamento_Financeiro.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Financeiro);
  Util.Limpa_Campos(FrmLancamento_Financeiro);
  Util.Desabilita_Campos(FrmLancamento_Financeiro);
  EdtValor_Documento.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtMulta.Text:= '0,00';
  EdtValor_Cobrado.Text:= '0,00';
  ADOQuery1.Close;
  achei:= false;
  CBJuro.Hint:= 'Se marcado, será calculado juros em todas as parcelas. '+#13+'Se não marcar, mesmo que for um lançamento a prazo e com juros, será cobrado o juros diários, caso vença alguma parcela.';
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmLancamento_Financeiro.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmLancamento_Financeiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmLancamento_Financeiro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmLancamento_Financeiro.MEdtData_LancamentoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Lancamento.Text:= DateToStr(date);
end;

procedure TFrmLancamento_Financeiro.MEdtData_LancamentoExit(Sender: TObject);
begin
  if (MEdtData_Lancamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Lancamento);
end;

procedure TFrmLancamento_Financeiro.MEdtData_VencimentoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Vencimento.Text:= DateToStr(date);
end;

procedure TFrmLancamento_Financeiro.MEdtData_VencimentoExit(Sender: TObject);
begin
  if (MEdtData_Vencimento.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end
  else
    Util.Verifica_Data(MEdtData_Vencimento);

  {if StrToDateTime(MEdtData_Vencimento.Text) < StrToDateTime(MEdtData_Lancamento.Text) then
    begin
      Application.MessageBox('A data de vencimento deve ser maior que a data de lançamento', 'Erro', MB_OK+MB_ICONHAND);
      MEdtData_Vencimento.SetFocus;
    end;}
end;

procedure TFrmLancamento_Financeiro.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmLancamento_Financeiro.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Lancamento_Financeiro_Alterar, FrmChama_Lancamento_Financeiro_Alterar);
  FrmChama_Lancamento_Financeiro_Alterar.ShowModal;
  FrmChama_Lancamento_Financeiro_Alterar.Release;
end;

end.
