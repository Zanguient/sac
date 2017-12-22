unit Modelo.DAO.EntradaProdutosTEntradas;

interface

uses
  Entidade.TEntradas, Modelo.Entidade.ComandosSQL, Modelo.Dominio.ComandosSQL,
  ADODB;
  type
    TEntradasDAO = class
      private
        FComando: TComandoSQLEntidade;
        FComandoSQLDom: TComandoSQLDominio;
        Conexao: TADOConnection;
      public
        function gravar(FEntradas: TEntradasEntidade): boolean;
        function alterar(FEntradas: TEntradasEntidade): boolean;
        function remover(CodigoEntrada: integer): boolean;
        function VerificaNotaFinalizada(CodigoNota: integer): Boolean;
        constructor Create(var Conexao: TADOConnection);
    end;
implementation

{ TEntradasDAO }

function TEntradasDAO.alterar(FEntradas: TEntradasEntidade): boolean;
var
  comando: AnsiString;
begin
  comando:=
          'Update Entrada_Produtos set N_Nota_Fiscal = :N_Nota_Fiscal, Modelo = :Modelo, Serie = :Serie,'+
          'Data_Emissao = :Data_Emissao, Hora_Emissao = :Hora_Emissao, Data_Entrada = :Data_Entrada,'+
          'Hora_Entrada = :Hora_Entrada, Tipo_Frete = :Tipo_Frete, Tipo_Pagamento = :Tipo_Pagamento,'+
          'Codigo_Fornecedor = :Codigo_Fornecedor, Codigo_CFOP = :Codigo_CFOP,'+
          'Codigo_Empresa = :Codigo_Empresa, Quantidade_Itens = :Quantidade_Itens, Observacao = :Observacao,'+
          'Codigo_Funcionario = :Codigo_Funcionario, Chave_NFe_Entrada = :Chave_NFe_Entrada, Caixa_ECF = :Caixa_ECF, Finalizada = :Finalizada '+
          'where Codigo = :Codigo';
  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('N_Nota_Fiscal');
  FComando.Parametros.Add('Modelo');
  FComando.Parametros.Add('Serie');
  FComando.Parametros.Add('Data_Emissao');
  FComando.Parametros.Add('Hora_Emissao');
  FComando.Parametros.Add('Data_Entrada');
  FComando.Parametros.Add('Hora_Entrada');
  FComando.Parametros.Add('Tipo_Frete');
  FComando.Parametros.Add('Tipo_Pagamento');
  FComando.Parametros.Add('Codigo_Fornecedor');
  FComando.Parametros.Add('Codigo_CFOP');
  FComando.Parametros.Add('Codigo_Empresa');
  FComando.Parametros.Add('Quantidade_Itens');
  FComando.Parametros.Add('Observacao');
  FComando.Parametros.Add('Codigo_Funcionario');
  FComando.Parametros.Add('Chave_NFe_Entrada');
  FComando.Parametros.Add('Caixa_ECF');
  FComando.Parametros.Add('Finalizada');
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(FEntradas.N_Nota_Fiscal);
  FComando.Valores.Add(FEntradas.Modelo);
  FComando.Valores.Add(FEntradas.Serie);
  FComando.Valores.Add(FEntradas.Data_Emissao);
  FComando.Valores.Add(FEntradas.Hora_Emissao);
  FComando.Valores.Add(FEntradas.Data_Entrada);
  FComando.Valores.Add(FEntradas.Hora_Entrada);
  FComando.Valores.Add(FEntradas.Tipo_Frete);
  FComando.Valores.Add(FEntradas.Tipo_Pagamento);
  FComando.Valores.Add(FEntradas.Codigo_Fornecedor);
  FComando.Valores.Add(FEntradas.Codigo_CFOP);
  FComando.Valores.Add(FEntradas.Codigo_Empresa);
  FComando.Valores.Add(FEntradas.Quantidade_Itens);
  FComando.Valores.Add(FEntradas.Observacao);
  FComando.Valores.Add(FEntradas.Codigo_Funcionario);
  FComando.Valores.Add(FEntradas.Chave_NFe_Entrada);
  FComando.Valores.Add(FEntradas.Caixa_ECF);
  FComando.Valores.Add(FEntradas.Finalizada);
  FComando.Valores.Add(FEntradas.Codigo);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

constructor TEntradasDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
end;

