unit UChama_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Funcionario = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_funcionario: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_usuario: TADOQuery;
    qrychama_usuarioCodigo: TIntegerField;
    qrychama_usuarioNome: TStringField;
    qrychama_usuarioLogin: TStringField;
    qrychama_usuarioSenha: TStringField;
    qrychama_usuarioAdministrador: TStringField;
    qrychama_usuarioCodigo_Perfil: TIntegerField;
    qrychama_usuarioData_Cadastro: TDateTimeField;
    qrychama_usuarioPerfil: TStringField;
    qrychama_usuarioAtualiza_Preco_Orcamento: TStringField;
    qrychama_outros: TADOQuery;
    qrychama_outrosCodigo: TIntegerField;
    qrychama_outrosData_Admissao: TDateTimeField;
    qrychama_outrosData_Demissao: TDateTimeField;
    qrychama_outrosCTPS_N: TStringField;
    qrychama_outrosCTPS_Serie: TStringField;
    qrychama_outrosTitulo_N: TStringField;
    qrychama_outrosTitulo_Cidade: TStringField;
    qrychama_outrosTitulo_Zona: TStringField;
    qrychama_outrosTitulo_Secao: TStringField;
    qrychama_outrosCertificado_Militar_N: TStringField;
    qrychama_outrosCertificado_Militar_Serie: TStringField;
    qrychama_outrosCertificado_Militar_Categoria: TStringField;
    qrychama_outrosNome_Pai: TStringField;
    qrychama_outrosNome_Mae: TStringField;
    qrychama_outrosNacionalidade: TStringField;
    qrychama_outrosNaturalidade: TStringField;
    qrychama_outrosConjuge: TStringField;
    qrychama_outrosGrau_Instrucao: TStringField;
    qrychama_outrosCNH_N: TStringField;
    qrychama_outrosCNH_Categoria: TStringField;
    qrychama_outrosCNH_Cidade: TStringField;
    qrychama_outrosPIS_N: TStringField;
    qrychama_outrosPIS_Data_Cadastro: TDateTimeField;
    qrychama_outrosPIS_Banco: TStringField;
    qrychama_outrosPIS_Codigo_Banco: TStringField;
    qrychama_outrosPIS_Codigo_Agencia: TStringField;
    qrychama_outrosPIS_Endereco_Agencia: TStringField;
    qrychama_funcionarioCodigo: TIntegerField;
    qrychama_funcionarioCodigo_Empresa: TIntegerField;
    qrychama_funcionarioNome: TStringField;
    qrychama_funcionarioCPF: TStringField;
    qrychama_funcionarioRG: TStringField;
    qrychama_funcionarioOrgao_Expedidor: TStringField;
    qrychama_funcionarioData_Emissao_RG: TDateTimeField;
    qrychama_funcionarioSalario: TFloatField;
    qrychama_funcionarioComissao: TFloatField;
    qrychama_funcionarioDesconto: TFloatField;
    qrychama_funcionarioNumero: TStringField;
    qrychama_funcionarioReferencia: TStringField;
    qrychama_funcionarioCodigo_Setor: TIntegerField;
    qrychama_funcionarioCodigo_Cidade: TIntegerField;
    qrychama_funcionarioCodigo_Cargo: TIntegerField;
    qrychama_funcionarioCodigo_Departamento: TIntegerField;
    qrychama_funcionarioTelefone: TStringField;
    qrychama_funcionarioCelular: TStringField;
    qrychama_funcionarioContato: TStringField;
    qrychama_funcionarioTelefone_Contato: TStringField;
    qrychama_funcionarioEmail: TStringField;
    qrychama_funcionarioData_Nascimento: TDateTimeField;
    qrychama_funcionarioEstado_Civil: TStringField;
    qrychama_funcionarioData_Cadastro: TDateTimeField;
    qrychama_funcionarioObservacoes: TStringField;
    qrychama_funcionarioComissao_Servico: TFloatField;
    qrychama_funcionarioEndereco: TStringField;
    qrychama_funcionarioCEP: TStringField;
    qrychama_funcionarioCidade: TStringField;
    qrychama_funcionarioUF: TStringField;
    qrychama_funcionarioSetor: TStringField;
    qrychama_funcionarioCargo: TStringField;
    qrychama_funcionarioDepartamento: TStringField;
    qrychama_usuarioSaldo_Atual: TFloatField;
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
  FrmChama_Funcionario: TFrmChama_Funcionario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCompra, UMovimentacao_Manual,
  UFolha_Pagamento, UConsulta_Folha_Pagamento, UOS, UCadastro_Funcionarios,
  UConsulta_Venda, UCotacao_Preco_Produto, URetorno_Cotacao,
  UConsulta_Cotacao_Preco_Produto, UConsulta_Retorno_Cotacao_Preco,
  UConsulta_Comissao, UConsulta_OS, UOcorrencia, UConsulta_Ocorrencia,
  UConsulta_Ficha_Funcionario, UPedido_Venda, Conexao.TConexao;

