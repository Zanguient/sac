unit UChama_Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Empresa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_empresa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_contabilista: TADOQuery;
    qrychama_empresaCodigo: TIntegerField;
    qrychama_empresaNome_Fantasia: TStringField;
    qrychama_empresaRazao_Social: TStringField;
    qrychama_empresaProprietario: TStringField;
    qrychama_empresaCNPJ: TStringField;
    qrychama_empresaInsc_Estadual: TStringField;
    qrychama_empresaInsc_Municipal: TStringField;
    qrychama_empresaSuframa: TStringField;
    qrychama_empresaCNAE: TStringField;
    qrychama_empresaRegime_Tributario: TIntegerField;
    qrychama_empresaEnquadramento: TStringField;
    qrychama_empresaAliquota: TStringField;
    qrychama_empresaCusto_OP: TFloatField;
    qrychama_empresaNumero: TStringField;
    qrychama_empresaComplemento: TStringField;
    qrychama_empresaCodigo_Setor: TIntegerField;
    qrychama_empresaCodigo_Cidade: TIntegerField;
    qrychama_empresaTelefone: TStringField;
    qrychama_empresaFax: TStringField;
    qrychama_empresaEmail: TStringField;
    qrychama_empresaSenha: TStringField;
    qrychama_empresaSMTP: TStringField;
    qrychama_empresaPorta: TStringField;
    qrychama_empresaSite: TStringField;
    qrychama_empresaData_Cadastro: TDateTimeField;
    qrychama_empresaObservacoes: TStringField;
    qrychama_empresaContato: TStringField;
    qrychama_empresaTelefone_Contato: TStringField;
    qrychama_empresaEndereco: TStringField;
    qrychama_empresaCEP: TStringField;
    qrychama_empresaCidade: TStringField;
    qrychama_empresaUF: TStringField;
    qrychama_empresaCodigo_Municipio: TStringField;
    qrychama_empresaSetor: TStringField;
    qrychama_contabilistaCodigo_Empresa: TIntegerField;
    qrychama_contabilistaNome_Contador: TStringField;
    qrychama_contabilistaCNPJ: TStringField;
    qrychama_contabilistaCPF: TStringField;
    qrychama_contabilistaCRC: TStringField;
    qrychama_contabilistaNumero: TStringField;
    qrychama_contabilistaComplemento: TStringField;
    qrychama_contabilistaCodigo_Setor: TIntegerField;
    qrychama_contabilistaCodigo_Cidade: TIntegerField;
    qrychama_contabilistaEmail: TStringField;
    qrychama_contabilistaTelefone: TStringField;
    qrychama_contabilistaEndereco: TStringField;
    qrychama_contabilistaCEP: TStringField;
    qrychama_contabilistaCidade: TStringField;
    qrychama_contabilistaUF: TStringField;
    qrychama_contabilistaSetor: TStringField;
    qrychama_contabilistaCodigo_Municipio: TStringField;
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
  FrmChama_Empresa: TFrmChama_Empresa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Empresa, UNFE, UDeclaracao, UFolha_Pagamento,
  UConsulta_Folha_Pagamento;

{$R *.dfm}

procedure TFrmChama_Empresa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Empresa.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Empresa(EdtConsulta.Text);
end;

