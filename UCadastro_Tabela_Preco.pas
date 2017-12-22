unit UCadastro_Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient;

type
  TFrmCadastro_Tabela_Preco = class(TForm)
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
    MEdtData_Validade: TMaskEdit;
    Label1: TLabel;
    Label6: TLabel;
    EdtGrupo: TEdit;
    EdtCodigo_Grupo: TEdit;
    RGBusca: TRadioGroup;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    BBtnChama_Produto: TToolButton;
    ADOQuery2: TADOQuery;
    ADOQuery2Codigo: TAutoIncField;
    ADOQuery2Codigo_Venda: TStringField;
    ADOQuery2Descricao: TStringField;
    RGTipo: TRadioGroup;
    ADOQuery2Tipo: TIntegerField;
    Label2: TLabel;
    EdtPorcentagem: TEdit;
    RGEscolha: TRadioGroup;
    ImgImagens_Comandos: TImageList;
    ADOQuery2Valor_Compra: TFloatField;
    RGTipo_Calculo: TRadioGroup;
    EdtPesquisa: TEdit;
    EdtPercentual_Vista: TEdit;
    Label3: TLabel;
    EdtPercentual_Prazo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtAtalho: TEdit;
    RGPesquisa: TRadioGroup;
    ADOQuery2Percentual_Vista: TFloatField;
    ADOQuery2Percentual_Prazo: TFloatField;
    ADOQuery2Percentual_Desconto_Vista: TFloatField;
    ADOQuery2Percentual_Desconto_Prazo: TFloatField;
    RGValor: TRadioGroup;
    ADOQuery1Codigo_Registro: TAutoIncField;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Preco_Vista: TFloatField;
    ADOQuery1Preco_Prazo: TFloatField;
    ADOQuery1Percentual_Desconto_Vista: TFloatField;
    ADOQuery1Percentual_Desconto_Prazo: TFloatField;
    ADOQuery1Percentual_Lucro_Vista: TFloatField;
    ADOQuery1Percentual_Lucro_Prazo: TFloatField;
    ADOQuery1Cod_Prod: TAutoIncField;
    ADOQuery1Codigo_Similar: TStringField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Codigo_Original: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Valor_Compra: TFloatField;
    ADOQuery1Percentual_Comissao_Vista: TFloatField;
    ADOQuery1Percentual_Comissao_Prazo: TFloatField;
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
    procedure BBtnChama_ProdutoClick(Sender: TObject);
    procedure EdtCodigo_GrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGBuscaClick(Sender: TObject);
    procedure MEdtData_ValidadeEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPesquisaChange(Sender: TObject);
    procedure EdtPercentual_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPercentual_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_GrupoDblClick(Sender: TObject);
    procedure ADOQuery1BeforeInsert(DataSet: TDataSet);
    procedure ADOQuery1BeforeScroll(DataSet: TDataSet);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure MEdtData_ValidadeExit(Sender: TObject);
  private
    Tabela: URegistro.TCadastro_Tabela_Preco;
    Util: TUtil;

    procedure Gera_Codigo(var Conexao: TADOConnection);
    procedure Atualiza_Valor;
    procedure Inicia_Query_Conexao(var Conexao: TADOConnection);
    procedure Fecha_Conexao;

  public
    ativo, escolha, achei, liberado: boolean;
    Conexao: TADOConnection;

    procedure Cria_Conexao;
    procedure Pega_Produtos(var Conexao: TADOConnection);
    procedure Pega_Produtos_Pesquisa(var Conexao: TADOConnection);
    procedure Ordena_Produtos(var Conexao: TADOConnection);
    procedure ADOQuery(var Conexao: TADOConnection);
    procedure Atualiza_Query2(var Conexao: TADOConnection);
    procedure Atualiza_Dados(var Conexao: TADOConnection);
  protected
    function Confira: boolean; virtual;

  end;

var
  FrmCadastro_Tabela_Preco: TFrmCadastro_Tabela_Preco;
implementation

uses UDM, UDeclaracao, UChama_Grupo_Produto, UChama_Tabela_Preco, USenha_ADM,
  Conexao.TTransacao, Conexao.TPoll, Conexao.TConexao, Util.Mensagens,
  Util.TLog;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Tabela_Preco.ADOQuery(var Conexao: TADOConnection);
begin
  with ADOQuery2, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    if (RGValor.ItemIndex = 0) then
      add('select Pro.Tipo, Pro.Codigo, Pro.Codigo_Venda, Pro.Descricao, Pro.Valor_Compra,')
    else
      add('select Pro.Tipo, Pro.Codigo, Pro.Codigo_Venda, Pro.Descricao, Pro.Valor_Compra_Unitario as Valor_Compra,');

    add('Gru.Percentual_Vista, Gru.Percentual_Prazo, Gru.Percentual_Desconto_Vista, Gru.Percentual_Desconto_Prazo');
    add('from Produto Pro');
    add('left join Grupo_Produto Gru on(Pro.Codigo_Grupo = Gru.Codigo)');
    add('where Pro.Codigo not in (select ITP.Codigo_Produto from Itens_Tabela_Preco ITP ');
    add('where ITP.Codigo = :Codigo) and Pro.Status = :Status');

    if (RGTipo.ItemIndex = 1) then
      Add('and Pro.Tipo = 0')
    else if (RGTipo.ItemIndex = 2) then
      Add('and Pro.Tipo = 1');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('Status').Value:= 'ATIVO';
    open;
  end;
  {with ADOQuery2, sql do
  begin
    close;
    clear;
    add('select Pro.Tipo, Pro.Codigo, Pro.Codigo_Venda, Pro.Descricao, Pro.Valor_Compra from Produto Pro');
    if (RGTipo.ItemIndex = 1) then
      Add('where Pro.Tipo = 0')
    else if (RGTipo.ItemIndex = 2) then
      Add('where Pro.Tipo = 1');
    open;
  end;}
