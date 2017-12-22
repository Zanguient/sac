unit URel_Ficha_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Ficha_Funcionario = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule1: TQRHRule;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    LblTelefone_Rodape: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    LblNome: TQRLabel;
    QRLabel3: TQRLabel;
    LblEndereco: TQRLabel;
    QRLabel5: TQRLabel;
    LblCidade: TQRLabel;
    QRLabel8: TQRLabel;
    LblData_Nascimento: TQRLabel;
    QRLabel10: TQRLabel;
    LblEstado_Civil: TQRLabel;
    QRLabel11: TQRLabel;
    LblTelefone: TQRLabel;
    QRLabel12: TQRLabel;
    LblCelular: TQRLabel;
    QRLabel15: TQRLabel;
    LblEmail: TQRLabel;
    QRBand2: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel16: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRSubDetail2: TQRSubDetail;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    LblSalario: TQRLabel;
    QRShape1: TQRShape;
    LblData_Cadastro: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel7: TQRLabel;
    LblData_Admissao: TQRLabel;
    QRLabel14: TQRLabel;
    LblData_Demissao: TQRLabel;
    QRLabel26: TQRLabel;
    LblCargo: TQRLabel;
    QRLabel33: TQRLabel;
    LblDepartamento: TQRLabel;
    QRShape2: TQRShape;
    LblCTPS_N: TQRLabel;
    QRLabel37: TQRLabel;
    LblCTPS_Serie: TQRLabel;
    QRLabel31: TQRLabel;
    LblTitulo_Numero: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape3: TQRShape;
    LblTitulo_Cidade: TQRLabel;
    QRLabel38: TQRLabel;
    LblTitulo_Zona: TQRLabel;
    QRLabel39: TQRLabel;
    LblSecao: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape4: TQRShape;
    QRLabel41: TQRLabel;
    LblMilitar_N: TQRLabel;
    QRLabel43: TQRLabel;
    LblMilitar_Serie: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape5: TQRShape;
    S: TQRLabel;
    QRLabel47: TQRLabel;
    LblMilitar_Categoria: TQRLabel;
    LblCNH_N: TQRLabel;
    QRLabel49: TQRLabel;
    LblCNH_Categoria: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape6: TQRShape;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    LblCNH_Cidade: TQRLabel;
    LblPIS_N: TQRLabel;
    QRLabel56: TQRLabel;
    LblPIS_Cadastro: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape7: TQRShape;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    LblPIS_Banco: TQRLabel;
    QRLabel62: TQRLabel;
    LblPIS_Codigo_Banco: TQRLabel;
    LblPIS_Codigo_Agencia: TQRLabel;
    QRLabel65: TQRLabel;
    LblPIS_Endereco_Agencia: TQRLabel;
    QRLabel67: TQRLabel;
    LblPai: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel68: TQRLabel;
    LblMae: TQRLabel;
    LblConjuge: TQRLabel;
    QRLabel72: TQRLabel;
    LblNaturalidade: TQRLabel;
    QRLabel71: TQRLabel;
    LblNacionalidade: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel70: TQRLabel;
    LblGrau_Instrucao: TQRLabel;
    LblComissao: TQRLabel;
    QRLabel75: TQRLabel;
    LblCPF: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    LblRG: TQRLabel;
    QRLabel28: TQRLabel;
    LblData_Emissao: TQRLabel;
    QRLabel29: TQRLabel;
    LblOrgao_Expedidor: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand5: TQRBand;
    QRSubDetail3: TQRSubDetail;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand6: TQRBand;
    QRSubDetail4: TQRSubDetail;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand7: TQRBand;
    QRSubDetail5: TQRSubDetail;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    LblTitulo_Secao: TQRLabel;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand8: TQRBand;
    LblObs: TQRLabel;
    QRLabel34: TQRLabel;
    ADOQuery1: TADOQuery;
    qryalteracao_salarial: TADOQuery;
    qryalteracao_salarialCodigo: TIntegerField;
    qryalteracao_salarialData: TDateTimeField;
    qryalteracao_salarialSalario: TFloatField;
    qryalteracao_cargo: TADOQuery;
    qryalteracao_cargoCodigo_Registro: TAutoIncField;
    qryalteracao_cargoCodigo: TIntegerField;
    qryalteracao_cargoData: TDateTimeField;
    qryalteracao_cargoCodigo_Cargo: TIntegerField;
    qryalteracao_cargoCargo: TStringField;
    qryferias: TADOQuery;
    qryferiasCodigo_Registro: TAutoIncField;
    qryferiasCodigo: TIntegerField;
    qryferiasFerias_De: TDateTimeField;
    qryferiasFerias_Ate: TDateTimeField;
    qryferiasPeriodo_De: TDateTimeField;
    qryferiasPeriodo_Ate: TDateTimeField;
    qrycontribuicao_social: TADOQuery;
    qrycontribuicao_socialCodigo_Registro: TAutoIncField;
    qrycontribuicao_socialCodigo: TIntegerField;
    qrycontribuicao_socialN_Guia: TStringField;
    qrycontribuicao_socialData: TDateTimeField;
    qrycontribuicao_socialSindicato: TStringField;
    qryocorrencia: TADOQuery;
    qryocorrenciaTipo_Ocorrencia: TStringField;
    qryocorrenciaCodigo: TAutoIncField;
    qryocorrenciaCodigo_Funcionario: TIntegerField;
    qryocorrenciaCodigo_Tipo_Ocorrencia: TIntegerField;
    qryocorrenciaData_Ocorrencia: TDateTimeField;
    qryocorrenciaData_Cadastro: TDateTimeField;
    qryocorrenciaObservacao: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Ficha_Funcionario: TFrmRel_Ficha_Funcionario;

