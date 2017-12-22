unit UTratamento_IPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmTratamento_IPI = class(TForm)
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
    Label9: TLabel;
    EdtDescricao: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    EdtRegra_IPI_EN_Entrada: TEdit;
    EdtCodigo_Regra_IPI_EN_Entrada: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    EdtRegra_IPI_EPP_Entrada: TEdit;
    EdtCodigo_Regra_IPI_EPP_Entrada: TEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    EdtRegra_IPI_ME_Entrada: TEdit;
    EdtCodigo_Regra_IPI_ME_Entrada: TEdit;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    EdtCodigo_Regra_IPI_EN_Saida: TEdit;
    EdtRegra_IPI_EN_Saida: TEdit;
    Label7: TLabel;
    EdtCodigo_Regra_IPI_EPP_Saida: TEdit;
    EdtRegra_IPI_EPP_Saida: TEdit;
    Label8: TLabel;
    EdtCodigo_Regra_IPI_ME_Saida: TEdit;
    EdtRegra_IPI_ME_Saida: TEdit;
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
    procedure EdtCodigo_Regra_IPI_EN_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_IPI_EPP_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_IPI_ME_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_IPI_EN_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_IPI_EPP_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_IPI_ME_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_IPI_Nao_ContribuinteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure BBtnSalvar_ItensClick(Sender: TObject);
    procedure BBtnExcluir_ItemClick(Sender: TObject);
    procedure CmbDestinoClick(Sender: TObject);
    procedure EdtCodigo_Regra_IPI_EN_SaidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_IPI_EN_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_IPI_EPP_SaidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_IPI_EPP_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_IPI_ME_SaidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_IPI_ME_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_IPI_EN_EntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_IPI_EN_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_IPI_EPP_EntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_IPI_EPP_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_IPI_ME_EntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRegra_IPI_ME_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Regra_IPI_EN_SaidaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_IPI_EPP_SaidaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_IPI_ME_SaidaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_IPI_EN_EntradaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_IPI_EPP_EntradaDblClick(Sender: TObject);
    procedure EdtCodigo_Regra_IPI_ME_EntradaDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Tratamento_IPI: URegistro.TTratamento_IPI;
    Itens_Tratamento_IPI: URegistro.TItens_Tratamento_IPI;
    Util: TUtil;
    Salvar_Item: boolean;
    procedure Limpa_Menor;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
    regra: integer;
  protected
    function Confira: boolean;
    function Confira_Itens: boolean;
  end;

var
  FrmTratamento_IPI: TFrmTratamento_IPI;
implementation

uses UDM, UDeclaracao, UChama_Tratamento_IPI, UChama_Regra_IPI;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmTratamento_IPI.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmTratamento_IPI);
  Util.Desabilita_Campos(FrmTratamento_IPI);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmTratamento_IPI.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Tratamento_IPI.Excluir(Tratamento_IPI);
    Itens_Tratamento_IPI.Excluir(Itens_Tratamento_IPI);
    Cria_Arquivo_Atualiza_Dados('DTIPI');
    Cria_Arquivo_Atualiza_Dados('DITIPI');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU TRATAMENTO DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmTratamento_IPI);
  end;
end;

procedure TFrmTratamento_IPI.BBtnExcluir_ItemClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Itens_Tratamento_IPI.Excluir_Item(Itens_Tratamento_IPI);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU ITEM DE TRATAMENTO DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    Limpa_Menor;
  end;
end;

procedure TFrmTratamento_IPI.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTratamento_IPI.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmTratamento_IPI);
  Util.Limpa_Campos(FrmTratamento_IPI);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  PageControl2.TabIndex:= 0;
  Salvar_Item:= false;
  Gera_Codigo;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmTratamento_IPI.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Tratamento_IPI.Inserir(Tratamento_IPI);
        Itens_Tratamento_IPI.Inserir(Itens_Tratamento_IPI);
        Cria_Arquivo_Atualiza_Dados('ITIPI');
        Cria_Arquivo_Atualiza_Dados('IITIPI');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU TRATAMENTO DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Tratamento_IPI.Alterar(Tratamento_IPI);
        Itens_Tratamento_IPI.Alterar(Itens_Tratamento_IPI);
        Cria_Arquivo_Atualiza_Dados('ATIPI');
        Cria_Arquivo_Atualiza_Dados('AITIPI');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU TRATAMENTO DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmTratamento_IPI);
    Cria_Arquivo_Atualiza_Produto;
end;