end;

procedure TFrmCadastro_Tabela_Preco.Atualiza_Dados(var Conexao: TADOConnection);
begin
  ADOQuery1.Close;
  ADOQuery1.Connection:= Conexao;
  ADOQuery1.Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
  ADOQuery1.Open;

  //ADOQuery1.Close;
  //ADOQuery1.Open;
end;

procedure TFrmCadastro_Tabela_Preco.Atualiza_Query2(var Conexao: TADOConnection);
begin
  with ADOQuery2, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select Pro.Tipo, Pro.Codigo, Pro.Codigo_Venda, Pro.Descricao, Pro.Valor_Compra,');
    add('Gru.Percentual_Vista, Gru.Percentual_Prazo, Gru.Percentual_Desconto_Vista, Gru.Percentual_Desconto_Prazo');
    add('from Produto Pro');
    add('left join Grupo_Produto Gru on(Pro.Codigo_Grupo = Gru.Codigo)');
    open;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.Atualiza_Valor;
var
  valor1, valor2, valor3, valor4, calculo_perc, perc: double;
begin
  if (ADOQuery1Percentual_Lucro_Vista.AsFloat <> 0) and (RGBusca.ItemIndex <> 2) then
  begin
    //if not (dm.ADOConnection1.InTransaction) then
      //dm.ADOConnection1.BeginTrans;

    //ADOQuery1.Connection:= FrmCadastro_Tabela_Preco.Conexao;
    ADOQuery1.Edit;
    valor1:= ADOQuery1Valor_Compra.Value;

    if (RGTipo_Calculo.ItemIndex = 0) then
    begin
      perc:= ADOQuery1Percentual_Lucro_Vista.Value / 100;
      valor2:= valor1 * perc;
      valor1:= valor1 + valor2;
    end
    else
    begin
      calculo_perc:= (100 - ADOQuery1Percentual_Lucro_Vista.AsFloat) / 100;
      valor1:= valor1 / calculo_perc;
    end;

    valor3:= Calcula_Valor(FloatToStr(valor1));

    valor1:= ADOQuery1Valor_Compra.Value;

    if (RGTipo_Calculo.ItemIndex = 0) then
    begin
      perc:= ADOQuery1Percentual_Lucro_Prazo.Value / 100;
      valor2:= valor1 * perc;
      valor1:= valor1 + valor2;
    end
    else
    begin
      calculo_perc:= (100 - ADOQuery1Percentual_Lucro_Prazo.AsFloat) / 100;
      valor1:= valor1 / calculo_perc;
    end;

    valor4:= Calcula_Valor(FloatToStr(valor1));

    ADOQuery1Preco_Vista.AsString:= FormatFloat('0.00', valor3);
    ADOQuery1Preco_Vista.AsString:= StringReplace(ADOQuery1Preco_Vista.AsString, ThousandSeparator, '', [rfReplaceAll]);

    ADOQuery1Preco_Prazo.AsString:= FormatFloat('0.00', valor4);
    ADOQuery1Preco_Prazo.AsString:= StringReplace(ADOQuery1Preco_Prazo.AsString, ThousandSeparator, '', [rfReplaceAll]);

    if (ADOQuery1Percentual_Lucro_Vista.AsFloat = 0) or (ADOQuery1Percentual_Lucro_Vista.AsString = '') then
      ADOQuery1Percentual_Lucro_Vista.AsInteger:= 0;

    if (ADOQuery1Percentual_Lucro_Prazo.AsFloat = 0) or (ADOQuery1Percentual_Lucro_Prazo.AsString = '') then
      ADOQuery1Percentual_Lucro_Prazo.AsInteger:= 0;

    if (ADOQuery1Percentual_Desconto_Vista.AsFloat = 0) or (ADOQuery1Percentual_Desconto_Vista.AsString = '') then
      ADOQuery1Percentual_Desconto_Vista.AsInteger:= 0;

    if (ADOQuery1Percentual_Desconto_Prazo.AsFloat = 0) or (ADOQuery1Percentual_Desconto_Prazo.AsString = '') then
      ADOQuery1Percentual_Desconto_Prazo.AsInteger:= 0;

    if (ADOQuery1Percentual_Comissao_Vista.AsFloat = 0) or (ADOQuery1Percentual_Comissao_Vista.AsString = '') then
      ADOQuery1Percentual_Comissao_Vista.AsInteger:= 0;

    if (ADOQuery1Percentual_Comissao_Prazo.AsFloat = 0) or (ADOQuery1Percentual_Comissao_Prazo.AsString = '') then
      ADOQuery1Percentual_Comissao_Prazo.AsInteger:= 0;

    ADOQuery1.Post;
    //ADOQuery1.ApplyUpdates(0);
    //DM.ADOConnection1.CommitTrans;
  end
  else
  begin
    //if not (dm.ADOConnection1.InTransaction) then
      //dm.ADOConnection1.BeginTrans;
    //ADOQuery1.Connection:= FrmCadastro_Tabela_Preco.Conexao;
    ADOQuery1.Edit;
    if (ADOQuery1Percentual_Lucro_Vista.AsFloat = 0) or (ADOQuery1Percentual_Lucro_Vista.AsString = '') then
      ADOQuery1Percentual_Lucro_Vista.AsInteger:= 0;

    if (ADOQuery1Preco_Vista.AsString = '') or (ADOQuery1Preco_Vista.AsFloat = 0) then
      ADOQuery1Preco_Vista.AsInteger:= 0;

    if (ADOQuery1Preco_Prazo.AsString = '') or (ADOQuery1Preco_Prazo.AsFloat = 0) then
      ADOQuery1Preco_Prazo.AsInteger:= 0;

    if (ADOQuery1Percentual_Desconto_Vista.AsFloat = 0) or (ADOQuery1Percentual_Desconto_Vista.AsString = '') then
      ADOQuery1Percentual_Desconto_Vista.AsInteger:= 0;

    if (ADOQuery1Percentual_Desconto_Prazo.AsFloat = 0) or (ADOQuery1Percentual_Desconto_Prazo.AsString = '') then
      ADOQuery1Percentual_Desconto_Prazo.AsInteger:= 0;

    if (ADOQuery1Percentual_Comissao_Vista.AsFloat = 0) or (ADOQuery1Percentual_Comissao_Vista.AsString = '') then
      ADOQuery1Percentual_Comissao_Vista.AsInteger:= 0;

    if (ADOQuery1Percentual_Comissao_Prazo.AsFloat = 0) or (ADOQuery1Percentual_Comissao_Prazo.AsString = '') then
      ADOQuery1Percentual_Comissao_Prazo.AsInteger:= 0;

    ADOQuery1.Post;
    //ADOQuery1.ApplyUpdates(0);
    //DM.ADOConnection1.CommitTrans;

  end;
