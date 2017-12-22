unit UCadastro_Grupo_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Grupo_Produto = class(TForm)
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
    LblMarca: TLabel;
    EdtDescricao: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtCodigo_Grupo_ICMS: TEdit;
    EdtGrupo_ICMS: TEdit;
    Label2: TLabel;
    EdtCodigo_Grupo_IPI: TEdit;
    EdtGrupo_IPI: TEdit;
    Label3: TLabel;
    EdtCodigo_Grupo_PIS: TEdit;
    EdtGrupo_PIS: TEdit;
    Label4: TLabel;
    EdtCodigo_Grupo_COFINS: TEdit;
    EdtGrupo_COFINS: TEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Valor_Compra: TFloatField;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    EdtPercentual_Vista: TEdit;
    EdtPercentual_Prazo: TEdit;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    EdtPercentual_Desconto_Prazo: TEdit;
    EdtPercentual_Desconto_Vista: TEdit;
    Label10: TLabel;
    EdtCodigo_Sub_Grupo: TEdit;
    EdtSub: TEdit;
    Label11: TLabel;
    EdtSub_Grupo: TEdit;
    ADOQuery1Preco_Vista: TFloatField;
    ADOQuery1Preco_Prazo: TFloatField;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    EdtPercentual_Comissao_Prazo: TEdit;
    EdtPercentual_Comissao_Vista: TEdit;
    ADOQuery1Ultima_Compra: TDateTimeField;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    EdtCodigo_Grupo_Destino: TEdit;
    EdtGrupo_Destino: TEdit;
    GroupBox5: TGroupBox;
    CBAtualiza_Preco: TCheckBox;
    RGTipo_Calculo: TRadioGroup;
    CBAtualiza_Desconto: TCheckBox;
    RGItens: TRadioGroup;
    CBAtualiza_Comissao: TCheckBox;
    RGChamar_Produtos: TRadioGroup;
    RGAumentar: TRadioGroup;
    BBtnInativar: TButton;
    BtnTransferir: TButton;
    BBtnAtualizar_Preco: TButton;
    BBtnNovo: TToolButton;
    RGPesquisar_Por: TRadioGroup;
    Label14: TLabel;
    Label15: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
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
    procedure EdtGrupo_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_ICMSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtGrupo_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupo_PISKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupo_COFINSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_PISKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_COFINSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_IPIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Grupo_PISKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Grupo_COFINSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Grupo_ICMSDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_IPIDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_PISDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_COFINSDblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_Grupo_DestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Grupo_DestinoDblClick(Sender: TObject);
    procedure BtnTransferirClick(Sender: TObject);
    procedure CBAtualiza_PrecoClick(Sender: TObject);
    procedure EdtCodigo_Sub_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Sub_GrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Sub_GrupoDblClick(Sender: TObject);
    procedure EdtDescricaoExit(Sender: TObject);
    procedure EdtSub_GrupoEnter(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure BBtnAtualizar_PrecoClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_FinalEnter(Sender: TObject);
    procedure MEdtData_InicialEnter(Sender: TObject);
    procedure ADOQuery1Ultima_CompraGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure EdtPercentual_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPercentual_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPercentual_Desconto_VistaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtPercentual_Desconto_PrazoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtPercentual_Comissao_VistaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtPercentual_Comissao_PrazoKeyPress(Sender: TObject;
      var Key: Char);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Grupo_Produto: URegistro.TGrupo_Produto;
    Util: TUtil;

    procedure Atualiza_Tributacao_ICMS;
    procedure Atualiza_Tributacao_IPI;
    procedure Atualiza_Tributacao_PIS;
    procedure Atualiza_Tributacao_COFINS;
    procedure Atualiza_Grupo;
    procedure UpdateGrupo(Produto: Integer);
    procedure Atualiza_Preco;
    procedure Atualiza_Desconto;
    procedure Verifica_Permissao_Atualiza_Preco;
    procedure Gera_Codigo;
    procedure Atualiza_Comissao;
    procedure Atualiza_Itens_Tabela;
  public

    ativo, achei: boolean;
    grupo, codigo_icms, codigo_ipi, codigo_pis, codigo_cofins, codigo_pai: integer;

    descricao_grupo, codigo_grupo: AnsiString;

    procedure Pega_Produto_Grupo;
    procedure Inicia_Itens;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Grupo_Produto: TFrmCadastro_Grupo_Produto;
implementation

uses UDM, UChama_Grupo_Produto, UDeclaracao, UChama_Tratamento_COFINS,
  UChama_Tratamento_ICMS, UChama_Tratamento_IPI, UChama_Tratamento_PIS;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Grupo_Produto.Atualiza_Tributacao_COFINS;
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
      add('update Produto set Codigo_Grupo_Tributacao_COFINS = :Codigo_Grupo');
      add('where Codigo_Grupo = :Grupo');
      Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(EdtCodigo_Grupo_COFINS.Text);
      Parameters.ParamByName('Grupo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Tributacao_ICMS;
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
      add('update Produto set Codigo_Grupo_Tributacao = :Codigo_Grupo');
      add('where Codigo_Grupo = :Grupo');
      Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(EdtCodigo_Grupo_ICMS.Text);
      Parameters.ParamByName('Grupo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Tributacao_IPI;
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
      add('update Produto set Codigo_Grupo_Tributacao_IPI = :Codigo_Grupo');
      add('where Codigo_Grupo = :Grupo');
      Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(EdtCodigo_Grupo_IPI.Text);
      Parameters.ParamByName('Grupo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Tributacao_PIS;
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
      add('update Produto set Codigo_Grupo_Tributacao_PIS = :Codigo_Grupo');
      add('where Codigo_Grupo = :Grupo');
      Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(EdtCodigo_Grupo_PIS.Text);
      Parameters.ParamByName('Grupo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.BBtnAtualizar_PrecoClick(Sender: TObject);
begin
  if (CBAtualiza_Preco.Checked = false) and (CBAtualiza_Desconto.Checked = false) and (CBAtualiza_Comissao.Checked = false) then
  begin
    Application.MessageBox('Por favor, selecione pelo menos uma opção no campo Atualizações para continuar', 'Dados não encontrados', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (RGItens.ItemIndex = 1) then
  begin
    if (DBGrid1.SelectedRows.Count = 0) then
    begin
      Application.MessageBox('É necessário informar pelo menos um item', 'Dados não encontrados', MB_OK+MB_ICONHAND);
      abort;
    end;
  end;

  Atualiza_Itens_Tabela;
end;

procedure TFrmCadastro_Grupo_Produto.BBtnCancelarClick(Sender: TObject);
begin
  Inicia_Itens;
  Util.Limpa_Campos(FrmCadastro_Grupo_Produto);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Produto);
  Inicia_Itens;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Grupo_Produto.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Grupo_Produto.Excluir(Grupo_Produto);
    Cria_Arquivo_Atualiza_Dados('DGProd');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU GRUPO DE PRODUTO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Produto);
  END;
end;

procedure TFrmCadastro_Grupo_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Grupo_Produto.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Grupo_Produto);
  Util.Limpa_Campos(FrmCadastro_Grupo_Produto);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  Inicia_Itens;
  PageControl1.TabIndex:= 0;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtCodigo.Text:= IntToStr(Gera_Codigo_Indetity('Grupo_Produto'));
  EdtDescricao.SetFocus;
end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Preco;
var
  qAux: TADOQuery;
  valor_vista, valor_prazo, perc_vista, perc_prazo, valor1, valor2, valor3, calculo_perc: double;
begin

  qAux:= TADOQuery.Create(self);
  try
    if (RGItens.ItemIndex = 1) then
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Itens_Tabela_Preco set ');
          add('Preco_Vista = :Preco_Vista, ');
          add('Preco_Prazo = :Preco_Prazo,');
          add('Percentual_Desconto_Vista = :Percentual_Desconto_Vista, ');
          add('Percentual_Desconto_Prazo = :Percentual_Desconto_Prazo');
          //add('Percentual_Lucro_Vista = :Percentual_Lucro_Vista, ');
          //add('Percentual_Lucro_Prazo = :Percentual_Lucro_Prazo');
          add('from Itens_Tabela_Preco ITP');
          add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');

          if (RGAumentar.ItemIndex = 0) then
          begin
            valor1:= ADOQuery1Valor_Compra.AsFloat;
            valor3:= ADOQuery1Valor_Compra.AsFloat;
          end
          else
          begin
            valor1:= ADOQuery1Preco_Vista.AsFloat;
            valor3:= ADOQuery1Preco_Prazo.AsFloat;
          end;

          if (RGTipo_Calculo.ItemIndex = 0) then
          begin
            perc_vista:= StrToFloat(EdtPercentual_Vista.Text) / 100;
            valor2:= valor1 * perc_vista;
            valor_vista:= valor1 + valor2;

            valor2:= 0;

            perc_prazo:= StrToFloat(EdtPercentual_Prazo.Text) / 100;
            valor2:= valor3 * perc_prazo;
            valor_prazo:= valor3 + valor2;
          end
          else
          begin
            calculo_perc:= (100 - StrToFloat(EdtPercentual_Vista.Text)) / 100;
            valor_vista:= valor1 / calculo_perc;

            calculo_perc:= 0;

            calculo_perc:= (100 - StrToFloat(EdtPercentual_Prazo.Text)) / 100;
            valor_prazo:= valor3 / calculo_perc;
          end;

          Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery1Codigo.AsInteger;
          Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_ativo;
          Parameters.ParamByName('Preco_Vista').Value:= valor_vista;
          Parameters.ParamByName('Preco_Prazo').Value:= valor_prazo;
          Parameters.ParamByName('Percentual_Desconto_Vista').Value:= StrToFloat(EdtPercentual_Desconto_Vista.Text);
          Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= StrToFloat(EdtPercentual_Desconto_Prazo.Text);
          //Parameters.ParamByName('Percentual_Lucro_Vista').Value:= StrToFloat(EdtPercentual_Vista.Text);
          //Parameters.ParamByName('Percentual_Lucro_Prazo').Value:= StrToFloat(EdtPercentual_Prazo.Text);
          ExecSQL;
        end;
      end;
    end
    else
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Itens_Tabela_Preco set ');
        add('Preco_Vista = :Preco_Vista, ');
        add('Preco_Prazo = :Preco_Prazo,');
        add('Percentual_Desconto_Vista = :Percentual_Desconto_Vista, ');
        add('Percentual_Desconto_Prazo = :Percentual_Desconto_Prazo');
        //add('Percentual_Lucro_Vista = :Percentual_Lucro_Vista, ');
        //add('Percentual_Lucro_Prazo = :Percentual_Lucro_Prazo');
        add('from Itens_Tabela_Preco ITP');
        add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');

        if (RGAumentar.ItemIndex = 0) then
        begin
          valor1:= ADOQuery1Valor_Compra.AsFloat;
          valor3:= ADOQuery1Valor_Compra.AsFloat;
        end
        else
        begin
          valor1:= ADOQuery1Preco_Vista.AsFloat;
          valor3:= ADOQuery1Preco_Prazo.AsFloat;
        end;

        if (RGTipo_Calculo.ItemIndex = 0) then
        begin
          perc_vista:= StrToFloat(EdtPercentual_Vista.Text) / 100;
          valor2:= valor1 * perc_vista;
          valor_vista:= valor1 + valor2;

          valor2:= 0;

          perc_prazo:= StrToFloat(EdtPercentual_Prazo.Text) / 100;
          valor2:= valor3 * perc_prazo;
          valor_prazo:= valor3 + valor2;
        end
        else
        begin
          calculo_perc:= (100 - StrToFloat(EdtPercentual_Vista.Text)) / 100;
          valor_vista:= valor1 / calculo_perc;

          calculo_perc:= 0;

          calculo_perc:= (100 - StrToFloat(EdtPercentual_Prazo.Text)) / 100;
          valor_prazo:= valor3 / calculo_perc;
        end;

        Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery1Codigo.AsInteger;
        Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_ativo;
        Parameters.ParamByName('Preco_Vista').Value:= valor_vista;
        Parameters.ParamByName('Preco_Prazo').Value:= valor_prazo;
        Parameters.ParamByName('Percentual_Desconto_Vista').Value:= StrToFloat(EdtPercentual_Desconto_Vista.Text);
        Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= StrToFloat(EdtPercentual_Desconto_Prazo.Text);
        //Parameters.ParamByName('Percentual_Lucro_Vista').Value:= StrToFloat(EdtPercentual_Vista.Text);
        //Parameters.ParamByName('Percentual_Lucro_Prazo').Value:= StrToFloat(EdtPercentual_Prazo.Text);
        ExecSQL;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Grupo_Produto ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Grupo_Produto.Inserir(Grupo_Produto);
        Cria_Arquivo_Atualiza_Dados('IGProd');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU GRUPO DE PRODUTO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Grupo_Produto.Alterar(Grupo_Produto);
        Cria_Arquivo_Atualiza_Dados('AGProd');

        UDeclaracao.Insere_Historico(usuario, 'ALTEROU GRUPO DE PRODUTO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;

    if (EdtCodigo_Grupo_ICMS.Text <> '') and (EdtCodigo_Grupo_ICMS.Text <> '0') and (EdtCodigo.Text <> '') then
      Atualiza_Tributacao_ICMS;

    if (EdtCodigo_Grupo_IPI.Text <> '') and (EdtCodigo_Grupo_IPI.Text <> '0') and (EdtCodigo.Text <> '') then
      Atualiza_Tributacao_IPI;

    if (EdtCodigo_Grupo_PIS.Text <> '') and (EdtCodigo_Grupo_PIS.Text <> '0') and (EdtCodigo.Text <> '') then
      Atualiza_Tributacao_PIS;

    if (EdtCodigo_Grupo_COFINS.Text <> '') and (EdtCodigo_Grupo_COFINS.Text <> '0') and (EdtCodigo.Text <> '') then
      Atualiza_Tributacao_COFINS;


    Cria_Arquivo_Atualiza_Dados('AProd');

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Produto);
end;

procedure TFrmCadastro_Grupo_Produto.BtnTransferirClick(Sender: TObject);
begin
  Atualiza_Grupo;
  Pega_Produto_Grupo;
end;

procedure TFrmCadastro_Grupo_Produto.CBAtualiza_PrecoClick(Sender: TObject);
begin
  if (CBAtualiza_Preco.Checked) then
  begin
    RGTipo_Calculo.Visible:= true
  end
  else
  begin
    RGTipo_Calculo.Visible:= false;
  end;
end;

function TFrmCadastro_Grupo_Produto.Confira: boolean;
begin
    Confira:= false;

    if EdtDescricao.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtDescricao.SetFocus;
      abort;
    end;

    if EdtPercentual_Vista.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Vista.SetFocus;
      abort;
    end;

    if EdtPercentual_Prazo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Prazo.SetFocus;
      abort;
    end;

    if EdtPercentual_Desconto_Vista.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Desconto_Vista.SetFocus;
      abort;
    end;

    if EdtPercentual_Desconto_Prazo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Desconto_Prazo.SetFocus;
      abort;
    end;

    if EdtPercentual_Comissao_Prazo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Comissao_Prazo.SetFocus;
      abort;
    end;

    if EdtPercentual_Comissao_Vista.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Comissao_Vista.SetFocus;
      abort;
    end;

    Confira:= true;
end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Desconto;
var
  qAux: TADOQuery;
  valor_vista, valor_prazo, perc_vista, perc_prazo, valor1, valor2, calculo_perc: double;
begin

  qAux:= TADOQuery.Create(self);
  try
    if (RGItens.ItemIndex = 1) then
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Itens_Tabela_Preco set ');
          add('Percentual_Desconto_Vista = :Percentual_Desconto_Vista, ');
          add('Percentual_Desconto_Prazo = :Percentual_Desconto_Prazo');
          add('from Itens_Tabela_Preco ITP');
          add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');

          Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery1Codigo.AsInteger;
          Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_ativo;
          Parameters.ParamByName('Percentual_Desconto_Vista').Value:= StrToFloat(EdtPercentual_Desconto_Vista.Text);
          Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= StrToFloat(EdtPercentual_Desconto_Prazo.Text);
          ExecSQL;
        end;
      end;
    end
    else
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Itens_Tabela_Preco set ');
        add('Percentual_Desconto_Vista = :Percentual_Desconto_Vista, ');
        add('Percentual_Desconto_Prazo = :Percentual_Desconto_Prazo');
        add('from Itens_Tabela_Preco ITP');
        add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');

        Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery1Codigo.AsInteger;
        Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_ativo;
        Parameters.ParamByName('Percentual_Desconto_Vista').Value:= StrToFloat(EdtPercentual_Desconto_Vista.Text);
        Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= StrToFloat(EdtPercentual_Desconto_Prazo.Text);
        ExecSQL;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.ADOQuery1Ultima_CompraGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;

end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Comissao;
var
  qAux: TADOQuery;
  valor_vista, valor_prazo, perc_vista, perc_prazo, valor1, valor2, calculo_perc: double;
begin

  qAux:= TADOQuery.Create(self);
  try
    if (RGItens.ItemIndex = 1) then
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Itens_Tabela_Preco set ');
          add('Percentual_Comissao_Vista = :Percentual_Comissao_Vista, ');
          add('Percentual_Comissao_Prazo = :Percentual_Comissao_Prazo');
          add('from Itens_Tabela_Preco ITP');
          add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');

          Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery1Codigo.AsInteger;
          Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_ativo;
          Parameters.ParamByName('Percentual_Comissao_Vista').Value:= StrToFloat(EdtPercentual_Comissao_Vista.Text);
          Parameters.ParamByName('Percentual_Comissao_Prazo').Value:= StrToFloat(EdtPercentual_Comissao_Prazo.Text);
          ExecSQL;
        end;
      end;
    end
    else
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Itens_Tabela_Preco set ');
        add('Percentual_Comissao_Vista = :Percentual_Comissao_Vista, ');
        add('Percentual_Comissao_Prazo = :Percentual_Comissao_Prazo');
        add('from Itens_Tabela_Preco ITP');
        add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');

        Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery1Codigo.AsInteger;
        Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_ativo;
        Parameters.ParamByName('Percentual_Comissao_Vista').Value:= StrToFloat(EdtPercentual_Comissao_Vista.Text);
        Parameters.ParamByName('Percentual_Comissao_Prazo').Value:= StrToFloat(EdtPercentual_Comissao_Prazo.Text);
        ExecSQL;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Grupo;
begin
  if (EdtCodigo_Grupo_Destino.Text = '') then
  begin
    Application.MessageBox('Informe pelo menos um grupo, para transferir', 'Grupo não encontrado', MB_OK+MB_ICONHAND);
    EdtCodigo_Grupo_Destino.SetFocus;
    abort;
  end;

  if (Application.MessageBox('Confirma a transferência dos produtos selecionados para o novo grupo?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = IDYES then
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
    Processo_Concluido;
  end;
end;

procedure TFrmCadastro_Grupo_Produto.Atualiza_Itens_Tabela;
begin
  if (CBAtualiza_Preco.Checked) or (CBAtualiza_Desconto.Checked) or (CBAtualiza_Comissao.Checked) then
  begin
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      if (RGItens.ItemIndex = 1) then
      begin
        if (DBGrid1.SelectedRows.CurrentRowSelected) then
        begin
          if (CBAtualiza_Preco.Checked) then
          begin
            Atualiza_Preco;
          end;

          if (CBAtualiza_Desconto.Checked) then
          begin
            Atualiza_Desconto;
          end;

          if (CBAtualiza_Comissao.Checked) then
          begin
            Atualiza_Comissao;
          end;
        end;
      end
      else
      begin
        if (CBAtualiza_Preco.Checked) then
        begin
          Atualiza_Preco;
        end;

        if (CBAtualiza_Desconto.Checked) then
        begin
          Atualiza_Desconto;
        end;

        if (CBAtualiza_Comissao.Checked) then
        begin
          Atualiza_Comissao;
        end;
      end;

      ADOQuery1.Next;
    end;

    Cria_Arquivo_Atualiza_Dados('AITPr');
    Cria_Arquivo_Atualiza_Dados('AProd');
    //Sleep(2000);
    Processo_Concluido;
    Pega_Produto_Grupo;
  end;

end;

procedure TFrmCadastro_Grupo_Produto.UpdateGrupo(Produto: Integer);
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
      add('update Produto set Codigo_Grupo = :Codigo_Grupo, ');
      add('Codigo_Grupo_Tributacao = :Codigo_Grupo_Tributacao,');
      add('Codigo_Grupo_Tributacao_IPI = :Codigo_Grupo_Tributacao_IPI,');
      add('Codigo_Grupo_Tributacao_PIS = :Codigo_Grupo_Tributacao_PIS,');
      add('Codigo_Grupo_Tributacao_COFINS = :Codigo_Grupo_Tributacao_COFINS');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Produto;
      Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(EdtCodigo_Grupo_Destino.Text);
      Parameters.ParamByName('Codigo_Grupo_Tributacao').Value:= codigo_icms;
      Parameters.ParamByName('Codigo_Grupo_Tributacao_IPI').Value:= codigo_ipi;
      Parameters.ParamByName('Codigo_Grupo_Tributacao_PIS').Value:= codigo_pis;
      Parameters.ParamByName('Codigo_Grupo_Tributacao_COFINS').Value:= codigo_cofins;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('update Produto set Codigo_Grupo = :Codigo_Grupo, ');
      add('Codigo_Grupo_Tributacao = :Codigo_Grupo_Tributacao,');
      add('Codigo_Grupo_Tributacao_IPI = :Codigo_Grupo_Tributacao_IPI,');
      add('Codigo_Grupo_Tributacao_PIS = :Codigo_Grupo_Tributacao_PIS,');
      add('Codigo_Grupo_Tributacao_COFINS = :Codigo_Grupo_Tributacao_COFINS');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Produto;
      Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(EdtCodigo_Grupo_Destino.Text);
      Parameters.ParamByName('Codigo_Grupo_Tributacao').Value:= codigo_icms;
      Parameters.ParamByName('Codigo_Grupo_Tributacao_IPI').Value:= codigo_ipi;
      Parameters.ParamByName('Codigo_Grupo_Tributacao_PIS').Value:= codigo_pis;
      Parameters.ParamByName('Codigo_Grupo_Tributacao_COFINS').Value:= codigo_cofins;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Produto.Verifica_Permissao_Atualiza_Preco;
begin

end;

procedure TFrmCadastro_Grupo_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_COFINSDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_COFINS, FrmChama_Tratamento_COFINS);
  FrmChama_Tratamento_COFINS.ShowModal;
  FrmChama_Tratamento_COFINS.Free;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_COFINSKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tratamento_COFINS, FrmChama_Tratamento_COFINS);
      FrmChama_Tratamento_COFINS.ShowModal;
      FrmChama_Tratamento_COFINS.Free;
    end;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_COFINSKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_DestinoDblClick(
  Sender: TObject);
begin
  grupo:= 1;
  Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
  FrmChama_Grupo_Produto.ShowModal;
  FrmChama_Grupo_Produto.Release;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_DestinoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    grupo:= 1;
    Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
    FrmChama_Grupo_Produto.ShowModal;
    FrmChama_Grupo_Produto.Release;
  end;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_ICMSDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_ICMS, FrmChama_Tratamento_ICMS);
  FrmChama_Tratamento_ICMS.ShowModal;
  FrmChama_Tratamento_ICMS.Free;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_ICMSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tratamento_ICMS, FrmChama_Tratamento_ICMS);
      FrmChama_Tratamento_ICMS.ShowModal;
      FrmChama_Tratamento_ICMS.Free;
    end;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_IPIDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_IPI, FrmChama_Tratamento_IPI);
  FrmChama_Tratamento_IPI.ShowModal;
  FrmChama_Tratamento_IPI.Free;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_IPIKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tratamento_IPI, FrmChama_Tratamento_IPI);
      FrmChama_Tratamento_IPI.ShowModal;
      FrmChama_Tratamento_IPI.Free;
    end;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_IPIKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_PISDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_PIS, FrmChama_Tratamento_PIS);
  FrmChama_Tratamento_PIS.ShowModal;
  FrmChama_Tratamento_PIS.Free;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_PISKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tratamento_PIS, FrmChama_Tratamento_PIS);
      FrmChama_Tratamento_PIS.ShowModal;
      FrmChama_Tratamento_PIS.Free;
    end;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Grupo_PISKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Sub_GrupoDblClick(
  Sender: TObject);