procedure TFrmTratamento_IPI.BBtnSalvar_ItensClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Deseja INSERIR um novo registro ou ALTERAR o registro selecionado?' + #10+#13 +
      'Caso queira INSERIR um novo registro, clique em SIM, caso queira apenas ALTERAR, clique em NÃO.'), 'Opção', MB_YESNO+MB_ICONQUESTION) = idyes) then
    begin
      if (Confira = true) then
      begin
        Itens_Tratamento_IPI.Inserir(Itens_Tratamento_IPI);
        Salvar_Item:= true;
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Itens_Tratamento_IPI.Alterar(Itens_Tratamento_IPI);
        Salvar_Item:= true;
      end
      else
        exit;
    end;

end;

procedure TFrmTratamento_IPI.CmbDestinoClick(Sender: TObject);
begin
  {if (CmbOrigem.Text = '') then
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
      clear;
      add('select ITI.*, RI1.Descricao, RI2.Descricao, RI3.Descricao, RI4.Descricao, RI5.Descricao, RI6.Descricao, RI7.Descricao from Tratamento_IPI TI');
      add('inner join Itens_Tratamento_IPI ITI on (TI.Codigo = ITI.Codigo)');
      add('inner join Regra_IPI RI1 on (ITI.Entrada_Regra_EN = RI1.Codigo)');
      add('inner join Regra_IPI RI2 on (ITI.Entrada_Regra_EPP = RI2.Codigo)');
      add('inner join Regra_IPI RI3 on (ITI.Entrada_Regra_ME = RI3.Codigo)');
      add('inner join Regra_IPI RI4 on (ITI.Saida_Regra_EN = RI4.Codigo)');
      add('inner join Regra_IPI RI5 on (ITI.Saida_Regra_EPP = RI5.Codigo)');
      add('inner join Regra_IPI RI6 on (ITI.Saida_Regra_ME = RI6.Codigo)');
      add('inner join Regra_IPI RI7 on (ITI.Regra_Nao_Contribuinte = RI7.Codigo) ');
      add('where ITI.Codigo = :Codigo and ITI.Origem = :Origem and ITI.Destino = :Destino');
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Origem').Value:= CmbOrigem.Text;
      Parameters.ParamByName('Destino').Value:= CmbDestino.Text;
      open;
    end;
    
    if (ADOQuery1.IsEmpty = true) then
      begin
        Application.MessageBox('Dados não encontrados para a Origem/Destino selecionado', 'Dados não encontrados', MB_OK+MB_ICONHAND);
        //BBtnSalvar_Itens.Enabled:= false;
        //BBtnExcluir_Item.Enabled:= false;
        abort;    
      end
      else
      begin
        EdtCodigo_Regra_IPI_EN_Entrada.Text:= ADOQuery1Entrada_Regra_EN.AsString;
        EdtRegra_IPI_EN_Entrada.Text:= ADOQuery1Descricao.AsString;

        EdtCodigo_Regra_IPI_EPP_Entrada.Text:= ADOQuery1Entrada_Regra_EPP.AsString;
        EdtRegra_IPI_EPP_Entrada.Text:= ADOQuery1Descricao_1.AsString;

        EdtCodigo_Regra_IPI_ME_Entrada.Text:= ADOQuery1Entrada_Regra_ME.AsString;
        EdtRegra_IPI_ME_Entrada.Text:= ADOQuery1Descricao_2.AsString;

        EdtCodigo_Regra_IPI_EN_Saida.Text:= ADOQuery1Saida_Regra_EN.AsString;
        EdtRegra_IPI_EN_Saida.Text:= ADOQuery1Descricao_3.AsString;

        EdtCodigo_Regra_IPI_EPP_Saida.Text:= ADOQuery1Saida_Regra_EPP.AsString;
        EdtRegra_IPI_EPP_Saida.Text:= ADOQuery1Descricao_4.AsString;

        EdtCodigo_Regra_IPI_ME_Saida.Text:= ADOQuery1Saida_Regra_ME.AsString;
        EdtRegra_IPI_ME_Saida.Text:= ADOQuery1Descricao_5.AsString;

        //EdtCodigo_Regra_IPI_Nao_Contribuinte.Text:= ADOQuery1Regra_Nao_Contribuinte.AsString;
        //EdtRegra_IPI_Nao_Contribuinte.Text:= ADOQuery1Descricao_6.AsString;

        //BBtnSalvar_Itens.Enabled:= true;
        //BBtnExcluir_Item.Enabled:= true;
      end;
  end;}

end;

function TFrmTratamento_IPI.Confira: boolean;
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

function TFrmTratamento_IPI.Confira_Itens: boolean;
begin
    Confira_Itens:= false;
    {if CmbOrigem.Text = '' then
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
      end;}

    if EdtCodigo_Regra_IPI_EN_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_IPI_EN_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_IPI_EPP_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_IPI_EPP_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_IPI_ME_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_IPI_ME_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_IPI_EN_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_IPI_EN_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_IPI_EPP_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_IPI_EPP_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_IPI_ME_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_IPI_ME_Saida.SetFocus;
        abort;
      end;

    {if EdtCodigo_Regra_IPI_Nao_Contribuinte.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_IPI_Nao_Contribuinte.SetFocus;
        abort;
      end;}

      Confira_Itens:= true;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_EntradaDblClick(
  Sender: TObject);