implementation

uses UDM, UCadastro_Funcionarios, UGeral;

{$R *.dfm}

procedure TFrmRel_Ficha_Funcionario.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Ficha_Funcionario.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with qryalteracao_salarial, sql do
  begin
    close;
    Connection:= FrmCadastro_Funcionarios.Conexao;
    clear;
    add('select * from Funcionario_Alteracao_Salarial where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Funcionarios.EdtCodigo.Text);
    open;
  end;

  with qryalteracao_cargo, sql do
  begin
    close;
    Connection:= FrmCadastro_Funcionarios.Conexao;
    clear;
    add('select * from Funcionario_Alteracao_Cargo where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Funcionarios.EdtCodigo.Text);
    open;
  end;

  with qrycontribuicao_social, sql do
  begin
    close;
    Connection:= FrmCadastro_Funcionarios.Conexao;
    clear;
    add('select * from Funcionario_Contribuicao_Social where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Funcionarios.EdtCodigo.Text);
    open;
  end;

  with qryferias, sql do
  begin
    close;
    Connection:= FrmCadastro_Funcionarios.Conexao;
    clear;
    add('select * from Funcionario_Ferias where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Funcionarios.EdtCodigo.Text);
    open;
  end;

  with qryocorrencia, sql do
  begin
    close;
    Connection:= FrmCadastro_Funcionarios.Conexao;
    clear;
    add('select O.* from Ocorrencia O');
    add('where O.Codigo_Funcionario = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Funcionarios.EdtCodigo.Text);
    open;
  end;
  {with ADOQuery1, sql do
  begin
    close;
    Connection:= FrmCadastro_Funcionarios.Conexao;
    clear;
    add('select * from Funcionario where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Funcionarios.EdtCodigo.Text);
    open;
  end;}

  LblNome.Caption:= FrmCadastro_Funcionarios.EdtNome.Text;
  LblEndereco.Caption:= FrmCadastro_Funcionarios.EdtEndereco.Text + ', ' + FrmCadastro_Funcionarios.EdtNumero.Text + ', ' + FrmCadastro_Funcionarios.EdtSetor.Text;
  LblCidade.Caption:= FrmCadastro_Funcionarios.EdtCidade.Text;
  LblTelefone.Caption:= FrmCadastro_Funcionarios.MEdtTelefone.Text;
  LblCelular.Caption:= FrmCadastro_Funcionarios.MEdtCelular.Text;
  LblEstado_Civil.Caption:= FrmCadastro_Funcionarios.CmbEstado_Civil.Text;
  LblEmail.Caption:= FrmCadastro_Funcionarios.EdtEmail.Text;
  LblCargo.Caption:= FrmCadastro_Funcionarios.EdtCargo.Text;
  LblDepartamento.Caption:= FrmCadastro_Funcionarios.EdtDepartamento.Text;

  LblData_Cadastro.Caption:= FrmCadastro_Funcionarios.MEdtData_Cadastro.Text;
  LblData_Nascimento.Caption:= FrmCadastro_Funcionarios.MEdtData_Nascimento.Text;
  LblData_Admissao.Caption:= FrmCadastro_Funcionarios.MEdtData_Admissao.Text;
  LblData_Demissao.Caption:= FrmCadastro_Funcionarios.MEdtData_Demissao.Text;
  LblSalario.Caption:= FrmCadastro_Funcionarios.EdtSalario.Text;
  LblComissao.Caption:= FrmCadastro_Funcionarios.EdtComissao_Produto.Text;

  LblCPF.Caption:= FrmCadastro_Funcionarios.EdtCPF.Text;
  LblRG.Caption:= FrmCadastro_Funcionarios.EdtRG.Text;
  LblOrgao_Expedidor.Caption:= FrmCadastro_Funcionarios.EdtOrgao_Expedidor.Text;
  LblData_Emissao.Caption:= FrmCadastro_Funcionarios.EdtData_Emissao.Text;

  LblPai.Caption:= FrmCadastro_Funcionarios.EdtNome_Pai.Text;
  LblMae.Caption:= FrmCadastro_Funcionarios.EdtNome_Mae.Text;
  LblConjuge.Caption:= FrmCadastro_Funcionarios.EdtNome_Conjuge.Text;
  LblNaturalidade.Caption:= FrmCadastro_Funcionarios.EdtNaturalidade.Text;
  LblNacionalidade.Caption:= FrmCadastro_Funcionarios.EdtNacionalidade.Text;
  LblGrau_Instrucao.Caption:= FrmCadastro_Funcionarios.EdtGrau_Instrucao.Text;

  LblCTPS_N.Caption:= FrmCadastro_Funcionarios.EdtCTPS_N.Text;
  LblCTPS_Serie.Caption:= FrmCadastro_Funcionarios.EdtCTPS_Serie.Text;

  LblTitulo_Numero.Caption:= FrmCadastro_Funcionarios.EdtTitulo_N.Text;
  LblTitulo_Cidade.Caption:= FrmCadastro_Funcionarios.EdtTitulo_Cidade.Text;
  LblTitulo_Zona.Caption:= FrmCadastro_Funcionarios.EdtTitulo_Zona.Text;
  LblTitulo_Secao.Caption:= FrmCadastro_Funcionarios.EdtTitulo_Secao.Text;

  LblMilitar_N.Caption:= FrmCadastro_Funcionarios.EdtCertificado_Militar_N.Text;
  LblMilitar_Serie.Caption:= FrmCadastro_Funcionarios.EdtCertificado_Militar_Serie.Text;
  LblMilitar_Categoria.Caption:= FrmCadastro_Funcionarios.EdtCertificado_Militar_Categoria.Text;

  LblCNH_N.Caption:= FrmCadastro_Funcionarios.EdtCNH_N.Text;
  LblCNH_Categoria.Caption:= FrmCadastro_Funcionarios.EdtCNH_Categoria.Text;
  LblCNH_Cidade.Caption:= FrmCadastro_Funcionarios.EdtCNH_Cidade.Text;

  LblPIS_N.Caption:= FrmCadastro_Funcionarios.EdtPIS_N.Text;
  LblPIS_Cadastro.Caption:= FrmCadastro_Funcionarios.MEdtPIS_Cadastro.Text;
  LblPIS_Banco.Caption:= FrmCadastro_Funcionarios.EdtPIS_Banco.Text;
  LblPIS_Codigo_Banco.Caption:= FrmCadastro_Funcionarios.EdtPIS_Codigo_Banco.Text;
  LblPIS_Codigo_Agencia.Caption:= FrmCadastro_Funcionarios.EdtPIS_Codigo_Agencia.Text;
  LblPIS_Endereco_Agencia.Caption:= FrmCadastro_Funcionarios.EdtPIS_Endereco_Agencia.Text;
  LblObs.Caption:= FrmCadastro_Funcionarios.MmoObservacoes.Text;

end;

end.
