unit UChama_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Usuario = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_usuario: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_usuarioCodigo: TAutoIncField;
    qrychama_usuarioNome: TStringField;
    qrychama_usuarioLogin: TStringField;
    qrychama_usuarioSenha: TStringField;
    qrychama_usuarioCodigo_Perfil: TIntegerField;
    qrychama_usuarioData_Cadastro: TDateTimeField;
    qrychama_usuarioPerfil: TStringField;
    qrychama_usuarioAdministrador: TStringField;
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
  FrmChama_Usuario: TFrmChama_Usuario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Usuario, UConsulta_Fechamento_Caixa,
  UConsulta_Historico_Log, UBaixar_Titulo, UConsulta_Acerto_Caixa, UConsulta_OS,
  UPedido_Venda, UConsulta_Lancamento_Caixa, ULancamento_Caixa;

{$R *.dfm}

procedure TFrmChama_Usuario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Usuario.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Usuario;
end;

procedure TFrmChama_Usuario.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Usuario <> Nil) and (FrmCadastro_Usuario.ativo = true) then
  begin
    FrmCadastro_Usuario.EdtCodigo.Text:= qrychama_usuarioCodigo.AsString;
    FrmCadastro_Usuario.EdtNome.Text:= qrychama_usuarioNome.AsString;
    FrmCadastro_Usuario.EdtLogin.Text:= qrychama_usuarioLogin.AsString;
    FrmCadastro_Usuario.EdtSenha.Text:= qrychama_usuarioSenha.AsString;
    FrmCadastro_Usuario.EdtCodigo_Perfil.Text:= qrychama_usuarioCodigo_Perfil.AsString;
    FrmCadastro_Usuario.EdtPerfil.Text:= qrychama_usuarioPerfil.AsString;

    if (qrychama_usuarioAdministrador.AsString = 'SIM') then
      FrmCadastro_Usuario.CBADM.Checked:= true
    else
      FrmCadastro_Usuario.CBADM.Checked:= false;

    FrmCadastro_Usuario.MEdtData_Cadastro.Text:= qrychama_usuarioData_Cadastro.AsString;
    FrmChama_Usuario.Close;
    FrmCadastro_Usuario.BBtnSalvar.Enabled:= true;
    FrmCadastro_Usuario.BBtnExcluir.Enabled:= true;
    FrmCadastro_Usuario.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Usuario.BBtnCancelar.Enabled:= true;
    FrmCadastro_Usuario.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Usuario);
    FrmCadastro_Usuario.achei:= true;
  end
  else if (FrmConsulta_Fechamento_Caixa <> nil) and (FrmConsulta_Fechamento_Caixa.ativo = true) then
  begin
    FrmConsulta_Fechamento_Caixa.EdtCodigo_Usuario.Text:= qrychama_usuarioCodigo.AsString;
    FrmConsulta_Fechamento_Caixa.EdtUsuario.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
  else if (FrmConsulta_Historico_Log <> nil) and (FrmConsulta_Historico_Log.ativo = true) then
  begin
    FrmConsulta_Historico_Log.EdtCodigo_Usuario.Text:= qrychama_usuarioCodigo.AsString;
    FrmConsulta_Historico_Log.EdtUsuario.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
  begin
    //FrmBaixar_Titulo.EdtCodigo_Caixa.Text:= qrychama_usuarioCodigo.AsString;
    //FrmBaixar_Titulo.EdtCaixa.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
  else if (FrmConsulta_Acerto_Caixa <> nil) and (FrmConsulta_Acerto_Caixa.ativo = true) then
  begin
    FrmConsulta_Acerto_Caixa.EdtCodigo.Text:= qrychama_usuarioCodigo.AsString;
    FrmConsulta_Acerto_Caixa.EdtDescricao.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
  else if (FrmConsulta_OS <> nil) and (FrmConsulta_OS.ativo = true) then
  begin
    FrmConsulta_OS.EdtCodigo_Cliente.Text:= qrychama_usuarioCodigo.AsString;
    FrmConsulta_OS.EdtCliente.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
  else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) then
  begin
    FrmPedido_Venda.EdtCodigo_Atendente.Text:= qrychama_usuarioCodigo.AsString;
    FrmPedido_Venda.EdtAtendente.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
  else if (FrmLancamento_Caixa <> nil) and (FrmLancamento_Caixa.ativo = true) then
  begin
    FrmLancamento_Caixa.txtEdtCodigo_Atendente.Text:= qrychama_usuarioCodigo.AsString;
    FrmLancamento_Caixa.txtEdtAtendente.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
  else if (FrmConsulta_Lancamento_Caixa <> nil) and (FrmConsulta_Lancamento_Caixa.ativo = true) then
  begin
    FrmConsulta_Lancamento_Caixa.EdtCodigo_Usuario.Text:= qrychama_usuarioCodigo.AsString;
    FrmConsulta_Lancamento_Caixa.EdtUsuario.Text:= qrychama_usuarioNome.AsString;
    FrmChama_Usuario.Close;
  end;
end;

procedure TFrmChama_Usuario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Usuario.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Usuario.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Usuario;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Usuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Usuario.Release;
end;

procedure TFrmChama_Usuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
