unit UTratamento_ICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmTratamento_ICMS = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    LblCargo: TLabel;
    Label1: TLabel;
    CmbOrigem: TComboBox;
    CmbDestino: TComboBox;
    Label2: TLabel;
    Label9: TLabel;
    EdtDescricao: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    EdtRegra_ICMS_EN_Entrada: TEdit;
    EdtCodigo_Regra_ICMS_EN_Entrada: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    EdtRegra_ICMS_EPP_Entrada: TEdit;
    EdtCodigo_Regra_ICMS_EPP_Entrada: TEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    EdtRegra_ICMS_ME_Entrada: TEdit;
    EdtCodigo_Regra_ICMS_ME_Entrada: TEdit;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    EdtCodigo_Regra_ICMS_EN_Saida: TEdit;
    EdtRegra_ICMS_EN_Saida: TEdit;
    Label7: TLabel;
    EdtCodigo_Regra_ICMS_EPP_Saida: TEdit;
    EdtRegra_ICMS_EPP_Saida: TEdit;
    Label8: TLabel;
    EdtCodigo_Regra_ICMS_ME_Saida: TEdit;
    EdtRegra_ICMS_ME_Saida: TEdit;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    EdtCodigo_Regra_ICMS_Nao_Contribuinte: TEdit;
    EdtRegra_ICMS_Nao_Contribuinte: TEdit;
    BBtnSalvar_Itens: TToolButton;
    BBtnExcluir_Item: TToolButton;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Origem: TStringField;
    ADOQuery1Destino: TStringField;
    ADOQuery1Entrada_Regra_EN: TIntegerField;
    ADOQuery1Entrada_Regra_EPP: TIntegerField;
    ADOQuery1Entrada_Regra_ME: TIntegerField;
    ADOQuery1Saida_Regra_EN: TIntegerField;
    ADOQuery1Saida_Regra_EPP: TIntegerField;
    ADOQuery1Saida_Regra_ME: TIntegerField;
    ADOQuery1Regra_Nao_Contribuinte: TIntegerField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Descricao_1: TStringField;
    ADOQuery1Descricao_2: TStringField;
    ADOQuery1Descricao_3: TStringField;
    ADOQuery1Descricao_4: TStringField;
    ADOQuery1Descricao_5: TStringField;
    ADOQuery1Descricao_6: TStringField;
    BBtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_Regra_ICMS_EN_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_EPP_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_ME_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_EN_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_EPP_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_ME_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure BBtnSalvar_ItensClick(Sender: TObject);
    procedure BBtnExcluir_ItemClick(Sender: TObject);
    procedure CmbDestinoClick(Sender: TObject);
    procedure EdtRegra_ICMS_Nao_ContribuinteKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Regra_ICMS_EN_SaidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_ICMS_EN_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_ICMS_EPP_SaidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_ICMS_EPP_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_ICMS_ME_SaidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_ICMS_ME_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_ICMS_EN_EntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Regra_ICMS_EPP_EntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Regra_ICMS_ME_EntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_ICMS_ME_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtRegra_ICMS_EPP_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtRegra_ICMS_EN_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_ICMS_EN_EntradaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_ICMS_EPP_EntradaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_ICMS_ME_EntradaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_ICMS_EN_SaidaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_ICMS_EPP_SaidaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_ICMS_ME_SaidaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_ICMS_Nao_ContribuinteDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Tratamento_ICMS: URegistro.TTratamento_ICMS;
    Itens_Tratamento_ICMS: URegistro.TItens_Tratamento_ICMS;
    Util: TUtil;
    Salvar_Item, tem_origem_destino: boolean;

    procedure Limpa_Menor;
    procedure Gera_Codigo;
    procedure Verifica_Origem_Destino;
    procedure Fecha_Conexao;
    procedure Inicia_Query_Conexao(Conexao: TADOConnection);
  public
    ativo, achei: boolean;
    regra: integer;
    Conexao: TADOConnection;

    procedure Cria_Conexao;
  protected
    function Confira: boolean;
    function Confira_Itens: boolean;
  end;

var
  FrmTratamento_ICMS: TFrmTratamento_ICMS;
implementation

uses UDM, UDeclaracao, UChama_Tratamento_ICMS, UChama_Regra_ICMS;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmTratamento_ICMS.BBtnCancelarClick(Sender: TObject);
begin
  BBtnSalvar.Enabled:= false;
  BBtnSalvar_Itens.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnExcluir_Item.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;

  Conexao.RollbackTrans;
  Fecha_Conexao;

  Util.Limpa_Campos(FrmTratamento_ICMS);
  Util.Desabilita_Campos(FrmTratamento_ICMS);
