unit UCadastro_Marca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Marca = class(TForm)
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
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Valor_Compra: TFloatField;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    EdtCodigo_Marca_Destino: TEdit;
    EdtMarca_Destino: TEdit;
    BtnTransferir: TButton;
    EdtConsulta: TEdit;
    ADOQuery1Codigo_Original: TStringField;
    ADOQuery1Codigo_Similar: TStringField;
    ADOQuery1Preco_Vista: TFloatField;
    ADOQuery1Preco_Prazo: TFloatField;
    RGTipo_Calculo: TRadioGroup;
    CBAtualiza_Preco: TCheckBox;
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
    RGAumentar: TRadioGroup;
    BbtnNovo: TToolButton;
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
    procedure EdtCodigo_Marca_DestinoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMarca_DestinoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Marca_DestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnTransferirClick(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure CBAtualiza_PrecoClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Marca: URegistro.TMarca;
    Util: TUtil;
    procedure Inicia_Itens;
    procedure Atualiza_Preco;
    procedure Atualiza_Marca;
    procedure Verifica_Permissao_Calcular_Preco;
    procedure Verifica_Permissao_Transferencia;
    procedure UpdateMarca(Produto: Integer);

  public
    ativo, achei: boolean;
    marcaa: integer;
    procedure Pega_Produto_Marca;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Marca: TFrmCadastro_Marca;
implementation

uses UDM, UChama_Marca, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Marca.BBtnCancelarClick(Sender: TObject);
begin
  achei:= false;
  Util.Limpa_Campos(FrmCadastro_Marca);
  Util.Desabilita_Campos(FrmCadastro_Marca);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Marca.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Marca.Excluir(Marca);
    Cria_Arquivo_Atualiza_Dados('DM');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU MARCA ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Marca);
  END;
end;

procedure TFrmCadastro_Marca.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Marca.BbtnNovoClick(Sender: TObject);
begin
  achei:= false;
  Util.Habilita_Campos(FrmCadastro_Marca);
  Util.Limpa_Campos(FrmCadastro_Marca);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BbtnNovo.Enabled:= false;
  Inicia_Itens;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  EdtDescricao.SetFocus;

end;

procedure TFrmCadastro_Marca.BBtnSalvarClick(Sender: TObject);
begin
  if (CBAtualiza_Preco.Checked) then
  begin
    Verifica_Permissao_Calcular_Preco;
  end;

  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Marca.Inserir(Marca);
        Cria_Arquivo_Atualiza_Dados('IM');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU MARCA ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Marca.Alterar(Marca);
        Cria_Arquivo_Atualiza_Dados('AM');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU MARCA ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;

    if (CBAtualiza_Preco.Checked) then
    begin
      Atualiza_Preco;
      Cria_Arquivo_Atualiza_Dados('AITPr');
    end;

    Cria_Arquivo_Atualiza_Dados('AProd');

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BbtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Marca);
end;

procedure TFrmCadastro_Marca.BtnTransferirClick(Sender: TObject);
begin
  Atualiza_Marca;
  Pega_Produto_Marca;
end;

