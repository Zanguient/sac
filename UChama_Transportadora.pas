unit UChama_Transportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Transportadora = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_transportadora: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_transportadoraCodigo: TAutoIncField;
    qrychama_transportadoraNome_Fantasia: TStringField;
    qrychama_transportadoraRazao_Social: TStringField;
    qrychama_transportadoraCPF: TStringField;
    qrychama_transportadoraRG: TStringField;
    qrychama_transportadoraOrgao_Expedidor: TStringField;
    qrychama_transportadoraData_Emissao_RG: TDateTimeField;
    qrychama_transportadoraCNPJ: TStringField;
    qrychama_transportadoraInsc_Estadual_Municipal: TStringField;
    qrychama_transportadoraNumero: TStringField;
    qrychama_transportadoraReferencia: TStringField;
    qrychama_transportadoraCodigo_Setor: TIntegerField;
    qrychama_transportadoraCodigo_Cidade: TIntegerField;
    qrychama_transportadoraTelefone: TStringField;
    qrychama_transportadoraCelular: TStringField;
    qrychama_transportadoraEmail: TStringField;
    qrychama_transportadoraSite: TStringField;
    qrychama_transportadoraData_Cadastro: TDateTimeField;
    qrychama_transportadoraObservacoes: TStringField;
    qrychama_transportadoraEndereco: TStringField;
    qrychama_transportadoraCEP: TStringField;
    qrychama_transportadoraCidade: TStringField;
    qrychama_transportadoraUF: TStringField;
    qrychama_transportadoraSetor: TStringField;
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
  FrmChama_Transportadora: TFrmChama_Transportadora;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Transportadora, UEntrada_Produtos, UNFE, UDeclaracao;

{$R *.dfm}

procedure TFrmChama_Transportadora.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Transportadora.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Transportadora;
end;