end;

procedure TFrmTratamento_ICMS.Fecha_Conexao;
begin
  if (Conexao <> nil) then
  begin
    Conexao.Close;
  end;
end;

procedure TFrmTratamento_ICMS.Cria_Conexao;
begin
  UGeral.Abre_Conexao(Conexao);
  Conexao.BeginTrans;
  SetUncommitted(Conexao);
  Inicia_Query_Conexao(Conexao);
end;

procedure TFrmTratamento_ICMS.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Tratamento_ICMS.Excluir(Tratamento_ICMS, Conexao);
    Itens_Tratamento_ICMS.Excluir(Itens_Tratamento_ICMS, Conexao);
    Cria_Arquivo_Atualiza_Dados('DTICMS');
    Cria_Arquivo_Atualiza_Dados('DITICMS');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU TRATAMENTO DE ICMS ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);

    Conexao.CommitTrans;
    Fecha_Conexao;
    BBtnSalvar.Enabled:= false;
    BBtnSalvar_Itens.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnExcluir_Item.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmTratamento_ICMS);
  end;
end;

procedure TFrmTratamento_ICMS.BBtnExcluir_ItemClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Itens_Tratamento_ICMS.Excluir_Item(Itens_Tratamento_ICMS, Conexao);
    Cria_Arquivo_Atualiza_Dados('DITICMS');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU ITEM DE TRATAMENTO DE ICMS ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    Limpa_Menor;
  end;
end;

procedure TFrmTratamento_ICMS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTratamento_ICMS.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmTratamento_ICMS);
  Util.Limpa_Campos(FrmTratamento_ICMS);
  BBtnSalvar.Enabled:= true;
  BBtnSalvar_Itens.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnExcluir_Item.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;

  if (Conexao.InTransaction = false) then
  begin
    try
      Cria_Conexao;
    except
      ShowMessage('Erro ao abrir conexão com banco de dados.');
      abort;
    end;
  end;

  achei:= false;
  PageControl2.TabIndex:= 0;
  Salvar_Item:= false;
  tem_origem_destino:= false;
  Gera_Codigo;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmTratamento_ICMS.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Salvar_Item = true) then
      begin
        if (Confira = true) then
        BEGIN
          Tratamento_ICMS.Inserir(Tratamento_ICMS, Conexao);
          //Cria_Arquivo_Atualiza_Dados('ITICMS');
          //Cria_Arquivo_Atualiza_Dados('IITICMS');
          UDeclaracao.Insere_Historico(usuario, 'CADASTROU TRATAMENTO DE ICMS ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
        END
        else
          exit;
      end
      else
        abort;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Tratamento_ICMS.Alterar(Tratamento_ICMS, Conexao);
        //Cria_Arquivo_Atualiza_Dados('ATICMS');
        //Cria_Arquivo_Atualiza_Dados('AITICMS');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU TRATAMENTO DE ICMS ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;

    Conexao.CommitTrans;
    Conexao.Close;
    //Fecha_Conexao;

    BBtnSalvar.Enabled:= false;
    BBtnSalvar_Itens.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnExcluir_Item.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    //Insere_Tratamento_ICMS;
    Util.Desabilita_Campos(FrmTratamento_ICMS);
    Cria_Arquivo_Atualiza_Produto;
end;

procedure TFrmTratamento_ICMS.Verifica_Origem_Destino;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('Select ITI.Codigo from Itens_Tratamento_ICMS ITI where ');
      add('Origem = '+QuotedStr(CmbOrigem.Text)+' and Destino = '+QuotedStr(CmbDestino.Text)+' and Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      open;

      if (IsEmpty = false) then
      begin
        Application.MessageBox(PChar('Já está configurado o tratamento de '+CmbOrigem.Text+' para '+CmbDestino.Text+'.'), 'Origem e Destino já configurado', MB_OK+MB_ICONHAND);
        abort;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmTratamento_ICMS.BBtnSalvar_ItensClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Deseja INSERIR um novo registro ou ALTERAR o registro selecionado?' + #10+#13 +
      'Caso queira INSERIR um novo registro, clique em SIM, caso queira apenas ALTERAR, clique em NÃO.'), 'Opção', MB_YESNO+MB_ICONQUESTION) = idyes) then
    begin
      if (Confira = true) then
      begin

        Verifica_Origem_Destino;
        Itens_Tratamento_ICMS.Inserir(Itens_Tratamento_ICMS, Conexao);
        Salvar_Item:= true;

      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Itens_Tratamento_ICMS.Alterar(Itens_Tratamento_ICMS, Conexao);
        Salvar_Item:= true;

      end
      else
        exit;
    end;
    tem_origem_destino:= true;