begin
  regra:= 1;
  Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
  FrmChama_Regra_IPI.ShowModal;
  FrmChama_Regra_IPI.Free;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 1;
    Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
    FrmChama_Regra_IPI.ShowModal;
    FrmChama_Regra_IPI.Free;
  end;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_SaidaDblClick(
  Sender: TObject);
begin
  regra:= 4;
  Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
  FrmChama_Regra_IPI.ShowModal;
  FrmChama_Regra_IPI.Free;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 4;
    Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
    FrmChama_Regra_IPI.ShowModal;
    FrmChama_Regra_IPI.Free;
  end;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_EntradaDblClick(
  Sender: TObject);
begin
  regra:= 2;
  Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
  FrmChama_Regra_IPI.ShowModal;
  FrmChama_Regra_IPI.Free;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 2;
    Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
    FrmChama_Regra_IPI.ShowModal;
    FrmChama_Regra_IPI.Free;
  end;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_SaidaDblClick(
  Sender: TObject);
begin
  regra:= 5;
  Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
  FrmChama_Regra_IPI.ShowModal;
  FrmChama_Regra_IPI.Free;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 5;
    Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
    FrmChama_Regra_IPI.ShowModal;
    FrmChama_Regra_IPI.Free;
  end;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_EntradaDblClick(
  Sender: TObject);
begin
  regra:= 3;
  Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
  FrmChama_Regra_IPI.ShowModal;
  FrmChama_Regra_IPI.Free;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 3;
    Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
    FrmChama_Regra_IPI.ShowModal;
    FrmChama_Regra_IPI.Free;
  end;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_SaidaDblClick(
  Sender: TObject);
begin
  regra:= 6;
  Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
  FrmChama_Regra_IPI.ShowModal;
  FrmChama_Regra_IPI.Free;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 6;
    Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
    FrmChama_Regra_IPI.ShowModal;
    FrmChama_Regra_IPI.Free;
  end;
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtCodigo_Regra_IPI_Nao_ContribuinteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 7;
    Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
    FrmChama_Regra_IPI.ShowModal;
    FrmChama_Regra_IPI.Free;
  end;
end;

procedure TFrmTratamento_IPI.EdtRegra_IPI_EN_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtRegra_IPI_EN_SaidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtRegra_IPI_EPP_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtRegra_IPI_EPP_SaidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtRegra_IPI_ME_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.EdtRegra_IPI_ME_SaidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTratamento_IPI.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmTratamento_IPI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmTratamento_IPI.Free;
        FrmTratamento_IPI:= Nil;
      end;
end;

procedure TFrmTratamento_IPI.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmTratamento_IPI);
  Util.Limpa_Campos(FrmTratamento_IPI);
  Util.Desabilita_Campos(FrmTratamento_IPI);
  Salvar_Item:= false;
  PageControl2.TabIndex:= 0;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmTratamento_IPI.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmTratamento_IPI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;
  if (key = vk_escape) then
    close;
end;

procedure TFrmTratamento_IPI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmTratamento_IPI.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Tratamento_IPI ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmTratamento_IPI.Limpa_Menor;
begin
  EdtCodigo_Regra_IPI_EN_Entrada.Clear;
  EdtCodigo_Regra_IPI_EPP_Entrada.Clear;
  EdtCodigo_Regra_IPI_ME_Entrada.Clear;
  EdtCodigo_Regra_IPI_EN_Saida.Clear;
  EdtCodigo_Regra_IPI_EPP_Saida.Clear;
  EdtCodigo_Regra_IPI_ME_Saida.Clear;
  //EdtCodigo_Regra_IPI_Nao_Contribuinte.Clear;

  EdtRegra_IPI_EN_Entrada.Clear;
  EdtRegra_IPI_EPP_Entrada.Clear;
  EdtRegra_IPI_ME_Entrada.Clear;
  EdtRegra_IPI_EN_Saida.Clear;
  EdtRegra_IPI_EPP_Saida.Clear;
  EdtRegra_IPI_ME_Saida.Clear;
  //EdtRegra_IPI_Nao_Contribuinte.Clear;
end;

procedure TFrmTratamento_IPI.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmTratamento_IPI.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmTratamento_IPI.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_IPI, FrmChama_Tratamento_IPI);
  FrmChama_Tratamento_IPI.ShowModal;
  FrmChama_Tratamento_IPI.Release;
end;

end.