end;
procedure TFrmCadastro_Tabela_Preco.BBtnCancelarClick(Sender: TObject);
begin
  //if (dm.ADOConnection1.InTransaction) then
  //Conexao.RollbackTrans;
  //Fecha_Conexao;
  //TTransacao.Create(Conexao);
  //TTransacao.desfazerTransacao(Conexao);
  //TPool.getInstance.liberarConexao(Conexao);
  TConexao.CancelaConexao(Conexao);

  //if (achei = false) then
    //Tabela.Excluir_Itens_Tabela(Tabela);

  Util.Limpa_Campos(FrmCadastro_Tabela_Preco);
  Util.Desabilita_Campos(FrmCadastro_Tabela_Preco);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
  BBtnChama_Produto.Enabled:= false;
end;

procedure TFrmCadastro_Tabela_Preco.BBtnChama_ProdutoClick(Sender: TObject);
var
  qAux, qAux2: TADOQuery;
  compra, preco_vista, preco_prazo, total_preco_vista, total_preco_prazo, percentual_vista, percentual_prazo,
  percentual, calculo_perc, preco_vista_aux: double;
begin
  qAux:= TADOQuery.Create(self);
  try
    if (RGBusca.ItemIndex = 0) then
    begin
      if (EdtPercentual_Vista.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtPercentual_Vista.SetFocus;
        exit;
      end;

      if (EdtPercentual_Prazo.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtPercentual_Prazo.SetFocus;
        exit;
      end;

      ADOQuery(FrmCadastro_Tabela_Preco.Conexao);
      ADOQuery2.First;
      if (ADOQuery2.RecordCount > 0) then
      begin
        while not ADOQuery2.Eof do
        begin

          if (EdtPercentual_Vista.Text <> '0') then
            percentual_vista:= StrToFloat(EdtPercentual_Vista.Text)
          else
            percentual_vista:= ADOQuery2Percentual_Vista.AsFloat;

          if (EdtPercentual_Prazo.Text <> '0') then
            percentual_prazo:= StrToFloat(EdtPercentual_Prazo.Text)
          else
            percentual_prazo:= ADOQuery2Percentual_Prazo.AsFloat;

          with qAux, sql do
          begin
            close;
            Connection:= Conexao;
            clear;
            add('insert into Itens_Tabela_Preco (Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista, Percentual_Desconto_Prazo, Percentual_Lucro_Vista, Percentual_Lucro_Prazo) values ');
            add('(:Codigo, :Codigo_Produto, :Preco_Vista, :Preco_Prazo, :Percentual_Desconto_Vista, :Percentual_Desconto_Prazo, :Percentual_Lucro_Vista, :Percentual_Lucro_Prazo)');
            Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
            Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery2Codigo.AsInteger;

            //preço vista
            compra:= ADOQuery2Valor_Compra.AsFloat;

            if (RGTipo_Calculo.ItemIndex = 0) then
            begin
              total_preco_vista:= Calcula_Valor(FloatToStr(compra * (percentual_vista / 100)));
              total_preco_vista:= compra + total_preco_vista;
              Parameters.ParamByName('Preco_Vista').Value:= total_preco_vista;
            end
            else
            begin
              calculo_perc:= (100 - percentual_vista) / 100;
              total_preco_vista:= Calcula_Valor(FloatToStr(compra / calculo_perc));
              preco_vista_aux:= total_preco_vista - compra;

              total_preco_vista:= compra + preco_vista_aux;
              Parameters.ParamByName('Preco_Vista').Value:= total_preco_vista;
            end;


            //preço prazo

            if (RGTipo_Calculo.ItemIndex = 0) then
            begin
              total_preco_prazo:= Calcula_Valor(FloatToStr(compra * (percentual_prazo / 100)));
              total_preco_prazo:= compra + total_preco_prazo;
              Parameters.ParamByName('Preco_Prazo').Value:= total_preco_prazo;
            end
            else
            begin
              calculo_perc:= (100 - percentual_prazo) / 100;
              total_preco_prazo:= Calcula_Valor(FloatToStr(compra / calculo_perc));
              preco_vista_aux:= total_preco_prazo - compra;

              total_preco_prazo:= compra + preco_vista_aux;
              Parameters.ParamByName('Preco_Prazo').Value:= total_preco_prazo;
            end;

            Parameters.ParamByName('Percentual_Desconto_Vista').Value:= ADOQuery2Percentual_Desconto_Vista.AsFloat;
            Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= ADOQuery2Percentual_Desconto_Prazo.AsFloat;

            Parameters.ParamByName('Percentual_Lucro_Vista').Value:= percentual_vista;
            Parameters.ParamByName('Percentual_Lucro_Prazo').Value:= percentual_prazo;
            ExecSQL;
            ADOQuery2.Next;
          end;
        end;
        Pega_Produtos(FrmCadastro_Tabela_Preco.Conexao);
        ADOQuery1.Close;
        ADOQuery1.Open;
      end;
    end
    else if (RGBusca.ItemIndex = 1) then
    begin
      if (EdtCodigo_Grupo.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Grupo.SetFocus;
        exit;
      end;

      if (EdtPercentual_Vista.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtPercentual_Vista.SetFocus;
        exit;
      end;

      if (EdtPercentual_Prazo.Text = '') then
      begin
        Mensagem_Falta_Dados;
        EdtPercentual_Prazo.SetFocus;
        exit;
      end;

      qAux2:=TADOQuery.Create(self);
      with qAux2, sql do
      begin
        close;
        Connection:= FrmCadastro_Tabela_Preco.Conexao;
        clear;
        add('select Pro.Tipo, Pro.Codigo, Pro.Codigo_Venda, Pro.Descricao, Pro.Valor_Compra,');
        add('Gru.Percentual_Vista, Gru.Percentual_Prazo, Gru.Percentual_Desconto_Vista, Gru.Percentual_Desconto_Prazo');
        add('from Produto Pro');
        add('left join Grupo_Produto Gru on(Pro.Codigo_Grupo = Gru.Codigo)');
        add('where Pro.Codigo_Grupo = :Grupo and Pro.Codigo not in (select ITP.Codigo_Produto from Itens_Tabela_Preco ITP ');
        add('where ITP.Codigo = :Codigo)  ');

        if (RGTipo.ItemIndex = 1) then
          Add('and Pro.Tipo = 0')
        else if (RGTipo.ItemIndex = 2) then
          Add('and Pro.Tipo = 1');

        Parameters.ParamByName('Grupo').Value:= StrToInt(EdtCodigo_Grupo.Text);
        Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
        open;
      end;

      qAux2.First;
      if (qAux2.RecordCount > 0) then
      begin
        while not qAux2.Eof do
        begin

          if (EdtPercentual_Vista.Text <> '0') then
            percentual_vista:= StrToFloat(EdtPercentual_Vista.Text)
          else
            percentual_vista:= qAux2.FieldByName('Percentual_Vista').AsFloat;

          if (EdtPercentual_Prazo.Text <> '0') then
            percentual_prazo:= StrToFloat(EdtPercentual_Prazo.Text)
          else
            percentual_prazo:= qAux2.FieldByName('Percentual_Prazo').AsFloat;

          with qAux, sql do
          begin
            close;
            Connection:= FrmCadastro_Tabela_Preco.Conexao;
            clear;
            add('insert into Itens_Tabela_Preco (Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista, Percentual_Desconto_Prazo, Percentual_Lucro_Vista, Percentual_Lucro_Prazo) values ');
            add('(:Codigo, :Codigo_Produto, :Preco_Vista, :Preco_Prazo, :Percentual_Desconto_Vista, :Percentual_Desconto_Prazo, :Percentual_Lucro_Vista, :Percentual_Lucro_Prazo)');
            Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
            Parameters.ParamByName('Codigo_Produto').Value:= qAux2.FieldByName('Codigo').AsInteger;

            //preço vista
            compra:= qAux2.FieldByName('Valor_Compra').AsFloat;

            if (RGTipo_Calculo.ItemIndex = 0) then
            begin
              total_preco_vista:= Calcula_Valor(FloatToStr(compra * (percentual_vista / 100)));
              total_preco_vista:= compra + total_preco_vista;
              Parameters.ParamByName('Preco_Vista').Value:= total_preco_vista;
            end
            else
            begin
              calculo_perc:= (100 - percentual_vista) / 100;
              total_preco_vista:= Calcula_Valor(FloatToStr(compra / calculo_perc));
              preco_vista_aux:= total_preco_vista - compra;

              total_preco_vista:= compra + preco_vista_aux;
              Parameters.ParamByName('Preco_Vista').Value:= total_preco_vista;
            end;


            //preço prazo

            if (RGTipo_Calculo.ItemIndex = 0) then
            begin
              total_preco_prazo:= Calcula_Valor(FloatToStr(compra * (percentual_prazo / 100)));
              total_preco_prazo:= compra + total_preco_prazo;
              Parameters.ParamByName('Preco_Prazo').Value:= total_preco_prazo;
            end
            else
            begin
              calculo_perc:= (100 - percentual_prazo) / 100;
              total_preco_prazo:= Calcula_Valor(FloatToStr(compra / calculo_perc));
              preco_vista_aux:= total_preco_prazo - compra;

              total_preco_prazo:= compra + preco_vista_aux;
              Parameters.ParamByName('Preco_Prazo').Value:= total_preco_prazo;
            end;

            Parameters.ParamByName('Percentual_Desconto_Vista').Value:= qAux2.FieldByName('Percentual_Desconto_Vista').AsFloat;
            Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= qAux2.FieldByName('Percentual_Desconto_Prazo').AsFloat;

            Parameters.ParamByName('Percentual_Lucro_Vista').Value:= percentual_vista;
            Parameters.ParamByName('Percentual_Lucro_Prazo').Value:= percentual_prazo;
            ExecSQL;
            qAux2.Next;
          end;
        end;
        Pega_Produtos(FrmCadastro_Tabela_Preco.Conexao);
        ADOQuery1.Close;
        ADOQuery1.Open;
      end;
    end
    else if (RGBusca.ItemIndex = 2) then
    begin
      percentual:= StrToFloat(EdtPorcentagem.Text);
      qAux2:=TADOQuery.Create(self);
      with qAux2, sql do
      begin
        close;
        Connection:= FrmCadastro_Tabela_Preco.Conexao;
        clear;
        add('select ITP.* from Itens_Tabela_Preco ITP where ITP.Codigo = :Codigo ');
        Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo_Grupo.Text);
        open;
      end;

      qAux2.First;
      while not qAux2.Eof do
      begin
        with qAux, sql do
        begin
          close;
          Connection:= FrmCadastro_Tabela_Preco.Conexao;
          clear;
          add('insert into Itens_Tabela_Preco (Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista, Percentual_Desconto_Prazo, Percentual_Lucro_Vista, Percentual_Lucro_Prazo) values ');
          add('(:Codigo, :Codigo_Produto, :Preco_Vista, :Preco_Prazo, :Percentual_Desconto_Vista, :Percentual_Desconto_Prazo, :Percentual_Lucro_Vista, :Percentual_Lucro_Prazo)');
          Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
          Parameters.ParamByName('Codigo_Produto').Value:= qAux2.FieldByName('Codigo_Produto').AsInteger;

          //preço vista
          preco_vista:= qAux2.FieldByName('Preco_Vista').AsFloat;

          if (RGTipo_Calculo.ItemIndex = 0) then
          begin
            total_preco_vista:= Calcula_Valor(FloatToStr(preco_vista * (percentual / 100)));

            if (RGEscolha.ItemIndex = 0) then
              total_preco_vista:= preco_vista + total_preco_vista
            else
              total_preco_vista:= preco_vista - total_preco_vista;
            Parameters.ParamByName('Preco_Vista').Value:= total_preco_vista;
          end
          else
          begin
            calculo_perc:= (100 - percentual) / 100;
            total_preco_vista:= Calcula_Valor(FloatToStr(preco_vista / calculo_perc));
            preco_vista_aux:= total_preco_vista - preco_vista;

            if (RGEscolha.ItemIndex = 0) then
              total_preco_vista:= preco_vista + preco_vista_aux
            else
              total_preco_vista:= preco_vista - preco_vista_aux;
            Parameters.ParamByName('Preco_Vista').Value:= total_preco_vista;
          end;


          //preço prazo
          preco_prazo:= qAux2.FieldByName('Preco_Prazo').AsFloat;

          if (RGTipo_Calculo.ItemIndex = 0) then
          begin
            total_preco_prazo:= Calcula_Valor(FloatToStr(preco_prazo * (percentual / 100)));

            if (RGEscolha.ItemIndex = 0) then
              total_preco_prazo:= preco_prazo + total_preco_prazo
            else
              total_preco_prazo:= preco_prazo - total_preco_prazo;
            Parameters.ParamByName('Preco_Prazo').Value:= total_preco_prazo;
          end
          else
          begin
            calculo_perc:= (100 - percentual) / 100;
            total_preco_prazo:= Calcula_Valor(FloatToStr(preco_prazo / calculo_perc));
            preco_vista_aux:= total_preco_prazo - preco_prazo;

            if (RGEscolha.ItemIndex = 0) then
              total_preco_prazo:= preco_prazo + preco_vista_aux
            else
              total_preco_prazo:= preco_prazo - preco_vista_aux;
            Parameters.ParamByName('Preco_Prazo').Value:= total_preco_prazo;
          end;

          Parameters.ParamByName('Percentual_Desconto_Vista').Value:= qAux2.FieldByName('Percentual_Desconto_Vista').AsFloat;
          Parameters.ParamByName('Percentual_Desconto_Prazo').Value:= qAux2.FieldByName('Percentual_Desconto_Prazo').AsFloat;

          if (RGEscolha.ItemIndex = 0) then
            Parameters.ParamByName('Percentual_Lucro_Vista').Value:= qAux2.FieldByName('Percentual_Lucro_Vista').AsFloat + percentual
          else
            Parameters.ParamByName('Percentual_Lucro_Vista').Value:= qAux2.FieldByName('Percentual_Lucro_Vista').AsFloat - percentual;

          if (RGEscolha.ItemIndex = 0) then
            Parameters.ParamByName('Percentual_Lucro_Prazo').Value:= qAux2.FieldByName('Percentual_Lucro_Prazo').AsFloat + percentual
          else
            Parameters.ParamByName('Percentual_Lucro_Prazo').Value:= qAux2.FieldByName('Percentual_Lucro_Prazo').AsFloat - percentual;
          ExecSQL;
          qAux2.Next;
        end;
      end;
      Pega_Produtos(FrmCadastro_Tabela_Preco.Conexao);
      ADOQuery1.Close;
      ADOQuery1.Open;
    end;
  finally
    FreeAndNil(qAux);
  end;
  Atualiza_Dados(FrmCadastro_Tabela_Preco.Conexao);
end;

procedure TFrmCadastro_Tabela_Preco.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;

    if (liberado) then
    begin
      if Application.MessageBox('TODOS os preços de TODOS os produtos serão perdidos. DESEJA CONTINUAR?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = idyes then
      begin
        try
          liberado:= false;
          Tabela.Excluir_Itens_Tabela(Tabela, FrmCadastro_Tabela_Preco.Conexao);
          Tabela.Excluir(Tabela, FrmCadastro_Tabela_Preco.Conexao);

          //if (dm.ADOConnection1.InTransaction) then
          //Conexao.CommitTrans;
          //Conexao.Close;

          Cria_Arquivo_Atualiza_Dados('DTPr');
          Cria_Arquivo_Atualiza_Dados('DITPr');
          UDeclaracao.Insere_Historico(usuario, 'EXCLUIU TABELA DE PREÇO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
          TConexao.ConfirmaConexao(Conexao);
          BBtnSalvar.Enabled:= false;
          BBtnExcluir.Enabled:= false;
          BBtnPesquisar.Enabled:= true;
          BBtnCancelar.Enabled:= false;
          BBtnNovo.Enabled:= true;
          BBtnChama_Produto.Enabled:= false;
          Util.Desabilita_Campos(FrmCadastro_Tabela_Preco);
        except on E:Exception do
        begin
          TMensagens.MensagemErro('Erro ao excluir tabela de preço: '+E.Message);
          TLog.Error('Método BBtnExcluirClick CadastroTabelaPreco: '+E.Message);
          TConexao.CancelaConexao(Conexao);
        end;
        end;
      end;
    end;
  end;

  //TTransacao.Create(Conexao);
  //TTransacao.confirmarTransacao(Conexao);
  //TPool.getInstance.liberarConexao(Conexao);
end;

procedure TFrmCadastro_Tabela_Preco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Tabela_Preco.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Tabela_Preco);
  Util.Limpa_Campos(FrmCadastro_Tabela_Preco);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  BBtnChama_Produto.Enabled:= true;
  achei:= false;
  RGBusca.ItemIndex:= 0;
  EdtDescricao.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);

  Conexao:= TConexao.NovaConexao(Conexao);
  TConexao.IniciaQuerys([ADOQuery1, ADOQuery2], Conexao);

  //if (Conexao.InTransaction = false) then
  //begin
    //try
      //Cria_Conexao;
    //except
      //ShowMessage('Erro ao abrir conexão com banco de dados.');
      //abort;
    //end;
  //end;

  Gera_Codigo(Conexao);
  ADOQuery1Descricao.ReadOnly:= true;
  ADOQuery1.Close;
  liberado:= false;
  ADOQuery1.Close;

  ADOQuery2.Close;
  ADOQuery2.Open;
  RGTipo_Calculo.ItemIndex:= 0;
  RGValor.ItemIndex:= 0;
  MEdtData_Cadastro.SetFocus;
end;

procedure TFrmCadastro_Tabela_Preco.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Tabela.Inserir(Tabela, Conexao);
        Cria_Arquivo_Atualiza_Dados('ITPr');
        Cria_Arquivo_Atualiza_Dados('IITPr');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU TABELA DE PREÇO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Tabela.Alterar(Tabela, FrmCadastro_Tabela_Preco.Conexao);
        Cria_Arquivo_Atualiza_Dados('ATPr');
        Cria_Arquivo_Atualiza_Dados('AITPr');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU TABELA DE PREÇO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;

    //if (dm.ADOConnection1.InTransaction) then
    //TTransacao.Create(Conexao);
    //TTransacao.confirmarTransacao(Conexao);
    //TPool.getInstance.liberarConexao(Conexao);
    TConexao.ConfirmaConexao(Conexao);

    //Conexao.CommitTrans;
    //Conexao.Close;

    //ADOQuery1.Edit;
    //ADOQuery1.Post;     tirei aquiiiiiiiiiiiii

    {Delete_Tabela_Aux;
    Delete_Itens_Tabela_Aux;

    Insere_Tabela_Aux;
    Insere_Itens_Tabela_Aux;

    Delete_Produto_Aux;
    Insere_Produto_Aux;}
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    BBtnChama_Produto.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Tabela_Preco);
end;

procedure TFrmCadastro_Tabela_Preco.ADOQuery1BeforeInsert(
  DataSet: TDataSet);
begin
  if (ADOQuery1.Eof) then
  begin
    EdtPesquisa.Clear;
    abort;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.ADOQuery1BeforeScroll(
  DataSet: TDataSet);
begin
  Atualiza_Valor;
end;

function TFrmCadastro_Tabela_Preco.Confira: boolean;
begin
  Confira:= false;
  if EdtDescricao.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtDescricao.SetFocus;
      exit;
    end;

  if MEdtData_Cadastro.Text = '  /  /    ' then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Cadastro.SetFocus;
      exit;
    end;

  if MEdtData_Validade.Text = '  /  /    ' then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Validade.SetFocus;
      exit;
    end;

  if EdtPercentual_Vista.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Vista.SetFocus;
      exit;
    end;

  if EdtPercentual_Prazo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Prazo.SetFocus;
      exit;
    end;

    Confira:= true;
end;

procedure TFrmCadastro_Tabela_Preco.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCadastro_Tabela_Preco.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Confirma_Exclusao) then
    begin
      ADOQuery1.Delete;
      Atualiza_Dados(Conexao);
    end;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.EdtCodigo_GrupoDblClick(Sender: TObject);
begin
  if (RGBusca.ItemIndex = 1) then
  begin
    Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
    FrmChama_Grupo_Produto.ShowModal;
    FrmChama_Grupo_Produto.Close;
  end
  else if (RGBusca.ItemIndex = 2) then
  begin
    escolha:= true;
    Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
    FrmChama_Tabela_Preco.ShowModal;
    FrmChama_Tabela_Preco.Close;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.EdtCodigo_GrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    if (RGBusca.ItemIndex = 1) then
    begin
      Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
      FrmChama_Grupo_Produto.ShowModal;
      FrmChama_Grupo_Produto.Close;
    end
    else if (RGBusca.ItemIndex = 2) then
    begin
      escolha:= true;
      Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
      FrmChama_Tabela_Preco.ShowModal;
      FrmChama_Tabela_Preco.Close;
    end;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.EdtCodigo_GrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Tabela_Preco.EdtGrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Tabela_Preco.EdtPercentual_PrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Tabela_Preco.EdtPercentual_VistaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Tabela_Preco.EdtPesquisaChange(Sender: TObject);
begin
  if (EdtCodigo.Text <> '') then
  begin
    Pega_Produtos_Pesquisa(FrmCadastro_Tabela_Preco.Conexao);
    ADOQuery1.Close;
    ADOQuery1.Open;
  end;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Tabela_Preco.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Tabela_Preco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      exit;
    end
    else
      begin
        //Fecha_Conexao;
        //FreeAndNil(FrmCadastro_Tabela_Preco.Conexao);
        FrmCadastro_Tabela_Preco.Free;
        FrmCadastro_Tabela_Preco:= Nil;
      end;
end;

procedure TFrmCadastro_Tabela_Preco.Fecha_Conexao;
begin
  if (Conexao <> nil) then
  begin
    Conexao.Close;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Tabela_Preco);
  Util.Limpa_Campos(FrmCadastro_Tabela_Preco);
  Util.Desabilita_Campos(FrmCadastro_Tabela_Preco);
  //ADOQuery1Descricao.ReadOnly:= true;
  RGPesquisa.ItemIndex:= consulta_padrao_produto;
  ADOQuery1.Close;
  //Conexao:= TADOConnection.Create(self);
  RGTipo_Calculo.ItemIndex:= 0;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Tabela_Preco.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Tabela_Preco.Inicia_Query_Conexao(var Conexao: TADOConnection);