procedure TFrmCadastro_Marca.Atualiza_Marca;
begin
  Verifica_Permissao_Transferencia;

  if (Application.MessageBox('Confirma a transferência dos produtos selecionados para a nova marca?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = IDYES then
  begin
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        UpdateMarca(ADOQuery1Codigo.AsInteger);
      end;
      ADOQuery1.Next;
    end;
    Processo_Concluido;

  end;
end;

procedure TFrmCadastro_Marca.UpdateMarca(Produto: Integer);
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
      add('update Produto set Codigo_Marca = :Codigo_Marca');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo_Marca').Value:= StrToInt(EdtCodigo_Marca_Destino.Text);
      Parameters.ParamByName('Codigo').Value:= Produto;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('update Produto set Codigo_Marca = :Codigo_Marca');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo_Marca').Value:= StrToInt(EdtCodigo_Marca_Destino.Text);
      Parameters.ParamByName('Codigo').Value:= Produto;
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Marca.Verifica_Permissao_Calcular_Preco;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('É necessário informar pelo menos um item', 'Dados não encontrados', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (EdtPercentual_Vista.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPercentual_Vista.SetFocus;
    abort;
  end;

  if (EdtPercentual_Prazo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPercentual_Prazo.SetFocus;
    abort;
  end;

  if (EdtPercentual_Desconto_Vista.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPercentual_Desconto_Vista.SetFocus;
    abort;
  end;

  if (EdtPercentual_Desconto_Prazo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPercentual_Desconto_Prazo.SetFocus;
    abort;
  end;


end;

procedure TFrmCadastro_Marca.Verifica_Permissao_Transferencia;
begin
  if (EdtCodigo_Marca_Destino.Text = '') then
  begin
    Application.MessageBox('Informe pelo menos uma marca, para transferir', 'Marca não encontrada', MB_OK+MB_ICONHAND);
    EdtCodigo_Marca_Destino.SetFocus;
    abort;
  end;

  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('É necessário informar pelo menos um item', 'Dados não encontrados', MB_OK+MB_ICONHAND);
    abort;
  end;

end;

procedure TFrmCadastro_Marca.Atualiza_Preco;
var
  qAux: TADOQuery;
  valor_vista, valor_prazo, perc_vista, perc_prazo, valor1, valor2, valor3, calculo_perc: double;
begin

  qAux:= TADOQuery.Create(self);
  try
    ADOQuery1.First;
    while not (ADOQuery1.Eof) do
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
          add('Preco_Prazo = :Preco_Prazo');
          //add('Percentual_Desconto_Vista = :Percentual_Desconto_Vista, ');
          //add('Percentual_Desconto_Prazo = :Percentual_Desconto_Prazo,');
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
          //Parameters.ParamByName('Percentual_Desconto_Vista').Value:= StrToFloat(EdtPercentual_Desconto_Vista.Text);
          //Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= StrToFloat(EdtPercentual_Desconto_Prazo.Text);
          //Parameters.ParamByName('Percentual_Lucro_Vista').Value:= StrToFloat(EdtPercentual_Vista.Text);
          //Parameters.ParamByName('Percentual_Lucro_Prazo').Value:= StrToFloat(EdtPercentual_Prazo.Text);
          ExecSQL;
        end;
      end;
      ADOQuery1.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Marca.CBAtualiza_PrecoClick(Sender: TObject);
begin
  if (CBAtualiza_Preco.Checked) then
  begin
    RGTipo_Calculo.Visible:= true;
    RGAumentar.Visible:= true;
  end
  else
  begin
    RGTipo_Calculo.Visible:= false;
    RGAumentar.Visible:= false;
  end;
end;

function TFrmCadastro_Marca.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Marca.EdtCodigo_Marca_DestinoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    marcaa:= 1;
    Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
    FrmChama_Marca.ShowModal;
    FrmChama_Marca.Free;
  end;
end;

procedure TFrmCadastro_Marca.EdtCodigo_Marca_DestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
  util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Marca.EdtConsultaChange(Sender: TObject);
begin
  if (achei = true) then
    Pega_Produto_Marca;
end;

procedure TFrmCadastro_Marca.EdtMarca_DestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
  util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Marca.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Marca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Marca.Free;
        FrmCadastro_Marca:= Nil;
      end;
end;

procedure TFrmCadastro_Marca.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Marca);
  Util.Limpa_Campos(FrmCadastro_Marca);
  Util.Desabilita_Campos(FrmCadastro_Marca);
  Inicia_Itens;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Marca.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Marca.Inicia_Itens();
begin
  EdtPercentual_Vista.Text:= '0,00';
  EdtPercentual_Prazo.Text:= '0,00';
  EdtPercentual_Desconto_Prazo.Text:= '0,00';
  EdtPercentual_Desconto_Vista.Text:= '0,00';
  CBAtualiza_Preco.Checked:= false;
end;

procedure TFrmCadastro_Marca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Marca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Marca.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Marca.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Marca.Pega_Produto_Marca;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Prazo from Produto P');
    add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto and ITP.Codigo = :Tabela)');
    add('where P.Codigo_Marca = :Marca and P.Descricao like '''+ EdtConsulta.Text +'%'' order by P.Descricao');
    Parameters.ParamByName('Marca').Value:= StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_padrao;
    open;
  end;
end;

procedure TFrmCadastro_Marca.BBtnPesquisarClick(Sender: TObject);
begin
  marcaa:= 0;
  Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
  FrmChama_Marca.ShowModal;
  FrmChama_Marca.Release;
end;

end.
