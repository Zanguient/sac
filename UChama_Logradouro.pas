unit UChama_Logradouro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral, UConsulta,
  ADODB;

type
  TFrmChama_Logradouro = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_logradouro: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_logradouroCodigo: TAutoIncField;
    qrychama_logradouroDescricao: TStringField;
    qrychama_logradouroTipo_Logradouro: TStringField;
    qrychama_logradouroCEP: TStringField;
    qrychama_logradouroData_Cadastro: TDateTimeField;
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
  FrmChama_Logradouro: TFrmChama_Logradouro;
  Consulta: TConsulta;
  Util: TUtil;
implementation

uses UDM, UCadastro_Logradouro, UCadastro_Cliente, UCadastro_Funcionarios,
  UCadastro_Forn_Fab, UCadastro_Empresa, UCadastro_Transportadora, UNFE,
  UDeclaracao;

{$R *.dfm}

procedure TFrmChama_Logradouro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Logradouro.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Logradouro(EdtConsulta.Text);
end;

procedure TFrmChama_Logradouro.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.enderec = true) then
    begin
      {FrmCadastro_Cliente.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Cliente.EdtEndereco.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Cliente.EdtTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Cliente.EdtCEP.Text:= qrychama_logradouroCEP.AsString;}
      FrmChama_Logradouro.Close;
    end
    else if (FrmCadastro_Logradouro <> NIl) and (FrmCadastro_Logradouro.ativo = true) then
    begin
      FrmCadastro_Logradouro.EdtCodigo.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Logradouro.EdtLogradouro.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Logradouro.CmbTipo.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Logradouro.MEdtData_Cadastro.Text:= qrychama_logradouroData_Cadastro.AsString;
      FrmCadastro_Logradouro.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
      FrmChama_Logradouro.Close;
      FrmCadastro_Logradouro.BBtnSalvar.Enabled:= true;
      FrmCadastro_Logradouro.BBtnExcluir.Enabled:= true;
      FrmCadastro_Logradouro.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Logradouro.BBtnCancelar.Enabled:= true;
      FrmCadastro_Logradouro.BBtnNovo.Enabled:= False;
      Util.Habilita_Campos(FrmCadastro_Logradouro);
      FrmCadastro_Logradouro.achei:= true;
    end
    else if (FrmCadastro_Funcionarios <> NIL) and (FrmCadastro_Funcionarios.ativo = true) then
    begin
      {FrmCadastro_Funcionarios.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Funcionarios.EdtEndereco.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Funcionarios.EdtTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Funcionarios.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
      FrmChama_Logradouro.Close;}
    end
    else if (FrmCadastro_Forn_Fab <> Nil) and (FrmCadastro_Forn_Fab.ativo = true) then
    begin
      {FrmCadastro_Forn_Fab.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Forn_Fab.EdtEndereco.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Forn_Fab.EdtTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Forn_Fab.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
      FrmChama_Logradouro.Close;}
    end
    else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) and (FrmCadastro_Empresa.contabilista = false) then
    begin
      {FrmCadastro_Empresa.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Empresa.EdtEndereco.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Empresa.EdtTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Empresa.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
      FrmChama_Logradouro.Close;}
    end
    else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) and (FrmCadastro_Empresa.contabilista = true) then
    begin
      {FrmCadastro_Empresa.EdtCodigo_Endereco_Contador.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Empresa.EdtEndereco_Contador.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Empresa.EdtTipo_Logradouro_Contador.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Empresa.EdtCEP_Contador.Text:= qrychama_logradouroCEP.AsString;
      FrmChama_Logradouro.Close;}
    end
    else if (FrmCadastro_Transportadora <> NIl) and (FrmCadastro_Transportadora.ativo = true) then
    begin
      {FrmCadastro_Transportadora.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Transportadora.EdtEndereco.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Transportadora.EdtTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Transportadora.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
      FrmChama_Logradouro.Close;}
    end
    else if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.enderec = false) then
    begin
      {FrmCadastro_Cliente.EdtCodigo_Endereco_Outros.Text:= qrychama_logradouroCodigo.AsString;
      FrmCadastro_Cliente.EdtEndereco_Outros.Text:= qrychama_logradouroDescricao.AsString;
      FrmCadastro_Cliente.EdtTipo_Logradouro_Outros.Text:= qrychama_logradouroTipo_Logradouro.AsString;
      FrmCadastro_Cliente.EdtCEP_Outros.Text:= qrychama_logradouroCEP.AsString;
      FrmChama_Logradouro.Close;}
    end
    else if (FrmNFE <> Nil)  and (FrmNFE.ativo = true) then
    begin
      //FrmNFE.EdtCodigo_Logradouro_Retirada.Text:= qrychama_logradouroCodigo.AsString;
      //FrmNFE.EdtLogradouro_Retirada.Text:= qrychama_logradouroDescricao.AsString;
      endereco_emitente:= qrychama_logradouroDescricao.AsString;
      FrmChama_Logradouro.Close;
    end;
end;

procedure TFrmChama_Logradouro.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Logradouro.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Logradouro.EdtConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Logradouro(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Logradouro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Logradouro.Release;
end;

procedure TFrmChama_Logradouro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