begin
  grupo:= 2;
  Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
  FrmChama_Grupo_Produto.ShowModal;
  FrmChama_Grupo_Produto.Free;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Sub_GrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      grupo:= 2;
      Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
      FrmChama_Grupo_Produto.ShowModal;
      FrmChama_Grupo_Produto.Free;
    end;
end;

procedure TFrmCadastro_Grupo_Produto.EdtCodigo_Sub_GrupoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtConsultaChange(Sender: TObject);
begin
  if (achei = true) then
    Pega_Produto_Grupo;
  //Consulta.Chama_Produto_Grupo(EdtConsulta.Text);
end;

procedure TFrmCadastro_Grupo_Produto.EdtGrupo_COFINSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtGrupo_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtGrupo_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtGrupo_PISKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtPercentual_Comissao_PrazoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtPercentual_Comissao_VistaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtPercentual_Desconto_PrazoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtPercentual_Desconto_VistaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtPercentual_PrazoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtPercentual_VistaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Grupo_Produto.EdtSub_GrupoEnter(Sender: TObject);
begin
  if (achei = false) then
    EdtSub_Grupo.Text:= EdtCodigo.Text;

end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Grupo_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Grupo_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Grupo_Produto.Free;
        FrmCadastro_Grupo_Produto:= Nil;
      end;