begin
  ADOQuery1.Connection:= Conexao;
  ADOQuery2.Connection:= Conexao;
end;

procedure TFrmCadastro_Tabela_Preco.Cria_Conexao;
begin
  Conexao:= TADOConnection.Create(self);
  Conexao:= TPool.getInstance.getConnection;
  TTransacao.Create(Conexao);
  TTransacao.iniciarTransacao(Conexao);
  SetUncommitted(Conexao);
  Inicia_Query_Conexao(Conexao);

  {UGeral.Abre_Conexao(FrmCadastro_Tabela_Preco.Conexao);
  Conexao.BeginTrans;
  SetUncommitted(FrmCadastro_Tabela_Preco.Conexao);
  Inicia_Query_Conexao(FrmCadastro_Tabela_Preco.Conexao);}
end;

procedure TFrmCadastro_Tabela_Preco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      {Util.Habilita_Campos(FrmCadastro_Tabela_Preco);
      Util.Limpa_Campos(FrmCadastro_Tabela_Preco);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      BBtnChama_Produto.Enabled:= true;
      achei:= false;
      RGBusca.ItemIndex:= 0;

      if (Conexao.InTransaction = false) then
      begin
        try
          Cria_Conexao;
        except
          ShowMessage('Erro ao abrir conexão com banco de dados.');
          abort;
        end;
      end;

      Gera_Codigo(FrmCadastro_Tabela_Preco.Conexao);
      ADOQuery1Descricao.ReadOnly:= true;
      ADOQuery1.Close;
      liberado:= false;
      ADOQuery1.Close;

      ADOQuery2.Close;
      ADOQuery2.Open;
      RGTipo_Calculo.ItemIndex:= 0;
      RGValor.ItemIndex:= 0;
      MEdtData_Cadastro.SetFocus;}
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Tabela_Preco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Tabela_Preco.Gera_Codigo(var Conexao: TADOConnection);
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
      add('select max(Codigo) as Codigo from Tabela_Preco ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Tabela_Preco.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Tabela_Preco.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Tabela_Preco.MEdtData_ValidadeEnter(Sender: TObject);
begin
  MEdtData_Validade.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Tabela_Preco.MEdtData_ValidadeExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Validade);