end;

procedure TFrmTratamento_ICMS.Inicia_Query_Conexao(Conexao: TADOConnection);
begin
  ADOQuery1.Connection:= Conexao;
end;

procedure TFrmTratamento_ICMS.CmbDestinoClick(Sender: TObject);
begin
  if (CmbOrigem.Text = '') then
  begin
    Application.MessageBox('Informe uma origem', 'Origem não encontrada', MB_OK+MB_ICONHAND);
    CmbOrigem.SetFocus;
    abort;
  end;

  if (achei = true) then
  begin
    with ADOQuery1, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select ITI.*, RI1.Descricao, RI2.Descricao, RI3.Descricao, RI4.Descricao, RI5.Descricao, RI6.Descricao, RI7.Descricao from Tratamento_ICMS TI');
      add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)');
      add('inner join Regra_ICMS RI1 on (ITI.Entrada_Regra_EN = RI1.Codigo)');
      add('inner join Regra_ICMS RI2 on (ITI.Entrada_Regra_EPP = RI2.Codigo)');
      add('inner join Regra_ICMS RI3 on (ITI.Entrada_Regra_ME = RI3.Codigo)');
      add('inner join Regra_ICMS RI4 on (ITI.Saida_Regra_EN = RI4.Codigo)');
      add('inner join Regra_ICMS RI5 on (ITI.Saida_Regra_EPP = RI5.Codigo)');
      add('inner join Regra_ICMS RI6 on (ITI.Saida_Regra_ME = RI6.Codigo)');
      add('inner join Regra_ICMS RI7 on (ITI.Regra_Nao_Contribuinte = RI7.Codigo) ');
      add('where ITI.Codigo = :Codigo and ITI.Origem = :Origem and ITI.Destino = :Destino');
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Origem').Value:= CmbOrigem.Text;
      Parameters.ParamByName('Destino').Value:= CmbDestino.Text;
      open;
    end;
    
    if (ADOQuery1.IsEmpty = true) then
      begin
        Application.MessageBox('Dados não encontrados para a Origem/Destino selecionado', 'Dados não encontrados', MB_OK+MB_ICONHAND);
        tem_origem_destino:= false;
        abort;
      end
      else
      begin
        tem_origem_destino:= true;
        EdtCodigo_Regra_ICMS_EN_Entrada.Text:= ADOQuery1Entrada_Regra_EN.AsString;
        EdtRegra_ICMS_EN_Entrada.Text:= ADOQuery1Descricao.AsString;

        EdtCodigo_Regra_ICMS_EPP_Entrada.Text:= ADOQuery1Entrada_Regra_EPP.AsString;
        EdtRegra_ICMS_EPP_Entrada.Text:= ADOQuery1Descricao_1.AsString;
      
        EdtCodigo_Regra_ICMS_ME_Entrada.Text:= ADOQuery1Entrada_Regra_ME.AsString;
        EdtRegra_ICMS_ME_Entrada.Text:= ADOQuery1Descricao_2.AsString;

        EdtCodigo_Regra_ICMS_EN_Saida.Text:= ADOQuery1Saida_Regra_EN.AsString;
        EdtRegra_ICMS_EN_Saida.Text:= ADOQuery1Descricao_3.AsString;

        EdtCodigo_Regra_ICMS_EPP_Saida.Text:= ADOQuery1Saida_Regra_EPP.AsString;
        EdtRegra_ICMS_EPP_Saida.Text:= ADOQuery1Descricao_4.AsString;

        EdtCodigo_Regra_ICMS_ME_Saida.Text:= ADOQuery1Saida_Regra_ME.AsString;
        EdtRegra_ICMS_ME_Saida.Text:= ADOQuery1Descricao_5.AsString;

        EdtCodigo_Regra_ICMS_Nao_Contribuinte.Text:= ADOQuery1Regra_Nao_Contribuinte.AsString;
        EdtRegra_ICMS_Nao_Contribuinte.Text:= ADOQuery1Descricao_6.AsString;

        BBtnSalvar_Itens.Enabled:= true;
        BBtnExcluir_Item.Enabled:= true;
      end;
  end;

end;

function TFrmTratamento_ICMS.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if MEdtData_Cadastro.Text = '  /  /    ' then
      begin
        Mensagem_Falta_Dados;
        MEdtData_Cadastro.SetFocus;
        abort;
      end;

      Confira:= true;
end;