end;

procedure TFrmCadastro_Grupo_Produto.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Grupo_Produto);
  Util.Limpa_Campos(FrmCadastro_Grupo_Produto);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Produto);
  PageControl1.TabIndex:= 0;
  Inicia_Itens;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Grupo_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Grupo_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Grupo_Produto.Inicia_Itens;
begin
  achei:= false;
  EdtPercentual_Vista.Text:= '0,00';
  EdtPercentual_Prazo.Text:= '0,00';
  EdtPercentual_Desconto_Vista.Text:= '0,00';
  EdtPercentual_Desconto_Prazo.Text:= '0,00';
  EdtPercentual_Comissao_Prazo.Text:= '0,00';
  EdtPercentual_Comissao_Vista.Text:= '0,00';
  EdtCodigo_Grupo_Destino.Clear;
  EdtGrupo_Destino.Clear;
  CBAtualiza_Preco.Checked:= false;
  CBAtualiza_Desconto.Checked:= false;
  CBAtualiza_Comissao.Checked:= false;
  RGTipo_Calculo.Visible:= false;
  ADOQuery1.Close;
  codigo_icms:= 0;
  codigo_ipi:= 0;
  codigo_pis:= 0;
  codigo_cofins:= 0;
  codigo_pai:= 0;
end;