end;

procedure TFrmCadastro_Tabela_Preco.Ordena_Produtos(var Conexao: TADOConnection);
begin
  with ADOQuery1, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select ITP.*, Pro.Codigo as Cod_Prod, Pro.Codigo_Similar, Pro.Codigo_Venda, Pro.Codigo_Original, Pro.Descricao from Itens_Tabela_Preco ITP');
    add('inner join Produto Pro on (ITP.Codigo_Produto = Pro.Codigo)');
    add('where ITP.Codigo = :Codigo order by Pro.Descricao');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.Pega_Produtos(var Conexao: TADOConnection);
begin
  with ADOQuery1, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    if (RGValor.ItemIndex = 0) then
      add('select ITP.*, Pro.Codigo as Cod_Prod, Pro.Codigo_Similar, Pro.Codigo_Venda, Pro.Codigo_Original, Pro.Descricao, Pro.Valor_Compra from Itens_Tabela_Preco ITP')
    else
      add('select ITP.*, Pro.Codigo as Cod_Prod, Pro.Codigo_Similar, Pro.Codigo_Venda, Pro.Codigo_Original, Pro.Descricao, Pro.Valor_Compra_Unitario as Valor_Compra from Itens_Tabela_Preco ITP');;
    add('inner join Produto Pro on (ITP.Codigo_Produto = Pro.Codigo)');
    add('where ITP.Codigo = :Codigo order by Pro.Descricao');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.Pega_Produtos_Pesquisa(var Conexao: TADOConnection);