function TFrmTratamento_ICMS.Confira_Itens: boolean;
begin
    Confira_Itens:= false;
    if CmbOrigem.Text = '' then
      begin
        Mensagem_Falta_Dados;
        CmbOrigem.SetFocus;
        abort;
      end;

    if CmbDestino.Text = '' then
      begin
        Mensagem_Falta_Dados;
        CmbDestino.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EN_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EN_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EPP_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EPP_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_ME_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_ME_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EN_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EN_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EPP_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EPP_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_ME_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_ME_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_Nao_Contribuinte.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_Nao_Contribuinte.SetFocus;
        abort;
      end;

      Confira_Itens:= true;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_EntradaDblClick(
  Sender: TObject);
begin
  regra:= 1;
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Free;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 1;
    Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
    FrmChama_Regra_ICMS.ShowModal;
    FrmChama_Regra_ICMS.Free;
  end;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_SaidaDblClick(
  Sender: TObject);
begin
  regra:= 4;
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Free;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 4;
    Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
    FrmChama_Regra_ICMS.ShowModal;
    FrmChama_Regra_ICMS.Free;
  end;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_EntradaDblClick(
  Sender: TObject);
begin
  regra:= 2;
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Free;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 2;
    Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
    FrmChama_Regra_ICMS.ShowModal;
    FrmChama_Regra_ICMS.Free;
  end;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_SaidaDblClick(
  Sender: TObject);
begin
  regra:= 5;
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Free;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 5;
    Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
    FrmChama_Regra_ICMS.ShowModal;
    FrmChama_Regra_ICMS.Free;
  end;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_EntradaDblClick(
  Sender: TObject);
begin
  regra:= 3;
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Free;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 3;
    Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
    FrmChama_Regra_ICMS.ShowModal;
    FrmChama_Regra_ICMS.Free;
  end;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_SaidaDblClick(
  Sender: TObject);
begin
  regra:= 6;
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Free;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 6;
    Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
    FrmChama_Regra_ICMS.ShowModal;
    FrmChama_Regra_ICMS.Free;
  end;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_Nao_ContribuinteDblClick(
  Sender: TObject);
begin
  regra:= 7;
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Free;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 7;
    Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
    FrmChama_Regra_ICMS.ShowModal;
    FrmChama_Regra_ICMS.Free;
  end;
end;

procedure TFrmTratamento_ICMS.EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtRegra_ICMS_EN_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtRegra_ICMS_EN_SaidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtRegra_ICMS_EPP_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtRegra_ICMS_EPP_SaidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtRegra_ICMS_ME_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtRegra_ICMS_ME_SaidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.EdtRegra_ICMS_Nao_ContribuinteKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_ICMS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmTratamento_ICMS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        Fecha_Conexao;
        FreeAndNil(Conexao);
        FrmTratamento_ICMS.Free;
        FrmTratamento_ICMS:= Nil;
      end;
end;

procedure TFrmTratamento_ICMS.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmTratamento_ICMS);
  Util.Limpa_Campos(FrmTratamento_ICMS);
  Util.Desabilita_Campos(FrmTratamento_ICMS);
  Salvar_Item:= false;
  Conexao:= TADOConnection.Create(self);
  PageControl2.TabIndex:= 0;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmTratamento_ICMS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmTratamento_ICMS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;
  if (key = vk_escape) then
    close;
end;

procedure TFrmTratamento_ICMS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmTratamento_ICMS.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select max(Codigo) as Codigo from Tratamento_ICMS ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmTratamento_ICMS.Limpa_Menor;
begin
  EdtCodigo_Regra_ICMS_EN_Entrada.Clear;
  EdtCodigo_Regra_ICMS_EPP_Entrada.Clear;
  EdtCodigo_Regra_ICMS_ME_Entrada.Clear;
  EdtCodigo_Regra_ICMS_EN_Saida.Clear;
  EdtCodigo_Regra_ICMS_EPP_Saida.Clear;
  EdtCodigo_Regra_ICMS_ME_Saida.Clear;
  EdtCodigo_Regra_ICMS_Nao_Contribuinte.Clear;

  EdtRegra_ICMS_EN_Entrada.Clear;
  EdtRegra_ICMS_EPP_Entrada.Clear;
  EdtRegra_ICMS_ME_Entrada.Clear;
  EdtRegra_ICMS_EN_Saida.Clear;
  EdtRegra_ICMS_EPP_Saida.Clear;
  EdtRegra_ICMS_ME_Saida.Clear;
  EdtRegra_ICMS_Nao_Contribuinte.Clear;
end;

procedure TFrmTratamento_ICMS.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmTratamento_ICMS.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmTratamento_ICMS.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_ICMS, FrmChama_Tratamento_ICMS);
  FrmChama_Tratamento_ICMS.ShowModal;
  FrmChama_Tratamento_ICMS.Release;
end;

end.