procedure TFrmCadastro_Grupo_Produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Grupo_Produto.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Grupo_Produto.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Grupo_Produto.MEdtData_FinalEnter(Sender: TObject);
begin
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Grupo_Produto.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
  if (achei = true) then
    Pega_Produto_Grupo;
end;

procedure TFrmCadastro_Grupo_Produto.MEdtData_InicialEnter(Sender: TObject);
begin
  MEdtData_Inicial.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Grupo_Produto.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

procedure TFrmCadastro_Grupo_Produto.Pega_Produto_Grupo;
begin
  if (RGPesquisar_Por.ItemIndex = 2) then
  begin
    if (MEdtData_Inicial.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Inicial.SetFocus;
      abort;
    end;

    if (MEdtData_Final.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Final.SetFocus;
      abort;
    end;
  end;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Ultima_Compra, ITP.Preco_Vista, ITP.Preco_Prazo from Produto P');
    add('inner join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto and ITP.Codigo = :Tabela)');
    add('left join Grupo_Produto GP on(P.Codigo_Grupo = GP.Codigo)');

    if (RGChamar_Produtos.ItemIndex = 0) then
    begin
      case RGPesquisar_Por.ItemIndex of
        0: add('where P.Codigo_Grupo = :Grupo and P.Codigo like '''+ EdtConsulta.Text +'%'' order by P.Descricao');
        1: add('where P.Codigo_Grupo = :Grupo and P.Descricao like '''+ EdtConsulta.Text +'%'' order by P.Descricao');
        2: add('where P.Codigo_Grupo = :Grupo and P.Ultima_Compra between :DI and :DF order by P.Descricao');
      end;

      Parameters.ParamByName('Grupo').Value:= StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_padrao;
    end
    else
    begin
      case RGPesquisar_Por.ItemIndex of
        0: add('where GP.Codigo_Pai = :Grupo and P.Codigo like '''+ EdtConsulta.Text +'%'' order by P.Descricao');
        1: add('where GP.Codigo_Pai = :Grupo and P.Descricao like '''+ EdtConsulta.Text +'%'' order by P.Descricao');
        2: add('where GP.Codigo_Pai = :Grupo and P.Ultima_Compra between :DI and :DF order by P.Descricao');
      end;

      Parameters.ParamByName('Grupo').Value:= codigo_pai;
      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_padrao;
    end;

    if (RGPesquisar_Por.ItemIndex = 2) then
    begin
      Parameters.ParamByName('DI').Value:= StrToDateTime(MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(MEdtData_Final.Text);
    end;
    open;
  end;
end;

procedure TFrmCadastro_Grupo_Produto.BBtnPesquisarClick(Sender: TObject);
begin
  grupo:= 0;
  Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
  FrmChama_Grupo_Produto.ShowModal;
  FrmChama_Grupo_Produto.Release;
end;

procedure TFrmCadastro_Grupo_Produto.EdtDescricaoExit(Sender: TObject);
begin
  descricao_grupo:= EdtDescricao.Text;
end;

end.