begin
  with ADOQuery1, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    if (RGValor.ItemIndex = 0) then
      add('select ITP.*, Pro.Codigo as Cod_Prod, Pro.Codigo_Similar, Pro.Codigo_Venda, Pro.Codigo_Original, Pro.Descricao, Pro.Valor_Compra from Itens_Tabela_Preco ITP')
    else
      add('select ITP.*, Pro.Codigo as Cod_Prod, Pro.Codigo_Similar, Pro.Codigo_Venda, Pro.Codigo_Original, Pro.Descricao, Pro.Valor_Compra_Unitario as Valor_Compra from Itens_Tabela_Preco ITP');
    add('left join Produto Pro on (ITP.Codigo_Produto = Pro.Codigo)');

    if (RGPesquisa.ItemIndex = 0) then
      add('where ITP.Codigo = :Codigo and Pro.Codigo like '''+ EdtPesquisa.Text  +'%'' order by Pro.Descricao')
    else if (RGPesquisa.ItemIndex = 1) then
      add('where ITP.Codigo = :Codigo and Pro.Codigo_Venda like '''+ EdtPesquisa.Text  +'%'' order by Pro.Descricao')
    else if (RGPesquisa.ItemIndex = 2) then
      add('where ITP.Codigo = :Codigo and Pro.Codigo_Similar like '''+ EdtPesquisa.Text  +'%'' order by Pro.Descricao')
    else if (RGPesquisa.ItemIndex = 3) then
      add('where ITP.Codigo = :Codigo and Pro.Codigo_Original like '''+ EdtPesquisa.Text  +'%'' order by Pro.Descricao')
    else if (RGPesquisa.ItemIndex = 4) then
      add('where ITP.Codigo = :Codigo and Pro.Descricao like '''+ EdtPesquisa.Text  +'%'' order by Pro.Descricao');

    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.RGBuscaClick(Sender: TObject);