procedure TFrmChama_Empresa.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Empresa <> NIL) and (FrmCadastro_Empresa.ativo = true) then
    begin
      FrmCadastro_Empresa.EdtCodigo.Text:= qrychama_empresaCodigo.AsString;
      FrmCadastro_Empresa.EdtProprietario.Text:= qrychama_empresaProprietario.AsString;
      FrmCadastro_Empresa.EdtNome.Text:= qrychama_empresaNome_Fantasia.AsString;
      FrmCadastro_Empresa.EdtRazao_Social.Text:= qrychama_empresaRazao_Social.AsString;
      FrmCadastro_Empresa.EdtCNPJ.Text:= qrychama_empresaCNPJ.AsString;
      FrmCadastro_Empresa.EdtInsc_Estadual.Text:= qrychama_empresaInsc_Estadual.AsString;
      FrmCadastro_Empresa.EdtInsc_Municipal.Text:= qrychama_empresaInsc_Municipal.AsString;
      FrmCadastro_Empresa.EdtSuframa.Text:= qrychama_empresaSuframa.AsString;
      FrmCadastro_Empresa.EdtCNAE.Text:= qrychama_empresaCNAE.AsString;
      FrmCadastro_Empresa.EdtComplemento.Text:= qrychama_empresaComplemento.AsString;
      FrmCadastro_Empresa.EdtContato.Text:= qrychama_empresaContato.AsString;
      FrmCadastro_Empresa.MEdtTelefone_Contato.Text:= qrychama_empresaTelefone_Contato.AsString;

      if (qrychama_empresaRegime_Tributario.AsInteger = 0) then
        FrmCadastro_Empresa.RGRegime_Tributario.ItemIndex:= 0
      else if (qrychama_empresaRegime_Tributario.AsInteger = 1) then
        FrmCadastro_Empresa.RGRegime_Tributario.ItemIndex:= 1
      else if (qrychama_empresaRegime_Tributario.AsInteger = 2) then
        FrmCadastro_Empresa.RGRegime_Tributario.ItemIndex:= 2;

      if (qrychama_empresaEnquadramento.AsString = 'EN') then
        FrmCadastro_Empresa.RGEnquadramento.ItemIndex:= 0
      else if (qrychama_empresaEnquadramento.AsString = 'EPP') then
        FrmCadastro_Empresa.RGEnquadramento.ItemIndex:= 1
      else if (qrychama_empresaEnquadramento.AsString = 'ME') then
        FrmCadastro_Empresa.RGEnquadramento.ItemIndex:= 2;

      FrmCadastro_Empresa.EdtAliquota.Text:= qrychama_empresaAliquota.AsString;
      FrmCadastro_Empresa.EdtCusto_OP.Text:= qrychama_empresaCusto_OP.AsString;

      FrmCadastro_Empresa.EdtEndereco.Text:= qrychama_empresaEndereco.AsString;
      FrmCadastro_Empresa.EdtCEP.Text:= qrychama_empresaCEP.AsString;

        FrmCadastro_Empresa.EdtNumero.Text:= qrychama_empresaNumero.AsString;
      if (qrychama_empresaCodigo_Setor.AsString = '0') then
        begin
          FrmCadastro_Empresa.EdtCodigo_Setor.Text:= '';
          FrmCadastro_Empresa.EdtSetor.Text:= '';
        end
        else
        begin
          FrmCadastro_Empresa.EdtCodigo_Setor.Text:= qrychama_empresaCodigo_Setor.AsString;
          FrmCadastro_Empresa.EdtSetor.Text:= qrychama_empresaSetor.AsString;
        end;

      if (qrychama_empresaCodigo_Cidade.AsString = '0') then
        begin
          FrmCadastro_Empresa.EdtCodigo_Cidade.Text:= '';
          FrmCadastro_Empresa.EdtCidade.Text:= '';
          FrmCadastro_Empresa.EdtUF.Text:= '';
        end
        else
        begin
          FrmCadastro_Empresa.EdtCodigo_Cidade.Text:= qrychama_empresaCodigo_Cidade.AsString;
          FrmCadastro_Empresa.EdtCidade.Text:= qrychama_empresaCidade.AsString;
          FrmCadastro_Empresa.EdtUF.Text:= qrychama_empresaUF.AsString;
        end;

      FrmCadastro_Empresa.EdtEmail.Text:= qrychama_empresaEmail.AsString;
      FrmCadastro_Empresa.EdtSenha.Text:= qrychama_empresaSenha.AsString;
      FrmCadastro_Empresa.EdtSMTP.Text:= qrychama_empresaSMTP.AsString;
      FrmCadastro_Empresa.EdtPorta.Text:= qrychama_empresaPorta.AsString;
      FrmCadastro_Empresa.EdtSite.Text:= qrychama_empresaSite.AsString;

      if (qrychama_empresaData_Cadastro.AsString = '30/12/1899') then
        FrmCadastro_Empresa.MEdtData_Cadastro.Clear
      else
        FrmCadastro_Empresa.MEdtData_Cadastro.Text:= qrychama_empresaData_Cadastro.AsString;

      FrmCadastro_Empresa.MEdtTelefone.Text:= qrychama_empresaTelefone.AsString;
      FrmCadastro_Empresa.MEdtFax.Text:= qrychama_empresaFax.AsString;
      FrmCadastro_Empresa.MmoObservacoes.Text:= qrychama_empresaObservacoes.AsString;


      FrmCadastro_Empresa.EdtNome_Contador.Text:= qrychama_contabilistaNome_Contador.AsString;
      //FrmCadastro_Empresa.EdtCodigo_Endereco_Contador.Text:= qrychama_contabilistaCodigo_Endereco.AsString;
      FrmCadastro_Empresa.EdtEndereco_Contador.Text:= qrychama_contabilistaEndereco.AsString;
      FrmCadastro_Empresa.EdtNumero_Contador.Text:= qrychama_contabilistaNumero.AsString;
      //FrmCadastro_Empresa.EdtTipo_Logradouro_Contador.Text:= qrychama_contabilistaTipo_Logradouro.AsString;
      FrmCadastro_Empresa.EdtCEP_Contador.Text:= qrychama_contabilistaCEP.AsString;
      FrmCadastro_Empresa.EdtComplemento_Contador.Text:= qrychama_contabilistaComplemento.AsString;
      FrmCadastro_Empresa.EdtCodigo_Setor_Contador.Text:= qrychama_contabilistaCodigo_Setor.AsString;
      FrmCadastro_Empresa.EdtSetor_Contador.Text:= qrychama_contabilistaSetor.AsString;
      FrmCadastro_Empresa.EdtCodigo_Cidade_Contador.Text:= qrychama_contabilistaCodigo_Cidade.AsString;
      FrmCadastro_Empresa.EdtCidade_Contador.Text:= qrychama_contabilistaCidade.AsString;
      FrmCadastro_Empresa.EdtUF_Contador.Text:= qrychama_contabilistaUF.AsString;
      FrmCadastro_Empresa.EdtEmail_Contador.Text:= qrychama_contabilistaEmail.AsString;
      FrmCadastro_Empresa.MEdtTelefone_Contador.Text:= qrychama_contabilistaTelefone.AsString;
      FrmCadastro_Empresa.MEdtCNPJ_Contador.Text:= qrychama_contabilistaCNPJ.AsString;
      FrmCadastro_Empresa.MEdtCPF_Contador.Text:= qrychama_contabilistaCPF.AsString;
      FrmCadastro_Empresa.EdtCRC.Text:= qrychama_contabilistaCRC.AsString;


      FrmChama_Empresa.Close;
      FrmCadastro_Empresa.BBtnSalvar.Enabled:= true;
      FrmCadastro_Empresa.BBtnExcluir.Enabled:= true;
      FrmCadastro_Empresa.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Empresa.BBtnCancelar.Enabled:= true;
      FrmCadastro_Empresa.BBtnNovo.Enabled:= False;
      Util.Habilita_Campos(FrmCadastro_Empresa);
      FrmCadastro_Empresa.achei:= true;
    end
    else if (FrmNFE <> Nil) and (FrmNFE.ativo = true) then
    begin
      FrmNFE.EdtEmitente.Text:= qrychama_empresaNome_Fantasia.AsString;
      FrmNFE.EdtCodigo_Emitente.Text:= qrychama_empresaCodigo.AsString;
      //FrmNFE.MEdtCNPJ_Retirada.Text:= qrychama_empresaCNPJ.AsString;

      razao_social_emitente:= qrychama_empresaRazao_Social.AsString;
      cnpj_emitente:= qrychama_empresaCNPJ.AsString;
      endereco_emitente:= qrychama_empresaEndereco.AsString;
      numero_emitente:= qrychama_empresaNumero.AsString;
      complemento_emitente:= qrychama_empresaComplemento.AsString;
      setor_emitente:= qrychama_empresaSetor.AsString;
      codigo_municipio_emitente:= qrychama_empresaCodigo_Municipio.AsString;
      municipio_emitente:= qrychama_empresaCidade.AsString;
      uf_emitente:= qrychama_empresaUF.AsString;
      telefone_emitente:= qrychama_empresaTelefone.AsString;
      cep_emitente:= qrychama_empresaCEP.AsString;
      regime_tributario_emitente:= qrychama_empresaRegime_Tributario.AsString;
      cnae_fiscal_emitente:= qrychama_empresaCNAE.AsString;
      ie_emitente:= qrychama_empresaInsc_Estadual.AsString;
      im_emitente:= qrychama_empresaInsc_Municipal.AsString;
      FrmChama_Empresa.Close;
    end
    else if (FrmFolha_Pagamento <> nil) and (FrmFolha_Pagamento.ativo) then
    begin
      FrmFolha_Pagamento.EdtCodigo_Empresa.Text:= qrychama_empresaCodigo.AsString;
      FrmFolha_Pagamento.EdtEmpresa.Text:= qrychama_empresaNome_Fantasia.AsString;
      FrmChama_Empresa.Close;
    end
    else if (FrmConsulta_Folha_Pagamento <> nil) and (FrmConsulta_Folha_Pagamento.ativo) then
    begin
      FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text:= qrychama_empresaCodigo.AsString;
      FrmConsulta_Folha_Pagamento.EdtEmpresa.Text:= qrychama_empresaNome_Fantasia.AsString;
      FrmChama_Empresa.Close;
    end;
end;

procedure TFrmChama_Empresa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Empresa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Empresa.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Empresa(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Empresa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Empresa.Release;
end;

procedure TFrmChama_Empresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