function TEntradasDAO.gravar(FEntradas: TEntradasEntidade): boolean;
var
  comando: AnsiString;
begin
  comando:=
          'Insert into Entrada_Produtos (Codigo, N_Nota_Fiscal, Modelo, Serie, Data_Emissao, Hora_Emissao, Data_Entrada,'+
          'Hora_Entrada, Tipo_Frete, Tipo_Pagamento, Codigo_Fornecedor, Codigo_CFOP, Codigo_Empresa, Quantidade_Itens, Observacao, Status, Codigo_Funcionario,Chave_NFe_Entrada, Caixa_ECF, Finalizada)'+
          'values (:Codigo, :N_Nota_Fiscal, :Modelo, :Serie, :Data_Emissao, :Hora_Emissao, :Data_Entrada,'+
          ':Hora_Entrada, :Tipo_Frete, :Tipo_Pagamento, :Codigo_Fornecedor, :Codigo_CFOP, :Codigo_Empresa, :Quantidade_Itens, :Observacao, :Status, :Codigo_Funcionario, :Chave_NFe_Entrada, :Caixa_ECF, :Finalizada)';
  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Parametros.Add('N_Nota_Fiscal');
  FComando.Parametros.Add('Modelo');
  FComando.Parametros.Add('Serie');
  FComando.Parametros.Add('Data_Emissao');
  FComando.Parametros.Add('Hora_Emissao');
  FComando.Parametros.Add('Data_Entrada');
  FComando.Parametros.Add('Hora_Entrada');
  FComando.Parametros.Add('Tipo_Frete');
  FComando.Parametros.Add('Tipo_Pagamento');
  FComando.Parametros.Add('Codigo_Fornecedor');
  FComando.Parametros.Add('Codigo_CFOP');
  FComando.Parametros.Add('Codigo_Empresa');
  FComando.Parametros.Add('Quantidade_Itens');
  FComando.Parametros.Add('Observacao');
  FComando.Parametros.Add('Status');
  FComando.Parametros.Add('Codigo_Funcionario');
  FComando.Parametros.Add('Chave_NFe_Entrada');
  FComando.Parametros.Add('Caixa_ECF');
  FComando.Parametros.Add('Finalizada');
  FComando.Valores.Add(FEntradas.Codigo);
  FComando.Valores.Add(FEntradas.N_Nota_Fiscal);
  FComando.Valores.Add(FEntradas.Modelo);
  FComando.Valores.Add(FEntradas.Serie);
  FComando.Valores.Add(FEntradas.Data_Emissao);
  FComando.Valores.Add(FEntradas.Hora_Emissao);
  FComando.Valores.Add(FEntradas.Data_Entrada);
  FComando.Valores.Add(FEntradas.Hora_Entrada);
  FComando.Valores.Add(FEntradas.Tipo_Frete);
  FComando.Valores.Add(FEntradas.Tipo_Pagamento);
  FComando.Valores.Add(FEntradas.Codigo_Fornecedor);
  FComando.Valores.Add(FEntradas.Codigo_CFOP);
  FComando.Valores.Add(FEntradas.Codigo_Empresa);
  FComando.Valores.Add(FEntradas.Quantidade_Itens);
  FComando.Valores.Add(FEntradas.Observacao);
  FComando.Valores.Add(FEntradas.Status);
  FComando.Valores.Add(FEntradas.Codigo_Funcionario);
  FComando.Valores.Add(FEntradas.Chave_NFe_Entrada);
  FComando.Valores.Add(FEntradas.Caixa_ECF);
  FComando.Valores.Add(FEntradas.Finalizada);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

function TEntradasDAO.remover(CodigoEntrada: integer): boolean;
var
  comando: AnsiString;
begin
  comando:=
          'Delete from Entrada_Produtos where Codigo = :Codigo';
  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(CodigoEntrada);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

function TEntradasDAO.VerificaNotaFinalizada(CodigoNota: integer): Boolean;
var
  comando: AnsiString;
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  qAux.Connection:= Conexao;
  comando:= 'Select EP.Finalizada from Entrada_Produtos EP where Codigo = :Codigo ';
  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(CodigoNota);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLRetornaADOQuery(qAux);
  qAux.Open;

  if (qAux.IsEmpty = False) then
  begin
    if (qAux.FieldByName('Finalizada').AsInteger = 0) then
      Result:= True
    else
      Result:= False;
  end
  else
  begin
    Result:= false;
  end;
end;

end.