procedure TFrmChama_Transportadora.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Transportadora <> NIL) and (FrmCadastro_Transportadora.ativo = true) then
    begin
      FrmCadastro_Transportadora.EdtCodigo.Text:= qrychama_transportadoraCodigo.AsString;
      FrmCadastro_Transportadora.EdtNome.Text:= qrychama_transportadoraNome_Fantasia.AsString;
      FrmCadastro_Transportadora.EdtRazao_Social.Text:= qrychama_transportadoraRazao_Social.AsString;
      FrmCadastro_Transportadora.EdtCPF.Text:= qrychama_transportadoraCPF.AsString;
      FrmCadastro_Transportadora.EdtRG.Text:= qrychama_transportadoraRG.AsString;
      FrmCadastro_Transportadora.EdtOrgao_Expedidor.Text:= qrychama_transportadoraOrgao_Expedidor.AsString;

      if (qrychama_transportadoraData_Emissao_RG.AsString = '30/12/1899') then
        FrmCadastro_Transportadora.EdtData_Emissao.Clear
      else
        FrmCadastro_Transportadora.EdtData_Emissao.Text:= qrychama_transportadoraData_Emissao_RG.AsString;

      FrmCadastro_Transportadora.EdtCNPJ.Text:= qrychama_transportadoraCNPJ.AsString;
      FrmCadastro_Transportadora.EdtInsc_Estadual_Municipal.Text:= qrychama_transportadoraInsc_Estadual_Municipal.AsString;

      FrmCadastro_Transportadora.EdtEndereco.Text:= qrychama_transportadoraEndereco.AsString;
      FrmCadastro_Transportadora.EdtCEP.Text:= qrychama_transportadoraCEP.AsString;

        FrmCadastro_Transportadora.EdtNumero.Text:= qrychama_transportadoraNumero.AsString;
      if (qrychama_transportadoraCodigo_Setor.AsString = '0') then
        begin
          FrmCadastro_Transportadora.EdtCodigo_Setor.Text:= '';
          FrmCadastro_Transportadora.EdtSetor.Text:= '';
        end
        else
        begin
          FrmCadastro_Transportadora.EdtCodigo_Setor.Text:= qrychama_transportadoraCodigo_Setor.AsString;
          FrmCadastro_Transportadora.EdtSetor.Text:= qrychama_transportadoraSetor.AsString;
        end;

      if (qrychama_transportadoraCodigo_Cidade.AsString = '0') then
        begin
          FrmCadastro_Transportadora.EdtCodigo_Cidade.Text:= '';
          FrmCadastro_Transportadora.EdtCidade.Text:= '';
          FrmCadastro_Transportadora.EdtUF.Text:= '';
        end
        else
        begin
          FrmCadastro_Transportadora.EdtCodigo_Cidade.Text:= qrychama_transportadoraCodigo_Cidade.AsString;
          FrmCadastro_Transportadora.EdtCidade.Text:= qrychama_transportadoraCidade.AsString;
          FrmCadastro_Transportadora.EdtUF.Text:= qrychama_transportadoraUF.AsString;
        end;

      FrmCadastro_Transportadora.EdtReferencia.Text:= qrychama_transportadoraReferencia.AsString;
      FrmCadastro_Transportadora.EdtEmail.Text:= qrychama_transportadoraEmail.AsString;
      FrmCadastro_Transportadora.EdtSite.Text:= qrychama_transportadoraSite.AsString;

      if (qrychama_transportadoraData_Cadastro.AsString = '30/12/1899') then
        FrmCadastro_Transportadora.MEdtData_Cadastro.Clear
      else
        FrmCadastro_Transportadora.MEdtData_Cadastro.Text:= qrychama_transportadoraData_Cadastro.AsString;

      FrmCadastro_Transportadora.MEdtTelefone.Text:= qrychama_transportadoraTelefone.AsString;
      FrmCadastro_Transportadora.MEdtCelular.Text:= qrychama_transportadoraCelular.AsString;
      FrmCadastro_Transportadora.MmoObservacoes.Text:= qrychama_transportadoraObservacoes.AsString;
      FrmChama_Transportadora.Close;
      FrmCadastro_Transportadora.BBtnSalvar.Enabled:= true;
      FrmCadastro_Transportadora.BBtnExcluir.Enabled:= true;
      FrmCadastro_Transportadora.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Transportadora.BBtnCancelar.Enabled:= true;
      FrmCadastro_Transportadora.BBtnNovo.Enabled:= False;
      Util.Habilita_Campos(FrmCadastro_Transportadora);
      FrmCadastro_Transportadora.achei:= true;
    end
    else if (FrmEntrada_Produtos <> nil) and (FrmEntrada_Produtos.ativo) then
    begin
      FrmEntrada_Produtos.EdtCodigo_Transportadora.Text:= qrychama_transportadoraCodigo.AsString;
      FrmEntrada_Produtos.EdtTransportadora.Text:= qrychama_transportadoraNome_Fantasia.AsString;
      FrmChama_Transportadora.Close;
    end
    else if (FrmNFE <> Nil) and (FrmNFE.ativo = true) then
    begin
      FrmNFE.EdtCodigo_Transportadora.Text:= qrychama_transportadoraCodigo.AsString;
      FrmNFE.EdtTransportadora.Text:= qrychama_transportadoraNome_Fantasia.AsString;
      cnpj_trans:= qrychama_transportadoraCNPJ.AsString;
      insc_trans:= qrychama_transportadoraInsc_Estadual_Municipal.AsString;
      cpf_trans:= qrychama_transportadoraCPF.AsString;
      rg_trans:= qrychama_transportadoraRG.AsString;
      endereco_trans:= qrychama_transportadoraEndereco.AsString;
      municipio_trans:= qrychama_transportadoraCidade.AsString;
      uf_trans:= qrychama_transportadoraUF.AsString;
      inscricao_estadual_trans:= qrychama_transportadoraInsc_Estadual_Municipal.AsString;
      telefone_transportadora:= qrychama_transportadoraTelefone.AsString;
      FrmChama_Transportadora.Close;
    end;
end;

procedure TFrmChama_Transportadora.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Transportadora.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Transportadora.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Transportadora;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Transportadora.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Transportadora.Release;
end;

procedure TFrmChama_Transportadora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