{$R *.dfm}

procedure TFrmChama_Funcionario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Funcionario.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Funcionario(EdtConsulta.Text);
end;

procedure TFrmChama_Funcionario.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Funcionarios <> NIL) and (FrmCadastro_Funcionarios.ativo = true) then
    begin
      FrmCadastro_Funcionarios.EdtCodigo.Text:= qrychama_funcionarioCodigo.AsString;
      FrmCadastro_Funcionarios.EdtNome.Text:= qrychama_funcionarioNome.AsString;
      FrmCadastro_Funcionarios.EdtCPF.Text:= qrychama_funcionarioCPF.AsString;
      FrmCadastro_Funcionarios.EdtRG.Text:= qrychama_funcionarioRG.AsString;
      FrmCadastro_Funcionarios.EdtOrgao_Expedidor.Text:= qrychama_funcionarioOrgao_Expedidor.AsString;

      if (qrychama_funcionarioData_Emissao_RG.AsString = '30/12/1899') then
        FrmCadastro_Funcionarios.EdtData_Emissao.Clear
      else
        FrmCadastro_Funcionarios.EdtData_Emissao.Text:= qrychama_funcionarioData_Emissao_RG.AsString;

      FrmCadastro_Funcionarios.EdtSalario.Text:= FormatFloat('#0.0,0', qrychama_funcionarioSalario.AsFloat);
      FrmCadastro_Funcionarios.EdtSalario.Text:= StringReplace(FrmCadastro_Funcionarios.EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmCadastro_Funcionarios.EdtComissao_Produto.Text:= FormatFloat('#0.0,0', qrychama_funcionarioComissao.AsFloat);
      FrmCadastro_Funcionarios.EdtComissao_Produto.Text:= StringReplace(FrmCadastro_Funcionarios.EdtComissao_Produto.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmCadastro_Funcionarios.EdtComissao_Servico.Text:= FormatFloat('#0.0,0', qrychama_funcionarioComissao_Servico.AsFloat);
      FrmCadastro_Funcionarios.EdtComissao_Servico.Text:= StringReplace(FrmCadastro_Funcionarios.EdtComissao_Servico.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmCadastro_Funcionarios.EdtDesconto.Text:= FormatFloat('#0.0,0', qrychama_funcionarioDesconto.AsFloat);
      FrmCadastro_Funcionarios.EdtDesconto.Text:= StringReplace(FrmCadastro_Funcionarios.EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmCadastro_Funcionarios.EdtEndereco.Text:= qrychama_funcionarioEndereco.AsString;
      FrmCadastro_Funcionarios.EdtCEP.Text:= qrychama_funcionarioCEP.AsString;

      FrmCadastro_Funcionarios.EdtNumero.Text:= qrychama_funcionarioNumero.AsString;
      FrmCadastro_Funcionarios.EdtReferencia.Text:= qrychama_funcionarioReferencia.AsString;

      if (qrychama_funcionarioCodigo_Setor.AsString = '0') then
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Setor.Text:= '';
          FrmCadastro_Funcionarios.EdtSetor.Text:= '';
        end
        else
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Setor.Text:= qrychama_funcionarioCodigo_Setor.AsString;
          FrmCadastro_Funcionarios.EdtSetor.Text:= qrychama_funcionarioSetor.AsString;
        end;

      if (qrychama_funcionarioCodigo_Cidade.AsString = '0') then
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Cidade.Text:= '';
          FrmCadastro_Funcionarios.EdtCidade.Text:= '';
          FrmCadastro_Funcionarios.EdtUF.Text:= '';
        end
        else
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Cidade.Text:= qrychama_funcionarioCodigo_Cidade.AsString;
          FrmCadastro_Funcionarios.EdtCidade.Text:= qrychama_funcionarioCidade.AsString;
          FrmCadastro_Funcionarios.EdtUF.Text:= qrychama_funcionarioUF.AsString;
        end;

      if (qrychama_funcionarioCodigo_Cargo.AsString = '0') then
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Cargo.Text:= '';
          FrmCadastro_Funcionarios.EdtCargo.Text:= '';
        end
        else
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Cargo.Text:= qrychama_funcionarioCodigo_Cargo.AsString;
          FrmCadastro_Funcionarios.EdtCargo.Text:= qrychama_funcionarioCargo.AsString;
        end;

      if (qrychama_funcionarioCodigo_Departamento.AsString = '0') then
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Departamento.Text:= '';
          FrmCadastro_Funcionarios.EdtDepartamento.Text:= '';
        end
        else
        begin
          FrmCadastro_Funcionarios.EdtCodigo_Departamento.Text:= qrychama_funcionarioCodigo_Departamento.AsString;
          FrmCadastro_Funcionarios.EdtDepartamento.Text:= qrychama_funcionarioDepartamento.AsString;
        end;

      FrmCadastro_Funcionarios.MEdtTelefone.Text:= qrychama_funcionarioTelefone.AsString;
      FrmCadastro_Funcionarios.MEdtCelular.Text:= qrychama_funcionarioCelular.AsString;
      FrmCadastro_Funcionarios.EdtContato.Text:= qrychama_funcionarioContato.AsString;
      FrmCadastro_Funcionarios.MEdtTelefone_Contato.Text:= qrychama_funcionarioTelefone_Contato.AsString;
      FrmCadastro_Funcionarios.EdtEmail.Text:= qrychama_funcionarioEmail.AsString;
      if (qrychama_funcionarioData_Cadastro.AsString = '30/12/1899') then
        FrmCadastro_Funcionarios.MEdtData_Cadastro.Clear
      else
        FrmCadastro_Funcionarios.MEdtData_Cadastro.Text:= qrychama_funcionarioData_Cadastro.AsString;

      FrmCadastro_Funcionarios.CmbEstado_Civil.Text:= qrychama_funcionarioEstado_Civil.AsString;

      if (qrychama_funcionarioData_Nascimento.AsString = '30/12/1899') then
        FrmCadastro_Funcionarios.MEdtData_Nascimento.Clear
      else
        FrmCadastro_Funcionarios.MEdtData_Nascimento.Text:= qrychama_funcionarioData_Nascimento.AsString;

      FrmCadastro_Funcionarios.MmoObservacoes.Text:= qrychama_funcionarioObservacoes.AsString;

      Consulta.Chama_Usuario_Funcionario;
      FrmCadastro_Funcionarios.EdtLogin.Text:= qrychama_usuarioLogin.AsString;
      FrmCadastro_Funcionarios.EdtSenha.Text:= qrychama_usuarioSenha.AsString;
      FrmCadastro_Funcionarios.EdtCodigo_Perfil.Text:= qrychama_usuarioCodigo_Perfil.AsString;
      FrmCadastro_Funcionarios.EdtPerfil.Text:= qrychama_usuarioPerfil.AsString;
      FrmCadastro_Funcionarios.EdtSaldo_Atual.Text:= qrychama_usuarioSaldo_Atual.AsString;

      if (qrychama_usuarioAdministrador.AsString = 'SIM') then
        FrmCadastro_Funcionarios.CBADM.Checked:= true
      else
        FrmCadastro_Funcionarios.CBADM.Checked:= false;

      if (qrychama_usuarioAtualiza_Preco_Orcamento.AsString = 'SIM') then
        FrmCadastro_Funcionarios.CBAtualiza_Preco_Orcamento.Checked:= true
      else
        FrmCadastro_Funcionarios.CBAtualiza_Preco_Orcamento.Checked:= false;


      FrmCadastro_Funcionarios.Conexao:= TConexao.NovaConexao(FrmCadastro_Funcionarios.Conexao);
      TConexao.IniciaQuerys([FrmCadastro_Funcionarios.qryalteracao_salarial, FrmCadastro_Funcionarios.qryalteracao_cargo, FrmCadastro_Funcionarios.qryferias, FrmCadastro_Funcionarios.qryocorrencia, FrmCadastro_Funcionarios.qrycontribuicao_social], FrmCadastro_Funcionarios.Conexao);

      Consulta.Chama_Funcionario_Outros;
      FrmCadastro_Funcionarios.MEdtData_Admissao.Text:= qrychama_outrosData_Admissao.AsString;
      FrmCadastro_Funcionarios.MEdtData_Demissao.Text:= qrychama_outrosData_Demissao.AsString;
      FrmCadastro_Funcionarios.EdtCTPS_N.Text:= qrychama_outrosCTPS_N.AsString;
      FrmCadastro_Funcionarios.EdtCTPS_Serie.Text:= qrychama_outrosCTPS_Serie.AsString;
      FrmCadastro_Funcionarios.EdtTitulo_N.Text:= qrychama_outrosTitulo_N.AsString;
      FrmCadastro_Funcionarios.EdtTitulo_Cidade.Text:= qrychama_outrosTitulo_Cidade.AsString;
      FrmCadastro_Funcionarios.EdtTitulo_Zona.Text:= qrychama_outrosTitulo_Zona.AsString;
      FrmCadastro_Funcionarios.EdtTitulo_Secao.Text:= qrychama_outrosTitulo_Secao.AsString;
      FrmCadastro_Funcionarios.EdtCertificado_Militar_N.Text:= qrychama_outrosCertificado_Militar_N.AsString;
      FrmCadastro_Funcionarios.EdtCertificado_Militar_Serie.Text:= qrychama_outrosCertificado_Militar_Serie.AsString;
      FrmCadastro_Funcionarios.EdtCertificado_Militar_Categoria.Text:= qrychama_outrosCertificado_Militar_Categoria.AsString;
      FrmCadastro_Funcionarios.EdtNome_Pai.Text:= qrychama_outrosNome_Pai.AsString;
      FrmCadastro_Funcionarios.EdtNome_Mae.Text:= qrychama_outrosNome_Mae.AsString;
      FrmCadastro_Funcionarios.EdtNacionalidade.Text:= qrychama_outrosNacionalidade.AsString;
      FrmCadastro_Funcionarios.EdtNaturalidade.Text:= qrychama_outrosNaturalidade.AsString;
      FrmCadastro_Funcionarios.EdtNome_Conjuge.Text:= qrychama_outrosConjuge.AsString;
      FrmCadastro_Funcionarios.EdtGrau_Instrucao.Text:= qrychama_outrosGrau_Instrucao.AsString;
      FrmCadastro_Funcionarios.EdtCNH_N.Text:= qrychama_outrosCNH_N.AsString;
      FrmCadastro_Funcionarios.EdtCNH_Categoria.Text:= qrychama_outrosCNH_Categoria.AsString;
      FrmCadastro_Funcionarios.EdtCNH_Cidade.Text:= qrychama_outrosCNH_Cidade.AsString;
      FrmCadastro_Funcionarios.EdtPIS_N.Text:= qrychama_outrosPIS_N.AsString;
      FrmCadastro_Funcionarios.MEdtPIS_Cadastro.Text:= qrychama_outrosPIS_Data_Cadastro.AsString;
      FrmCadastro_Funcionarios.EdtPIS_Banco.Text:= qrychama_outrosPIS_Banco.AsString;
      FrmCadastro_Funcionarios.EdtPIS_Codigo_Banco.Text:= qrychama_outrosPIS_Codigo_Banco.AsString;
      FrmCadastro_Funcionarios.EdtPIS_Codigo_Agencia.Text:= qrychama_outrosPIS_Codigo_Agencia.AsString;
      FrmCadastro_Funcionarios.EdtPIS_Endereco_Agencia.Text:= qrychama_outrosPIS_Endereco_Agencia.AsString;

      //if (FrmCadastro_Funcionarios.Conexao.InTransaction = false) then
        //FrmCadastro_Funcionarios.Cria_Conexao;

      Consulta.Chama_Cargo_LookUp(FrmCadastro_Funcionarios.Conexao);
      Consulta.Chama_Tipo_Ocorrencia_LookUp(FrmCadastro_Funcionarios.Conexao);
      Consulta.Chama_Funcionario_LookUp(FrmCadastro_Funcionarios.Conexao);
      FrmCadastro_Funcionarios.Pega_Alteracao_Salarial;
      FrmCadastro_Funcionarios.Pega_Alteracao_Cargo;
      FrmCadastro_Funcionarios.Pega_Ferias;
      FrmCadastro_Funcionarios.Pega_Ocorrencias;
      FrmCadastro_Funcionarios.Pega_Contribuicao;

      FrmChama_Funcionario.Close;
      FrmCadastro_Funcionarios.BBtnSalvar.Enabled:= true;
      FrmCadastro_Funcionarios.BBtnExcluir.Enabled:= true;
      FrmCadastro_Funcionarios.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Funcionarios.BBtnCancelar.Enabled:= true;
      FrmCadastro_Funcionarios.BBtnImprimir.Enabled:= true;
      FrmCadastro_Funcionarios.BBtnNovo.Enabled:= False;
      Util.Habilita_Campos(FrmCadastro_Funcionarios);
      FrmCadastro_Funcionarios.achei:= true;
    end
    else if (FrmCompra <> Nil) and (FrmCompra.ativo = true) then
    begin
      FrmCompra.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmCompra.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmMovimentacao_Manual <> Nil) and (FrmMovimentacao_Manual.ativo = true) then
    begin
      FrmMovimentacao_Manual.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmMovimentacao_Manual.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmFolha_Pagamento <> Nil) and (FrmFolha_Pagamento.ativo = true) then
    begin
      FrmFolha_Pagamento.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmFolha_Pagamento.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;

      FrmFolha_Pagamento.LblCPF.Caption:= qrychama_funcionarioCPF.AsString;
      FrmFolha_Pagamento.LblCidade.Caption:= qrychama_funcionarioCidade.AsString;
      FrmFolha_Pagamento.LblSetor.Caption:= qrychama_funcionarioSetor.AsString;
      FrmFolha_Pagamento.LblEndereco.Caption:= qrychama_funcionarioEndereco.AsString;
      FrmFolha_Pagamento.LblUF.Caption:= qrychama_funcionarioUF.AsString;
      FrmFolha_Pagamento.LblNumero.Caption:= qrychama_funcionarioNumero.AsString;
      FrmFolha_Pagamento.LblTelefone.Caption:= qrychama_funcionarioTelefone.AsString;

      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_Folha_Pagamento <> Nil) and (FrmConsulta_Folha_Pagamento.ativo = true) then
    begin
      FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_Folha_Pagamento.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmOS <> Nil) and (FrmOS.ativo = true) then
    begin
      FrmOS.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmOS.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_Venda <> NIl) and (FrmConsulta_Venda.ativo = true) then
    begin
      FrmConsulta_Venda.EdtCodigo.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_Venda.EdtConsulta.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmCotacao_Preco_Produto <> Nil) and (FrmCotacao_Preco_Produto.ativo = true) then
    begin
      FrmCotacao_Preco_Produto.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmCotacao_Preco_Produto.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmRetorno_Cotacao <> Nil) and (FrmRetorno_Cotacao.ativo = true) then
    begin
      FrmRetorno_Cotacao.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmRetorno_Cotacao.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto <> Nil) and (FrmConsulta_Cotacao_Preco_Produto.ativo = true) then
    begin
      FrmConsulta_Cotacao_Preco_Produto.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_Cotacao_Preco_Produto.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco <> Nil) and (FrmConsulta_Retorno_Cotacao_Preco.ativo = true) then
    begin
      FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_Retorno_Cotacao_Preco.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_Comissao <> Nil) and (FrmConsulta_Comissao.ativo = true) then
    begin
      FrmConsulta_Comissao.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_Comissao.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_OS <> Nil) and (FrmConsulta_OS.ativo = true) then
    begin
      FrmConsulta_OS.EdtCodigo_Cliente.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_OS.EdtCliente.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmOcorrencia <> Nil) and (FrmOcorrencia.ativo = true) then
    begin
      FrmOcorrencia.EdtCodigo_Funcionario.Text:= qrychama_funcionarioCodigo.AsString;
      FrmOcorrencia.EdtFuncionario.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_Ocorrencia <> Nil) and (FrmConsulta_Ocorrencia.ativo = true) then
    begin
      FrmConsulta_Ocorrencia.EdtCodigo.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_Ocorrencia.EdtConsulta.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmConsulta_Ficha_Funcionario <> Nil) and (FrmConsulta_Ficha_Funcionario.ativo = true) then
    begin
      FrmConsulta_Ficha_Funcionario.EdtCodigo.Text:= qrychama_funcionarioCodigo.AsString;
      FrmConsulta_Ficha_Funcionario.EdtDescricao.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end
    else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) then
    begin
      FrmPedido_Venda.EdtCodigo_Atendente.Text:= qrychama_funcionarioCodigo.AsString;
      FrmPedido_Venda.EdtAtendente.Text:= qrychama_funcionarioNome.AsString;
      FrmChama_Funcionario.Close;
    end;
end;

procedure TFrmChama_Funcionario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Funcionario.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Funcionario.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Funcionario(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Funcionario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Funcionario.Release;
end;

procedure TFrmChama_Funcionario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.

