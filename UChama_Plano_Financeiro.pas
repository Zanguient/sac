unit UChama_Plano_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Plano_Financeiro = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_plano: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_planoCodigo: TAutoIncField;
    qrychama_planoCodigo_Empresa: TIntegerField;
    qrychama_planoTipo: TStringField;
    qrychama_planoDescricao: TStringField;
    qrychama_planoCodigo_SubNivel: TIntegerField;
    qrychama_planoData_Cadastro: TDateTimeField;
    qrychama_planoSub_Nivel: TStringField;
    qrychama_planoCodigo_Pai: TIntegerField;
    qrychama_planoDescricao2: TStringField;
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
  FrmChama_Plano_Financeiro: TFrmChama_Plano_Financeiro;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Plano_Financeiro, ULancamento_Financeiro, ULancamento_Banco,
  UConsulta_Lancamento_Banco, UConta_Fixa, UConsulta_Lancamentos_Financeiros,
  UConfiguracao_Sistema, ULancamento_Caixa;

{$R *.dfm}

procedure TFrmChama_Plano_Financeiro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Plano_Financeiro.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Plano_Financeiro(EdtConsulta.Text);
end;

procedure TFrmChama_Plano_Financeiro.DBGrid1DblClick(Sender: TObject);
begin
    if (FrmCadastro_Plano_Financeiro <> Nil) and (FrmCadastro_Plano_Financeiro.ativo = true) and (FrmCadastro_Plano_Financeiro.edit = true) then
    begin
      FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text:= qrychama_planoCodigo.AsString;
      FrmCadastro_Plano_Financeiro.EdtSubnivel.Text:= qrychama_planoDescricao.AsString;
      FrmCadastro_Plano_Financeiro.EdtDescricao.Text:= qrychama_planoDescricao.AsString + ' : ' + FrmCadastro_Plano_Financeiro.EdtDescricao.Text;
      FrmCadastro_Plano_Financeiro.codigo_pai:= qrychama_planoCodigo_Pai.AsInteger;

      if (qrychama_planoSub_Nivel.AsString <> '') then
        FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text:= qrychama_planoSub_Nivel.AsString + '.' + FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text
      else
        FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text:= FrmCadastro_Plano_Financeiro.EdtCodigo.Text;

      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmCadastro_Plano_Financeiro <> NIL) and (FrmCadastro_Plano_Financeiro.ativo = true) then
    begin
      FrmCadastro_Plano_Financeiro.EdtCodigo.Text:= qrychama_planoCodigo.AsString;
      FrmCadastro_Plano_Financeiro.MEdtData_Cadastro.Text:= qrychama_planoData_Cadastro.AsString;

      if (qrychama_planoTipo.AsString = 'RECEITA') then
        FrmCadastro_Plano_Financeiro.RGTipo.ItemIndex:= 0
      else
        FrmCadastro_Plano_Financeiro.RGTipo.ItemIndex:= 1;

      FrmCadastro_Plano_Financeiro.EdtDescricao.Text:= qrychama_planoDescricao.AsString;

      FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text:= qrychama_planoCodigo_SubNivel.AsString;
      FrmCadastro_Plano_Financeiro.EdtSubnivel.Text:= qrychama_planoDescricao2.AsString;

      FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text:= qrychama_planoSub_Nivel.AsString;
      FrmCadastro_Plano_Financeiro.codigo_pai:= qrychama_planoCodigo_Pai.AsInteger;

      FrmChama_Plano_Financeiro.Close;
      FrmCadastro_Plano_Financeiro.BBtnSalvar.Enabled:= true;
      FrmCadastro_Plano_Financeiro.BBtnExcluir.Enabled:= true;
      FrmCadastro_Plano_Financeiro.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Plano_Financeiro.BBtnCancelar.Enabled:= true;
      FrmCadastro_Plano_Financeiro.BBtnNovo.Enabled:= false;
      Util.Habilita_Campos(FrmCadastro_Plano_Financeiro);
      FrmCadastro_Plano_Financeiro.achei:= true;
    end
    else if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
    begin
      FrmLancamento_Financeiro.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      FrmLancamento_Financeiro.EdtPlano.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
    begin
      FrmLancamento_Banco.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      FrmLancamento_Banco.EdtPlano.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmConsulta_Lancamento_Banco <> nil) and (FrmConsulta_Lancamento_Banco.ativo = true) then
    begin
      //FrmConsulta_Lancamento_Banco.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      //FrmConsulta_Lancamento_Banco.EdtConsulta.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmConta_Fixa <> nil) and (FrmConta_Fixa.ativo = true) then
    begin
      FrmConta_Fixa.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      FrmConta_Fixa.EdtPlano.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> NIl) and (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
    begin
      FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_planoCodigo.AsString;
      FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmConfiguracao_Sistema <> NIl) and (FrmConfiguracao_Sistema.ativo = true) and (FrmConfiguracao_Sistema.receber = true) then
    begin
      FrmConfiguracao_Sistema.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      FrmConfiguracao_Sistema.EdtPlano.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmConfiguracao_Sistema <> NIl) and (FrmConfiguracao_Sistema.ativo = true) and (FrmConfiguracao_Sistema.receber = false) then
    begin
      FrmConfiguracao_Sistema.EdtCodigo_Plano_Pagar.Text:= qrychama_planoCodigo.AsString;
      FrmConfiguracao_Sistema.EdtPlano_Pagar.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmLancamento_Caixa <> NIl) and (FrmLancamento_Caixa.ativo = true) then
    begin
      FrmLancamento_Caixa.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      FrmLancamento_Caixa.EdtPlano.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end;
end;

procedure TFrmChama_Plano_Financeiro.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Plano_Financeiro.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Plano_Financeiro.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Plano_Financeiro(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Plano_Financeiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Plano_Financeiro.Release;
end;

procedure TFrmChama_Plano_Financeiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