begin
  if (RGBusca.ItemIndex = 0) then
  begin
    Label6.Visible:= false;
    EdtCodigo_Grupo.Visible:= false;
    EdtGrupo.Visible:= false;

    Label2.Visible:= false;
    EdtPorcentagem.Visible:= false;
    RGEscolha.Visible:= false;
  end;

  if (RGBusca.ItemIndex = 1) then
  begin
    Label6.Visible:= true;
    Label6.Caption:= 'Grupo';
    EdtCodigo_Grupo.Visible:= true;
    EdtGrupo.Visible:= true;

    Label2.Visible:= false;
    EdtPorcentagem.Visible:= false;
    RGEscolha.Visible:= false;
  end;

  {if (RGBusca.ItemIndex = 2) then
  begin
    ADOQuery1Descricao.ReadOnly:= false;
    ADOQuery1Desc_Prod.ReadOnly:= false;

    ADOQuery1Descricao.ReadOnly:= false;
    ADOQuery1Desc_Prod.ReadOnly:= false;
    Atualiza_Dados;
  end
  else
  begin
    ADOQuery1Descricao.ReadOnly:= true;
    ADOQuery1Desc_Prod.ReadOnly:= true;

    ADOQuery1Descricao.ReadOnly:= true;
    ADOQuery1Desc_Prod.ReadOnly:= true;
  end;}


  if (RGBusca.ItemIndex = 2) then
  begin
    Label6.Visible:= true;
    Label6.Caption:= 'Tabela';
    EdtCodigo_Grupo.Visible:= true;
    EdtGrupo.Visible:= true;

    Label2.Visible:= true;
    EdtPorcentagem.Visible:= true;
    RGEscolha.Visible:= true;
  end;
end;

procedure TFrmCadastro_Tabela_Preco.BBtnPesquisarClick(Sender: TObject);
begin
  escolha:= false;
  Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
  FrmChama_Tabela_Preco.ShowModal;
  FrmChama_Tabela_Preco.Release;
end;

end.
