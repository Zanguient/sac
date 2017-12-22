unit UConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ToolWin, ComCtrls, Buttons, IniFiles, DB, DBTables,
  StdCtrls, Mask, DBCtrls, Grids, ADODB, Modelo.Entidade.TLancamentoFinanceiroEntidade;

type
  TConsulta = class
    public
      procedure Consulta_OS_Agrupado_Grupo;
      procedure Chama_Configuracao_ECF;
      procedure Consulta_Ficha_Cliente;
      procedure Consulta_Patrimonio;
      procedure Chama_Patrimonio;
      procedure Chama_Tipo_Bem_Patrimonial;
      procedure Chama_Status_OS(var Conexao: TADOConnection);
      procedure Chama_Cargo_LookUp(var Conexao: TADOConnection);
      procedure Chama_Tipo_Ocorrencia_LookUp(var Conexao: TADOConnection);
      procedure Chama_Funcionario_LookUp(var Conexao: TADOConnection);
      procedure Chama_Status(descricao: string);
      procedure Chama_Tipo_Ocorrencia;
      procedure Chama_Ocorrencia;
      procedure Consulta_Lancamento_Financeiro_Pagar_Agrupado;
      procedure Consulta_Lancamento_Financeiro_Receber_Agrupado;

      procedure Consulta_Lancamento_Financeiro_Agrupado_PF;
      procedure Consulta_Lancamento_Financeiro_Agrupado_Cli_Forn;
      procedure Consulta_Lancamento_Financeiro_Agrupado_Departamento;
      procedure Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento;
      procedure Chama_Logradouro(descricao: string);
      procedure Chama_Cidade(descricao: string);
      procedure Chama_DAV_Converter(descricao: string);
      procedure Chama_Unidade(descricao: string);
      procedure Chama_Setor(descricao: string);
      procedure Chama_Lancamento_Financeiro_Alterar;
      procedure Chama_Cargo(descricao: string);
      procedure Chama_Departamento(descricao: string);
      procedure Chama_Grupo(descricao: string);
      procedure Chama_Cliente(descricao: string);
      procedure Chama_Funcionario(descricao: string);
      procedure Chama_Folha;
      procedure Chama_Fornecedor(descricao: string);
      procedure Chama_Grupo_Produto(descricao: string);
      procedure Chama_Marca(descricao: string);
      procedure Chama_Fabricante(descricao: string);
      procedure Chama_Produto(descricao: AnsiString);
      //procedure Chama_Produto_Similar;
      procedure Chama_Produto_Similar_Consulta;
      //procedure Chama_Produto_Grupo(Descricao);
      procedure Chama_Tipo_Documento(descricao: string);
      procedure Chama_Condicao_Pagamento(descricao: string);
      procedure Chama_Plano_Financeiro(descricao: string);
      procedure Chama_Caixa(descricao: string);
      procedure Chama_Empresa(descricao: string);
      procedure Chama_Empresa_Inicial();
      procedure Chama_Lancamento_Financeiro(descricao: string);
      procedure Chama_Banco(descricao: string);
      procedure Chama_Operacao_Bancaria(descricao: string);
      procedure Chama_Conta_Corrente(descricao: string);
      procedure Chama_Itens_Folha(descricao: string);
      procedure Chama_Cheque(descricao: string);
      procedure Chama_Local_Produto(descricao: string);
      procedure Chama_Lancamento_Banco(descricao: string);
      procedure Chama_Lancamento_Caixa;
      procedure Chama_Lancamento_Conciliacao(descricao: string);
      procedure Chama_Pedido(descricao: string);
      procedure Chama_CFOP(descricao: string);
      procedure Chama_Situacao_Tributaria(descricao: string);
      procedure Chama_Produto_Compra(descricao: string);
      procedure Chama_Conta_Fixa(descricao: string);
      procedure Chama_Ordem_Entrega;
      procedure Chama_NCM;
      procedure Chama_Servico;
      procedure Chama_Veiculo;
      procedure Chama_Etiqueta;
      procedure Chama_Etiquetadora;
      procedure Chama_Pais;
      procedure Chama_Configuracao;
      procedure Chama_WebService;
      procedure Sugestao_Compra;
      procedure Consulta_Fechamento_Caixa;
      procedure Consulta_Acerto_Caixa;
      procedure Consulta_Contagem_Estoque;
      procedure Consulta_Balanco_Estoque;
      procedure Consulta_Ocorrencia;
      function Consulta_Conta_Fixa(descricao: string): boolean;
      procedure Consulta_Custo_Empresa;
      procedure Consulta_Historico_Log;
      procedure Consulta_Historico_Movimentacao;
      procedure Consulta_Inventario_Estoque;
      procedure Consulta_Ficha_Funcionario;
      procedure Consulta_Saldo_Estoque;
      procedure Consulta_Saldo_Estoque_Geral;
      procedure Consulta_Saldo_Estoque_Geral2;
      procedure Consulta_Comissao;
      procedure Consulta_Comissao_Lucratividade_Vendedor;
      procedure Consulta_Custo_Venda;
      procedure Consulta_Produto_Cadastrado;
      procedure Consulta_Lucratividade_Produto;
      procedure Consulta_Lucratividade_Grupo;
      procedure Consulta_Lucratividade_Marca;
      procedure Consulta_Lancamento_Financeiro (descricao: string);
      procedure Consulta_Lancamento_Financeiro_Sintetico;
      procedure Consulta_Lancamento_Financeiro_Sintetico2;
      procedure Consulta_Ocorrencia_Cobranca;
      procedure Consulta_Parcelas_Lancamento;
      procedure Consulta_Folha_Pagamento;
      procedure Consulta_Itens_Folha_Pagamento;
      procedure Consulta_Compra;
      procedure Consulta_Itens_Compra;
      procedure Consulta_Cotacao;
      procedure Consulta_Itens_Cotacao;
      procedure Consulta_Retorno_Cotacao;
      procedure Consulta_Itens_Retorno_Cotacao;
      procedure Consulta_Entrada;
      procedure Consulta_Entrada_Sintetico1;
      procedure Consulta_Entrada_Sintetico2;
      procedure Consulta_Itens_Entrada;
      procedure Consulta_Itens_Entrada_Sintetico_1;
      procedure Consulta_OS;
      procedure Consulta_OS_Sintetico;
      procedure Consulta_Itens_OS;

      procedure Chama_Transportadora;
      procedure Chama_Obs_Fiscal;
      procedure Chama_Regra_ICMS;
      procedure Chama_Regra_PIS;
      procedure Chama_Regra_IPI;
      procedure Chama_Regra_ISSQN;
      procedure Chama_Regra_COFINS;
      procedure Chama_Tratamento_ICMS;
      procedure Chama_Tratamento_PIS;
      procedure Chama_Tratamento_COFINS;
      procedure Chama_Tratamento_IPI;
      procedure Chama_Tratamento_ISSQN;
      procedure Chama_Grupo_Produto_Tributacao;
      procedure Chama_Grupo_Produto_Tributacao_PIS;
      procedure Chama_Grupo_Produto_Tributacao_COFINS;
      procedure Chama_Grupo_Produto_Tributacao_IPI;
      procedure Chama_Usuario;
      procedure Chama_Usuario_Funcionario;
      procedure Chama_Funcionario_Outros;
      procedure Chama_Perfil_Usuario;
      procedure Chama_Tabela_Preco;
      procedure Chama_Tabela_Preco_Cadastro;
      procedure Chama_Receita;
      procedure Chama_Itens_Receita;
      procedure Consulta_Tabela_Preco;
      procedure Consulta_Itens_Tabela_Preco;
      procedure Consulta_Preco_Produto;
      procedure Consulta_Venda;
      procedure Consulta_Venda_Sintetico_2;
      procedure Consulta_Venda_Sintetico_1;
      procedure Consulta_Venda_Tributo;
      procedure Consulta_Venda_Lucratividade_Geral;
      procedure Consulta_Venda_Lucratividade_Vendedor;
      procedure Consulta_Venda_Lucratividade_Cliente;
      procedure Consulta_Venda_Lucratividade_Grupo;

      procedure Consulta_Venda_Agrupado_Grupo;
      procedure Consulta_Venda_Agrupado_Cliente;

      procedure Consulta_Itens_Venda;
      procedure Consulta_Comparativo_Preco_Cotacao;
      procedure Consulta_Curva_ABC_Produto;
      procedure Consulta_Reposicao_Estoque;
      procedure Consulta_Compra_Reposicao;
      procedure Consulta_Posicao_Estoque;
      procedure Chama_Agenda_Telefonica;

      procedure Consulta_Cheque(descricao: string);
      procedure Consulta_Lancamento_Banco;
      procedure Consulta_Lancamento_Caixa;
      procedure Consulta_Saldo(descricao: string);
      procedure Consulta_Tabela_Produto;
      procedure Consulta_Estoque_Produto;
      procedure Consulta_Movimento_Saida();
      procedure Consulta_Fechamento_Estoque;
      function Atualiza_Dados_Carne(LFE: TLancamentoFinanceiroEntidade): String;
      procedure Chama_Ocorrencia_Cobranca;

      procedure Pega_Produto(Edt: TEdit);
  end;
implementation

uses UChama_Logradouro, UChama_Cidade, UChama_Unidade, UChama_Setor,
  UChama_Cargo, UChama_Departamento, UChama_Grupo_Cliente, UChama_Cliente,
  UChama_Funcionario, UChama_Fornecedor, UChama_Grupo_Produto, UChama_Marca,
  UChama_Produto, UChama_Tipo_Documento, UChama_Condicao_Pagamento,
  UChama_Plano_Financeiro, UChama_Empresa, UChama_Lancamentos_Financeiros,
  UChama_Caixa, UChama_Banco, UChama_Operacao_Bancaria, UChama_Conta_Corrente,
  UChama_Itens_Folha, UChama_Cheque, UChama_Empresa_Inicial,
  UChama_Local_Produto, UGeral, UChama_Lancamento_Banco, UConciliacao_Bancaria,
  UConsulta_Cheque, UConsulta_Lancamento_Banco, UConsulta_Saldo_Bancario, UDM,
  UTabela_Produto, UMovimentacao_Saida, UMenu_Geral, UEstoque_Produto,
  UDeclaracao, UChama_Pedido, UChama_CFOP, UChama_Situacao_Tributaria,
  UConciliacao_Compra, UChama_Produto_Compra, UGera_Ordem_Entrega,
  USugestao_Compra, UConfiguracao_Sistema, UChama_Configuracao, UChama_NCM,
  UChama_Pais, UChama_Veiculo, UChama_Servico, UFechamento_Inventario,
  UPedido_Venda, UPre_Venda, UChama_Conta_Fixa, UConsulta_Conta_Fixa,
  UConsulta_Lancamentos_Financeiros, UConsulta_Folha_Pagamento,
  UConsulta_Compra, UConsulta_Entrada, UConsulta_OS, UChama_Transportadora,
  UChama_Observacao_Fiscal, UChama_Regra_ICMS, UChama_Tratamento_ICMS,
  UChama_Grupo_Produto_Tributacao, UChama_Regra_PIS, UChama_Tratamento_PIS,
  UChama_Grupo_Produto_Tributacao_PIS, UChama_Regra_COFINS,
  UChama_Tratamento_COFINS, UChama_Grupo_Produto_Tributacao_COFINS,
  UChama_Regra_IPI, UChama_Tratamento_IPI, UChama_Grupo_Produto_Tributacao_IPI,
  UChama_Regra_ISSQN, UChama_Tratamento_ISSQN, UChama_Usuario,
  UConsulta_Fechamento_Caixa, UChama_Tabela_Preco, UConsulta_Tabela_Preco,
  UConsulta_Preco_Produto, UConsulta_Venda, UConsulta_Cotacao_Preco_Produto,
  UConsulta_Retorno_Cotacao_Preco, UConsulta_Comparativo_Preco_Cotacao,
  UConsulta_Curva_ABC_Produto, UConsulta_Reposicao_Estoque,
  UConsulta_Posicao_Estoque, UConsulta_Historico_Log, UChama_Receita, UReceita,
  UConsulta_Saldo_Estoque, UConsulta_Custo_Venda, UChama_Perfil_Usuario,
  UChama_Lancamento_Financeiro_Alterar, UConsulta_Acerto_Caixa,
  UConsulta_Lucratividade_Produto, UConsulta_Lucratividade_Grupo,
  UConsulta_Lucratividade_Marca, UChama_Etiqueta, UConsulta_Comissao,
  UConsulta_Produto_Cadastrado, UConsulta_Inventario, UChama_Fabricante,
  UChama_DAV_Converter, UChama_Agenda_Telefonica, UConsulta_Contagem_Estoque,
  UConsulta_Custo_Empresa, UCadastro_Grupo_Produto,
  UConsulta_Historico_Movimentacao, UChama_Status, UChama_Tipo_Ocorrencia,
  UChama_Ocorrencia, UConsulta_Ocorrencia, UChama_Tipo_Bem_Patrimonial,
  UChama_Patrimonio, UConsulta_Padrao, UConsulta_Patrimonio,
  UConsulta_Ficha_Funcionario, UChama_Folha_Pagamento, UConsulta_Ficha_Cliente,
  UChama_Lancamento_Caixa, UConsulta_Lancamento_Caixa, Util.TLog,
  UChama_Ocorrencia_Cobranca;

procedure Chama_Logradouro(descricao: string);
begin
end;
{ TConsulta }

function TConsulta.Atualiza_Dados_Carne(LFE: TLancamentoFinanceiroEntidade): String;
var
  aux: String;
  qAux: TADOQuery;
begin
  try
    aux:= ('select PL.N_Documento, PL.Codigo, LF.Data_Lancamento, PL.Valor_Pagar, (convert(varchar, PL.Parcela) + '+QuotedStr('/')+' + convert(varchar, CP.Parcela)) as Parcela, PL.Data_Vencimento,'
    +'LF.Observacoes, case'
    +'                               when (C.Tipo = '+QuotedStr('FÍSICO')+') then '
    +'                                     C.Nome_Nome_Fantasia + ' + QuotedStr('-') + '+ substring(C.CPF, 1,3) + ' + QuotedStr('.') + ' + substring(C.CPF, 4,3) + ' + QuotedStr('.') + ' + substring(C.CPF, 7,3) + ' + QuotedStr('-') + ' + substring(C.CPF, 9,2) '
    +'                               else '
    +'                                     C.Nome_Nome_Fantasia + ' + QuotedStr('-') + ' + substring(C.CNPJ,1,2) + ' + QuotedStr('.') + ' + SUBSTRING(C.CNPJ, 3,3) + ' + QuotedStr('.') + ' + SUBSTRING(C.CNPJ, 6,3) + ' + QuotedStr('/') + ' + SUBSTRING(C.CNPJ, 9,4) + ' +QuotedStr('-') + ' + SUBSTRING(C.CNPJ, 13,2) end as Cliente, '
    +'(C.Endereco + ' + QuotedStr('-') + '+S.Descricao) as Endereco, C.CEP, (Ci.Descricao + ' + QuotedStr('-') + ' +Ci.UF) as Cidade '
    +' from Lancamento_Financeiro LF '
    +'left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo) '
    +'left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo) '
    +'left join Cliente C on (LF.Codigo_Cli_For = C.Codigo) '
    //+'left join Logradouro LO on (LO.Codigo = C.Codigo_Logradouro) '
    +'left join Setor S on (S.Codigo = C.Codigo_Setor) '
    +'left join Cidade Ci on (Ci.Codigo = C.Codigo_Cidade) '
    +'where LF.Tipo = ' + QuotedStr('RECEBER') + ' and LF.Codigo = '+ IntToStr(LFE.Codigo) +' order by PL.Parcela');
    result:= aux;
  finally
  end;
end;

procedure TConsulta.Chama_Agenda_Telefonica;
begin
  if (FrmChama_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Agenda_Telefonica.qrychama_agenda do
        begin
          close;
          sql.clear;
          sql.add('select * from Agenda_Telefonica AT');
          sql.add('where AT.Codigo like '''+ FrmChama_Agenda_Telefonica.EdtConsulta.Text +'%''order by AT.Nome');
          open;

          if (FrmChama_Agenda_Telefonica.qrychama_agenda.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Agenda_Telefonica.qrychama_agenda do
            begin
              close;
              sql.clear;
              sql.add('select * from Agenda_Telefonica AT');
              sql.add('where AT.Nome like '''+ FrmChama_Agenda_Telefonica.EdtConsulta.Text +'%''order by AT.Nome');
              open;

              if (FrmChama_Agenda_Telefonica.qrychama_agenda.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Banco(descricao: string);
begin
  if (FrmChama_Banco.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Banco.qrychama_banco do
        begin
          close;
          sql.clear;
          sql.add('Select * from Banco B');
          if (FrmChama_Banco.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where B.Codigo like '''+ FrmChama_Banco.EdtConsulta.Text +'%''order by B.Codigo')
          else
            sql.add('where B.Codigo like '''+ FrmChama_Banco.EdtConsulta.Text +'%''order by B.Nome');
          open;

          if (FrmChama_Banco.qrychama_banco.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Banco.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Banco.qrychama_banco do
            begin
              close;
              sql.clear;
              sql.add('Select * from Banco B');
              if (FrmChama_Banco.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where B.Nome like '''+ FrmChama_Banco.EdtConsulta.Text +'%''order by B.Codigo')
              else
                sql.add('where B.Nome like '''+ FrmChama_Banco.EdtConsulta.Text +'%''order by B.Nome');
              open;

              if (FrmChama_Banco.qrychama_banco.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Status_OS(var Conexao: TADOConnection);
begin
  with dm.qrystatus, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select * from Cadastro_Status');
    open;
    First;
  end;
end;

procedure TConsulta.Chama_Caixa(descricao: string);
begin
  if (FrmChama_Caixa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Caixa.qrychama_caixa do
        begin
          close;
          sql.clear;
          sql.add('select Cai.*, Cai.Codigo_SubNivel, Cai.Caixa from Caixa Cai');
          sql.add('inner join Caixa Cai2 on (Cai.Codigo = Cai2.Codigo)');
          if (FrmChama_Caixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Cai.Codigo like '''+ FrmChama_Caixa.EdtConsulta.Text +'%''order by Cai.Codigo')
          else
            sql.add('where Cai.Codigo like '''+ FrmChama_Caixa.EdtConsulta.Text +'%''order by Cai.Caixa');
          open;

          if (FrmChama_Caixa.qrychama_caixa.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Caixa.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Caixa.qrychama_caixa do
            begin
              close;
              sql.clear;
              sql.add('select Cai.*, Cai.Codigo_SubNivel, Cai.Caixa from Caixa Cai');
              sql.add('inner join Caixa Cai2 on (Cai.Codigo = Cai2.Codigo)');
              if (FrmChama_Caixa.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where Cai.Codigo like '''+ FrmChama_Caixa.EdtConsulta.Text +'%''order by Cai.Codigo')
              else
                sql.add('where Cai.Codigo like '''+ FrmChama_Caixa.EdtConsulta.Text +'%''order by Cai.Caixa');
              open;

              if (FrmChama_Caixa.qrychama_caixa.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Cargo(descricao: string);
begin
  if (FrmChama_Cargo.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Cargo.qrychama_cargo do
        begin
          close;
          sql.clear;
          sql.add('Select * from Cargo C');
          if (FrmChama_Cargo.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo like '''+ FrmChama_Cargo.EdtConsulta.Text +'%''order by C.Codigo')
          else
            sql.add('where C.Codigo like '''+ FrmChama_Cargo.EdtConsulta.Text +'%''order by C.Descricao');
          open;

          if (FrmChama_Cargo.qrychama_cargo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Cargo.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Cargo.qrychama_cargo do
            begin
              close;
              sql.clear;
              sql.add('Select * from Cargo C');
              if (FrmChama_Cargo.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where C.Descricao like '''+ FrmChama_Cargo.EdtConsulta.Text +'%''order by C.Codigo')
              else
                sql.add('where C.Descricao like '''+ FrmChama_Cargo.EdtConsulta.Text +'%''order by C.Descricao');
              open;

              if (FrmChama_Cargo.qrychama_cargo.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Cargo_LookUp(var Conexao: TADOConnection);
begin
  with dm.qrychama_cargo, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select * from Cargo');
    open;
    First;
  end;
end;

procedure TConsulta.Chama_Status(descricao: string);
begin
  if (FrmChama_Status.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmChama_Status.qrychama_status do
      begin
        close;
        sql.clear;
        sql.add('Select * from Cadastro_Status CS');
        if (FrmChama_Status.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where CS.Codigo like '''+ FrmChama_Status.EdtConsulta.Text +'%''order by CS.Codigo')
        else
          sql.add('where CS.Codigo like '''+ FrmChama_Status.EdtConsulta.Text +'%''order by CS.Descricao');
        open;

        if (FrmChama_Status.qrychama_status.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end
    else if (FrmChama_Status.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_Status.qrychama_status do
        begin
          close;
          sql.clear;
          sql.add('Select * from Cadastro_Status CS');
          if (FrmChama_Status.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CS.Descricao like '''+ FrmChama_Status.EdtConsulta.Text +'%''order by CS.Codigo')
          else
            sql.add('where CS.Descricao like '''+ FrmChama_Status.EdtConsulta.Text +'%''order by CS.Descricao');
          open;

          if (FrmChama_Status.qrychama_status.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_CFOP(descricao: string);
begin
  if (FrmChama_CFOP.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_CFOP.qrychama_cfop do
        begin
          close;
          sql.clear;
          sql.add('Select * from Cadastro_CFOP CFOP');
          if (FrmChama_CFOP.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CFOP.CFOP like '''+ FrmChama_CFOP.EdtConsulta.Text +'%''order by CFOP.CFOP')
          else
            sql.add('where CFOP.CFOP like '''+ FrmChama_CFOP.EdtConsulta.Text +'%''order by CFOP.Descricao');
          open;

          if (FrmChama_CFOP.qrychama_cfop.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_CFOP.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_CFOP.qrychama_cfop do
            begin
              close;
              sql.clear;
              sql.add('Select * from Cadastro_CFOP CFOP');
              if (FrmChama_CFOP.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where CFOP.Descricao like '''+ FrmChama_CFOP.EdtConsulta.Text +'%''order by CFOP.CFOP')
              else
                sql.add('where CFOP.Descricao like '''+ FrmChama_CFOP.EdtConsulta.Text +'%''order by CFOP.Descricao');
              open;

              if (FrmChama_CFOP.qrychama_cfop.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Cheque(descricao: string);
begin
  if (FrmChama_Cheque.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Cheque.qrychama_cheque do
        begin
          close;
          sql.clear;
          sql.add('select Che.*, B.Nome from Cheque Che');
          sql.add('inner join Banco B on (Che.Codigo_Banco = B.Codigo)');

          if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 0) then
          begin
            sql.add('where Che.Status = :Status and Che.Codigo like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          end
          else if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 1) then
          begin
            sql.add('where Che.Status = :Status and Che.Codigo like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
            Parameters.ParamByName('Status').Value:= 'BAIXADO'
          end;
          open;

          if (FrmChama_Cheque.qrychama_cheque.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Cheque.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Cheque.qrychama_cheque do
            begin
              close;
              sql.clear;
              sql.add('select Che.*, B.Nome from Cheque Che');
              sql.add('inner join Banco B on (Che.Codigo_Banco = B.Codigo)');

              if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 0) then
              begin
                sql.add('where Che.Status = :Status and Che.N_Cheque like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
                Parameters.ParamByName('Status').Value:= 'PENDENTE'
              end
              else if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 1) then
              begin
                sql.add('where Che.Status = :Status and Che.N_Cheque like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
                Parameters.ParamByName('Status').Value:= 'BAIXADO'
              end;
              open;
              if (FrmChama_Cheque.qrychama_cheque.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end
        else
          if (FrmChama_Cheque.RGConsulta_Por.ItemIndex = 2) then
          begin
            with FrmChama_Cheque.qrychama_cheque do
              begin
              close;
              sql.clear;
              sql.add('select Che.*, B.Nome from Cheque Che');
              sql.add('inner join Banco B on (Che.Codigo_Banco = B.Codigo)');

              if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 0) then
              begin
                sql.add('where Che.Status = :Status and Che.Emitente like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
                Parameters.ParamByName('Status').Value:= 'PENDENTE'
              end
              else if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 1) then
              begin
                sql.add('where Che.Status = :Status and Che.Emitente like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
                Parameters.ParamByName('Status').Value:= 'BAIXADO'
              end;
              open;
                if (FrmChama_Cheque.qrychama_cheque.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
              end;
          end
          else
            if (FrmChama_Cheque.RGConsulta_Por.ItemIndex = 3) then
            begin
              with FrmChama_Cheque.qrychama_cheque do
                begin
                  close;
                  sql.clear;
                  sql.add('select Che.*, B.Nome from Cheque Che');
                  sql.add('inner join Banco B on (Che.Codigo_Banco = B.Codigo)');

                  if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 0) then
                  begin
                    sql.add('where Che.Status = :Status and Che.Favorecido like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
                    Parameters.ParamByName('Status').Value:= 'PENDENTE'
                  end
                  else if (FrmChama_Cheque.RGTipo_Cheque.ItemIndex = 1) then
                  begin
                    sql.add('where Che.Status = :Status and Che.Favorecido like '''+ FrmChama_Cheque.EdtConsulta.Text +'%''order by Che.Codigo');
                    Parameters.ParamByName('Status').Value:= 'BAIXADO'
                  end;
                open;
                  if (FrmChama_Cheque.qrychama_cheque.IsEmpty = true) then
                    begin
                      Mensagem_Fim_Pesquisa;
                      abort;
                    end;
                end;
            end;
end;

procedure TConsulta.Chama_Cidade(descricao: string);
begin
  if (FrmChama_Cidade.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Cidade.qrychama_cidade do
        begin
          close;
          sql.clear;
          sql.add('select C.*, P.Descricao as Pais from Cidade C');
          sql.add('left join Pais P on (C.Codigo_Pais = P.Codigo)');

          if (FrmChama_Cidade.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo like '''+ FrmChama_Cidade.EdtConsulta.Text +'%''order by C.Codigo')
          else
            sql.add('where C.Codigo like '''+ FrmChama_Cidade.EdtConsulta.Text +'%''order by C.Descricao');
          open;

          if (FrmChama_Cidade.qrychama_cidade.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Cidade.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Cidade.qrychama_cidade do
            begin
              close;
              sql.clear;
              sql.add('select C.*, P.Descricao as Pais from Cidade C');
              sql.add('left join Pais P on (C.Codigo_Pais = P.Codigo)');

              if (FrmChama_Cidade.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where C.Descricao like '''+ FrmChama_Cidade.EdtConsulta.Text +'%''order by C.Codigo')
              else
                sql.add('where C.Descricao like '''+ FrmChama_Cidade.EdtConsulta.Text +'%''order by C.Descricao');
              open;

              if (FrmChama_Cidade.qrychama_cidade.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Cliente(descricao: string);
begin
  descricao:= FrmChama_Cliente.EdtConsulta.Text +'%';

  if (FrmChama_Cliente.RGConsulta_Por.ItemIndex = 0) then
  begin
    with dm.qrychama_cliente, sql do
    begin
      close;
      clear;
      add('select Cli.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor, GC.Descricao as Grupo,');
      add('TP.Descricao as Tabela_Preco from Cliente Cli');
      add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
      add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
      add('left join Grupo_Cliente GC on (Cli.Codigo_Grupo = GC.Codigo)');
      add('left join Tabela_Preco TP on (Cli.Codigo_Tabela_Preco = TP.Codigo)');
      add('where Cli.Codigo like '+ QuotedStr(descricao));
      add('order by Cli.Nome_Nome_Fantasia');
      open;
    end;
  end
  else if (FrmChama_Cliente.RGConsulta_Por.ItemIndex = 1) then
  begin
    with dm.qrychama_cliente, sql do
    begin
      close;
      clear;
      add('select Cli.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor, GC.Descricao as Grupo,');
      add('TP.Descricao as Tabela_Preco from Cliente Cli');
      add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
      add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
      add('left join Grupo_Cliente GC on (Cli.Codigo_Grupo = GC.Codigo)');
      add('left join Tabela_Preco TP on (Cli.Codigo_Tabela_Preco = TP.Codigo)');
      add('where Cli.Nome_Nome_Fantasia like '+ QuotedStr(descricao));
      add('order by Cli.Nome_Nome_Fantasia');
      open;
    end
  end
  else if (FrmChama_Cliente.RGConsulta_Por.ItemIndex = 2) then
  begin
    with dm.qrychama_cliente, sql do
    begin
      close;
      clear;
      add('select Cli.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor, GC.Descricao as Grupo,');
      add('TP.Descricao as Tabela_Preco from Cliente Cli');
      add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
      add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
      add('left join Grupo_Cliente GC on (Cli.Codigo_Grupo = GC.Codigo)');
      add('left join Tabela_Preco TP on (Cli.Codigo_Tabela_Preco = TP.Codigo)');
      add('where Cli.Razao_Social like '+ QuotedStr(descricao));
      add('order by Cli.Nome_Nome_Fantasia');
      open;
    end;
  end
  else if (FrmChama_Cliente.RGConsulta_Por.ItemIndex = 3) then
  begin
    with dm.qrychama_cliente, sql do
    begin
      close;
      clear;
      add('select Cli.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor, GC.Descricao as Grupo,');
      add('TP.Descricao as Tabela_Preco from Cliente Cli');
      add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
      add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
      add('left join Grupo_Cliente GC on (Cli.Codigo_Grupo = GC.Codigo)');
      add('left join Tabela_Preco TP on (Cli.Codigo_Tabela_Preco = TP.Codigo)');
      add('where Cli.CNPJ like '+ QuotedStr(descricao));
      add('order by Cli.Nome_Nome_Fantasia');
      open;
    end;
  end
  else if (FrmChama_Cliente.RGConsulta_Por.ItemIndex = 4) then
  begin
    with dm.qrychama_cliente, sql do
    begin
      close;
      clear;
      add('select Cli.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor, GC.Descricao as Grupo,');
      add('TP.Descricao as Tabela_Preco from Cliente Cli');
      add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
      add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
      add('left join Grupo_Cliente GC on (Cli.Codigo_Grupo = GC.Codigo)');
      add('left join Tabela_Preco TP on (Cli.Codigo_Tabela_Preco = TP.Codigo)');
      add('where Cli.CPF like '+ QuotedStr(descricao));
      add('order by Cli.Nome_Nome_Fantasia');
      open;
    end;
  end;
end;

procedure TConsulta.Chama_Condicao_Pagamento(descricao: string);
begin
  descricao:= FrmChama_Condicao_Pagamento.EdtConsulta.Text +'%';

  if (FrmChama_Condicao_Pagamento.RGConsulta_Por.ItemIndex = 0) then
  begin
    with dm.qrychama_condicao, sql do
    begin
      close;
      clear;
      add('Select CP.* from Condicao_Pagamento CP');
      add('where Codigo = :Codigo and Status = :Status and Programa_Impressora = :Impressora');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmChama_Condicao_Pagamento.EdtConsulta.Text);

      if (FrmChama_Condicao_Pagamento.CBStatus.Checked) then
        Parameters.ParamByName('Status').Value:= 'ATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'INATIVO';

      if (FrmChama_Condicao_Pagamento.CBImpFiscal.Checked) then
        Parameters.ParamByName('Impressora').Value:= 'SIM'
      else
        Parameters.ParamByName('Impressora').Value:= 'NÃO';

      open;
      if (dm.qrychama_condicao.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
  end
  else if (FrmChama_Condicao_Pagamento.RGConsulta_Por.ItemIndex = 1) then
  begin
    with dm.qrychama_condicao, sql do
    begin
      close;
      clear;
      add('Select CP.* from Condicao_Pagamento CP');
      add('where Descricao like :Descricao and Status = :Status and Programa_Impressora = :Impressora');
      Parameters.ParamByName('Descricao').Value:= FrmChama_Condicao_Pagamento.EdtConsulta.Text+'%';
      if (FrmChama_Condicao_Pagamento.CBStatus.Checked) then
        Parameters.ParamByName('Status').Value:= 'ATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'INATIVO';

      if (FrmChama_Condicao_Pagamento.CBImpFiscal.Checked) then
        Parameters.ParamByName('Impressora').Value:= 'SIM'
      else
        Parameters.ParamByName('Impressora').Value:= 'NÃO';

      open;
    end;
    if (dm.qrychama_condicao.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
  end;
end;

procedure TConsulta.Chama_Configuracao;
begin
  with FrmChama_Configuracao.qrychama_configuracao do
    begin
      close;
      sql.clear;
      sql.add('select CS.*, TP.Descricao, (CFOP.CFOP +' + QuotedStr('-') + '+ CFOP.Descricao) as CFOP,');

      sql.add('TD1.Descricao as Tipo_Documento, D1.Descricao as Departamento, PF1.Descricao as Plano,');
      sql.add('TD2.Descricao as Tipo_Documento, D2.Descricao as Departamento, PF2.Descricao as Plano');

      sql.add('from Configuracao_Sistema CS');


      sql.add('left join Tabela_Preco TP on (CS.Codigo_Tabela_Preco_Padrao = TP.Codigo)');

      sql.add('left join Tipo_Documento TD1 on (CS.Codigo_Tipo_Documento = TD1.Codigo)');
      sql.add('left join Departamento D1 on (CS.Codigo_Departamento = D1.Codigo)');
      sql.add('left join Plano_Financeiro PF1 on (CS.Codigo_Plano_Financeiro = PF1.Codigo)');

      sql.add('left join Tipo_Documento TD2 on (CS.Codigo_Tipo_Documento_Pagar = TD2.Codigo)');
      sql.add('left join Departamento D2 on (CS.Codigo_Departamento_Pagar = D2.Codigo)');
      sql.add('left join Plano_Financeiro PF2 on (CS.Codigo_Plano_Financeiro_Pagar = PF2.Codigo)');
      sql.add('left join Cadastro_CFOP CFOP on (CS.Codigo_CFOP_Padrao = CFOP.Codigo)');
      open;
    end;
end;

procedure TConsulta.Chama_Configuracao_ECF;
begin
  with FrmConfiguracao_Sistema.qryconfiguracao_ecf do
    begin
      close;
      sql.clear;
      sql.add('select * from Configuracao_ECF');
      open;
    end;
end;


procedure TConsulta.Chama_Conta_Corrente(descricao: string);
begin
  if (FrmChama_Conta_Corrente.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Conta_Corrente.qrychama_conta do
        begin
          close;
          sql.clear;
          sql.add('select CC.*, B.Nome from Conta_Corrente CC');
          sql.add('inner join Banco B on (CC.Codigo_Banco = B.Codigo)');

          if (FrmChama_Conta_Corrente.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CC.Codigo like '''+ FrmChama_Conta_Corrente.EdtConsulta.Text +'%''order by CC.Codigo')
          else
            sql.add('where CC.Codigo like '''+ FrmChama_Conta_Corrente.EdtConsulta.Text +'%''order by CC.Conta');
          open;

          if (FrmChama_Conta_Corrente.qrychama_conta.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Conta_Corrente.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Conta_Corrente.qrychama_conta do
            begin
              close;
              sql.clear;
              sql.add('select CC.*, B.Nome from Conta_Corrente CC');
              sql.add('inner join Banco B on (CC.Codigo_Banco = B.Codigo)');

              if (FrmChama_Conta_Corrente.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where CC.Conta like '''+ FrmChama_Conta_Corrente.EdtConsulta.Text +'%''order by CC.Codigo')
              else
                sql.add('where CC.Conta like '''+ FrmChama_Conta_Corrente.EdtConsulta.Text +'%''order by CC.Conta');
              open;

              if (FrmChama_Conta_Corrente.qrychama_conta.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
            end;
            end;
        end;
end;

procedure TConsulta.Chama_Conta_Fixa(descricao: string);
begin
  if (FrmChama_Conta_Fixa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Conta_Fixa.qrychama_conta_fixa do
        begin
          close;
          sql.clear;
          sql.add('select CF.*, PF.Plano from Conta_Fixa CF');
          sql.add('left join Plano_Financeiro PF on (CF.Codigo_Plano = PF.Codigo)');
          if (FrmChama_Conta_Fixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CF.Codigo like '''+ FrmChama_Conta_Fixa.EdtConsulta.Text +'%''order by CF.Codigo')
          else
            sql.add('where CF.Codigo like '''+ FrmChama_Conta_Fixa.EdtConsulta.Text +'%''order by CF.Descricao');
          open;

          if (FrmChama_Conta_Fixa.qrychama_conta_fixa.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Conta_Fixa.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Conta_Fixa.qrychama_conta_fixa do
            begin
              close;
              sql.clear;
              sql.add('select CF.*, PF.Plano from Conta_Fixa CF');
              sql.add('left join Plano_Financeiro PF on (CF.Codigo_Plano = PF.Codigo)');
              if (FrmChama_Conta_Fixa.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where CF.Descricao like '''+ FrmChama_Conta_Fixa.EdtConsulta.Text +'%''order by CF.Codigo')
              else
                sql.add('where CF.Descricao like '''+ FrmChama_Conta_Fixa.EdtConsulta.Text +'%''order by CF.Descricao');
              open;

              if (FrmChama_Conta_Fixa.qrychama_conta_fixa.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_DAV_Converter(descricao: string);
begin
  if (FrmChama_DAV_Converter.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmChama_DAV_Converter.qrychama_dav do
    begin
      close;
      sql.clear;
      sql.add('select P.N_Pedido, P.Data_Venda, C.Nome_Nome_Fantasia, P.Total_Pedido,');
      sql.add('V.Placa, V.Veiculo, CS.Descricao as StatusOS from Pedido P');
      sql.add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
      sql.add('left join Veiculo V on (P.Codigo_Veiculo = V.Codigo)');
      sql.add('left join Cadastro_Status CS on (P.Status_OS = CS.Codigo)');
      sql.add('where P.N_Pedido = :Pedido and (P.Tipo = :DAV or P.Tipo = :DAVOS) order by P.N_Pedido');
      Parameters.ParamByName('Pedido').Value:= descricao;
      Parameters.ParamByName('DAV').Value:= 'DAV';
      Parameters.ParamByName('DAVOS').Value:= 'DAV-OS';
      open;

      if (FrmChama_DAV_Converter.qrychama_dav.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
  end
  else if (FrmChama_DAV_Converter.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_DAV_Converter.qrychama_dav do
      begin
        close;
        sql.clear;
        sql.add('select P.N_Pedido, P.Data_Venda, C.Nome_Nome_Fantasia, P.Total_Pedido,');
        sql.add('V.Placa, V.Veiculo, CS.Descricao as StatusOS from Pedido P');
        sql.add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
        sql.add('left join Veiculo V on (P.Codigo_Veiculo = V.Codigo)');
        sql.add('left join Cadastro_Status CS on (P.Status_OS = CS.Codigo)');
        sql.add('where (P.Tipo = :DAVOS or P.Tipo = :DAV) and C.Nome_Nome_Fantasia like '''+ descricao +'%'' order by P.N_Pedido');
        Parameters.ParamByName('DAV').Value:= 'DAV';
        Parameters.ParamByName('DAVOS').Value:= 'DAV-OS';
        open;

        if (FrmChama_DAV_Converter.qrychama_dav.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
  end
  else if (FrmChama_DAV_Converter.RGConsulta_Por.ItemIndex = 2) then
  begin
    begin
      with FrmChama_DAV_Converter.qrychama_dav do
      begin
        close;
        sql.clear;
        sql.add('select P.N_Pedido, P.Data_Venda, C.Nome_Nome_Fantasia, P.Total_Pedido,');
        sql.add('V.Placa, V.Veiculo, CS.Descricao as StatusOS from Pedido P');
        sql.add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
        sql.add('left join Veiculo V on (P.Codigo_Veiculo = V.Codigo)');
        sql.add('left join Cadastro_Status CS on (P.Status_OS = CS.Codigo)');
        sql.add('where (P.Tipo = :DAV or P.Tipo = :DAVOS) and V.Placa like '''+ descricao +'%'' order by P.N_Pedido');
        Parameters.ParamByName('DAV').Value:= 'DAV';
        Parameters.ParamByName('DAVOS').Value:= 'DAV-OS';
        open;

        if (FrmChama_DAV_Converter.qrychama_dav.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end;
  end
  else if (FrmChama_DAV_Converter.RGConsulta_Por.ItemIndex = 3) then
  begin
    begin
      with FrmChama_DAV_Converter.qrychama_dav do
      begin
        close;
        sql.clear;
        sql.add('select P.N_Pedido, P.Data_Venda, C.Nome_Nome_Fantasia, P.Total_Pedido,');
        sql.add('V.Placa, V.Veiculo, CS.Descricao as StatusOS from Pedido P');
        sql.add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
        sql.add('left join Veiculo V on (P.Codigo_Veiculo = V.Codigo)');
        sql.add('left join Cadastro_Status CS on (P.Status_OS = CS.Codigo)');
        sql.add('where (P.Tipo = :DAV or P.Tipo = :DAVOS) and P.Status_OS = :Status_OS order by P.N_Pedido');
        Parameters.ParamByName('DAV').Value:= 'DAV';
        Parameters.ParamByName('DAVOS').Value:= 'DAV-OS';
        Parameters.ParamByName('Status_OS').Value:= dm.qrystatusCodigo.AsInteger;
        open;

        if (FrmChama_DAV_Converter.qrychama_dav.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end;
  end;

end;

procedure TConsulta.Chama_Departamento(descricao: string);
begin
  if (FrmChama_Departamento.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Departamento.qrychama_departamento do
        begin
          close;
          sql.clear;
          sql.add('Select * from Departamento D');
          if (FrmChama_Departamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where D.Codigo like '''+ FrmChama_Departamento.EdtConsulta.Text +'%''order by D.Codigo')
          else
            sql.add('where D.Codigo like '''+ FrmChama_Departamento.EdtConsulta.Text +'%''order by D.Descricao');
          open;

          if (FrmChama_Departamento.qrychama_departamento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Departamento.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Departamento.qrychama_departamento do
            begin
              close;
              sql.clear;
              sql.add('Select * from Departamento D');
              if (FrmChama_Departamento.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where D.Descricao like '''+ FrmChama_Departamento.EdtConsulta.Text +'%''order by D.Codigo')
              else
                sql.add('where D.Descricao like '''+ FrmChama_Departamento.EdtConsulta.Text +'%''order by D.Descricao');
              open;

              if (FrmChama_Departamento.qrychama_departamento.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Empresa(descricao: string);
begin
  if (FrmChama_Empresa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Empresa.qrychama_contabilista do
        begin
          close;
          sql.clear;
          sql.add('select Cont.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor from Contabilista Cont');
          sql.add('left join Cidade Ci on (Cont.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Cont.Codigo_Setor = Se.Codigo)');
          //sql.add('left join Logradouro L on (Cont.Codigo_Endereco = L.Codigo)');
          sql.add('where Cont.Codigo_Empresa = :Codigo ');
          Parameters.ParamByName('Codigo').Value:= UDeclaracao.codigo_empresa;
          open;
        end;

      with FrmChama_Empresa.qrychama_empresa do
        begin
          close;
          sql.clear;
          sql.add('select Emp.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor from Empresa Emp');
          sql.add('left join Cidade Ci on (Emp.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Emp.Codigo_Setor = Se.Codigo)');

          if (FrmChama_Empresa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Emp.Codigo like '''+ FrmChama_Empresa.EdtConsulta.Text +'%''order by Emp.Codigo')
          else
            sql.add('where Emp.Codigo like '''+ FrmChama_Empresa.EdtConsulta.Text +'%''order by Emp.Nome_Fantasia');
          open;

          if (FrmChama_Empresa.qrychama_empresa.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;

        if (FrmChama_Empresa.qrychama_empresa.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;

    end
    else
      if (FrmChama_Empresa.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Empresa.qrychama_contabilista do
            begin
              close;
              sql.clear;
              sql.add('select Cont.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor from Contabilista Cont');
              sql.add('left join Cidade Ci on (Cont.Codigo_Cidade = Ci.Codigo)');
              sql.add('left join Setor Se on (Cont.Codigo_Setor = Se.Codigo)');
              //sql.add('left join Logradouro L on (Cont.Codigo_Endereco = L.Codigo)');
              sql.add('where Cont.Codigo_Empresa = :Codigo ');
              Parameters.ParamByName('Codigo').Value:= UDeclaracao.codigo_empresa;
              open;
            end;

          with FrmChama_Empresa.qrychama_empresa do
            begin
              close;
              sql.clear;
              sql.add('select Emp.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio, Se.Descricao as Setor from Empresa Emp');
              sql.add('left join Cidade Ci on (Emp.Codigo_Cidade = Ci.Codigo)');
              sql.add('left join Setor Se on (Emp.Codigo_Setor = Se.Codigo)');

              if (FrmChama_Empresa.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where Emp.Nome_Fantasia like '''+ FrmChama_Empresa.EdtConsulta.Text +'%''order by Emp.Codigo')
              else
                sql.add('where Emp.Nome_Fantasia like '''+ FrmChama_Empresa.EdtConsulta.Text +'%''order by Emp.Nome_Fantasia');
              open;
            end;

            if (FrmChama_Empresa.qrychama_empresa.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
        end;
end;

procedure TConsulta.Chama_Empresa_Inicial();
begin
  with FrmChama_Empresa_Inicial.qrychama_empresa do
    begin
      close;
      sql.clear;
      sql.add('Select E.Codigo, E.Nome_Fantasia, E.Razao_Social, E.Suframa, E.Proprietario, E.CNPJ, E.Complemento, E.Contato, E.Telefone_Contato, E.Aliquota, E.CNAE,');
      sql.add('E.Insc_Estadual, E.Insc_Municipal, E.Telefone, E.Numero, E.Email, E.Enquadramento, E.Regime_Tributario, L.Descricao, L.Tipo_Logradouro, L.CEP, Cid.Descricao, Cid.UF,');
      sql.add('Cid.Codigo_Municipio, S.Descricao from Empresa E');
      sql.add('left join Logradouro L on (E.Codigo_Logradouro = L.Codigo)');
      sql.add('left join Cidade Cid on (E.Codigo_Cidade = Cid.Codigo)');
      sql.add('left join Setor S on (E.Codigo_Setor = S.Codigo)');
      open;
    end;
end;

procedure TConsulta.Chama_Etiqueta;
begin
  if (FrmChama_Etiqueta.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Etiqueta.qrychama_etiqueta do
        begin
          close;
          sql.clear;
          sql.add('select * from Cadastro_Etiqueta');
          sql.add('where Codigo like '''+ FrmChama_Etiqueta.EdtConsulta.Text +'%''');
          open;

          if (FrmChama_Etiqueta.qrychama_etiqueta.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Etiqueta.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Etiqueta.qrychama_etiqueta do
            begin
              close;
              sql.clear;
              sql.add('select * from Cadastro_Etiqueta');
              sql.add('where Descricao like '''+ FrmChama_Etiqueta.EdtConsulta.Text +'%''');
              open;

              if (FrmChama_Etiqueta.qrychama_etiqueta.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Etiquetadora;
begin
if (FrmChama_Etiqueta.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Etiqueta.qrychama_etiquetadora do
        begin
          close;
          sql.clear;
          sql.add('select * from Etiquetadora');
          sql.add('where Codigo like '''+ FrmChama_Etiqueta.EdtConsulta.Text +'%''');
          open;

          if (FrmChama_Etiqueta.qrychama_etiquetadora.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Etiqueta.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Etiqueta.qrychama_etiquetadora do
            begin
              close;
              sql.clear;
              sql.add('select * from Etiquetadora');
              sql.add('where Descricao like '''+ FrmChama_Etiqueta.EdtConsulta.Text +'%''');
              open;

              if (FrmChama_Etiqueta.qrychama_etiquetadora.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Fabricante(descricao: string);
begin
  if (FrmChama_Fabricante.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Fabricante.qrychama_fabricante do
        begin
          close;
          sql.clear;
          sql.add('select Forn.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L.Tipo_Logradouro, L.CEP from Fornecedor Forn');
          sql.add('left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)');
          sql.add('left join Logradouro L on (Forn.Codigo_Logradouro = L.Codigo)');

          if (FrmChama_Fabricante.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Forn.Tipo = :Tipo and Forn.Codigo like '''+ FrmChama_Fabricante.EdtConsulta.Text +'%''order by Forn.Codigo')
          else
            sql.add('where Forn.Tipo = :Tipo and Forn.Codigo like '''+ FrmChama_Fabricante.EdtConsulta.Text +'%''order by Forn.Nome_Fantasia');
          Parameters.ParamByName('Tipo').Value:= 'FABRICANTE';
          open;

          if (FrmChama_Fabricante.qrychama_fabricante.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Fabricante.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Fabricante.qrychama_fabricante do
            begin
              close;
              sql.clear;
              sql.add('select Forn.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L.Tipo_Logradouro, L.CEP from Fornecedor Forn');
              sql.add('left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
              sql.add('left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)');
              sql.add('left join Logradouro L on (Forn.Codigo_Logradouro = L.Codigo)');

              if (FrmChama_Fabricante.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where Forn.Tipo = :Tipo and Forn.Nome_Fantasia like '''+ FrmChama_Fabricante.EdtConsulta.Text +'%''order by Forn.Codigo')
              else
                sql.add('where Forn.Tipo = :Tipo and Forn.Nome_Fantasia like '''+ FrmChama_Fabricante.EdtConsulta.Text +'%''order by Forn.Nome_Fantasia');
              Parameters.ParamByName('Tipo').Value:= 'FABRICANTE';
              open;

              if (FrmChama_Fabricante.qrychama_fabricante.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Folha;
begin
  with FrmChama_Folha_Pagamento.qrychama_folha do
    begin
      close;
      sql.clear;
      sql.add('Select FP.*, Fun.Nome, Fun.Endereco, Fun.Numero, Fun.CPF,  Fun.Telefone,');
      sql.add('Cid.Descricao as Cidade, Cid.UF, Em.Nome_Fantasia as Empresa from Folha_Pagamento FP');
      sql.add('left join Funcionario Fun on (FP.Codigo_Funcionario = Fun.Codigo)');
      sql.add('left join Empresa Em on (FP.Codigo_Empresa = Em.Codigo)');
      sql.add('left join Cidade Cid on (Fun.Codigo_Cidade = Cid.Codigo)');

      case (FrmChama_Folha_Pagamento.RGConsulta_Por.ItemIndex) of
        0: sql.add('where Fun.Nome like '''+ FrmChama_Folha_Pagamento.EdtConsulta.Text +'%''');
        1: sql.add('where FP.Mes_Ano = :Mes');
      end;

      case (FrmChama_Folha_Pagamento.RGConsulta_Por.ItemIndex) of
        1: Parameters.ParamByName('Mes').Value:= FrmChama_Folha_Pagamento.EdtConsulta.Text;
      end;

      open;

      if (FrmChama_Folha_Pagamento.qrychama_folha.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Chama_Fornecedor(descricao: string);
begin
  if (FrmChama_Fornecedor.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Fornecedor.qrychama_fornecedor do
        begin
          close;
          sql.clear;
          sql.add('select Forn.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Setor from Fornecedor Forn');
          sql.add('left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)');

          if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Forn.Codigo like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Codigo')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where Forn.Codigo like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Nome_Fantasia')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where Forn.Codigo like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Razao_Social')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where Forn.Codigo like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.CNPJ');

          open;

          if (FrmChama_Fornecedor.qrychama_fornecedor.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmChama_Fornecedor.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_Fornecedor.qrychama_fornecedor do
        begin
          close;
          sql.clear;
          sql.add('select Forn.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Setor from Fornecedor Forn');
          sql.add('left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)');

          if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Forn.Nome_Fantasia like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Codigo')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where Forn.Nome_Fantasia like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Nome_Fantasia')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where Forn.Nome_Fantasia like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Razao_Social')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where Forn.Nome_Fantasia like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.CNPJ');
          //Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR';
          open;

          if (FrmChama_Fornecedor.qrychama_fornecedor.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmChama_Fornecedor.RGConsulta_Por.ItemIndex = 2) then
    begin
      with FrmChama_Fornecedor.qrychama_fornecedor do
        begin
          close;
          sql.clear;
          sql.add('select Forn.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Setor from Fornecedor Forn');
          sql.add('left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)');

          if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Forn.Razao_Social like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Codigo')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where Forn.Razao_Social like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Nome_Fantasia')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where Forn.Razao_Social like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Razao_Social')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where Forn.Razao_Social like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.CNPJ');
          //Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR';
          open;

          if (FrmChama_Fornecedor.qrychama_fornecedor.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmChama_Fornecedor.RGConsulta_Por.ItemIndex = 3) then
    begin
      with FrmChama_Fornecedor.qrychama_fornecedor do
        begin
          close;
          sql.clear;
          sql.add('select Forn.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Setor from Fornecedor Forn');
          sql.add('left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)');

          if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Forn.CNPJ like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Codigo')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where Forn.CNPJ like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Nome_Fantasia')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where Forn.CNPJ like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.Razao_Social')
          else if (FrmChama_Fornecedor.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where Forn.CNPJ like '''+ FrmChama_Fornecedor.EdtConsulta.Text +'%''order by Forn.CNPJ');
          //Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR';
          open;

          if (FrmChama_Fornecedor.qrychama_fornecedor.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Funcionario(descricao: string);
begin
  if (FrmChama_Funcionario.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Funcionario.qrychama_funcionario do
        begin
          close;
          sql.clear;
          sql.add('select Fun.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao Setor, Car.Descricao as Cargo, Dep.Descricao as Departamento from Funcionario Fun');
          sql.add('left join Cidade Ci on (Fun.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Fun.Codigo_Setor = Se.Codigo)');
          sql.add('left join Cargo Car on (Fun.Codigo_Cargo = Car.Codigo)');
          sql.add('left join Departamento Dep on (Fun.Codigo_Departamento = Dep.Codigo)');

          if (FrmChama_Funcionario.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Fun.Codigo like '''+ FrmChama_Funcionario.EdtConsulta.Text +'%''order by Fun.Codigo')
          else
            sql.add('where Fun.Codigo like '''+ FrmChama_Funcionario.EdtConsulta.Text +'%''order by Fun.Nome');
          open;

          if (FrmChama_Funcionario.qrychama_funcionario.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Funcionario.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Funcionario.qrychama_funcionario do
            begin
              close;
              sql.clear;
              sql.add('select Fun.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao Setor, Car.Descricao as Cargo, Dep.Descricao as Departamento from Funcionario Fun');
              sql.add('left join Cidade Ci on (Fun.Codigo_Cidade = Ci.Codigo)');
              sql.add('left join Setor Se on (Fun.Codigo_Setor = Se.Codigo)');
              sql.add('left join Cargo Car on (Fun.Codigo_Cargo = Car.Codigo)');
              sql.add('left join Departamento Dep on (Fun.Codigo_Departamento = Dep.Codigo)');

              if (FrmChama_Funcionario.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where Fun.Nome like '''+ FrmChama_Funcionario.EdtConsulta.Text +'%''order by Fun.Codigo')
              else
                sql.add('where Fun.Nome like '''+ FrmChama_Funcionario.EdtConsulta.Text +'%''order by Fun.Nome');
              open;

              if (FrmChama_Funcionario.qrychama_funcionario.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Funcionario_LookUp(var Conexao: TADOConnection);
begin
  with dm.qrychama_funcionario, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select F.Codigo, F.Nome, F.Comissao, F.Comissao_Servico from Funcionario F');
    open;
    First;
  end;
end;

procedure TConsulta.Chama_Funcionario_Outros;
begin
  with FrmChama_Funcionario.qrychama_outros do
  begin
    close;
    sql.clear;
    sql.add('select * from Funcionario_Outros');
    sql.add('where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= FrmChama_Funcionario.qrychama_funcionarioCodigo.AsInteger;
    open;
  end;
end;

procedure TConsulta.Chama_Grupo(descricao: string);
begin
  if (FrmChama_Grupo_Cliente.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Grupo_Cliente.qrychama_grupo do
        begin
          close;
          sql.clear;
          sql.add('Select * from Grupo_Cliente GC');
          if (FrmChama_Grupo_Cliente.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where GC.Codigo like '''+ FrmChama_Grupo_Cliente.EdtConsulta.Text +'%''order by GC.Codigo')
          else
            sql.add('where GC.Codigo like '''+ FrmChama_Grupo_Cliente.EdtConsulta.Text +'%''order by GC.Descricao');
          open;

          if (FrmChama_Grupo_Cliente.qrychama_grupo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Grupo_Cliente.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Grupo_Cliente.qrychama_grupo do
            begin
              close;
              sql.clear;
              sql.add('Select * from Grupo_Cliente GC');
              if (FrmChama_Grupo_Cliente.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where GC.Descricao like '''+ FrmChama_Grupo_Cliente.EdtConsulta.Text +'%''order by GC.Codigo')
              else
                sql.add('where GC.Descricao like '''+ FrmChama_Grupo_Cliente.EdtConsulta.Text +'%''order by GC.Descricao');
              open;

              if (FrmChama_Grupo_Cliente.qrychama_grupo.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Grupo_Produto(descricao: string);
begin
  if (FrmChama_Grupo_Produto.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Grupo_Produto.qrychama_grupo do
        begin
          close;
          sql.clear;
          sql.add('select GP.*, GP1.Descricao as Sub, TI.Descricao as ICMS, TCO.Descricao as COFINS,');
          sql.add('TIPI.Descricao as IPI, TPIS.Descricao as PIS from Grupo_Produto GP');
          sql.add('left join Tratamento_ICMS TI on (GP.Codigo_Grupo_ICMS = TI.Codigo)');
          sql.add('left join Tratamento_COFINS TCO on (GP.Codigo_Grupo_COFINS= TCO.Codigo)');
          sql.add('left join Tratamento_IPI TIPI on (GP.Codigo_Grupo_IPI = TIPI.Codigo)');
          sql.add('left join Tratamento_PIS TPIS on (GP.Codigo_Grupo_PIS = TPIS.Codigo)');
          sql.add('left join Grupo_Produto GP1 on(GP.Codigo_Sub_Grupo = GP1.Codigo)');
          if (FrmChama_Grupo_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where GP.Codigo like '''+ FrmChama_Grupo_Produto.EdtConsulta.Text +'%''order by GP.Codigo')
          else
            sql.add('where GP.Codigo like '''+ FrmChama_Grupo_Produto.EdtConsulta.Text +'%''order by GP.Descricao');
          open;

          if (FrmChama_Grupo_Produto.qrychama_grupo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Grupo_Produto.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Grupo_Produto.qrychama_grupo do
            begin
              close;
              sql.clear;
              sql.add('select GP.*, GP1.Descricao as Sub, TI.Descricao as ICMS, TCO.Descricao as COFINS,');
              sql.add('TIPI.Descricao as IPI, TPIS.Descricao as PIS from Grupo_Produto GP');
              sql.add('left join Tratamento_ICMS TI on (GP.Codigo_Grupo_ICMS = TI.Codigo)');
              sql.add('left join Tratamento_COFINS TCO on (GP.Codigo_Grupo_COFINS= TCO.Codigo)');
              sql.add('left join Tratamento_IPI TIPI on (GP.Codigo_Grupo_IPI = TIPI.Codigo)');
              sql.add('left join Tratamento_PIS TPIS on (GP.Codigo_Grupo_PIS = TPIS.Codigo)');
              sql.add('left join Grupo_Produto GP1 on(GP.Codigo_Sub_Grupo = GP1.Codigo)');
              if (FrmChama_Grupo_Produto.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where GP.Descricao like '''+ FrmChama_Grupo_Produto.EdtConsulta.Text +'%''order by GP.Codigo')
              else
                sql.add('where GP.Descricao like '''+ FrmChama_Grupo_Produto.EdtConsulta.Text +'%''order by GP.Descricao');
              open;

              if (FrmChama_Grupo_Produto.qrychama_grupo.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Grupo_Produto_Tributacao;
begin
  if (FrmChama_Grupo_Produto_Tributacao.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Grupo_Produto_Tributacao.qrychama_grupo do
        begin
          close;
          sql.clear;
          sql.add('select GPT.*, TI.Descricao from Grupo_Produto_Tributacao GPT');
          sql.add('inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
          if (FrmChama_Grupo_Produto_Tributacao.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where GPT.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao.EdtConsulta.Text +'%''order by GPT.Codigo')
          else
            sql.add('where GPT.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao.EdtConsulta.Text +'%''order by GPT.Descricao');
          open;

          if (FrmChama_Grupo_Produto_Tributacao.qrychama_grupo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Grupo_Produto_Tributacao.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Grupo_Produto_Tributacao.qrychama_grupo do
            begin
              close;
              sql.clear;
              sql.add('select GPT.*, TI.Descricao from Grupo_Produto_Tributacao GPT');
              sql.add('inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
              if (FrmChama_Grupo_Produto_Tributacao.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where GPT.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao.EdtConsulta.Text +'%''order by GPT.Codigo')
              else
                sql.add('where GPT.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao.EdtConsulta.Text +'%''order by GPT.Descricao');
              open;

              if (FrmChama_Grupo_Produto_Tributacao.qrychama_grupo.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Grupo_Produto_Tributacao_COFINS;
begin
  if (FrmChama_Grupo_Produto_Tributacao_COFINS.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Grupo_Produto_Tributacao_COFINS.qrychama_grupo do
        begin
          close;
          sql.clear;
          sql.add('select GPTC.*, TC.Descricao from Grupo_Produto_Tributacao_COFINS GPTC');
          sql.add('inner join Tratamento_COFINS TC on (GPTC.Codigo_Tratamento_COFINS = TC.Codigo)');

          if (FrmChama_Grupo_Produto_Tributacao_COFINS.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where GPTC.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao_COFINS.EdtConsulta.Text +'%''order by GPTC.Codigo')
          else
            sql.add('where GPTC.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao_COFINS.EdtConsulta.Text +'%''order by GPTC.Descricao');
          open;

          if (FrmChama_Grupo_Produto_Tributacao_COFINS.qrychama_grupo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Grupo_Produto_Tributacao_COFINS.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Grupo_Produto_Tributacao_COFINS.qrychama_grupo do
            begin
              close;
              sql.clear;
              sql.add('select GPTC.*, TC.Descricao from Grupo_Produto_Tributacao_COFINS GPTC');
              sql.add('inner join Tratamento_COFINS TC on (GPTC.Codigo_Tratamento_COFINS = TC.Codigo)');

              if (FrmChama_Grupo_Produto_Tributacao_COFINS.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where GPTC.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao_COFINS.EdtConsulta.Text +'%''order by GPTC.Codigo')
              else
                sql.add('where GPTC.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao_COFINS.EdtConsulta.Text +'%''order by GPTC.Descricao');
              open;

              if (FrmChama_Grupo_Produto_Tributacao_COFINS.qrychama_grupo.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Grupo_Produto_Tributacao_IPI;
begin
  if (FrmChama_Grupo_Produto_Tributacao_IPI.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Grupo_Produto_Tributacao_IPI.qrychama_grupo do
        begin
          close;
          sql.clear;
          sql.add('select GPTIPI.*, TIPI.Descricao from Grupo_Produto_Tributacao_IPI GPTIPI');
          sql.add('inner join Tratamento_IPI TIPI on (GPTIPI.Codigo_Tratamento_IPI = TIPI.Codigo)');

          if (FrmChama_Grupo_Produto_Tributacao_IPI.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where GPTIPI.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao_IPI.EdtConsulta.Text +'%''order by GPTIPI.Codigo')
          else
            sql.add('where GPTIPI.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao_IPI.EdtConsulta.Text +'%''order by GPTIPI.Descricao');
          open;

          if (FrmChama_Grupo_Produto_Tributacao_IPI.qrychama_grupo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Grupo_Produto_Tributacao_IPI.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Grupo_Produto_Tributacao_IPI.qrychama_grupo do
            begin
              close;
              sql.clear;
              sql.add('select GPTIPI.*, TIPI.Descricao from Grupo_Produto_Tributacao_IPI GPTIPI');
              sql.add('inner join Tratamento_IPI TIPI on (GPTIPI.Codigo_Tratamento_IPI = TIPI.Codigo)');

              if (FrmChama_Grupo_Produto_Tributacao_IPI.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where GPTIPI.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao_IPI.EdtConsulta.Text +'%''order by GPTIPI.Codigo')
              else
                sql.add('where GPTIPI.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao_IPI.EdtConsulta.Text +'%''order by GPTIPI.Descricao');
              open;

              if (FrmChama_Grupo_Produto_Tributacao_IPI.qrychama_grupo.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Grupo_Produto_Tributacao_PIS;
begin
  if (FrmChama_Grupo_Produto_Tributacao_PIS.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Grupo_Produto_Tributacao_PIS.qrychama_grupo do
        begin
          close;
          sql.clear;
          sql.add('select GPTP.*, TPIS.Descricao from Grupo_Produto_Tributacao_PIS GPTP');
          sql.add('inner join Tratamento_PIS TPIS on (GPTP.Codigo_Tratamento_PIS = TPIS.Codigo)');
          if (FrmChama_Grupo_Produto_Tributacao_PIS.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where GPTP.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao_PIS.EdtConsulta.Text +'%''order by GPTP.Codigo')
          else
            sql.add('where GPTP.Codigo like '''+ FrmChama_Grupo_Produto_Tributacao_PIS.EdtConsulta.Text +'%''order by GPTP.Descricao');
          open;

          if (FrmChama_Grupo_Produto_Tributacao_PIS.qrychama_grupo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Grupo_Produto_Tributacao_PIS.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Grupo_Produto_Tributacao_PIS.qrychama_grupo do
            begin
              close;
              sql.clear;
              sql.add('select GPTP.*, TPIS.Descricao from Grupo_Produto_Tributacao_PIS GPTP');
              sql.add('inner join Tratamento_PIS TPIS on (GPTP.Codigo_Tratamento_PIS = TPIS.Codigo)');
              if (FrmChama_Grupo_Produto_Tributacao_PIS.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where GPTP.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao_PIS.EdtConsulta.Text +'%''order by GPTP.Codigo')
              else
                sql.add('where GPTP.Descricao like '''+ FrmChama_Grupo_Produto_Tributacao_PIS.EdtConsulta.Text +'%''order by GPTP.Descricao');
              open;

              if (FrmChama_Grupo_Produto_Tributacao_PIS.qrychama_grupo.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Itens_Folha(descricao: string);
begin
  if (FrmChama_Itens_Folha.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Itens_Folha.qrychama_itens do
        begin
          close;
          sql.clear;
          sql.add('Select * from Itens_Folha IFF');
          if (FrmChama_Itens_Folha.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where IFF.Codigo like '''+ FrmChama_Itens_Folha.EdtConsulta.Text +'%''order by IFF.Codigo')
          else
            sql.add('where IFF.Codigo like '''+ FrmChama_Itens_Folha.EdtConsulta.Text +'%''order by IFF.Descricao');
          open;

          if (FrmChama_Itens_Folha.qrychama_itens.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Itens_Folha.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Itens_Folha.qrychama_itens do
            begin
              close;
              sql.clear;
              sql.add('Select * from Itens_Folha IFF');
              if (FrmChama_Itens_Folha.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where IFF.Descricao like '''+ FrmChama_Itens_Folha.EdtConsulta.Text +'%''order by IFF.Codigo')
              else
                sql.add('where IFF.Descricao like '''+ FrmChama_Itens_Folha.EdtConsulta.Text +'%''order by IFF.Descricao');
              open;

              if (FrmChama_Itens_Folha.qrychama_itens.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Itens_Receita;
begin
  if (FrmCadastro_Receita.achei = true) then
  begin
    with FrmCadastro_Receita.qryitens_receita do
    begin
      close;
      sql.clear;
      sql.add('select IR.*, P.Codigo as Codigo_Produto, P.Descricao, P.Estoque from Itens_Receita IR');
      sql.add('inner join Produto P on (IR.Codigo_Insumo = P.Codigo)');
      sql.Add('where IR.Codigo = :Codigo_Produto');
      Parameters.ParamByName('Codigo_Produto').Value:= StrToInt(FrmCadastro_Receita.EdtCodigo.Text);
      open;
    end;
  end;
end;

procedure TConsulta.Chama_Lancamento_Banco(descricao: string);
begin
  if (FrmChama_Lancamento_Banco.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Lancamento_Banco.qrychama_lancamento do
        begin
          close;
          sql.clear;
          sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Descricao as Plano, CCh.N_Cheque from Lancamento_Banco LB');
          sql.add('left join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
          sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
          sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
          sql.add('left join Cheque CCh on (LB.Codigo_Cheque = CCh.Codigo)');
          sql.add('where LB.Codigo_Empresa = :Empresa and LB.N_Documento like '''+ FrmChama_Lancamento_Banco.EdtConsulta.Text +'%''order by LB.Codigo');

          Parameters.ParamByName('Empresa').Value:= codigo_empresa;
          open;

          if (FrmChama_Lancamento_Banco.qrychama_lancamento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Lancamento_Banco.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Lancamento_Banco.qrychama_lancamento do
            begin
              close;
              sql.clear;
              sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Descricao as Plano, CCh.N_Cheque from Lancamento_Banco LB');
              sql.add('left join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
              sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
              sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
              sql.add('left join Cheque CCh on (LB.Codigo_Cheque = CCh.Codigo)');
              sql.add('where LB.Codigo_Empresa = :Empresa and CC.Conta like '''+ FrmChama_Lancamento_Banco.EdtConsulta.Text +'%''order by LB.Codigo');

              Parameters.ParamByName('Empresa').Value:= codigo_empresa;
              open;

              if (FrmChama_Lancamento_Banco.qrychama_lancamento.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Lancamento_Caixa;
begin
  if (FrmChama_Lancamento_Caixa.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmChama_Lancamento_Caixa.qrychama_lancamento do
    begin
      close;
      sql.clear;
      sql.add('select FV.*, CC.Conta, OB.Operacao, OB.Tipo as TipoOperacao, Codigo_Usuario, FU.Nome as NomeFuncionario from Fechamento_Venda FV');
      sql.add('left join Conta_Corrente CC on (FV.Codigo_Conta = CC.Codigo)');
      sql.add('left join Operacao_Bancaria OB on (FV.Codigo_Operacao = OB.Codigo)');
      sql.add('left join Funcionario FU on (FV.Codigo_Usuario = FU.Codigo)');
      sql.add('where FV.Codigo_Empresa = :Empresa and FV.Data = :Data');

      Parameters.ParamByName('Empresa').Value:= codigo_empresa;
      //Parameters.ParamByName('Usuario').Value:= codigo_usu;
      Parameters.ParamByName('Data').Value:= StrToDateTime(FrmChama_Lancamento_Caixa.MEdtData_Lancamento.Text);
      open;

      if (FrmChama_Lancamento_Caixa.qrychama_lancamento.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
  end;
end;

procedure TConsulta.Chama_Lancamento_Conciliacao(descricao: string);
begin
  if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConciliacao_Bancaria.qryconciliacao_bancaria do
        begin
          close;
          sql.clear;
          sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Descricao as Plano from Lancamento_Banco LB');
          sql.add('inner join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
          sql.add('inner join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
          sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
          sql.add('where LB.Status = :Status and LB.N_Documento like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.Codigo');

          if (FrmConciliacao_Bancaria.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'BLOQUEADO'
          else
            Parameters.ParamByName('Status').Value:= 'LIBERADO';
          open;

          if (FrmConciliacao_Bancaria.qryconciliacao_bancaria.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmConciliacao_Bancaria.qryconciliacao_bancaria do
        begin
          close;
          sql.clear;
          sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Descricao as Plano from Lancamento_Banco LB');
          sql.add('inner join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
          sql.add('inner join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
          sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
          sql.add('where LB.Status = :Status and CC.Conta like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.Codigo');

          if (FrmConciliacao_Bancaria.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'BLOQUEADO'
          else
            Parameters.ParamByName('Status').Value:= 'LIBERADO';
          open;

          if (FrmConciliacao_Bancaria.qryconciliacao_bancaria.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 2) then
    begin
      with FrmConciliacao_Bancaria.qryconciliacao_bancaria do
        begin
          close;
          sql.clear;
          sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Descricao as Plano from Lancamento_Banco LB');
          sql.add('inner join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
          sql.add('inner join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
          sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
          sql.add('where LB.Status = :Status and LB.Data_Lancamento like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.Codigo');
                  
          if (FrmConciliacao_Bancaria.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'BLOQUEADO'
          else
            Parameters.ParamByName('Status').Value:= 'LIBERADO';
          open;

          if (FrmConciliacao_Bancaria.qryconciliacao_bancaria.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Lancamento_Financeiro(descricao: string);
begin
  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    begin
      with FrmChama_Lancamentos_Financeiros.qrychama_lancamento do
        begin
          close;
          sql.clear;
          sql.add('select Forn.Codigo as Cod, Forn.Nome_Fantasia as Nome, PL.Codigo, PL.N_Documento, LF.Data_Lancamento, ');
          sql.add('LF.Codigo_Plano, LF.Tipo, LF.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Parcela, PL.Valor, PL.Valor_Pagar, PL.Valor_Restante, ');
          sql.add('PL.Desconto, PL.Acrescimo, PL.Valor_Pago, PL.Codigo_Conta, PL.Codigo_Cheque, P.COO, datediff(day, getDate(), PL.Data_Vencimento) as Dias_Venc,');
          sql.add('CP.Descricao as Cond_Pag, CP.Tipo_Pagamento, LF.Codigo_Forma_Pagamento from Parcelas_Lancamentos PL');
          sql.add('left join Lancamento_Financeiro LF on(PL.Codigo = LF.Codigo)');
          sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
          sql.add('left join Pedido P on(LF.N_Documento = P.Codigo)');
          sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by Forn.Nome_Fantasia');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by Forn.Nome_Fantasia');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente group by Form.Nome_Fantasia order by Forn.Nome_Fantasia');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by Forn.Nome_Fantasia');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;


          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;




          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;
          Parameters.ParamByName('Tipo').Value:= 'PAGAR';

          if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Pendente').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Pendente').Value:= 'PAGO';
          Parameters.ParamByName('Empresa').Value:= codigo_empresa;
          open;

          //FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text:= FormatFloat('#0.0,0', FrmChama_Lancamentos_Financeiros.qrychama_lancamento.FieldByName('Valor_par').AsFloat);
          //FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text:= StringReplace(FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
          if (FrmChama_Lancamentos_Financeiros.qrychama_lancamento.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
        end;
    end
    else
    if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    begin
      with FrmChama_Lancamentos_Financeiros.qrychama_lancamento do
        begin
          close;
          sql.clear;
          sql.add('select Cli.Codigo as Cod, Cli.Nome_Nome_Fantasia as Nome, PL.Codigo, PL.N_Documento, LF.Data_Lancamento, ');
          sql.add('LF.Codigo_Plano, LF.Tipo, LF.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Parcela, PL.Valor, PL.Valor_Pagar, PL.Valor_Restante, ');
          sql.add('PL.Desconto, PL.Acrescimo, PL.Valor_Pago, PL.Codigo_Conta, PL.Codigo_Cheque, P.COO, datediff(day, getDate(), PL.Data_Vencimento) as Dias_Venc,');
          sql.add('CP.Descricao as Cond_Pag, CP.Tipo_Pagamento, LF.Codigo_Forma_Pagamento from Parcelas_Lancamentos PL');
          sql.add('left join Lancamento_Financeiro LF on(PL.Codigo = LF.Codigo)');
          sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
          sql.add('left join Pedido P on(LF.N_Documento = P.Codigo)');
          sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;


          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;



          Parameters.ParamByName('Tipo').Value:= 'RECEBER';
          if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Pendente').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Pendente').Value:= 'PAGO';
          Parameters.ParamByName('Empresa').Value:= codigo_empresa;
          open;

          if (FrmChama_Lancamentos_Financeiros.qrychama_lancamento.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
        end;
    end;
end;

procedure TConsulta.Chama_Lancamento_Financeiro_Alterar;
begin
  if (FrmChama_Lancamento_Financeiro_Alterar.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmChama_Lancamento_Financeiro_Alterar.RGTipo.ItemIndex = 0) then
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Forn.Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Fornecedor Forn on (LF.Codigo_Cli_For = Forn.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Codigo like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text +'%''');

            Parameters.ParamByName('Tipo').Value:= 'PAGAR';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end
      else
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome_Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Codigo like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text +'%''');

            Parameters.ParamByName('Tipo').Value:= 'RECEBER';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end;
    end
    else if (FrmChama_Lancamento_Financeiro_Alterar.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmChama_Lancamento_Financeiro_Alterar.RGTipo.ItemIndex = 0) then
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Forn.Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Fornecedor Forn on (LF.Codigo_Cli_For = Forn.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.N_Documento like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text +'%''');

            Parameters.ParamByName('Tipo').Value:= 'PAGAR';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end
      else
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome_Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.N_Documento like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text+'%''');

            Parameters.ParamByName('Tipo').Value:= 'RECEBER';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end;
    end
    else if (FrmChama_Lancamento_Financeiro_Alterar.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmChama_Lancamento_Financeiro_Alterar.RGTipo.ItemIndex = 0) then
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Forn.Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Fornecedor Forn on (LF.Codigo_Cli_For = Forn.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Historico like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text+'%''');

            Parameters.ParamByName('Tipo').Value:= 'PAGAR';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end
      else
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome_Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Historico like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text+'%''');

            Parameters.ParamByName('Tipo').Value:= 'RECEBER';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end;
    end
    else if (FrmChama_Lancamento_Financeiro_Alterar.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmChama_Lancamento_Financeiro_Alterar.RGTipo.ItemIndex = 0) then
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Forn.Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Fornecedor Forn on (LF.Codigo_Cli_For = Forn.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text+'%''');

            Parameters.ParamByName('Tipo').Value:= 'PAGAR';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end
      else
      begin
        with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento do
          begin
            close;
            sql.clear;
            sql.add('select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome_Nome_Fantasia as Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
            sql.add('PF.Descricao as Plano_Financeiro from Lancamento_Financeiro LF');
            sql.add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
            sql.add('left join Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
            sql.add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
            sql.add('left join Departamento D on (LF.Codigo_Departamento = D.Codigo)');
            sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text+'%''');

            Parameters.ParamByName('Tipo').Value:= 'RECEBER';
            Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
            open;

            if (FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end;
    end;
end;

procedure TConsulta.Chama_Local_Produto(descricao: string);
begin
  if (FrmChama_Local_Produto.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Local_Produto.qrychama_local do
        begin
          close;
          sql.clear;
          sql.add('Select * from Localidade_Produto LP');
          if (FrmChama_Local_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where LP.Codigo like '''+ FrmChama_Local_Produto.EdtConsulta.Text +'%''order by LP.Codigo')
          else
            sql.add('where LP.Codigo like '''+ FrmChama_Local_Produto.EdtConsulta.Text +'%''order by LP.Local');
          open;

          if (FrmChama_Local_Produto.qrychama_local.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Local_Produto.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Local_Produto.qrychama_local do
            begin
              with FrmChama_Local_Produto.qrychama_local do
                begin
                  close;
                  sql.clear;
                  sql.add('Select * from Localidade_Produto LP');
                  if (FrmChama_Local_Produto.RGOrdena_Por.ItemIndex = 0) then
                    sql.add('where LP.Local like '''+ FrmChama_Local_Produto.EdtConsulta.Text +'%''order by LP.Codigo')
                  else
                    sql.add('where LP.Local like '''+ FrmChama_Local_Produto.EdtConsulta.Text +'%''order by LP.Local');
                  open;

                  if (FrmChama_Local_Produto.qrychama_local.IsEmpty = true) then
                    begin
                      Mensagem_Fim_Pesquisa;
                      abort;
                    end;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Logradouro(descricao: string);
begin
  if (FrmChama_Logradouro.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Logradouro.qrychama_logradouro do
        begin
          close;
          sql.clear;
          sql.add('Select L.Codigo, L.Descricao, L.Tipo_Logradouro, L.CEP, L.Data_Cadastro from Logradouro L');
          if (FrmChama_Logradouro.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where L.Codigo like '''+ FrmChama_Logradouro.EdtConsulta.Text +'%''order by L.Codigo')
          else
            sql.add('where L.Codigo like '''+ FrmChama_Logradouro.EdtConsulta.Text +'%''order by L.Descricao');
          open;

          if (FrmChama_Logradouro.qrychama_logradouro.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Logradouro.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Logradouro.qrychama_logradouro do
            begin
              close;
              sql.clear;
              sql.add('Select L.Codigo, L.Descricao, L.Tipo_Logradouro, L.CEP, L.Data_Cadastro from Logradouro L');
              if (FrmChama_Logradouro.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where L.Descricao like '''+ FrmChama_Logradouro.EdtConsulta.Text +'%''order by L.Codigo')
              else
                sql.add('where L.Descricao like '''+ FrmChama_Logradouro.EdtConsulta.Text +'%''order by L.Descricao');
              open;
            end;
        end;
end;

procedure TConsulta.Chama_Marca(descricao: string);
begin
  if (FrmChama_Marca.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Marca.qrychama_marca do
        begin
          close;
          sql.clear;
          sql.add('Select * from Marca M');
          if (FrmChama_Marca.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where M.Codigo like '''+ FrmChama_Marca.EdtConsulta.Text +'%''order by M.Codigo')
          else
            sql.add('where M.Codigo like '''+ FrmChama_Marca.EdtConsulta.Text +'%''order by M.Descricao');
          open;

          if (FrmChama_Marca.qrychama_marca.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Marca.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Marca.qrychama_marca do
            begin
              close;
              sql.clear;
              sql.add('Select * from Marca M');
              if (FrmChama_Marca.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where M.Descricao like '''+ FrmChama_Marca.EdtConsulta.Text +'%''order by M.Codigo')
              else
                sql.add('where M.Descricao like '''+ FrmChama_Marca.EdtConsulta.Text +'%''order by M.Descricao');
              open;

              if (FrmChama_Marca.qrychama_marca.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_NCM;
begin
  if (FrmChama_NCM.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_NCM.qrychama_ncm do
        begin
          close;
          sql.clear;
          sql.add('SELECT Codigo');
          sql.add('      ,Codigo_NCM');
          sql.add('      ,Descricao');
          sql.add('      ,Data_Cadastro');
          sql.add('      ,Ex');
          sql.add('      ,Aliquota_Nacional');
          sql.add('      ,Aliquota_Importada');
          sql.add('      ,Versao');
          sql.add('      ,Tabela');
          sql.add('      ,Aliquota_Estadual');
          sql.add('      ,Aliquota_Municipal');
          sql.add('      ,CONVERT(varchar,Vigencia_Inicio,103) as Vigencia_Inicio');
          sql.add('      ,CONVERT(varchar,Vigencia_Fim,103) as Vigencia_Fim');
          sql.add('      ,IVA');
          sql.add('  FROM NCM');
          if (FrmChama_NCM.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where NCM.Codigo_NCM like '''+ FrmChama_NCM.EdtConsulta.Text +'%''order by NCM.Codigo_NCM')
          else
            sql.add('where NCM.Codigo_NCM like '''+ FrmChama_NCM.EdtConsulta.Text +'%''order by NCM.Descricao');
          open;

          if (FrmChama_NCM.qrychama_ncm.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_NCM.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_NCM.qrychama_ncm do
            begin
              close;
              sql.clear;
              sql.add('SELECT Codigo');
              sql.add('      ,Codigo_NCM');
              sql.add('      ,Descricao');
              sql.add('      ,Data_Cadastro');
              sql.add('      ,Ex');
              sql.add('      ,Aliquota_Nacional');
              sql.add('      ,Aliquota_Importada');
              sql.add('      ,Versao');
              sql.add('      ,Tabela');
              sql.add('      ,Aliquota_Estadual');
              sql.add('      ,Aliquota_Municipal');
              sql.add('      ,CONVERT(varchar,Vigencia_Inicio,103) as Vigencia_Inicio');
              sql.add('      ,CONVERT(varchar,Vigencia_Fim,103) as Vigencia_Fim');
              sql.add('      ,IVA');
              sql.add('  FROM NCM');
              if (FrmChama_NCM.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where NCM.Descricao like '''+ FrmChama_NCM.EdtConsulta.Text +'%''order by NCM.Codigo_NCM')
              else
                sql.add('where NCM.Descricao like '''+ FrmChama_NCM.EdtConsulta.Text +'%''order by NCM.Descricao');
              open;

              if (FrmChama_NCM.qrychama_ncm.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Obs_Fiscal;
begin
  if (FrmChama_Observacao_Fiscal.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Observacao_Fiscal.qrychama_obs do
        begin
          close;
          sql.clear;
          sql.add('Select * from Cadastro_Observacao_Fiscal COF');
          if (FrmChama_Observacao_Fiscal.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where COF.Codigo like '''+ FrmChama_Observacao_Fiscal.EdtConsulta.Text +'%''order by COF.Codigo')
          else
            sql.add('where COF.Codigo like '''+ FrmChama_Observacao_Fiscal.EdtConsulta.Text +'%''order by COF.Descricao');
          open;

          if (FrmChama_Observacao_Fiscal.qrychama_obs.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Observacao_Fiscal.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Observacao_Fiscal.qrychama_obs do
            begin
              close;
              sql.clear;
              sql.add('Select * from Cadastro_Observacao_Fiscal COF');
              if (FrmChama_Observacao_Fiscal.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where COF.Descricao like '''+ FrmChama_Observacao_Fiscal.EdtConsulta.Text +'%''order by COF.Codigo')
              else
                sql.add('where COF.Descricao like '''+ FrmChama_Observacao_Fiscal.EdtConsulta.Text +'%''order by COF.Descricao');
              open;

              if (FrmChama_Observacao_Fiscal.qrychama_obs.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Ocorrencia;
begin
  if (FrmChama_Ocorrencia.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmChama_Ocorrencia.qrychama_ocorrencia do
      begin
        close;
        sql.clear;
        sql.add('select F.Nome, TOO.Descricao as Ocorrencia, O.* from Ocorrencia O');
        sql.add('left join Funcionario F on (O.Codigo_Funcionario = F.Codigo)');
        sql.add('left join Tipo_Ocorrencia TOO on (O.Codigo_Tipo_Ocorrencia = TOO.Codigo)');

        if (FrmChama_Ocorrencia.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where F.Nome like '''+ FrmChama_Ocorrencia.EdtConsulta.Text +'%''order by F.Nome')
        else
          sql.add('where F.Nome like '''+ FrmChama_Ocorrencia.EdtConsulta.Text +'%''order by TOO.Descricao');
        open;

        if (FrmChama_Ocorrencia.qrychama_ocorrencia.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end
    else if (FrmChama_Ocorrencia.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_Ocorrencia.qrychama_ocorrencia do
        begin
          close;
          sql.clear;
          sql.add('select F.Nome, TOO.Descricao as Ocorrencia, O.* from Ocorrencia O');
          sql.add('left join Funcionario F on (O.Codigo_Funcionario = F.Codigo)');
          sql.add('left join Tipo_Ocorrencia TOO on (O.Codigo_Tipo_Ocorrencia = TOO.Codigo)');

          if (FrmChama_Ocorrencia.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TOO.Descricao like '''+ FrmChama_Ocorrencia.EdtConsulta.Text +'%''order by F.Nome')
          else
            sql.add('where TOO.Descricao like '''+ FrmChama_Ocorrencia.EdtConsulta.Text +'%''order by TOO.Descricao');
          open;

          if (FrmChama_Ocorrencia.qrychama_ocorrencia.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Ocorrencia_Cobranca;
begin
  if (FrmChama_Ocorrencia_Cobranca.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmChama_Ocorrencia_Cobranca.qrychama_ocorrencia do
    begin
      close;
      sql.clear;
      sql.add('select LFOC.* from Lancamento_Financeiro_Ocorrencia_Cobranca LFOC');
      sql.add('where LFOC.N_Documento like '''+ FrmChama_Ocorrencia_Cobranca.EdtConsulta.Text +'%''order by LFOC.Codigo');
      open;

      if (FrmChama_Ocorrencia_Cobranca.qrychama_ocorrencia.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
  end
  else if (FrmChama_Ocorrencia_Cobranca.RGConsulta_Por.ItemIndex = 1) then
  begin
    with FrmChama_Ocorrencia_Cobranca.qrychama_ocorrencia do
    begin
      close;
      sql.clear;
      sql.add('select LFOC.* from Lancamento_Financeiro_Ocorrencia_Cobranca LFOC');
      sql.add('where LFOC.Data_Cobranca like '''+ FrmChama_Ocorrencia_Cobranca.EdtConsulta.Text +'%''order by LFOC.Codigo');
      open;

      if (FrmChama_Ocorrencia_Cobranca.qrychama_ocorrencia.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
  end
  else if (FrmChama_Ocorrencia_Cobranca.RGConsulta_Por.ItemIndex = 2) then
  begin
    with FrmChama_Ocorrencia_Cobranca.qrychama_ocorrencia do
    begin
      close;
      sql.clear;
      sql.add('select LFOC.* from Lancamento_Financeiro_Ocorrencia_Cobranca LFOC');
      sql.add('where LFOC.Observacoes like ''%'+ FrmChama_Ocorrencia_Cobranca.EdtConsulta.Text +'%''order by LFOC.Codigo');
      open;

      if (FrmChama_Ocorrencia_Cobranca.qrychama_ocorrencia.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
  end;
end;

procedure TConsulta.Chama_Operacao_Bancaria(descricao: string);
begin
  if (FrmChama_Operacao_Bancaria.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Operacao_Bancaria.qrychama_operacao do
        begin
          close;
          sql.clear;
          sql.add('Select * from Operacao_Bancaria OB');
          if (FrmChama_Operacao_Bancaria.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where OB.Codigo like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Codigo')
          else
            sql.add('where OB.Codigo like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Operacao');
          open;

          if (FrmChama_Operacao_Bancaria.qrychama_operacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Operacao_Bancaria.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Operacao_Bancaria.qrychama_operacao do
            begin
              close;
              sql.clear;
              sql.add('Select * from Operacao_Bancaria OB');
              if (FrmChama_Operacao_Bancaria.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where OB.Operacao like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Codigo')
              else
                sql.add('where OB.Operacao like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Operacao');
              open;

              if (FrmChama_Operacao_Bancaria.qrychama_operacao.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Ordem_Entrega;
begin
  if (FrmGera_Ordem_Entrega.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmGera_Ordem_Entrega.EdtN_Pedido.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmGera_Ordem_Entrega.EdtN_Pedido.SetFocus;
        abort;
      end;

      with FrmGera_Ordem_Entrega.qrypedido do
        begin
          close;
          sql.clear;
          sql.add('select P.*, C.Nome_Nome_Fantasia from Pedido P');
          sql.add('inner join Cliente C on (P.Codigo_Cliente = C.Codigo)');

          if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.N_Pedido = :Pedido and P.Tipo = :Tipo order by C.Nome_Nome_Fantasia')
          else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where P.N_Pedido = :Pedido and P.Tipo = :Tipo order by P.Data_Venda')
          else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where P.N_Pedido = :Pedido and P.Tipo = :Tipo order by P.Data_Previsao_Entrega')
          else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where P.N_Pedido = :Pedido and P.Tipo = :Tipo order by P.Total_Pedido');
          Parameters.ParamByName('Pedido').Value:= FrmGera_Ordem_Entrega.EdtN_Pedido.Text;
          Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
          open;

          if (FrmGera_Ordem_Entrega.qrypedido.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    if (FrmGera_Ordem_Entrega.RGConsulta_Por.ItemIndex = 1) then
      begin
        if (FrmGera_Ordem_Entrega.EdtCodigo_Cliente.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmGera_Ordem_Entrega.EdtCodigo_Cliente.SetFocus;
          abort;
        end;

        with FrmGera_Ordem_Entrega.qrypedido do
          begin
            close;
            sql.clear;
            sql.add('select P.*, C.Nome_Nome_Fantasia from Pedido P');
            sql.add('inner join Cliente C on (P.Codigo_Cliente = C.Codigo)');

            if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 0) then
              sql.add('where P.Codigo_Cliente = :Pedido and P.Tipo = :Tipo order by C.Nome_Nome_Fantasia')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 1) then
              sql.add('where P.Codigo_Cliente = :Pedido and P.Tipo = :Tipo order by P.Data_Venda')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 2) then
              sql.add('where P.Codigo_Cliente = :Pedido and P.Tipo = :Tipo order by P.Data_Previsao_Entrega')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 3) then
              sql.add('where P.Codigo_Cliente = :Pedido and P.Tipo = :Tipo order by P.Total_Pedido');
            Parameters.ParamByName('Pedido').Value:= FrmGera_Ordem_Entrega.EdtCodigo_Cliente.Text;
            Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
            open;

            if (FrmGera_Ordem_Entrega.qrypedido.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end
      else
      if (FrmGera_Ordem_Entrega.RGConsulta_Por.ItemIndex = 2) then
      begin
        if (FrmGera_Ordem_Entrega.MEdtData_Inicial.Text = '  /  /    ') or (FrmGera_Ordem_Entrega.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem_Falta_Dados;
          FrmGera_Ordem_Entrega.MEdtData_Inicial.SetFocus;
          abort;
        end;

        with FrmGera_Ordem_Entrega.qrypedido do
          begin
            close;
            sql.clear;
            sql.add('select P.*, C.Nome_Nome_Fantasia from Pedido P');
            sql.add('inner join Cliente C on (P.Codigo_Cliente = C.Codigo)');

            if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 0) then
              sql.add('where P.Data_Venda between :DI and :DF and P.Tipo = :Tipo order by C.Nome_Nome_Fantasia')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 1) then
              sql.add('where P.Data_Venda between :DI and :DF and P.Tipo = :Tipo order by P.Data_Venda')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 2) then
              sql.add('where P.Data_Venda between :DI and :DF and P.Tipo = :Tipo order by P.Data_Previsao_Entrega')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 3) then
              sql.add('where P.Data_Venda between :DI and :DF and P.Tipo = :Tipo order by P.Total_Pedido');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmGera_Ordem_Entrega.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmGera_Ordem_Entrega.MEdtData_Final.Text);
            Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
            open;

            if (FrmGera_Ordem_Entrega.qrypedido.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end
      else
      if (FrmGera_Ordem_Entrega.RGConsulta_Por.ItemIndex = 3) then
      begin
        if (FrmGera_Ordem_Entrega.MEdtData_Inicial.Text = '  /  /    ') or (FrmGera_Ordem_Entrega.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem_Falta_Dados;
          FrmGera_Ordem_Entrega.MEdtData_Inicial.SetFocus;
          abort;
        end;

        with FrmGera_Ordem_Entrega.qrypedido do
          begin
            close;
            sql.clear;
            sql.add('select P.*, C.Nome_Nome_Fantasia from Pedido P');
            sql.add('inner join Cliente C on (P.Codigo_Cliente = C.Codigo)');

            if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 0) then
              sql.add('where P.Data_Previsao_Entrega between :DI and :DF and P.Tipo = :Tipo order by C.Nome_Nome_Fantasia')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 1) then
              sql.add('where P.Data_Previsao_Entrega between :DI and :DF and P.Tipo = :Tipo order by P.Data_Venda')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 2) then
              sql.add('where P.Data_Previsao_Entrega between :DI and :DF and P.Tipo = :Tipo order by P.Data_Previsao_Entrega')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 3) then
              sql.add('where P.Data_Previsao_Entrega between :DI and :DF and P.Tipo = :Tipo order by P.Total_Pedido');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmGera_Ordem_Entrega.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmGera_Ordem_Entrega.MEdtData_Final.Text);
            Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
            open;

            if (FrmGera_Ordem_Entrega.qrypedido.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end
      else
      if (FrmGera_Ordem_Entrega.RGConsulta_Por.ItemIndex = 4) then
      begin
        if (FrmGera_Ordem_Entrega.EdtValor_Inicial.Text = '') or (FrmGera_Ordem_Entrega.EdtValor_Final.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmGera_Ordem_Entrega.EdtValor_Inicial.SetFocus;
          abort;
        end;

        with FrmGera_Ordem_Entrega.qrypedido do
          begin
            close;
            sql.clear;
            sql.add('select P.*, C.Nome_Nome_Fantasia from Pedido P');
            sql.add('inner join Cliente C on (P.Codigo_Cliente = C.Codigo)');

            if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 0) then
              sql.add('where P.Total_Pedido >= :P1 and P.Total_Pedido <= P2 and P.Tipo = :Tipo order by C.Nome_Nome_Fantasia')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 1) then
              sql.add('where P.Total_Pedido >= :P1 and P.Total_Pedido <= P2 and P.Tipo = :Tipo order by P.Data_Venda')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 2) then
              sql.add('where P.Total_Pedido >= :P1 and P.Total_Pedido <= P2 and P.Tipo = :Tipo order by P.Data_Previsao_Entrega')
            else if (FrmGera_Ordem_Entrega.RGOrdena_Por.ItemIndex = 3) then
              sql.add('where P.Total_Pedido >= :P1 and P.Total_Pedido <= P2 and P.Tipo = :Tipo order by P.Total_Pedido');
            Parameters.ParamByName('P1').Value:= StrToFloat(FrmGera_Ordem_Entrega.EdtValor_Inicial.Text);
            Parameters.ParamByName('P2').Value:= StrToFloat(FrmGera_Ordem_Entrega.EdtValor_Final.Text);
            Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
            open;

            if (FrmGera_Ordem_Entrega.qrypedido.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end;
end;

procedure TConsulta.Chama_Pais;
begin
  if (FrmChama_Pais.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Pais.qrychama_pais do
        begin
          close;
          sql.clear;
          sql.add('select * from Pais P');
          if (FrmChama_Pais.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.Codigo_Pais like '''+ FrmChama_Pais.EdtConsulta.Text +'%''order by P.Codigo_Pais')
          else
            sql.add('where P.Codigo_Pais like '''+ FrmChama_Pais.EdtConsulta.Text +'%''order by P.Descricao');
          open;

          if (FrmChama_Pais.qrychama_pais.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Pais.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Pais.qrychama_pais do
            begin
              close;
              sql.clear;
              sql.add('select * from Pais P');
              if (FrmChama_Pais.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where P.Descricao like '''+ FrmChama_Pais.EdtConsulta.Text +'%''order by P.Codigo_Pais')
              else
                sql.add('where P.Descricao like '''+ FrmChama_Pais.EdtConsulta.Text +'%''order by P.Descricao');
              open;

              if (FrmChama_Pais.qrychama_pais.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Pedido(descricao: string);
begin
  if (FrmPedido_Venda <> Nil) and (FrmPedido_Venda.ativo = true) then
  begin
    with FrmChama_Pedido.qrychama_pedido do
      begin
        close;
        sql.clear;
        sql.add('select Ped.N_Pedido, Ped.N_Pre_Venda, IP.*, P.Codigo_Venda, P.Descricao, UM.Sigla, P.ICMS from Itens_Pedido IP');
        sql.add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
        sql.add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
        sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
        sql.Add('where Ped.N_Pedido = :Pedido');
        Parameters.ParamByName('Pedido').Value:= FrmChama_Pedido.EdtConsulta.Text;
        open;
        if (FrmChama_Pedido.qrychama_pedido.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
  end
  else if (FrmPre_Venda <> Nil) and (FrmPre_Venda.ativo = true) then
  begin
    with FrmChama_Pedido.qrychama_pedido do
      begin
        close;
        sql.clear;
        sql.add('select Ped.N_Pedido, Ped.N_Pre_Venda, IP.*, P.Codigo_Venda, P.Descricao, UM.Sigla, P.ICMS from Itens_Pedido IP');
        sql.add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
        sql.add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
        sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
        sql.Add('where Ped.N_Pre_Venda = :Pedido');
        Parameters.ParamByName('Pedido').Value:= FrmChama_Pedido.EdtConsulta.Text;
        open;
        if (FrmChama_Pedido.qrychama_pedido.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
  end;
end;

procedure TConsulta.Chama_Perfil_Usuario;
begin
  if (FrmChama_Perfil_Usuario.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Perfil_Usuario.qrychama_perfil do
        begin
          close;
          sql.clear;
          sql.add('select * from Perfil_Usuario PU');
          if (FrmChama_Perfil_Usuario.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where PU.Codigo like '''+ FrmChama_Perfil_Usuario.EdtConsulta.Text +'%''order by PU.Codigo')
          else
            sql.add('where PU.Codigo like '''+ FrmChama_Perfil_Usuario.EdtConsulta.Text +'%''order by PU.Perfil');
          open;

          if (FrmChama_Perfil_Usuario.qrychama_perfil.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Perfil_Usuario.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Perfil_Usuario.qrychama_perfil do
            begin
              close;
              sql.clear;
              sql.add('select * from Perfil_Usuario PU');
              if (FrmChama_Perfil_Usuario.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where PU.Perfil like '''+ FrmChama_Perfil_Usuario.EdtConsulta.Text +'%''order by PU.Codigo')
              else
                sql.add('where PU.Perfil like '''+ FrmChama_Perfil_Usuario.EdtConsulta.Text +'%''order by PU.Perfil');
              open;

              if (FrmChama_Perfil_Usuario.qrychama_perfil.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Plano_Financeiro(descricao: string);
begin
  if (FrmChama_Plano_Financeiro.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Plano_Financeiro.qrychama_plano do
        begin
          close;
          sql.clear;
          sql.add('select PF.*, PF2.Descricao as Descricao2 from Plano_Financeiro PF');
          sql.add('left join Plano_Financeiro PF2 on (PF.Codigo_SubNivel = PF2.Codigo)');
          if (FrmChama_Plano_Financeiro.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where PF.Codigo like '''+ FrmChama_Plano_Financeiro.EdtConsulta.Text +'%''order by PF.Codigo')
          else
            sql.add('where PF.Codigo like '''+ FrmChama_Plano_Financeiro.EdtConsulta.Text +'%''order by PF.Descricao');
          open;

          if (FrmChama_Plano_Financeiro.qrychama_plano.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Plano_Financeiro.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Plano_Financeiro.qrychama_plano do
            begin
              close;
              sql.clear;
              sql.add('select PF.*, PF2.Descricao as Descricao2 from Plano_Financeiro PF');
              sql.add('left join Plano_Financeiro PF2 on (PF.Codigo_SubNivel = PF2.Codigo)');
              if (FrmChama_Plano_Financeiro.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where PF.Descricao like '''+ FrmChama_Plano_Financeiro.EdtConsulta.Text +'%''order by PF.Codigo')
              else
                sql.add('where PF.Descricao like '''+ FrmChama_Plano_Financeiro.EdtConsulta.Text +'%''order by PF.Descricao');
              open;

              if (FrmChama_Plano_Financeiro.qrychama_plano.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Produto(descricao: AnsiString);
begin
  TLog.Info('MÉTODO --- CHAMA_PRODUTO ---');
  if (FrmChama_Produto.EdtConsulta.Text <> '') then
    descricao:= FrmChama_Produto.EdtConsulta.Text//+'%'
  else
  begin
    descricao:= FrmChama_Produto.EdtConsulta.Text;
    FrmMenu_Geral.produto_escolhido:= '';
  end;

  {with dm.qrychama_produto, sql do
  begin
    close;
    clear;
    add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
    add('Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
    add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
    add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
    add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
    add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia as Fabricante, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla as Sigla2, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, ');
    add('Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG, Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
    add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
    add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

    add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
    add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
    add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
    add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

    add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
    add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

    if (enquadramento_empresa = 'EN') then
      add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
    else if (enquadramento_empresa = 'EPP') then
      add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
    else if (enquadramento_empresa = 'ME') then
      add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

    add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

    add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
    add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

    if (enquadramento_empresa = 'EN') then
      add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
    else if (enquadramento_empresa = 'EPP') then
      add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
    else if (enquadramento_empresa = 'ME') then
      add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

    add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
    add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

    add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

    add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

    add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
    add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');

    if (FrmChama_Produto.RGConsulta_Por.ItemIndex = 0) then
    begin
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Pro.Codigo like '''+ FrmChama_Produto.EdtConsulta.Text +'%'' order by Pro.Descricao');

      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      if (FrmChama_Produto.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Ativo').Value := 'ATIVO'
      else
        Parameters.ParamByName('Ativo').Value := 'INATIVO';
      open;
    end
    else if (FrmChama_Produto.RGConsulta_Por.ItemIndex = 1) then
    begin
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Pro.Codigo_Original like '''+ FrmChama_Produto.EdtConsulta.Text +'%'' order by Pro.Descricao');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      if (FrmChama_Produto.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Ativo').Value := 'ATIVO'
      else
        Parameters.ParamByName('Ativo').Value := 'INATIVO';
      open;
    end
    else if (FrmChama_Produto.RGConsulta_Por.ItemIndex = 2) then
    begin
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Pro.Codigo_Venda like '''+ FrmChama_Produto.EdtConsulta.Text +'%'' order by Pro.Descricao');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      if (FrmChama_Produto.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Ativo').Value := 'ATIVO'
      else
        Parameters.ParamByName('Ativo').Value := 'INATIVO';
      open;
    end
    else if (FrmChama_Produto.RGConsulta_Por.ItemIndex = 3) then
    begin
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Pro.Codigo_Similar like '''+ FrmChama_Produto.EdtConsulta.Text +'%'' order by Pro.Descricao');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      if (FrmChama_Produto.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Ativo').Value := 'ATIVO'
      else
        Parameters.ParamByName('Ativo').Value := 'INATIVO';
      open;
    end
    else if (FrmChama_Produto.RGConsulta_Por.ItemIndex = 4) then
    begin
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Pro.Descricao like '''+ FrmChama_Produto.EdtConsulta.Text +'%'' order by Pro.Descricao');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      if (FrmChama_Produto.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Ativo').Value := 'ATIVO'
      else
        Parameters.ParamByName('Ativo').Value := 'INATIVO';
      open;
    end
    else if (FrmChama_Produto.RGConsulta_Por.ItemIndex = 5) then
    begin
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Pro.Aplicacao like '''+ FrmChama_Produto.EdtConsulta.Text +'%'' order by Pro.Descricao');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      if (FrmChama_Produto.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Ativo').Value := 'ATIVO'
      else
        Parameters.ParamByName('Ativo').Value := 'INATIVO';
      open;
    end;
  end;}
  try
    with dm.qrychama_produto, sql do
    begin
      close;
      clear;
      add('select * from fProduto(:Status, :Origem, :Destino, :Tabela, :CampoPesquisa, :TextoPesquisa)');
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('Origem').Value:= uf;
      Parameters.ParamByName('Destino').Value:= uf;
      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_ativo;
      Parameters.ParamByName('CampoPesquisa').Value:= FrmChama_Produto.RGConsulta_Por.ItemIndex;
      Parameters.ParamByName('TextoPesquisa').Value:= descricao;
      open;
    end;
  except on E:Exception do
  begin
    ShowMessage('Erro no método Chama_Produto: '+E.Message);
  end;
  end;
  TLog.Info('FIM MÉTODO --- CHAMA_PRODUTO ---');
end;

procedure TConsulta.Chama_Produto_Similar_Consulta;
begin
  {if (FrmChama_Produto.RGConsulta_Similar.ItemIndex = 0) then
  begin
    with dm.qrychama_produto_similar, sql do
    begin
      close;
      //Connection:= dm.ADOConnectionLocal;
      clear;
      add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG,');
      add('Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
      add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

      add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

      add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
      add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

      add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
      add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Gru.Codigo_Pai = :Pai and Pro.Codigo like '''+ FrmChama_Produto.EdtProduto_Similar.Text +'%'' order by Pro.Descricao');
      // and Pro.Tipo = 0');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      //Parameters.ParamByName('GO3').Value := uf;
      //Parameters.ParamByName('GO4').Value := uf;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      Parameters.ParamByName('Pai').Value := dm.qrychama_produtoCodigo_Pai.AsInteger;
      open;
    end;
  end
  else if (FrmChama_Produto.RGConsulta_Similar.ItemIndex = 1) then
  begin
    with dm.qrychama_produto_similar, sql do
    begin
      close;
      //Connection:= dm.ADOConnectionLocal;
      clear;
      add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG,');
      add('Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
      add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

      add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

      add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
      add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

      add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
      add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Gru.Codigo_Pai = :Pai and Pro.Codigo_Original like '''+ FrmChama_Produto.EdtProduto_Similar.Text +'%'' order by Pro.Descricao');
      // and Pro.Tipo = 0');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      //Parameters.ParamByName('GO3').Value := uf;
      //Parameters.ParamByName('GO4').Value := uf;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      Parameters.ParamByName('Pai').Value := dm.qrychama_produtoCodigo_Pai.AsInteger;
      open;
    end;
  end
  else if (FrmChama_Produto.RGConsulta_Similar.ItemIndex = 2) then
  begin
    with dm.qrychama_produto_similar, sql do
    begin
      close;
      //Connection:= dm.ADOConnectionLocal;
      clear;
      add('select Pro.Codigo, Pro.Codigo_Similar, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG,');
      add('Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
      add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

      add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

      add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
      add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

      add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
      add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Gru.Codigo_Pai = :Pai and Pro.Codigo_Venda like '''+ FrmChama_Produto.EdtProduto_Similar.Text +'%'' order by Pro.Descricao');
      // and Pro.Tipo = 0');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      //Parameters.ParamByName('GO3').Value := uf;
      //Parameters.ParamByName('GO4').Value := uf;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      Parameters.ParamByName('Pai').Value := dm.qrychama_produtoCodigo_Pai.AsInteger;
      open;
    end;
  end
  else if (FrmChama_Produto.RGConsulta_Similar.ItemIndex = 3) then
  begin
    with dm.qrychama_produto_similar, sql do
    begin
      close;
      //Connection:= dm.ADOConnectionLocal;
      clear;
      add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG,');
      add('Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
      add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

      add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

      add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
      add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

      add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
      add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Gru.Codigo_Pai = :Pai and Pro.Codigo_Similar like '''+ FrmChama_Produto.EdtProduto_Similar.Text +'%'' order by Pro.Descricao');
      // and Pro.Tipo = 0');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      //Parameters.ParamByName('GO3').Value := uf;
      //Parameters.ParamByName('GO4').Value := uf;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      Parameters.ParamByName('Pai').Value := dm.qrychama_produtoCodigo_Pai.AsInteger;
      open;
    end;
  end
  else if (FrmChama_Produto.RGConsulta_Similar.ItemIndex = 4) then
  begin
    with dm.qrychama_produto_similar, sql do
    begin
      close;
      //Connection:= dm.ADOConnectionLocal;
      clear;
      add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG,');
      add('Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
      add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

      add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

      add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
      add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

      add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
      add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Gru.Codigo_Pai = :Pai and Pro.Descricao like '''+ FrmChama_Produto.EdtProduto_Similar.Text +'%'' order by Pro.Descricao');
      // and Pro.Tipo = 0');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      //Parameters.ParamByName('GO3').Value := uf;
      //Parameters.ParamByName('GO4').Value := uf;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      Parameters.ParamByName('Pai').Value := dm.qrychama_produtoCodigo_Pai.AsInteger;
      open;
    end;
  end
  else if (FrmChama_Produto.RGConsulta_Similar.ItemIndex = 5) then
  begin
    with dm.qrychama_produto_similar, sql do
    begin
      close;
      //Connection:= dm.ADOConnectionLocal;
      clear;
      add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG,');
      add('Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
      add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

      add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

      add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
      add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

      add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
      add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Gru.Codigo_Pai = :Pai and Pro.Aplicacao like '''+ FrmChama_Produto.EdtProduto_Similar.Text +'%'' order by Pro.Descricao');
      // and Pro.Tipo = 0');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := uf;
      Parameters.ParamByName('GO2').Value := uf;
      //Parameters.ParamByName('GO3').Value := uf;
      //Parameters.ParamByName('GO4').Value := uf;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      Parameters.ParamByName('Pai').Value := dm.qrychama_produtoCodigo_Pai.AsInteger;
      open;
    end;
  end;}
end;

procedure TConsulta.Chama_Produto_Compra(descricao: string);
begin
  if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Codigo_Original, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Produto P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where IC.N_Pedido = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where IC.N_Pedido = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where IC.N_Pedido = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmChama_Produto_Compra.EdtConsulta.Text);
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Codigo_Original, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Produto P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.Codigo_Original = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where P.Codigo_Original = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where P.Codigo_Original = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= FrmChama_Produto_Compra.EdtConsulta.Text;
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 2) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Codigo_Original, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Produto P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.Codigo_Venda = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where P.Codigo_Venda = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where P.Codigo_Venda = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= FrmChama_Produto_Compra.EdtConsulta.Text;
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 3) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Codigo_Original, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Produto P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.Descricao = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where P.Descricao = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where P.Descricao = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= FrmChama_Produto_Compra.EdtConsulta.Text;
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

{procedure TConsulta.Chama_Produto_Grupo(Descricao);
begin
  with FrmCadastro_Grupo_Produto.ADOQuery1, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Valor_Compra from Produto P');
    add('left join Grupo_Produto GP on(P.Codigo_Grupo = GP.Codigo)');

    if (FrmCadastro_Grupo_Produto.RGChamar_Produtos.ItemIndex = 0) then
    begin
      add('where P.Codigo_Grupo = :Grupo order by P.Descricao');
      Parameters.ParamByName('Grupo').Value:= StrToInt(FrmCadastro_Grupo_Produto.EdtCodigo.Text);
    end
    else
    begin
      add('where GP.Codigo_Pai = :Grupo order by P.Descricao');
      Parameters.ParamByName('Grupo').Value:= FrmCadastro_Grupo_Produto.codigo_pai;
    end;
    open;
  end;
end;}

{procedure TConsulta.Chama_Produto_Similar;
begin
  with dm.qrychama_produto_similar, sql do
  begin
    close;
    //Connection:= dm.ADOConnectionLocal;
    clear;
    add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
    add('Pro.Codigo_Barra, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
    add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
    add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
    add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
    add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo_Produto, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG,');
    add('Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
    add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
    add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

    add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
    add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
    add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
    add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

    add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
    add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

    if (enquadramento_empresa = 'EN') then
      add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
    else if (enquadramento_empresa = 'EPP') then
      add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
    else if (enquadramento_empresa = 'ME') then
      add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

    add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

    add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
    add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

    if (enquadramento_empresa = 'EN') then
      add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
    else if (enquadramento_empresa = 'EPP') then
      add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
    else if (enquadramento_empresa = 'ME') then
      add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

    add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
    add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

    add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

    add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

    add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
    add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('where TP.Codigo = :Codigo and Pro.Status = :Ativo and Gru.Codigo_Pai = :Pai order by Pro.Descricao');
    // and Pro.Tipo = 0');
    Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
    Parameters.ParamByName('GO1').Value := uf;
    Parameters.ParamByName('GO2').Value := uf;
    //Parameters.ParamByName('GO3').Value := uf;
    //Parameters.ParamByName('GO4').Value := uf;
    Parameters.ParamByName('Ativo').Value := 'ATIVO';
    Parameters.ParamByName('Pai').Value := dm.qrychama_produtoCodigo_Pai.AsInteger;
    open;
  end;
end;}

procedure TConsulta.Chama_Receita;
begin
  if (FrmChama_Receita.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Receita.qrychama_receita do
        begin
          close;
          sql.clear;
          sql.add('select R.*, P.Codigo_Venda, P.Descricao from Receita R');
          sql.add('inner join Produto P on (R.Codigo_Produto = P.Codigo)');
          if (FrmChama_Receita.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where R.Codigo like '''+ FrmChama_Receita.EdtConsulta.Text +'%''order by R.Codigo')
          else
            sql.add('where R.Codigo like '''+ FrmChama_Receita.EdtConsulta.Text +'%''order by P.Descricao');
          open;

          if (FrmChama_Receita.qrychama_receita.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Receita.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Receita.qrychama_receita do
            begin
              close;
              sql.clear;
              sql.add('select R.*, P.Codigo_Venda, P.Descricao from Receita R');
              sql.add('inner join Produto P on (R.Codigo_Produto = P.Codigo)');
              if (FrmChama_Receita.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where P.Descricao like '''+ FrmChama_Receita.EdtConsulta.Text +'%''order by R.Codigo')
              else
                sql.add('where P.Descricao like '''+ FrmChama_Receita.EdtConsulta.Text +'%''order by P.Descricao');
              open;

              if (FrmChama_Receita.qrychama_receita.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Regra_COFINS;
begin
  if (FrmChama_Regra_Cofins.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Regra_Cofins.qrychama_regra do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, CST.Descricao as Situacao, CST.Codigo_Situacao from Regra_COFINS RC');
          sql.add('inner join Cadastro_Situacao_Tributaria CST on (RC.Codigo_Situacao_Tributaria = CST.Codigo)');

          if (FrmChama_Regra_Cofins.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RC.Descricao like '''+ FrmChama_Regra_Cofins.EdtConsulta.Text +'%''order by RC.Descricao')
          else
            sql.add('where RC.Descricao like '''+ FrmChama_Regra_Cofins.EdtConsulta.Text +'%''order by RC.Aliquota');
          open;

          if (FrmChama_Regra_Cofins.qrychama_regra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Regra_Cofins.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Regra_Cofins.qrychama_regra do
            begin
              close;
              sql.clear;
              sql.add('select RC.*, CST.Descricao as Situacao, CST.Codigo_Situacao from Regra_COFINS RC');
              sql.add('inner join Cadastro_Situacao_Tributaria CST on (RC.Codigo_Situacao_Tributaria = CST.Codigo)');

              if (FrmChama_Regra_Cofins.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where RC.Aliquota like '''+ FrmChama_Regra_Cofins.EdtConsulta.Text +'%''order by RC.Descricao')
              else
                sql.add('where RC.Aliquota like '''+ FrmChama_Regra_Cofins.EdtConsulta.Text +'%''order by RC.Aliquota');
              open;

              if (FrmChama_Regra_Cofins.qrychama_regra.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Regra_ICMS;
begin
  if (FrmChama_Regra_ICMS.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Regra_ICMS.qrychama_regra do
        begin
          close;
          sql.clear;
          sql.add('select RI.*, CST.Codigo_Situacao, CST.Descricao as Situacao from Regra_ICMS RI');
          sql.add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
          if (FrmChama_Regra_ICMS.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RI.Descricao like '''+ FrmChama_Regra_ICMS.EdtConsulta.Text +'%''order by RI.Descricao')
          else
            sql.add('where RI.Descricao like '''+ FrmChama_Regra_ICMS.EdtConsulta.Text +'%''order by RI.Aliquota');
          open;

          if (FrmChama_Regra_ICMS.qrychama_regra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Regra_ICMS.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Regra_ICMS.qrychama_regra do
            begin
              close;
              sql.clear;
              sql.add('select RI.*, CST.Codigo_Situacao, CST.Descricao as Situacao from Regra_ICMS RI');
              sql.add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
              if (FrmChama_Regra_ICMS.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where RI.Aliquota like '''+ FrmChama_Regra_ICMS.EdtConsulta.Text +'%''order by RI.Descricao')
              else
                sql.add('where RI.Aliquota like '''+ FrmChama_Regra_ICMS.EdtConsulta.Text +'%''order by RI.Aliquota');
              open;

              if (FrmChama_Regra_ICMS.qrychama_regra.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Regra_IPI;
begin
  if (FrmChama_Regra_IPI.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Regra_IPI.qrychama_regra do
        begin
          close;
          sql.clear;
          sql.add('select RIPI.*, CST.Codigo_Situacao, CST.Descricao as Situacao from Regra_IPI RIPI');
          sql.add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');

          if (FrmChama_Regra_IPI.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RIPI.Descricao like '''+ FrmChama_Regra_IPI.EdtConsulta.Text +'%''order by RIPI.Descricao')
          else
            sql.add('where RIPI.Descricao like '''+ FrmChama_Regra_IPI.EdtConsulta.Text +'%''order by RIPI.Aliquota');
          open;

          if (FrmChama_Regra_IPI.qrychama_regra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Regra_IPI.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Regra_IPI.qrychama_regra do
            begin
              close;
              sql.clear;
              sql.add('select RIPI.*, CST.Codigo_Situacao, CST.Descricao as Situacao from Regra_IPI RIPI');
              sql.add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');

              if (FrmChama_Regra_IPI.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where RIPI.Aliquota like '''+ FrmChama_Regra_IPI.EdtConsulta.Text +'%''order by RIPI.Descricao')
              else
                sql.add('where RIPI.Aliquota like '''+ FrmChama_Regra_IPI.EdtConsulta.Text +'%''order by RIPI.Aliquota');
              open;

              if (FrmChama_Regra_IPI.qrychama_regra.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Regra_ISSQN;
begin
  if (FrmChama_Regra_ISSQN.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Regra_ISSQN.qrychama_regra do
        begin
          close;
          sql.clear;
          sql.add('select RISS.* from Regra_ISSQN RISS');

          if (FrmChama_Regra_ISSQN.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RISS.Descricao like '''+ FrmChama_Regra_ISSQN.EdtConsulta.Text +'%''order by RISS.Descricao')
          else
            sql.add('where RISS.Descricao like '''+ FrmChama_Regra_ISSQN.EdtConsulta.Text +'%''order by RISS.Aliquota');
          open;

          if (FrmChama_Regra_ISSQN.qrychama_regra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Regra_ISSQN.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Regra_ISSQN.qrychama_regra do
            begin
              close;
              sql.clear;
              sql.add('select RISS.* from Regra_ISSQN RISS');

              if (FrmChama_Regra_ISSQN.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where RISS.Aliquota like '''+ FrmChama_Regra_ISSQN.EdtConsulta.Text +'%''order by RISS.Descricao')
              else
                sql.add('where RISS.Aliquota like '''+ FrmChama_Regra_ISSQN.EdtConsulta.Text +'%''order by RISS.Aliquota');
              open;

              if (FrmChama_Regra_ISSQN.qrychama_regra.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Regra_PIS;
begin
  if (FrmChama_Regra_PIS.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Regra_PIS.qrychama_regra do
        begin
          close;
          sql.clear;
          sql.add('select RPIS.*, CST.Descricao as Situacao, CST.Codigo_Situacao from Regra_PIS RPIS');
          sql.add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');

          if (FrmChama_Regra_PIS.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RPIS.Descricao like '''+ FrmChama_Regra_PIS.EdtConsulta.Text +'%''order by RPIS.Descricao')
          else
            sql.add('where RPIS.Descricao like '''+ FrmChama_Regra_PIS.EdtConsulta.Text +'%''order by RPIS.Aliquota');
          open;

          if (FrmChama_Regra_PIS.qrychama_regra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Regra_PIS.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Regra_PIS.qrychama_regra do
            begin
              close;
              sql.clear;
              sql.add('select RPIS.*, CST.Descricao as Situacao, CST.Codigo_Situacao from Regra_PIS RPIS');
              sql.add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');

              if (FrmChama_Regra_PIS.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where RPIS.Aliquota like '''+ FrmChama_Regra_PIS.EdtConsulta.Text +'%''order by RPIS.Descricao')
              else
                sql.add('where RPIS.Aliquota like '''+ FrmChama_Regra_PIS.EdtConsulta.Text +'%''order by RPIS.Aliquota');
              open;

              if (FrmChama_Regra_PIS.qrychama_regra.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Servico;
begin
  descricao:= FrmChama_Servico.EdtConsulta.Text;
  if (FrmChama_Servico.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Servico.CDSChama_Servico do
        begin
          Filtered:= false;
          Filter:= 'Codigo_Venda like '+ QuotedStr(descricao +'%');
          Filtered:= true;

          if (FrmChama_Servico.EdtConsulta.Text = '') then
            Filtered:= false;
        end;
    end
    else
      if (FrmChama_Servico.RGConsulta_Por.ItemIndex = 1) then
      begin
        with FrmChama_Servico.CDSChama_Servico do
          begin
            Filtered:= false;
            Filter:= 'Descricao like '+ QuotedStr(descricao +'%');
            Filtered:= true;

            if (FrmChama_Servico.EdtConsulta.Text = '') then
              Filtered:= false;
          end;
      end;
end;

procedure TConsulta.Chama_Setor(descricao: string);
begin
  if (FrmChama_Setor.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Setor.qrychama_setor do
        begin
          close;
          sql.clear;
          sql.add('Select * from Setor S');
          if (FrmChama_Setor.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where S.Codigo like '''+ FrmChama_Setor.EdtConsulta.Text +'%''order by S.Codigo')
          else
            sql.add('where S.Codigo like '''+ FrmChama_Setor.EdtConsulta.Text +'%''order by S.Descricao');
          open;

          if (FrmChama_Setor.qrychama_setor.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Setor.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Setor.qrychama_setor do
            begin
              close;
              sql.clear;
              sql.add('Select * from Setor S');
              if (FrmChama_Setor.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where S.Descricao like '''+ FrmChama_Setor.EdtConsulta.Text +'%''order by S.Codigo')
              else
                sql.add('where S.Descricao like '''+ FrmChama_Setor.EdtConsulta.Text +'%''order by S.Descricao');
              open;
              
              if (FrmChama_Setor.qrychama_setor.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Tipo_Bem_Patrimonial;
begin
  if (FrmChama_Tipo_Bem_Patrimonial.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tipo_Bem_Patrimonial.qrychama_bem do
        begin
          close;
          sql.clear;
          sql.add('Select * from Tipo_Bem_Patrimonial S');
          if (FrmChama_Tipo_Bem_Patrimonial.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where S.Codigo like '''+ FrmChama_Tipo_Bem_Patrimonial.EdtConsulta.Text +'%''order by S.Codigo')
          else
            sql.add('where S.Codigo like '''+ FrmChama_Tipo_Bem_Patrimonial.EdtConsulta.Text +'%''order by S.Descricao');
          open;

          if (FrmChama_Tipo_Bem_Patrimonial.qrychama_bem.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Tipo_Bem_Patrimonial.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Tipo_Bem_Patrimonial.qrychama_bem do
            begin
              close;
              sql.clear;
              sql.add('Select * from Tipo_Bem_Patrimonial S');
              if (FrmChama_Tipo_Bem_Patrimonial.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where S.Descricao like '''+ FrmChama_Tipo_Bem_Patrimonial.EdtConsulta.Text +'%''order by S.Codigo')
              else
                sql.add('where S.Descricao like '''+ FrmChama_Tipo_Bem_Patrimonial.EdtConsulta.Text +'%''order by S.Descricao');
              open;

              if (FrmChama_Tipo_Bem_Patrimonial.qrychama_bem.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Patrimonio;
begin
  with FrmChama_Patrimonio.qrychama_bem, sql do
    begin
      close;
      sql.clear;
      sql.add('select P.*, M.Descricao as Marca, TBP.Descricao as Tipo_Bem, LP.Local, CS.Descricao as Status');
      sql.add('from Patrimonio P');
      sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      sql.add('left join Tipo_Bem_Patrimonial TBP on (P.Codigo_Tipo_Bem = TBP.Codigo)');
      sql.add('left join Localidade_Produto LP on (P.Codigo_Local_Bem = LP.Codigo)');
      sql.add('left join Cadastro_Status CS on (P.Codigo_Status = CS.Codigo)');

      case (FrmChama_Patrimonio.RGConsulta_Por.ItemIndex) of
        0: add('where P.Codigo like '''+ FrmChama_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
        1: add('where P.N_Bem like '''+ FrmChama_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
        2: add('where P.N_Identificacao like '''+ FrmChama_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
        3: add('where P.Descricao like '''+ FrmChama_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
      end;

      open;

      if (FrmChama_Patrimonio.qrychama_bem.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Chama_Situacao_Tributaria(descricao: string);
begin
  if (FrmChama_Situacao_Tributaria.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Situacao_Tributaria.qrychama_situacao_tributaria do
        begin
          close;
          sql.clear;
          sql.add('select CST.*, COF.Descricao as Obs from cadastro_situacao_tributaria CST');
          sql.add('left join Cadastro_Observacao_Fiscal COF on (CST.Codigo_Obs_Fiscal = COF.Codigo)');
          if (FrmChama_Situacao_Tributaria.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CST.Codigo_Situacao like '''+ FrmChama_Situacao_Tributaria.EdtConsulta.Text +'%''order by CST.Codigo_Situacao')
          else
            sql.add('where CST.Codigo_Situacao like '''+ FrmChama_Situacao_Tributaria.EdtConsulta.Text +'%''order by CST.Descricao');
          open;

          if (FrmChama_Situacao_Tributaria.qrychama_situacao_tributaria.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Situacao_Tributaria.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Situacao_Tributaria.qrychama_situacao_tributaria do
            begin
              close;
              sql.clear;
              sql.add('select CST.*, COF.Descricao as Obs from cadastro_situacao_tributaria CST');
              sql.add('left join Cadastro_Observacao_Fiscal COF on (CST.Codigo_Obs_Fiscal = COF.Codigo)');
              if (FrmChama_Situacao_Tributaria.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where CST.Descricao like '''+ FrmChama_Situacao_Tributaria.EdtConsulta.Text +'%''order by CST.Codigo_Situacao')
              else
                sql.add('where CST.Descricao like '''+ FrmChama_Situacao_Tributaria.EdtConsulta.Text +'%''order by CST.Descricao');
              open;

              if (FrmChama_Situacao_Tributaria.qrychama_situacao_tributaria.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Tabela_Preco;
begin
  if (FrmChama_Tabela_Preco.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tabela_Preco.qrychama_tabela do
        begin
          close;
          sql.clear;
          sql.add('Select * from Tabela_Preco TP');
          if (FrmChama_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TP.Data_Validade >= :Data and TP.Codigo like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Codigo')
          else
            sql.add('where TP.Data_Validade >= :Data and TP.Codigo like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Descricao');
          Parameters.ParamByName('Data').Value:= date;
          open;

          if (FrmChama_Tabela_Preco.qrychama_tabela.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Tabela_Preco.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Tabela_Preco.qrychama_tabela do
            begin
              close;
              sql.clear;
              sql.add('Select * from Tabela_Preco TP');
              if (FrmChama_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where TP.Data_Validade >= :Data and TP.Descricao like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Codigo')
              else
                sql.add('where TP.Data_Validade >= :Data and TP.Descricao like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Descricao');
              Parameters.ParamByName('Data').Value:= date;
              open;

              if (FrmChama_Tabela_Preco.qrychama_tabela.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
        end;
        end;
end;

procedure TConsulta.Chama_Tabela_Preco_Cadastro;
begin
  if (FrmChama_Tabela_Preco.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tabela_Preco.qrychama_tabela do
        begin
          close;
          sql.clear;
          sql.add('Select * from Tabela_Preco TP');
          if (FrmChama_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TP.Codigo like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Codigo')
          else
            sql.add('where TP.Codigo like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Descricao');
          open;

          if (FrmChama_Tabela_Preco.qrychama_tabela.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Tabela_Preco.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Tabela_Preco.qrychama_tabela do
            begin
              close;
              sql.clear;
              sql.add('Select * from Tabela_Preco TP');
              if (FrmChama_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where TP.Descricao like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Codigo')
              else
                sql.add('where TP.Descricao like '''+ FrmChama_Tabela_Preco.EdtConsulta.Text +'%''order by TP.Descricao');
              open;

              if (FrmChama_Tabela_Preco.qrychama_tabela.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
        end;
        end;
end;

procedure TConsulta.Chama_Tipo_Documento(descricao: string);
begin
  if (FrmChama_Tipo_Documento.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tipo_Documento.qrychama_tipo_documento do
        begin
          close;
          sql.clear;
          sql.add('Select * from Tipo_Documento TD');
          if (FrmChama_Tipo_Documento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TD.Codigo like '''+ FrmChama_Tipo_Documento.EdtConsulta.Text +'%''order by TD.Codigo')
          else
            sql.add('where TD.Codigo like '''+ FrmChama_Tipo_Documento.EdtConsulta.Text +'%''order by TD.Descricao');
          open;

          if (FrmChama_Tipo_Documento.qrychama_tipo_documento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Tipo_Documento.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Tipo_Documento.qrychama_tipo_documento do
            begin
              close;
              sql.clear;
              sql.add('Select * from Tipo_Documento TD');
              if (FrmChama_Tipo_Documento.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where TD.Descricao like '''+ FrmChama_Tipo_Documento.EdtConsulta.Text +'%''order by TD.Codigo')
              else
                sql.add('where TD.Descricao like '''+ FrmChama_Tipo_Documento.EdtConsulta.Text +'%''order by TD.Descricao');
              open;

              if (FrmChama_Tipo_Documento.qrychama_tipo_documento.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Tipo_Ocorrencia;
begin
  if (FrmChama_Tipo_Ocorrencia.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmChama_Tipo_Ocorrencia.qrychama_tipo_ocorrencia do
      begin
        close;
        sql.clear;
        sql.add('Select * from Tipo_Ocorrencia CS');
        if (FrmChama_Tipo_Ocorrencia.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where CS.Codigo like '''+ FrmChama_Tipo_Ocorrencia.EdtConsulta.Text +'%''order by CS.Codigo')
        else
          sql.add('where CS.Codigo like '''+ FrmChama_Tipo_Ocorrencia.EdtConsulta.Text +'%''order by CS.Descricao');
        open;

        if (FrmChama_Tipo_Ocorrencia.qrychama_tipo_ocorrencia.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end
    else if (FrmChama_Tipo_Ocorrencia.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_Tipo_Ocorrencia.qrychama_tipo_ocorrencia do
        begin
          close;
          sql.clear;
          sql.add('Select * from Tipo_Ocorrencia CS');
          if (FrmChama_Tipo_Ocorrencia.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CS.Descricao like '''+ FrmChama_Tipo_Ocorrencia.EdtConsulta.Text +'%''order by CS.Codigo')
          else
            sql.add('where CS.Descricao like '''+ FrmChama_Tipo_Ocorrencia.EdtConsulta.Text +'%''order by CS.Descricao');
          open;

          if (FrmChama_Tipo_Ocorrencia.qrychama_tipo_ocorrencia.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Tipo_Ocorrencia_LookUp(var Conexao: TADOConnection);
begin
  with dm.qrychama_tipo_ocorrencia, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select * from Tipo_Ocorrencia');
    open;
    First;
  end;
end;

procedure TConsulta.Chama_Transportadora;
begin
  if (FrmChama_Transportadora.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Transportadora.qrychama_transportadora do
        begin
          close;
          sql.clear;
          sql.add('select Trans.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Setor from Transportadora Trans');
          sql.add('left join Cidade Ci on (Trans.Codigo_Cidade = Ci.Codigo)');
          sql.add('left join Setor Se on (Trans.Codigo_Setor = Se.Codigo)');

          if (FrmChama_Transportadora.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Trans.Codigo like '''+ FrmChama_Transportadora.EdtConsulta.Text +'%''order by Trans.Codigo')
          else
            sql.add('where Trans.Codigo like '''+ FrmChama_Transportadora.EdtConsulta.Text +'%''order by Trans.Nome_Fantasia');
          open;

          if (FrmChama_Transportadora.qrychama_transportadora.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Transportadora.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Transportadora.qrychama_transportadora do
            begin
              close;
              sql.clear;
              sql.add('select Trans.*, Ci.Descricao as Cidade, Ci.UF, Se.Descricao as Setor from Transportadora Trans');
              sql.add('left join Cidade Ci on (Trans.Codigo_Cidade = Ci.Codigo)');
              sql.add('left join Setor Se on (Trans.Codigo_Setor = Se.Codigo)');

              if (FrmChama_Transportadora.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where Trans.Nome_Fantasia like '''+ FrmChama_Transportadora.EdtConsulta.Text +'%''order by Trans.Codigo')
              else
                sql.add('where Trans.Nome_Fantasia like '''+ FrmChama_Transportadora.EdtConsulta.Text +'%''order by Trans.Nome_Fantasia');
              open;

              if (FrmChama_Transportadora.qrychama_transportadora.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end;
end;

procedure TConsulta.Chama_Tratamento_COFINS;
begin
  if (FrmChama_Tratamento_COFINS.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tratamento_COFINS.qrychama_tratamento do
        begin
          close;
          sql.clear;
          sql.add('select TC.*, ITC.*,  RI1.Descricao, RI2.Descricao, RI3.Descricao, RI4.Descricao, RI5.Descricao, RI6.Descricao from Tratamento_COFINS TC');
          sql.add('left join Itens_Tratamento_COFINS ITC on (TC.Codigo = ITC.Codigo)');
          sql.add('inner join Regra_COFINS RI1 on (ITC.Entrada_Regra_EN = RI1.Codigo)');
          sql.add('inner join Regra_COFINS RI2 on (ITC.Entrada_Regra_EPP = RI2.Codigo)');
          sql.add('inner join Regra_COFINS RI3 on (ITC.Entrada_Regra_ME = RI3.Codigo)');
          sql.add('inner join Regra_COFINS RI4 on (ITC.Saida_Regra_EN = RI4.Codigo)');
          sql.add('inner join Regra_COFINS RI5 on (ITC.Saida_Regra_EPP = RI5.Codigo)');
          sql.add('inner join Regra_COFINS RI6 on (ITC.Saida_Regra_ME = RI6.Codigo)');

          if (FrmChama_Tratamento_COFINS.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TC.Descricao like '''+ FrmChama_Tratamento_COFINS.EdtConsulta.Text +'%''order by TC.Descricao');
          open;

          if (FrmChama_Tratamento_COFINS.qrychama_tratamento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Tratamento_ICMS;
begin
  if (FrmChama_Tratamento_ICMS.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tratamento_ICMS.qrychama_tratamento do
        begin
          close;
          sql.clear;
          sql.add('select TI.* from Tratamento_ICMS TI');

          if (FrmChama_Tratamento_ICMS.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TI.Descricao like '''+ FrmChama_Tratamento_ICMS.EdtConsulta.Text +'%''order by TI.Descricao');
          open;

          if (FrmChama_Tratamento_ICMS.qrychama_tratamento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Tratamento_IPI;
begin
  if (FrmChama_Tratamento_IPI.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tratamento_IPI.qrychama_tratamento do
        begin
          close;
          sql.clear;
          sql.add('select TIPI.*, ITIPI.*, RI1.Descricao, RI2.Descricao, RI3.Descricao, RI4.Descricao, RI5.Descricao, RI6.Descricao from Tratamento_IPI TIPI');
          sql.add('inner join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');
          sql.add('inner join Regra_IPI RI1 on (ITIPI.Entrada_Regra_EN = RI1.Codigo)');
          sql.add('inner join Regra_IPI RI2 on (ITIPI.Entrada_Regra_EPP = RI2.Codigo)');
          sql.add('inner join Regra_IPI RI3 on (ITIPI.Entrada_Regra_ME = RI3.Codigo)');
          sql.add('inner join Regra_IPI RI4 on (ITIPI.Saida_Regra_EN = RI4.Codigo)');
          sql.add('inner join Regra_IPI RI5 on (ITIPI.Saida_Regra_EPP = RI5.Codigo)');
          sql.add('inner join Regra_IPI RI6 on (ITIPI.Saida_Regra_ME = RI6.Codigo)');

          if (FrmChama_Tratamento_IPI.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TIPI.Descricao like '''+ FrmChama_Tratamento_IPI.EdtConsulta.Text +'%''order by TIPI.Descricao');
          open;

          if (FrmChama_Tratamento_IPI.qrychama_tratamento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Tratamento_ISSQN;
begin
  if (FrmChama_Tratamento_ISSQN.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tratamento_ISSQN.qrychama_tratamento do
        begin
          close;
          sql.clear;
          sql.add('select TISS.*, RISS1.Descricao, RISS2.Descricao, RISS3.Descricao, RISS4.Descricao, RISS5.Descricao, RISS6.Descricao, RISS7.Descricao from Tratamento_ISSQN TISS');
          sql.add('inner join Regra_ISSQN RISS1 on (TISS.Entrada_Regra_EN = RISS1.Codigo)');
          sql.add('inner join Regra_ISSQN RISS2 on (TISS.Entrada_Regra_EPP = RISS2.Codigo)');
          sql.add('inner join Regra_ISSQN RISS3 on (TISS.Entrada_Regra_ME = RISS3.Codigo)');
          sql.add('inner join Regra_ISSQN RISS4 on (TISS.Saida_Regra_EN = RISS4.Codigo)');
          sql.add('inner join Regra_ISSQN RISS5 on (TISS.Saida_Regra_EPP = RISS5.Codigo)');
          sql.add('inner join Regra_ISSQN RISS6 on (TISS.Saida_Regra_ME = RISS6.Codigo)');
          sql.add('inner join Regra_ISSQN RISS7 on (TISS.Regra_Nao_Contribuinte = RISS7.Codigo)');

          if (FrmChama_Tratamento_ISSQN.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TISS.Descricao like '''+ FrmChama_Tratamento_ISSQN.EdtConsulta.Text +'%''order by TISS.Descricao');
          open;

          if (FrmChama_Tratamento_ISSQN.qrychama_tratamento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Tratamento_PIS;
begin
  if (FrmChama_Tratamento_PIS.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Tratamento_PIS.qrychama_tratamento do
        begin
          close;
          sql.clear;
          sql.add('select TPIS.*, ITPIS.*, RI1.Descricao, RI2.Descricao, RI3.Descricao, RI4.Descricao, RI5.Descricao, RI6.Descricao from Tratamento_PIS TPIS');
          sql.add('left join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
          sql.add('inner join Regra_PIS RI1 on (ITPIS.Entrada_Regra_EN = RI1.Codigo)');
          sql.add('inner join Regra_PIS RI2 on (ITPIS.Entrada_Regra_EPP = RI2.Codigo)');
          sql.add('inner join Regra_PIS RI3 on (ITPIS.Entrada_Regra_ME = RI3.Codigo)');
          sql.add('inner join Regra_PIS RI4 on (ITPIS.Saida_Regra_EN = RI4.Codigo)');
          sql.add('inner join Regra_PIS RI5 on (ITPIS.Saida_Regra_EPP = RI5.Codigo)');
          sql.add('inner join Regra_PIS RI6 on (ITPIS.Saida_Regra_ME = RI6.Codigo)');

          if (FrmChama_Tratamento_PIS.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where TPIS.Descricao like '''+ FrmChama_Tratamento_PIS.EdtConsulta.Text +'%''order by TPIS.Descricao');
          open;

          if (FrmChama_Tratamento_PIS.qrychama_tratamento.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Unidade(descricao: string);
begin
  if (FrmChama_Unidade.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Unidade.qrychama_unidade do
        begin
          close;
          sql.clear;
          sql.add('Select * from Unidade_Medida UM');
          if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where UM.Codigo like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Codigo')
          else if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where UM.Codigo like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Descricao')
          else if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where UM.Codigo like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Sigla');
          open;

          if (FrmChama_Unidade.qrychama_unidade.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmChama_Unidade.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Unidade.qrychama_unidade do
            begin
              close;
              sql.clear;
              sql.add('Select * from Unidade_Medida UM');
              if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where UM.Descricao like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Codigo')
              else if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 1) then
                sql.add('where UM.Descricao like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Descricao')
              else if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 2) then
                sql.add('where UM.Descricao like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Sigla');
              open;
              if (FrmChama_Unidade.qrychama_unidade.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end
        else
          if (FrmChama_Unidade.RGConsulta_Por.ItemIndex = 2) then
            begin
              with FrmChama_Unidade.qrychama_unidade do
                begin
                  close;
                  sql.clear;
                  sql.add('Select * from Unidade_Medida UM');
                  if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 0) then
                    sql.add('where UM.Sigla like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Codigo')
                  else if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 1) then
                    sql.add('where UM.Sigla like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Descricao')
                  else if (FrmChama_Unidade.RGOrdena_Por.ItemIndex = 2) then
                    sql.add('where UM.Sigla like '''+ FrmChama_Unidade.EdtConsulta.Text +'%''order by UM.Sigla');
                  open;
                  if (FrmChama_Unidade.qrychama_unidade.IsEmpty = true) then
                    begin
                      Mensagem_Fim_Pesquisa;
                      abort;
                    end;
                end;
            end;
end;

procedure TConsulta.Chama_Usuario;
begin
  with FrmChama_Usuario.qrychama_usuario do
  begin
    close;
    sql.clear;
    sql.add('select CU.*, PU.Perfil from Cadastro_Usuario CU');
    sql.add('inner join Perfil_Usuario PU on (CU.Codigo_Perfil = PU.Codigo)');
    sql.add('where CU.Nome like '''+ FrmChama_Usuario.EdtConsulta.Text +'%''order by CU.Nome');
    open;
  end;
  if (FrmChama_Usuario.qrychama_usuario.IsEmpty = true) then
  begin
    Mensagem_Fim_Pesquisa;
    abort;
  end;
end;

procedure TConsulta.Chama_Usuario_Funcionario;
begin
  with FrmChama_Funcionario.qrychama_usuario do
  begin
    close;
    sql.clear;
    sql.add('select CU.*, PU.Perfil from Cadastro_Usuario CU');
    sql.add('inner join Perfil_Usuario PU on (CU.Codigo_Perfil = PU.Codigo)');
    sql.add('where CU.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= FrmChama_Funcionario.qrychama_funcionarioCodigo.AsInteger;
    open;
  end;
end;

procedure TConsulta.Chama_Veiculo;
begin
  if (FrmChama_Veiculo.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Veiculo.qrychama_veiculo do
      begin
        close;
        sql.clear;
        sql.add('select V.*, M.Descricao, C.Nome_Nome_Fantasia from Veiculo V');
        sql.add('inner join Marca M on (V.Codigo_Marca = M.Codigo)');
        sql.add('inner join Cliente C on (V.Codigo_Cliente = C.Codigo)');
        sql.add('where V.Codigo like '''+ FrmChama_Veiculo.EdtConsulta.Text +'%''order by V.Veiculo');
        open;

        if (FrmChama_Veiculo.qrychama_veiculo.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end;
    end
    else if (FrmChama_Veiculo.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_Veiculo.qrychama_veiculo do
        begin
          close;
          sql.clear;
          sql.add('select V.*, M.Descricao, C.Nome_Nome_Fantasia from Veiculo V');
          sql.add('inner join Marca M on (V.Codigo_Marca = M.Codigo)');
          sql.add('inner join Cliente C on (V.Codigo_Cliente = C.Codigo)');
          sql.add('where V.Veiculo like '''+ FrmChama_Veiculo.EdtConsulta.Text +'%''order by V.Veiculo');
          open;
          if (FrmChama_Veiculo.qrychama_veiculo.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
        end;
    end
    else if (FrmChama_Veiculo.RGConsulta_Por.ItemIndex = 2) then
    begin
      with FrmChama_Veiculo.qrychama_veiculo do
        begin
          close;
          sql.clear;
          sql.add('select V.*, M.Descricao, C.Nome_Nome_Fantasia from Veiculo V');
          sql.add('inner join Marca M on (V.Codigo_Marca = M.Codigo)');
          sql.add('inner join Cliente C on (V.Codigo_Cliente = C.Codigo)');
          sql.add('where V.Placa like '''+ FrmChama_Veiculo.EdtConsulta.Text +'%''order by V.Veiculo');
          open;
          if (FrmChama_Veiculo.qrychama_veiculo.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
        end;
    end;
end;

procedure TConsulta.Chama_WebService;
begin
  with FrmChama_Configuracao.qrychama_webservice_1_producao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_1_Producao.* from WebService_1_Producao');
      sql.add('where WebService_1_Producao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= FrmChama_Configuracao.qrychama_configuracaoCodigo_Empresa.AsInteger;
      open;
    end;

  with FrmChama_Configuracao.qrychama_webservice_2_producao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_2_Producao.* from WebService_2_Producao');
      sql.add('where WebService_2_Producao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= FrmChama_Configuracao.qrychama_configuracaoCodigo_Empresa.AsInteger;
      open;
    end;

  with FrmChama_Configuracao.qrychama_webservice_1_homologacao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_1_Homologacao.* from WebService_1_Homologacao');
      sql.add('where WebService_1_Homologacao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= FrmChama_Configuracao.qrychama_configuracaoCodigo_Empresa.AsInteger;
      open;
    end;

  with FrmChama_Configuracao.qrychama_webservice_2_homologacao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_2_Homologacao.* from WebService_2_Homologacao');
      sql.add('where WebService_2_Homologacao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= FrmChama_Configuracao.qrychama_configuracaoCodigo_Empresa.AsInteger;
      open;
    end;
end;

procedure TConsulta.Consulta_Fechamento_Caixa;
begin
  if (FrmConsulta_Fechamento_Caixa.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Fechamento_Caixa.MEdtData_Final.Text = '  /  /    ') or
    (FrmConsulta_Fechamento_Caixa.EdtCodigo_Usuario.Text = '') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Fechamento_Caixa.EdtCodigo_Usuario.SetFocus;
    abort;
  end;

  if (FrmConsulta_Fechamento_Caixa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConsulta_Fechamento_Caixa.qryconsulta_caixa do
      begin
        close;
        sql.clear;
        sql.add('select FC.*, CU.Nome from Fechamento_Caixa FC');
        sql.add('left join Cadastro_Usuario CU on (FC.Codigo_Usuario = CU.Codigo)');
        sql.add('where FC.Codigo_Usuario = :Parametro and Data_Abertura between :DI and :DF');
        Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Fechamento_Caixa.EdtCodigo_Usuario.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Final.Text);
        open;

        if (FrmConsulta_Fechamento_Caixa.qryconsulta_caixa.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end
    else if (FrmConsulta_Fechamento_Caixa.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmConsulta_Fechamento_Caixa.qryconsulta_caixa do
      begin
        close;
        sql.clear;
        sql.add('select FC.*, CU.Nome from Fechamento_Caixa FC');
        sql.add('left join Cadastro_Usuario CU on (FC.Codigo_Usuario = CU.Codigo)');
        sql.add('where FC.Codigo_Usuario = :Parametro and Data_Fechamento between :DI and :DF');
        Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Fechamento_Caixa.EdtCodigo_Usuario.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Final.Text);
        open;

        if (FrmConsulta_Fechamento_Caixa.qryconsulta_caixa.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end;
end;

procedure TConsulta.Consulta_Acerto_Caixa;
begin
  if (FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Acerto_Caixa.MEdtData_Final.Text = '  /  /    ') or
    (FrmConsulta_Acerto_Caixa.EdtCodigo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Acerto_Caixa.EdtCodigo.SetFocus;
    abort;
  end;

  if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConsulta_Acerto_Caixa.qryconsulta_caixa do
      begin
        close;
        sql.clear;
        sql.add('select AC.*, CU.Nome from Acerto_Caixa AC');
        sql.add('inner join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');

        sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Abertura between :DI and :DF');

        Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Acerto_Caixa.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Final.Text);
        open;

        if (FrmConsulta_Acerto_Caixa.qryconsulta_caixa.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end
    else if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmConsulta_Acerto_Caixa.qryconsulta_caixa do
      begin
        close;
        sql.clear;
        sql.add('select AC.*, CU.Nome from Acerto_Caixa AC');
        sql.add('inner join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');

        sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Fechamento between :DI and :DF');

        Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Acerto_Caixa.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Final.Text);
        open;

        if (FrmConsulta_Acerto_Caixa.qryconsulta_caixa.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
    end;
end;

procedure TConsulta.Consulta_Balanco_Estoque;
begin
  with FrmConsulta_Contagem_Estoque.qrybalanco do
  begin
    close;
    sql.clear;
    sql.add('select P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Compra,');
    sql.add('UM.Sigla as Unidade, sum(P.Estoque * P.Valor_Compra) as Total from Produto P');
    sql.add('left join Unidade_Medida UM on(P.Codigo_Unidade_Medida = UM.Codigo)');

    sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo');
    sql.add('group by P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Compra, UM.Sigla order by P.Descricao');

    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('Status').Value:= 'ATIVO';
    Parameters.ParamByName('Tipo').Value:= 0;
    open;
  end;

  if (FrmConsulta_Contagem_Estoque.qrybalanco.IsEmpty = true) then
  begin
    Mensagem_Fim_Pesquisa;
    abort;
  end;
end;

procedure TConsulta.Consulta_Cheque(descricao: string);
begin
  with FrmConsulta_Cheque.qryconsulta_cheque do
  begin
    close;
    sql.clear;
    sql.add('select Che.*, B.Nome from Cheque Che');
    sql.add('inner join Banco B on (Che.Codigo_Banco = B.Codigo)');

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 0) then
    begin
      //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        //sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 1) then
    begin
      //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        //sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Titular like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Titular like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;

    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 2) then
    begin
      //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        //sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.N_Cheque like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.N_Cheque like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';

      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Cheque.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Cheque.MEdtData_Final.Text = '  /  /    ') then
        begin
          Application.MessageBox('Por favor, informe uma data a consultar', 'Atenção', MB_OK+MB_ICONHAND);
          FrmConsulta_Cheque.MEdtData_Inicial.SetFocus;
          abort
        end;

        //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
          //sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Data_Vencimento between :DI and :DF order by Che.N_Cheque')
        //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Data_Vencimento between :DI and :DF');

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

        if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
          Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
        else
          Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

        if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PENDENTE'
        else
          Parameters.ParamByName('Status').Value:= 'BAIXADO';
        open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Cheque.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Cheque.MEdtData_Final.Text = '  /  /    ') then
        begin
          Application.MessageBox('Por favor, informe uma data a consultar', 'Atenção', MB_OK+MB_ICONHAND);
          FrmConsulta_Cheque.MEdtData_Inicial.SetFocus;
          abort
        end;

        //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
          //sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Data_Saida between :DI and :DF order by Che.N_Cheque')
        //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and  Che.Data_Saida between :DI and :DF');

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

        if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
          Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
        else
          Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

        if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PENDENTE'
        else
          Parameters.ParamByName('Status').Value:= 'BAIXADO';

        open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Cheque.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Cheque.MEdtData_Final.Text = '  /  /    ') then
        begin
          Application.MessageBox('Por favor, informe uma data a consultar', 'Atenção', MB_OK+MB_ICONHAND);
          FrmConsulta_Cheque.MEdtData_Inicial.SetFocus;
          abort
        end;

        //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
          //sql.add('where Che.Data_Vencimento between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
        //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where Che.Data_Vencimento between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''');

        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
          Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
        else
          Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

        if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PENDENTE'
        else
          Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) then
    begin
      if (FrmConsulta_Cheque.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Cheque.MEdtData_Final.Text = '  /  /    ') then
        begin
          Application.MessageBox('Por favor, informe uma data a consultar', 'Atenção', MB_OK+MB_ICONHAND);
          FrmConsulta_Cheque.MEdtData_Inicial.SetFocus;
          abort
        end;

        //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
          //sql.add('where Che.Data_Saida between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
        //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where Che.Data_Saida between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''');

        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
          Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
        else
          Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

        if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PENDENTE'
        else
          Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;
    end;

    if (FrmConsulta_Cheque.qryconsulta_cheque.IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TConsulta.Consulta_Comissao;
begin
  if (FrmConsulta_Comissao.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Comissao.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Comissao.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Comissao.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmConsulta_Comissao.qryconsulta do
      begin
        close;
        sql.clear;
        sql.add('select Fun.Nome, Fun.Salario, sum( (IP.Valor_Unitario * IP.Qtde) + IP.Outras_Despesas) as Total_Pedido,');
        sql.add('sum( ( (IP.Valor_Unitario * IP.Qtde) + IP.Outras_Despesas) * (IP.Comissao / 100)) as Total_Comissao,');
        sql.add('(Fun.Salario + sum(( (IP.Valor_Unitario * IP.Qtde) + IP.Outras_Despesas) * (IP.Comissao / 100))) as Total_Salario from Pedido Ped');
        sql.add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
        sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
        sql.add('where Ped.Codigo_Empresa = :Empresa and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status and IP.Cancelado = :N');
        sql.add('group by Fun.Nome, Fun.Salario');
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Final.Text);
        Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Final.Text);
        Parameters.ParamByName('Status').Value:= 'PAGO';
        Parameters.ParamByName('N').Value:= 'N';
        open;

        if (FrmConsulta_Comissao.qryconsulta.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
  end
  else
  begin
    if (FrmConsulta_Comissao.EdtCodigo_Funcionario.Text = '') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Comissao.EdtCodigo_Funcionario.SetFocus;
      abort;
    end;

    with FrmConsulta_Comissao.qryconsulta do
      begin
        close;
        sql.clear;
        sql.add('select Fun.Nome, Fun.Salario, sum( (IP.Valor_Unitario * IP.Qtde) + IP.Outras_Despesas) as Total_Pedido,');
        sql.add('sum(( (IP.Valor_Unitario * IP.Qtde) + IP.Outras_Despesas) * (IP.Comissao / 100)) as Total_Comissao,');
        sql.add('(Fun.Salario + sum(( (IP.Valor_Unitario * IP.Qtde) + IP.Outras_Despesas) * (IP.Comissao / 100))) as Total_Salario from Pedido Ped');
        sql.add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
        sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
        sql.add('where Ped.Codigo_Empresa = :Empresa and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Codigo_Funcionario = :Funcionario and Ped.Status = :Status and IP.Cancelado = :N');
        sql.add('group by Fun.Nome, Fun.Salario');
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Final.Text);
        Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Final.Text);
        Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Comissao.EdtCodigo_Funcionario.Text);
        Parameters.ParamByName('Status').Value:= 'PAGO';
        Parameters.ParamByName('N').Value:= 'N';
        open;

        if (FrmConsulta_Comissao.qryconsulta.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
  end;
end;

procedure TConsulta.Consulta_Comissao_Lucratividade_Vendedor;
begin
  if (FrmConsulta_Comissao.MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Comissao.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Comissao.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Comissao.MEdtData_Final.SetFocus;
    abort;
  end;

  with FrmConsulta_Comissao.qrylucratividade do
    begin
      close;
      sql.clear;
      sql.add('select F.Nome, sum(IP.Valor_Compra * IP.Qtde) as Valor_Compra, sum(IP.Valor_Unitario * IP.Qtde) as Valor_Venda,');
      sql.add('( sum(IP.Valor_Compra * IP.Qtde) / sum(IP.Valor_Unitario * IP.Qtde) *100 ) as Total from Itens_Pedido IP');
      sql.add('left join Pedido P on (IP.Codigo = P.Codigo)');
      sql.add('left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)');
      sql.add('where month(P.Data_Venda) between :m1 and :m2 and year(P.Data_Venda) between :a1 and :a2 and P.Status = :Status and IP.Cancelado = :N');
      sql.add('group by P.Codigo_Funcionario, F.Nome');

      Parameters.ParamByName('m1').Value:= FrmConsulta_Comissao.mes1;
      Parameters.ParamByName('m2').Value:= FrmConsulta_Comissao.mes2;
      Parameters.ParamByName('a1').Value:= FrmConsulta_Comissao.ano1;
      Parameters.ParamByName('a2').Value:= FrmConsulta_Comissao.ano2;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      Parameters.ParamByName('N').Value:= 'N';
      open;
    end;

    if (FrmConsulta_Comissao.qrylucratividade.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Comparativo_Preco_Cotacao;
begin
  if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.SetFocus;
        abort;
      end;

      with FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select IRC.*, RC.Codigo_Fornecedor, RC.Codigo_Condicao_Pagamento, RC.Prazo_Entrega, CP.Descricao as Cond_Pag, Forn.Nome_Fantasia, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
          sql.add('inner join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo )');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('left join Produto P on (P.Codigo = IRC.Codigo_Produto)');
          sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade_Medida)');

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Status = :Status order by P.Descricao, IRC.Sub_Total')
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Status = :Status order by Forn.Nome_Fantasia, IRC.Sub_Total');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text);

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 1) then
            Parameters.ParamByName('Status').Value:= 'APROVADO'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 2) then
            Parameters.ParamByName('Status').Value:= 'REPROVADO';
          open;

          if (FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text = '') or (FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select IRC.*, RC.Codigo_Fornecedor, RC.Codigo_Condicao_Pagamento, RC.Prazo_Entrega, CP.Descricao as Cond_Pag, Forn.Nome_Fantasia, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
          sql.add('inner join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo )');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('left join Produto P on (P.Codigo = IRC.Codigo_Produto)');
          sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade_Medida)');

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Codigo_Produto = :Produto and IRC.Status = :Status order by P.Descricao, IRC.Sub_Total')
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Codigo_Produto = :Produto and IRC.Status = :Status order by Forn.Nome_Fantasia, IRC.Sub_Total');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text);
          Parameters.ParamByName('Produto').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text);

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 1) then
            Parameters.ParamByName('Status').Value:= 'APROVADO'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 2) then
            Parameters.ParamByName('Status').Value:= 'REPROVADO';
          open;

          if (FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text = '') or (FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select IRC.*, RC.Codigo_Fornecedor, RC.Codigo_Condicao_Pagamento, RC.Prazo_Entrega, CP.Descricao as Cond_Pag, Forn.Nome_Fantasia, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
          sql.add('inner join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo )');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('left join Produto P on (P.Codigo = IRC.Codigo_Produto)');
          sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade_Medida)');

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and RC.Codigo_Fornecedor = :Fornecedor and IRC.Status = :Status order by P.Descricao, IRC.Sub_Total')
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and RC.Codigo_Fornecedor = :Fornecedor and IRC.Status = :Status order by Forn.Nome_Fantasia, IRC.Sub_Total');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text);
          Parameters.ParamByName('Fornecedor').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text);

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 1) then
            Parameters.ParamByName('Status').Value:= 'APROVADO'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 2) then
            Parameters.ParamByName('Status').Value:= 'REPROVADO';
          open;

          if (FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Compra;
begin
  if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Compra.EdtPedido.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome_Fantasia, Fun.Nome, CP.Descricao from Compra C');
          sql.add('inner join Fornecedor Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Funcionario Fun on (C.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.N_Pedido = :N_Pedido and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.N_Pedido = :N_Pedido and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.N_Pedido = :N_Pedido and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Pedido').Value:= FrmConsulta_Compra.EdtPedido.Text;
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome_Fantasia, Fun.Nome, CP.Descricao from Compra C');
          sql.add('inner join Fornecedor Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Funcionario Fun on (C.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome_Fantasia, Fun.Nome, CP.Descricao from Compra C');
          sql.add('inner join Fornecedor Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Funcionario Fun on (C.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Compra.EdtCodigo_Fornecedor.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Compra.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome_Fantasia, Fun.Nome, CP.Descricao from Compra C');
          sql.add('inner join Fornecedor Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Funcionario Fun on (C.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Compra.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Compra.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome_Fantasia, Fun.Nome, CP.Descricao from Compra C');
          sql.add('inner join Fornecedor Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Funcionario Fun on (C.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Compra.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Compra.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome_Fantasia, Fun.Nome, CP.Descricao from Compra C');
          sql.add('inner join Fornecedor Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Funcionario Fun on (C.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Compra_Reposicao;
begin
  with FrmConsulta_Reposicao_Estoque.qrycompra do
  begin
    close;
    sql.clear;
    sql.add('select IC.Qtde, IC.Qtde_Recebida, IC.Qtde_Restante, C.Data_Previsao_Entrega,');
    sql.add('P.Codigo_Original, P.Descricao from Itens_Compra IC');
    sql.add('left join Compra C on (IC.N_Pedido = C.N_Pedido)');
    sql.add('left join Produto P on (IC.Codigo_Produto = P.Codigo)');
    sql.Add('where IC.Status = :Status order by P.Descricao');
    Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;
  end;
end;

procedure TConsulta.Consulta_Contagem_Estoque;
begin
  with FrmConsulta_Contagem_Estoque.qryconsulta do
    begin
      close;
      sql.clear;
      sql.add('select P.Codigo_Venda, P.Descricao, P.Estoque, L.Local, G.Descricao as Grupo, M.Descricao as Marca, F.Nome_Fantasia from Produto P');
      sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      sql.add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');
      sql.Add('left join Localidade_Produto L on (P.Codigo_Local = L.Codigo)');
      sql.Add('left join Grupo_Produto G on (P.Codigo_Grupo = G.Codigo)');



    //if (FrmConsulta_Contagem_Estoque.RGEstoque.ItemIndex = 0) then
    //begin
      sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo order by P.Descricao');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('Tipo').Value:= 0;
    {end
    else if (FrmConsulta_Contagem_Estoque.RGEstoque.ItemIndex = 1) then
    begin
      sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Estoque > 0 order by P.Descricao');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('Tipo').Value:= 0;
    end
    else if (FrmConsulta_Contagem_Estoque.RGEstoque.ItemIndex = 2) then
    begin
      sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Estoque <= 0 order by P.Descricao');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('Tipo').Value:= 0;
    end;}
      {end
      else if (FrmConsulta_Contagem_Estoque.RGConsulta_Por.ItemIndex = 1) then
      begin
        if (FrmConsulta_Contagem_Estoque.EdtCodigo.Text = '') then
        begin
          FrmConsulta_Contagem_Estoque.EdtCodigo.SetFocus;
          Mensagem_Falta_Dados;
          abort;
        end;

        if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Parametro order by P.Codigo_Venda')
        else if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Parametro order by P.Descricao')
        else if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 2) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Parametro order by F.Nome_Fantasia')
        else if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 3) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Parametro order by M.Descricao');

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Contagem_Estoque.EdtCodigo.Text);
      end
      else if (FrmConsulta_Contagem_Estoque.RGConsulta_Por.ItemIndex = 2) then
      begin
        if (FrmConsulta_Contagem_Estoque.EdtCodigo.Text = '') then
        begin
          FrmConsulta_Contagem_Estoque.EdtCodigo.SetFocus;
          Mensagem_Falta_Dados;
          abort;
        end;

        if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Parametro order by P.Codigo_Venda')
        else if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Parametro order by P.Descricao')
        else if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 2) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Parametro order by F.Nome_Fantasia')
        else if (FrmConsulta_Contagem_Estoque.RGOrdena_Por.ItemIndex = 3) then
          sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Parametro order by M.Descricao');

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Contagem_Estoque.EdtCodigo.Text); }
      //end;
      open;

    end;

    if (FrmConsulta_Contagem_Estoque.qryconsulta.IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;

end;

function TConsulta.Consulta_Conta_Fixa(descricao: string): boolean;
begin
  Consulta_Conta_Fixa:= false;
  if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConsulta_Conta_Fixa.qryconsulta_conta do
        begin
          close;
          sql.clear;
          sql.add('select CF.*, PF.Plano, (select sum(CF.Valor) as Valor from Conta_Fixa CF');
          sql.add('where CF.Codigo_Empresa = :Empresa and CF.Tipo = :Tipo) from Conta_Fixa CF');
          sql.add('left join Plano_Financeiro PF on (CF.Codigo_Plano = PF.Codigo)');
          if (FrmConsulta_Conta_Fixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Tipo = :Tipoo order by CF.Descricao')
          else
            sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Tipo = :Tipoo order by CF.Dia_Vencimento');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Empresaa').Value:= UDeclaracao.codigo_empresa;

          if (FrmConsulta_Conta_Fixa.RGTipo.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo').Value:= 'CRÉDITO';
            Parameters.ParamByName('Tipoo').Value:= 'CRÉDITO'
          end
          else
          begin
            Parameters.ParamByName('Tipo').Value:= 'DÉBITO';
            Parameters.ParamByName('Tipoo').Value:= 'DÉBITO';
          end;
          open;

          if (FrmConsulta_Conta_Fixa.qryconsulta_conta.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
            Consulta_Conta_Fixa:= true;
        end;
    end
    else
      if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 1) then
        begin
          if (FrmConsulta_Conta_Fixa.EdtDia_Ini.Text = '') or (FrmConsulta_Conta_Fixa.EdtDia_Fim.Text = '') then
          begin
            Mensagem_Falta_Dados;
            abort;
          end
          else
          begin
          with FrmConsulta_Conta_Fixa.qryconsulta_conta do
            begin
              close;
              sql.clear;
              sql.add('select CF.*, PF.Plano, (select sum(Valor) as Valor from Conta_Fixa CF ');
              sql.add('where CF.Codigo_Empresa = :Empresa and CF.Dia_Vencimento >= :DII and CF.Dia_Vencimento <= :DFF and CF.Tipo = :Tipo) from Conta_Fixa CF');
              sql.add('left join Plano_Financeiro PF on (CF.Codigo_Plano = PF.Codigo)');
              if (FrmConsulta_Conta_Fixa.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Dia_Vencimento >= :DI and CF.Dia_Vencimento <= :DF and CF.Tipo = :Tipoo order by CF.Descricao')
              else
                sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Dia_Vencimento >= :DI and CF.Dia_Vencimento <= :DF and CF.Tipo = :Tipoo order by CF.Dia_Vencimento');

              Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Empresaa').Value:= UDeclaracao.codigo_empresa;

              Parameters.ParamByName('DI').Value:= StrToInt(FrmConsulta_Conta_Fixa.EdtDia_Ini.Text);
              Parameters.ParamByName('DF').Value:= StrToInt(FrmConsulta_Conta_Fixa.EdtDia_Fim.Text);
              Parameters.ParamByName('DII').Value:= StrToInt(FrmConsulta_Conta_Fixa.EdtDia_Ini.Text);
              Parameters.ParamByName('DFF').Value:= StrToInt(FrmConsulta_Conta_Fixa.EdtDia_Fim.Text);
              if (FrmConsulta_Conta_Fixa.RGTipo.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo').Value:= 'CRÉDITO';
                Parameters.ParamByName('Tipoo').Value:= 'CRÉDITO'
              end
              else
              begin
                Parameters.ParamByName('Tipo').Value:= 'DÉBITO';
                Parameters.ParamByName('Tipoo').Value:= 'DÉBITO';
              end;
              open;

              if (FrmConsulta_Conta_Fixa.qryconsulta_conta.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
                Consulta_Conta_Fixa:= true;
            end;
          end;
        end
        else
        if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 2) then
          begin
            if (FrmConsulta_Conta_Fixa.EdtConsulta.Text = '') then
            begin
              Mensagem_Falta_Dados;
              Abort;
            end
            else
            begin
            with FrmConsulta_Conta_Fixa.qryconsulta_conta do
              begin
                close;
                sql.clear;
                sql.add('select CF.*, PF.Plano, (select sum(Valor) as Valor from Conta_Fixa CF');
                sql.add('where CF.Codigo_Empresa = :Empresa and CF.Tipo = :Tipo and CF.Descricao like '''+ FrmConsulta_Conta_Fixa.EdtConsulta.Text +'%'') from Conta_Fixa CF');
                sql.add('left join Plano_Financeiro PF on (CF.Codigo_Plano = PF.Codigo)');
                if (FrmConsulta_Conta_Fixa.RGOrdena_Por.ItemIndex = 0) then
                  sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Tipo = :Tipoo and CF.Descricao like '''+ FrmConsulta_Conta_Fixa.EdtConsulta.Text +'%'' order by CF.Descricao')
                else
                  sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Tipo = :Tipoo and CF.Descricao like '''+ FrmConsulta_Conta_Fixa.EdtConsulta.Text +'%'' order by CF.Dia_Vencimento');

                Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Empresaa').Value:= UDeclaracao.codigo_empresa;

                if (FrmConsulta_Conta_Fixa.RGTipo.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo').Value:= 'CRÉDITO';
                  Parameters.ParamByName('Tipoo').Value:= 'CRÉDITO'
                end
                else
                begin
                  Parameters.ParamByName('Tipo').Value:= 'DÉBITO';
                  Parameters.ParamByName('Tipoo').Value:= 'DÉBITO';
                end;
                open;

                if (FrmConsulta_Conta_Fixa.qryconsulta_conta.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
                  Consulta_Conta_Fixa:= true;
              end;
            end;
          end
          else
          if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 3) then
            begin
              if (FrmConsulta_Conta_Fixa.EdtCodigo_Plano.Text = '') then
              begin
                Mensagem_Falta_Dados;
                Abort;
              end
              else
              begin
                with FrmConsulta_Conta_Fixa.qryconsulta_conta do
                  begin
                    close;
                    sql.clear;
                    sql.add('select CF.*, PF.Plano, (select sum(Valor) as Valor from Conta_Fixa CF');
                    sql.add('where CF.Codigo_Empresa = :Empresa and CF.Tipo = :Tipo and CF.Codigo_Plano = :Planoo) from Conta_Fixa CF');
                    sql.add('left join Plano_Financeiro PF on (CF.Codigo_Plano = PF.Codigo)');
                    if (FrmConsulta_Conta_Fixa.RGOrdena_Por.ItemIndex = 0) then
                      sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Tipo = :Tipoo and CF.Codigo_Plano = :Plano order by CF.Descricao')
                    else
                      sql.add('where CF.Codigo_Empresa = :Empresaa and CF.Tipo = :Tipoo and CF.Codigo_Plano = :Plano order by CF.Dia_Vencimento');

                    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                    Parameters.ParamByName('Empresaa').Value:= UDeclaracao.codigo_empresa;

                    Parameters.ParamByName('Plano').Value:= StrToInt(FrmConsulta_Conta_Fixa.EdtCodigo_Plano.Text);
                    Parameters.ParamByName('Planoo').Value:= StrToInt(FrmConsulta_Conta_Fixa.EdtCodigo_Plano.Text);
                    if (FrmConsulta_Conta_Fixa.RGTipo.ItemIndex = 0) then
                    begin
                      Parameters.ParamByName('Tipo').Value:= 'CRÉDITO';
                      Parameters.ParamByName('Tipoo').Value:= 'CRÉDITO'
                    end
                    else
                    begin
                      Parameters.ParamByName('Tipo').Value:= 'DÉBITO';
                      Parameters.ParamByName('Tipoo').Value:= 'DÉBITO';
                    end;
                    open;

                    if (FrmConsulta_Conta_Fixa.qryconsulta_conta.IsEmpty = true) then
                      begin
                        Mensagem_Fim_Pesquisa;
                        abort;
                      end;
                      Consulta_Conta_Fixa:= true;
                  end;
              end;
            end;
end;

procedure TConsulta.Consulta_Cotacao;
begin
  if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.EdtCotacao.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.*, F.Nome from Cotacao_Preco_Produto CP');
          sql.add('inner join Funcionario F on (F.Codigo = CP.Codigo_Funcionario)');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.N_Cotacao = :N_Cotacao order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.N_Cotacao = :N_Cotacao order by F.Nome');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Cotacao').Value:= FrmConsulta_Cotacao_Preco_Produto.EdtCotacao.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.*, F.Nome from Cotacao_Preco_Produto CP');
          sql.add('inner join Funcionario F on (F.Codigo = CP.Codigo_Funcionario)');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Cotacao between :DI and :DF order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Cotacao between :DI and :DF order by F.Nome');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.*, F.Nome from Cotacao_Preco_Produto CP');
          sql.add('inner join Funcionario F on (F.Codigo = CP.Codigo_Funcionario)');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Vencimento between :DI and :DF order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Vencimento between :DI and :DF order by F.Nome');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text = '  /  /    ') or
           (FrmConsulta_Cotacao_Preco_Produto.EdtCodigo_Funcionario.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.*, F.Nome from Cotacao_Preco_Produto CP');
          sql.add('inner join Funcionario F on (F.Codigo = CP.Codigo_Funcionario)');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Codigo_Funcionario = :Funcionario and CP.Data_Cotacao between :DI and :DF order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Codigo_Funcionario = :Funcionario and CP.Data_Cotacao between :DI and :DF order by F.Nome');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Cotacao_Preco_Produto.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text = '  /  /    ') or
           (FrmConsulta_Cotacao_Preco_Produto.EdtCodigo_Funcionario.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.*, F.Nome from Cotacao_Preco_Produto CP');
          sql.add('inner join Funcionario F on (F.Codigo = CP.Codigo_Funcionario)');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Codigo_Funcionario = :Funcionario and CP.Data_Vencimento between :DI and :DF order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Codigo_Funcionario = :Funcionario and CP.Data_Vencimento between :DI and :DF order by F.Nome');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Cotacao_Preco_Produto.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Curva_ABC_Produto;
var
  qAux: TADOQuery;
begin
  if (FrmConsulta_Curva_ABC_Produto.MEdtData_Inicial.Text = '  /  /    ') or
      (FrmConsulta_Curva_ABC_Produto.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Curva_ABC_Produto.MEdtData_Inicial.Setfocus;
    abort;
  end;

  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select sum(IP.Sub_Total) as Valor_Total from Itens_Pedido IP');
      add('inner join Pedido P on (IP.Codigo = P.Codigo)');
      add('where P.Codigo_Empresa = :Empresa and P.Data_Venda between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= FrmConsulta_Curva_ABC_Produto.MEdtData_Inicial.Text;
      Parameters.ParamByName('DF').Value:= FrmConsulta_Curva_ABC_Produto.MEdtData_Final.Text;
      open;
    end;

    with FrmConsulta_Curva_ABC_Produto.qryconsulta_curva do
      begin
        close;
        sql.clear;
        sql.add('select Pro.Codigo_Venda, Pro.Descricao, UM.Sigla, sum(IP.Qtde) as Quantidade_Vendida, sum(IP.Sub_Total) as Valor_Total,');
        sql.add('(sum(IP.Sub_Total) * 100) / :Valor_Total as Porcentagem from Itens_Pedido IP');
        sql.add('inner join Pedido P on (IP.Codigo = P.Codigo)');
        sql.add('inner join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
        sql.add('inner join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');

        if (FrmConsulta_Curva_ABC_Produto.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.add('where P.Codigo_Empresa = :Empresa and P.Data_Venda between :DI and :DF');
          sql.add('group by Pro.Codigo_Venda, Pro.Descricao, UM.Sigla order by Pro.Codigo_Venda');
        end
        else if (FrmConsulta_Curva_ABC_Produto.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.add('where P.Codigo_Empresa = :Empresa and P.Data_Venda between :DI and :DF');
          sql.add('group by Pro.Codigo_Venda, Pro.Descricao, UM.Sigla order by Pro.Descricao');
        end
        else if (FrmConsulta_Curva_ABC_Produto.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.add('where P.Codigo_Empresa = :Empresa and P.Data_Venda between :DI and :DF');
          sql.add('group by Pro.Codigo_Venda, Pro.Descricao, UM.Sigla order by Porcentagem desc');
        end;

        Parameters.ParamByName('Valor_Total').Value:= qAux.FieldByName('Valor_Total').AsFloat;

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= FrmConsulta_Curva_ABC_Produto.MEdtData_Inicial.Text;
        Parameters.ParamByName('DF').Value:= FrmConsulta_Curva_ABC_Produto.MEdtData_Final.Text;
        open;

        if (FrmConsulta_Curva_ABC_Produto.qryconsulta_curva.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TConsulta.Consulta_Custo_Empresa;
begin
  if (FrmConsulta_Custo_Empresa.MEdtData_Inicial.Text = '  /    ') or
      (FrmConsulta_Custo_Empresa.MEdtData_Final.Text = '  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Custo_Empresa.MEdtData_Inicial.Setfocus;
    abort;
  end;

  with FrmConsulta_Custo_Empresa.qryconsulta_custo do
  begin
    close;
    sql.clear;
    sql.add('SELECT MES_ANO,');
    sql.add('	   VALOR_FIXO,');
    sql.add('	   VALOR_VARIAVEL,');
    sql.add('	   VALORTOTAL,');
    sql.add('	   (VALOR_FIXO / VALORTOTAL) * 100 as PFIXO,');
    sql.add('	   (VALOR_VARIAVEL / VALORTOTAL) * 100 as PVARIAVEL');
    sql.add('FROM ( ');
    sql.add('SELECT  convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' + convert(varchar(4),year(h.Data_Lancamento)) as Mes_ano,');
    sql.add('        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL');
    sql.add('          left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    sql.add('          where PL.Status = ' + QuotedStr('PAGO') + ' and LF.Tipo = ' + QuotedStr('PAGAR') + ' and LF.Conta_Fixa = 0 AND (convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(h.Data_Lancamento))) =');
    sql.add('        convert(varchar(2),month(LF.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(LF.Data_Lancamento))) AS VALOR_FIXO,');

    sql.add('        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL');
    sql.add('          left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    sql.add('          where PL.Status = ' + QuotedStr('PAGO') + ' and LF.Tipo = ' + QuotedStr('PAGAR') + ' and LF.Conta_Fixa = 1 AND (convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(h.Data_Lancamento))) =');
    sql.add('        convert(varchar(2),month(LF.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(LF.Data_Lancamento))) AS VALOR_VARIAVEL,');

    sql.add('        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL');
    sql.add('          left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    sql.add('          where PL.Status = ' + QuotedStr('PAGO') + ' and LF.Tipo = ' + QuotedStr('PAGAR') + ' and (convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(h.Data_Lancamento))) =');
    sql.add('        convert(varchar(2),month(LF.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(LF.Data_Lancamento))) AS VALORTOTAL');

    sql.add('        FROM Lancamento_Financeiro H');
    sql.Add('        left join Parcelas_Lancamentos PL1 on(H.Codigo = PL1.Codigo)');
    sql.add('        where PL1.Status = ' + QuotedStr('PAGO') + ' and H.Tipo = ' + QuotedStr('PAGAR') + ' and month(H.Data_Lancamento) between :m1 and :m2 and year(H.Data_Lancamento) between :a1 and :a2');
    sql.add('          group by convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('          convert(varchar(4),year(h.Data_Lancamento))) AS TB');
    sql.Add('          order by VALORTOTAL');


    //Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('m1').Value:= FrmConsulta_Custo_Empresa.mes1;
    Parameters.ParamByName('m2').Value:= FrmConsulta_Custo_Empresa.mes2;
    Parameters.ParamByName('a1').Value:= FrmConsulta_Custo_Empresa.ano1;
    Parameters.ParamByName('a2').Value:= FrmConsulta_Custo_Empresa.ano2;
    open;
  end;

  if (FrmConsulta_Custo_Empresa.qryconsulta_custo.IsEmpty = true) then
  begin
    Mensagem_Fim_Pesquisa;
    abort;
  end;
end;

procedure TConsulta.Consulta_Custo_Venda;
begin
  if (FrmConsulta_Custo_Venda.EdtCodigo_Tabela_Preco.Text = '') then
  begin
    UDeclaracao.Mensagem_Falta_Dados;
    FrmConsulta_Custo_Venda.EdtCodigo_Tabela_Preco.SetFocus;
    abort;
  end;

  with FrmConsulta_Custo_Venda.qryconsulta_custo_venda do
    begin
      close;
      sql.clear;
      sql.add('select P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Medio, P.Saldo_Estoque, ITP.Preco_Vista, (P.Estoque * ITP.Preco_Vista) as Valor_Total,');
      sql.add('((P.Estoque * ITP.Preco_Vista) - P.Saldo_Estoque) as Diferenca, (P.Saldo_Estoque / (P.Estoque * ITP.Preco_Vista) * 100) as Perc_Real, ITP.Percentual_Lucro_Vista, UM.Sigla from Produto P');
      sql.add('inner join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

      if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Codigo_Venda')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Descricao')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 2) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Estoque')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 3) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Valor_Medio')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 4) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Saldo_Estoque')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 5) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by ITP.Preco_Vista')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 6) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by Valor_Total')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 7) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by Diferenca')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 8) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by ITP.Percentual_Lucro');

      Parameters.ParamByName('Tabela').Value:= StrToInt(FrmConsulta_Custo_Venda.EdtCodigo_Tabela_Preco.Text);
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      //Parameters.ParamByName('Tipo').Value:= 0;
      open;

      if (FrmConsulta_Custo_Venda.qryconsulta_custo_venda.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Entrada;
begin
  if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Entrada.EdtNota_Fiscal.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada do
        begin
          close;
          sql.clear;
          sql.add('Select EP.*, IE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Nota_Fiscal').Value:= FrmConsulta_Entrada.EdtNota_Fiscal.Text;
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada do
        begin
          close;
          sql.clear;
          sql.add('Select EP.*, IE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada do
        begin
          close;
          sql.clear;
          sql.add('Select EP.*, IE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada do
        begin
          close;
          sql.clear;
          sql.add('Select EP.*, IE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada do
        begin
          close;
          sql.clear;
          sql.add('Select EP.*, IE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada do
        begin
          close;
          sql.clear;
          sql.add('Select EP.*, IE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Entrada_Sintetico1;
begin
  if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Entrada.EdtNota_Fiscal.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.Nome_Fantasia,');
          sql.add('IE.Total_Produtos, IE.Custo_Total, IE.Total_Nota  from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Nota_Fiscal').Value:= FrmConsulta_Entrada.EdtNota_Fiscal.Text;
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.Nome_Fantasia,');
          sql.add('IE.Total_Produtos, IE.Custo_Total, IE.Total_Nota  from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.Nome_Fantasia,');
          sql.add('IE.Total_Produtos, IE.Custo_Total, IE.Total_Nota  from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.Nome_Fantasia,');
          sql.add('IE.Total_Produtos, IE.Custo_Total, IE.Total_Nota  from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.Nome_Fantasia,');
          sql.add('IE.Total_Produtos, IE.Custo_Total, IE.Total_Nota  from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.Nome_Fantasia,');
          sql.add('IE.Total_Produtos, IE.Custo_Total, IE.Total_Nota  from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Entrada_Sintetico2;
begin
  if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Entrada.EdtNota_Fiscal.Text = '') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Nota_Fiscal').Value:= FrmConsulta_Entrada.EdtNota_Fiscal.Text;
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Entrada.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Entrada.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Entrada.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Entrada.qryconsulta_entrada_sintetico do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Estoque_Produto;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  //if (FrmEstoque_Produto.RGConsulta_Por.ItemIndex = 0) then
    //begin
      with FrmEstoque_Produto.qryconsulta_produto do
        begin
          close;
          sql.clear;
          sql.add('select Pro.*, Forn.Nome_Fantasia, UM.Sigla from Produto Pro');
          sql.add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');

          if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where Pro.Status = :Status and Pro.Tipo = :Tipo order by Pro.Codigo_Venda')
          else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where Pro.Status = :Status and Pro.Tipo = :Tipo order by Pro.Codigo_Barra')
          else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where Pro.Status = :Status and Pro.Tipo = :Tipo order by Pro.Descricao');
          Parameters.ParamByName('Status').Value:= 'ATIVO';
          Parameters.ParamByName('Tipo').Value:= 0;
          open;

          if (FrmEstoque_Produto.qryconsulta_produto.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              FrmTabela_Produto.EdtTotal.Clear;
              abort;
            end;

          with qAux do
          begin
            close;
            sql.clear;
            Connection:= dm.ADOConnection1;
            sql.add('select Count(Pro.Codigo) as Conta from Produto Pro');
            sql.add('where Pro.Status = :Status and Pro.Tipo = :Tipo ');
            Parameters.ParamByName('Status').Value:= 'ATIVO';
            Parameters.ParamByName('Tipo').Value:= 0;
            open;
          end;
          FrmEstoque_Produto.EdtTotal.Text:= qAux.FieldByName('Conta').AsString;
        end;
    {end
    else
      if (FrmEstoque_Produto.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmEstoque_Produto.qryconsulta_produto do
            begin
              close;
              sql.clear;
              sql.add('select Pro.*, Forn.Nome_Fantasia, UM.Sigla from Produto Pro');
              sql.add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
              sql.add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');

              if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where Pro.Status = :Status and Pro.Codigo_Venda like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Codigo_Venda')
              else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 1) then
                sql.add('where Pro.Status = :Status and Pro.Codigo_Venda like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Codigo_Barra')
              else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 2) then
                sql.add('where Pro.Status = :Status and Pro.Codigo_Venda like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Descricao');
              Parameters.ParamByName('Status').Value:= 'ATIVO';
              open;

              if (FrmEstoque_Produto.qryconsulta_produto.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  abort;
                end;
            end;
        end
        else
          if (FrmEstoque_Produto.RGConsulta_Por.ItemIndex = 2) then
          begin
            with FrmEstoque_Produto.qryconsulta_produto do
              begin
                close;
                sql.clear;
                sql.add('select Pro.*, Forn.Nome_Fantasia, UM.Sigla from Produto Pro');
                sql.add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
                sql.add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');

                if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 0) then
                  sql.add('where Pro.Status = :Status and Pro.Codigo_Barra like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Codigo_Venda')
                else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 1) then
                  sql.add('where Pro.Status = :Status and Pro.Codigo_Barra like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Codigo_Original')
                else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 2) then
                  sql.add('where Pro.Status = :Status and Pro.Codigo_Barra like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Descricao');
                Parameters.ParamByName('Status').Value:= 'ATIVO';
                open;

                if (FrmEstoque_Produto.qryconsulta_produto.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
              end;
          end
          else
            if (FrmEstoque_Produto.RGConsulta_Por.ItemIndex = 3) then
            begin
              with FrmEstoque_Produto.qryconsulta_produto do
                begin
                  close;
                  sql.clear;
                  sql.add('select Pro.*, Forn.Nome_Fantasia, UM.Sigla from Produto Pro');
                  sql.add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
                  sql.add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');

                  if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 0) then
                    sql.add('where Pro.Status = :Status and Pro.Descricao like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Codigo_Venda')
                  else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 1) then
                    sql.add('where Pro.Status = :Status and Pro.Descricao like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Codigo_Original')
                  else if (FrmEstoque_Produto.RGOrdena_Por.ItemIndex = 2) then
                    sql.add('where Pro.Status = :Status and Pro.Descricao like '''+ FrmEstoque_Produto.EdtConsulta.Text +'%''order by Pro.Descricao');
                  Parameters.ParamByName('Status').Value:= 'ATIVO';
                  open;

                  if (FrmEstoque_Produto.qryconsulta_produto.IsEmpty = true) then
                    begin
                      Mensagem_Fim_Pesquisa;
                      abort;
                    end;
                end;
            end;}
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Agrupado_Cli_Forn;
begin
  if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
     (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryagrupado_cli_forn, sql do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('       Y.Nome,');
      sql.add('	   Y.Valor_Total,');
      sql.add('	   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('		case when (t.Tipo = '+QuotedStr('PAGAR')+') then');
      sql.add('		(select Forn.Nome_Fantasia from Fornecedor Forn where t.Codigo_Cli_For = Forn.Codigo)');
      sql.add('		when (t.Tipo = '+QuotedStr('RECEBER')+') then');
      sql.add('		(select Cli.Nome_Nome_Fantasia from Cliente Cli where t.Codigo_Cli_For = Cli.Codigo) end as Nome,');
      sql.add('       sum(tip.Valor_Pagar) as Valor_Total,');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');
        2: sql.add('	   convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)) as Mes,');
      end;
      //sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');

      sql.add('      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip');
      sql.add('      left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
        2: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
      end;

      //sql.add('      where tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1 and t.Tipo = :Tipo1) as Total_Geral');
      sql.add('        from Parcelas_Lancamentos tip');
      sql.add('left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');
      sql.add('left join Plano_Financeiro PF on (t.Codigo_Plano = PF.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('where t.Tipo = :Tipo2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
        2: sql.add('where t.Tipo = :Tipo2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
      end;

      //sql.add('where tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2 and t.Tipo = :Tipo2');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('group by t.Tipo, convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), t.Codigo_Cli_For');
        2: sql.add('group by t.Tipo, convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)), t.Codigo_Cli_For');
      end;

      //sql.add('group by t.Tipo, convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), t.Codigo_Cli_For');
      sql.add('with rollup ) Y ');

      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PAGO';
        Parameters.ParamByName('Status2').Value:= 'PAGO';
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PENDENTE';
        Parameters.ParamByName('Status2').Value:= 'PENDENTE';
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').Value:= 'PAGAR';
      end
      else
      begin
        Parameters.ParamByName('Tipo1').Value:= 'RECEBER';
        Parameters.ParamByName('Tipo2').Value:= 'RECEBER';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

      if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 1;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 0;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 0;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Conta1').Value:= 1;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 1;
        Parameters.ParamByName('Conta4').Value:= 1;
      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_cli_forn.IsEmpty) then
    begin
      Application.MessageBox('Dados a pagar não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Agrupado_Departamento;
begin
  if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
     (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryagrupado_departamento, sql do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('       Y.Descricao,');
      sql.add('	   Y.Valor_Total,');
      sql.add('	   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('	   case when grouping(D.Descricao) = 0 then D.Descricao');
      sql.add('			when grouping(D.Descricao) = 1  then '+QuotedStr('TOTAL---------->')+'');
      sql.add('	   end as Descricao,');

      sql.add('       sum(tip.Valor_Pagar) as Valor_Total,');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');
        2: sql.add('	   convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)) as Mes,');
      end;

      sql.add('      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip');
      sql.add('      left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
        2: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
      end;

      sql.add('        from Parcelas_Lancamentos tip');
      sql.add('left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');
      sql.add('left join Departamento D on (t.Codigo_Departamento = D.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('where t.Tipo = :Tipo2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
        2: sql.add('where t.Tipo = :Tipo2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
      end;

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('group by convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), D.Descricao');
        2: sql.add('group by convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)), D.Descricao');
      end;

      sql.add('with RollUP) Y');

      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PAGO';
        Parameters.ParamByName('Status2').Value:= 'PAGO';
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PENDENTE';
        Parameters.ParamByName('Status2').Value:= 'PENDENTE';
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').Value:= 'PAGAR';
      end
      else
      begin
        Parameters.ParamByName('Tipo1').Value:= 'RECEBER';
        Parameters.ParamByName('Tipo2').Value:= 'RECEBER';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

      if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 1;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 0;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 0;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Conta1').Value:= 1;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 1;
        Parameters.ParamByName('Conta4').Value:= 1;
      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_departamento.IsEmpty) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento;
begin
  if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
     (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryagrupado_forma_pagamento, sql do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('       Y.Descricao,');
      sql.add('	   Y.Valor_Total,');
      sql.add('	   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('	   case when grouping(CP.Descricao) = 0 then CP.Descricao');
      sql.add('			when grouping(CP.Descricao) = 1  then '+QuotedStr('TOTAL---------->')+'');
      sql.add('	   end as Descricao,');

      sql.add('       sum(tip.Valor_Pagar) as Valor_Total,');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');
        2: sql.add('	   convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)) as Mes,');
      end;

      sql.add('      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip');
      sql.add('      left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
        2: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
      end;

      sql.add('        from Parcelas_Lancamentos tip');
      sql.add('left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');
      sql.add('left join Condicao_Pagamento CP on (tip.Codigo_Forma_Pagamento_Parcela = CP.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('where t.Tipo = :Tipo2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
        2: sql.add('where t.Tipo = :Tipo2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
      end;

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('group by convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), CP.Descricao');
        2: sql.add('group by convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)), CP.Descricao');
      end;

      sql.add('with RollUP) Y');

      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PAGO';
        Parameters.ParamByName('Status2').Value:= 'PAGO';
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PENDENTE';
        Parameters.ParamByName('Status2').Value:= 'PENDENTE';
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').Value:= 'PAGAR';
      end
      else
      begin
        Parameters.ParamByName('Tipo1').Value:= 'RECEBER';
        Parameters.ParamByName('Tipo2').Value:= 'RECEBER';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

      if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 1;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 0;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 0;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Conta1').Value:= 1;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 1;
        Parameters.ParamByName('Conta4').Value:= 1;
      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_forma_pagamento.IsEmpty) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Agrupado_PF;
begin
  if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
     (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryagrupado_plano, sql do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('       Y.Descricao,');
      sql.add('	   Y.Valor_Total,');
      sql.add('	   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('	   case when grouping(PF.Descricao) = 0 then PF.Descricao');
      sql.add('			when grouping(PF.Descricao) = 1  then '+QuotedStr('TOTAL---------->')+'');
      sql.add('	   end as Descricao,');

      sql.add('       sum(tip.Valor_Pagar) as Valor_Total,');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');
        2: sql.add('	   convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)) as Mes,');
      end;

      sql.add('      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip');
      sql.add('      left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
        2: sql.add('      where t.Tipo = :Tipo1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
      end;

      sql.add('        from Parcelas_Lancamentos tip');
      sql.add('left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');
      sql.add('left join Plano_Financeiro PF on (t.Codigo_Plano = PF.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('where t.Tipo = :Tipo2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
        2: sql.add('where t.Tipo = :Tipo2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
      end;

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('group by convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), PF.Codigo_Pai, PF.Descricao');
        2: sql.add('group by convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)), PF.Codigo_Pai, PF.Descricao');
      end;

      sql.add('with RollUP) Y');

      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PAGO';
        Parameters.ParamByName('Status2').Value:= 'PAGO';
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PENDENTE';
        Parameters.ParamByName('Status2').Value:= 'PENDENTE';
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').Value:= 'PAGAR';
      end
      else
      begin
        Parameters.ParamByName('Tipo1').Value:= 'RECEBER';
        Parameters.ParamByName('Tipo2').Value:= 'RECEBER';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

      if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 1;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 0;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 0;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Conta1').Value:= 1;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 1;
        Parameters.ParamByName('Conta4').Value:= 1;
      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_plano.IsEmpty) then
    begin
      Application.MessageBox('Dados a pagar não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Pagar_Agrupado;
begin
  with FrmConsulta_Lancamentos_Financeiros.qrypagar_agrupado do
    begin
      close;
      sql.clear;
      sql.add('select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Historico,');
      sql.add('LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento,');
      sql.add('PL.Valor, PL.Valor_Pagar, PL.Valor_Pago, PL.Valor_Restante, PL.Status, Forn.Nome_Fantasia');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
      sql.Add('left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)');
      sql.Add('left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)');


      if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
        abort;
      end
      else
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
        else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
        else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento');

        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qrypagar_agrupado.IsEmpty) then
    begin
      Application.MessageBox('Dados a pagar não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;

end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Receber_Agrupado;
begin
  with FrmConsulta_Lancamentos_Financeiros.qryreceber_agrupado do
    begin
      close;
      sql.clear;
      sql.add('select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Historico,');
      sql.add('LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento,');
      sql.add('PL.Valor, PL.Valor_Pagar, PL.Valor_Pago, PL.Valor_Restante, PL.Status, Cli.Nome_Nome_Fantasia');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.Add('left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)');
      sql.Add('left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)');


      if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
        abort;
      end
      else
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
        else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
        else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento');

        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qryreceber_agrupado.IsEmpty) then
    begin
      Application.MessageBox('Dados a receber não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;

end;

procedure TConsulta.Consulta_Fechamento_Estoque;
var
  d1, d2: TDate;
begin
  d1:= StrToDate('01/'+FrmFechamento_Inventario.mes+'/'+FrmFechamento_Inventario.ano);
  d2:= UltimoDia(d1);
  {with FrmFechamento_Inventario.qryestoque do
    begin
      close;
      sql.clear;
      sql.add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque, ');
      sql.Add('(P.Valor_Compra * P.Estoque) as ValorEstoque, UM.Sigla from Produto P');
      sql.Add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      sQL.Add('where P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Empresa = :Empresa');
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('Tipo').Value:= 0;
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      open;
    end; }


  with FrmFechamento_Inventario.qryestoque do
    begin
      close;
      sql.clear;
      sql.add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque, ');
      sql.Add('(P.Valor_Compra * P.Estoque) as ValorEstoque, UM.Sigla from Itens_Pedido IP');
      SQL.Add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      SQL.Add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
      sql.Add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      SQL.Add('where Ped.Data_Venda between :DI and :DF and P.Tipo = :Tipo and Ped.Codigo_Empresa = :Empresa and');
      sql.Add('Ped.Status = :Status and (Ped.Tipo = :Tipo1 or Ped.Tipo = :Tipo2 or Ped.Tipo = :Tipo3)');
      sql.Add('group by P.Codigo, P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque, UM.Sigla');
      Parameters.ParamByName('Tipo').Value:= 0;
      Parameters.ParamByName('DI').Value:= d1;
      Parameters.ParamByName('DF').Value:= d2;
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      Parameters.ParamByName('Tipo1').Value:= 'PRÉ-VENDA';
      Parameters.ParamByName('Tipo2').Value:= 'PDV';
      Parameters.ParamByName('Tipo3').Value:= 'DAV-OS';
      open;
    end;

      if (FrmFechamento_Inventario.qryestoque.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
end;

procedure TConsulta.Consulta_Ficha_Funcionario;
begin
  if (FrmConsulta_Ficha_Funcionario.RGConsulta_Por.ItemIndex = 1) then
  begin
    if (FrmConsulta_Ficha_Funcionario.EdtCodigo.Text = '') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Ficha_Funcionario.EdtCodigo.SetFocus;
      abort;
    end;
  end;

  with FrmConsulta_Ficha_Funcionario.qryconsulta_funcionario, sql do
  begin
    close;
    clear;
    add('select F.Nome, F.CPF, F.RG, F.Salario, F.Comissao, L.Descricao as Logradouro,');
    add('S.Descricao as Setor, C.Descricao as Cidade, F.Numero, F.Telefone, F.Celular from Funcionario F');
    add('left join Logradouro L on (F.Codigo_Logradouro = L.Codigo)');
    add('left join Setor S on (F.Codigo_Setor = S.Codigo)');
    add('left join Cidade C on (F.Codigo_Cidade = C.Codigo)');

    case (FrmConsulta_Ficha_Funcionario.RGConsulta_Por.ItemIndex) of
      0: Add('');
      1: Add('where F.Codigo = :Codigo');
    end;

    case (FrmConsulta_Ficha_Funcionario.RGConsulta_Por.ItemIndex) of
      1: Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Ficha_Funcionario.EdtCodigo.Text);
    end;
    open;
  end;
end;

procedure TConsulta.Consulta_Ficha_Cliente;
begin
  if (FrmConsulta_Ficha_Cliente.RGConsulta_Por.ItemIndex = 1) then
  begin
    if (FrmConsulta_Ficha_Cliente.EdtCodigo.Text = '') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Ficha_Cliente.EdtCodigo.SetFocus;
      abort;
    end;
  end;

  with FrmConsulta_Ficha_Cliente.qryconsulta_cliente, sql do
  begin
    close;
    clear;
    add('select C.Nome_Nome_Fantasia, C.Razao_Social, C.CPF, C.RG, C.CNPJ, C.Insc_Estadual, C.Endereco,');
    add('S.Descricao as Setor, Ci.Descricao as Cidade, C.Numero, C.Telefone, C.Celular from Cliente C');
    //add('left join Logradouro L on (C.Codigo_Logradouro = L.Codigo)');
    add('left join Setor S on (C.Codigo_Setor = S.Codigo)');
    add('left join Cidade Ci on (C.Codigo_Cidade = Ci.Codigo)');

    case (FrmConsulta_Ficha_Cliente.RGConsulta_Por.ItemIndex) of
      0: Add('');
      1: Add('where C.Codigo = :Codigo');
    end;

    case (FrmConsulta_Ficha_Cliente.RGConsulta_Por.ItemIndex) of
      1: Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Ficha_Cliente.EdtCodigo.Text);
    end;
    open;
  end;
end;

procedure TConsulta.Consulta_Folha_Pagamento;
begin
  if (FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text = '') then
  begin
    FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text = '') or
         (FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Folha_Pagamento.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Fun.Nome from Folha_Pagamento FP');
          sql.add('inner join Funcionario Fun on (FP.Codigo_Funcionario = Fun.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Data_Fechamento between :DI and :DF order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Data_Fechamento between :DI and :DF order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Data_Fechamento between :DI and :DF order by Fun.Nome')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Data_Fechamento between :DI and :DF order by FP.Codigo');

          Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
          Parameters.ParamByName('Nome').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text = '') or
         (FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text = '  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Fun.Nome from Folha_Pagamento FP');
          sql.add('inner join Funcionario Fun on (FP.Codigo_Funcionario = Fun.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Mes_Ano = :Mes order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Mes_Ano = :Mes order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Mes_Ano = :Mes order by Fun.Nome')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and Mes_Ano = :Mes order by FP.Codigo');

          Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
          Parameters.ParamByName('Nome').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('Mes').Value:= FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text;
          open;
          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text = '  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Fun.Nome from Folha_Pagamento FP');
          sql.add('inner join Funcionario Fun on (FP.Codigo_Funcionario = Fun.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Mes_Ano = :Mes order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Mes_Ano = :Mes order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Mes_Ano = :Mes order by Fun.Nome')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Mes_Ano = :Mes order by FP.Codigo');

          Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
          Parameters.ParamByName('Mes').Value:= FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text;
          open;
          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Folha_Pagamento.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Fun.Nome from Folha_Pagamento FP');
          sql.add('inner join Funcionario Fun on (FP.Codigo_Funcionario = Fun.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Data_Fechamento between :DI and :DF order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Data_Fechamento between :DI and :DF order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Data_Fechamento between :DI and :DF order by Fun.Nome')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where FP.Codigo_Empresa = :Empresa and Data_Fechamento between :DI and :DF order by FP.Codigo');

          Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Final.Text);
          open;
          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Historico_Log;
begin
  if (FrmConsulta_Historico_Log.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Historico_Log.MEdtData_Final.Text = '  /  /    ') or
      (FrmConsulta_Historico_Log.EdtCodigo_Usuario.Text = '') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 0) then
  begin
    with FrmConsulta_Historico_Log.qryconsulta_historico do
    begin
      close;
      sql.clear;
      sql.add('select H.* from Historico H');
      sql.Add('where H.Usuario = :Usuario and H.Data between :DI and :DF');

      if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 0) then
        SQL.Add('order by H.Historico')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 1) then
        SQL.Add('order by H.Data')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 2) then
        SQL.Add('order by H.Tipo_Operacao');

      Parameters.ParamByName('Usuario').Value:= FrmConsulta_Historico_Log.EdtUsuario.Text;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Final.Text);
      open;
    end;
  end
  else
  begin
    with FrmConsulta_Historico_Log.qryconsulta_historico do
    begin
      close;
      sql.clear;
      sql.add('select H.* from Historico H');
      sql.Add('where H.Usuario = :Usuario and H.Data between :DI and :DF and H.Tipo_Operacao = :Tipo');

      if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 0) then
        SQL.Add('order by H.Historico')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 1) then
        SQL.Add('order by H.Data')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 2) then
        SQL.Add('order by H.Tipo_Operacao');

      Parameters.ParamByName('Usuario').Value:= FrmConsulta_Historico_Log.EdtUsuario.Text;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Final.Text);

      if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 1) then
        Parameters.ParamByName('Tipo').Value:= 'INSERÇÃO'
      else if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 2) then
        Parameters.ParamByName('Tipo').Value:= 'ALTERAÇÃO'
      else if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 3) then
        Parameters.ParamByName('Tipo').Value:= 'EXCLUSÃO'
      else if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 4) then
        Parameters.ParamByName('Tipo').Value:= 'CONSULTA';
      open;
    end;
  end;

  if (FrmConsulta_Historico_Log.qryconsulta_historico.IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;

end;

procedure TConsulta.Consulta_Historico_Movimentacao;
begin
  if (FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_Historico_Movimentacao.RGConsulta_Por.ItemIndex = 1) and (FrmConsulta_Historico_Movimentacao.EdtCodigo_Produto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Historico_Movimentacao.EdtCodigo_Produto.Setfocus;
    abort;
  end;

  if (FrmConsulta_Historico_Movimentacao.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmConsulta_Historico_Movimentacao.qryconsulta_historico do
    begin
      close;
      sql.clear;
      sql.add('select Codigo_Reg, Codigo, Descricao, Quantidade, Qtde_Estoque_Atual, Data, Tipo, Nome, CliForn, Qtd from');
      sql.add('( select IE.Codigo as Codigo_Reg, P.Codigo, P.Descricao, (IE.Quantidade) as Quantidade, ');
      sql.add('(IE.Qtde_Estoque_Atual + (IE.Quantidade * IE.Quantidade_Volume) ) as Qtd, IE.Qtde_Estoque_Atual, EP.Data_Entrada as Data, '+quotedstr('ENTRADA')+' as Tipo, ');
      sql.add('F.Nome, Fo.Nome_Fantasia as CliForn from Itens_Entrada IE');
      sql.add('left join Produto P on (IE.Codigo_Produto = P.Codigo)');
      sql.add('left join Entrada_Produtos EP on (EP.Codigo = IE.Codigo)');
      sql.add('left join Fornecedor Fo on (EP.Codigo_Fornecedor = Fo.Codigo)');
      sql.add('left join Funcionario F on (EP.Codigo_Funcionario = F.Codigo)');
      sql.add('where EP.Data_Entrada between :DI1 and :DF1');

      sql.add('Union');

      sql.add('select IP.Codigo as Codigo_Reg, IP.Codigo_Produto, IP.Descricao, (IP.Qtde) as Qtde, ');
      sql.add('(IP.Qtde_Estoque_Atual - IP.Qtde) as Qtd, IP.Qtde_Estoque_Atual, P.Data_Venda as Data, '+quotedstr('SAÍDA')+' as Tipo,');
      sql.add('F.Nome, Cli.Nome_Nome_Fantasia as CliForn from Itens_Pedido IP');
      sql.add('left join Pedido P on (IP.Codigo = P.Codigo) ');
      sql.add('left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)');
      sql.add('left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo)');
      sql.add('where P.Data_Venda between :DI2 and :DF2 and P.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');


      sql.add('Union');

      sql.add('select ME.Codigo_Registro as Codigo_Reg, ME.Codigo_Produto, ME.Descricao, ME.Quantidade as Qtde, ');
      sql.add('Qtd = case when (ME.Natureza = '+quotedstr('ENTRADA MANUAL')+') then');
      sql.add('    (ME.Estoque_Atual + ME.Quantidade)');
      sql.add('    when (ME.Natureza = '+quotedstr('SAÍDA MANUAL')+') then');
      sql.add('    (ME.Estoque_Atual - ME.Quantidade) end,');

      sql.add('ME.Estoque_Atual, ME.Data, ME.Natureza,');
      sql.add('F.Nome, F2.Nome from Movimentacao_Estoque ME');
      sql.add('left join Funcionario F on (ME.Codigo_Funcionario = F.Codigo)');
      sql.add('left join Funcionario F2 on (ME.Codigo_Funcionario = F2.Codigo)');

      sql.add('where ME.Data between :DI3 and :DF3) X order by Data desc, Descricao asc');
      Parameters.ParamByName('DI1').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
      Parameters.ParamByName('DI3').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF3').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
      //Parameters.ParamByName('Status1').Value := 'PAGO';
      Parameters.ParamByName('Status2').Value := 'PAGO';
      //Parameters.ParamByName('Status3').Value := 'PAGO';
      open;
    end;
  end
  else
  begin
    with FrmConsulta_Historico_Movimentacao.qryconsulta_historico do
    begin
      close;
      sql.clear;
      sql.add('select Codigo_Reg, Codigo, Descricao, Quantidade, Qtde_Estoque_Atual, Data, Tipo, Nome, CliForn, Qtd from');
      sql.add('( select IE.Codigo as Codigo_Reg, P.Codigo, P.Descricao, (IE.Quantidade) as Quantidade, ');
      sql.add('(IE.Qtde_Estoque_Atual + IE.Quantidade) as Qtd, IE.Qtde_Estoque_Atual, EP.Data_Entrada as Data, '+quotedstr('ENTRADA')+' as Tipo, ');
      sql.add('F.Nome, Fo.Nome_Fantasia as CliForn from Itens_Entrada IE');
      sql.add('left join Produto P on (IE.Codigo_Produto = P.Codigo)');
      sql.add('left join Entrada_Produtos EP on (EP.Codigo = IE.Codigo)');
      sql.add('left join Fornecedor Fo on (EP.Codigo_Fornecedor = Fo.Codigo)');
      sql.add('left join Funcionario F on (EP.Codigo_Funcionario = F.Codigo)');
      sql.add('where P.Codigo = :Codigo1 and EP.Data_Entrada between :DI1 and :DF1');

      sql.add('Union');

      sql.add('select IP.Codigo as Codigo_Reg, IP.Codigo_Produto, IP.Descricao, (IP.Qtde) as Qtde, ');
      sql.add('(IP.Qtde_Estoque_Atual - IP.Qtde) as Qtd, IP.Qtde_Estoque_Atual, P.Data_Venda as Data, '+quotedstr('SAÍDA')+' as Tipo,');
      sql.add('F.Nome, Cli.Nome_Nome_Fantasia as CliForn from Itens_Pedido IP');
      sql.add('left join Pedido P on (IP.Codigo = P.Codigo) ');
      sql.add('left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)');
      sql.add('left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo)');
      sql.add('where IP.Codigo_Produto = :Codigo2 and P.Data_Venda between :DI2 and :DF2 and P.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');

      sql.add('Union');

      sql.add('select ME.Codigo_Registro as Codigo_Reg, ME.Codigo_Produto, ME.Descricao, ME.Quantidade as Qtde, ');
      sql.add('Qtd = case when (ME.Natureza = '+quotedstr('ENTRADA MANUAL')+') then');
      sql.add('    (ME.Estoque_Atual + ME.Quantidade)');
      sql.add('    when (ME.Natureza = '+quotedstr('SAÍDA MANUAL')+') then');
      sql.add('    (ME.Estoque_Atual - ME.Quantidade) end,');

      sql.add('ME.Estoque_Atual, ME.Data, ME.Natureza,');
      sql.add('F.Nome, F2.Nome from Movimentacao_Estoque ME');
      sql.add('left join Funcionario F on (ME.Codigo_Funcionario = F.Codigo)');
      sql.add('left join Funcionario F2 on (ME.Codigo_Funcionario = F2.Codigo)');

      sql.add('where ME.Codigo_Produto = :Codigo3 and ME.Data between :DI3 and :DF3) X order by Data desc, Descricao asc');

      Parameters.ParamByName('Codigo1').Value := StrToInt(FrmConsulta_Historico_Movimentacao.EdtCodigo_Produto.Text);
      Parameters.ParamByName('Codigo2').Value := StrToInt(FrmConsulta_Historico_Movimentacao.EdtCodigo_Produto.Text);
      Parameters.ParamByName('Codigo3').Value := StrToInt(FrmConsulta_Historico_Movimentacao.EdtCodigo_Produto.Text);
      Parameters.ParamByName('DI1').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
      Parameters.ParamByName('DI3').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF3').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
      //Parameters.ParamByName('Status1').Value := 'PAGO';
      Parameters.ParamByName('Status2').Value := 'PAGO';
      //Parameters.ParamByName('Status3').Value := 'PAGO';
      open;
    end;
  end;

  if (FrmConsulta_Historico_Movimentacao.qryconsulta_historico.IsEmpty = true) then
  begin
    Mensagem_Fim_Pesquisa;
    abort;
  end;


end;

procedure TConsulta.Consulta_Inventario_Estoque;
begin
  with FrmConsulta_Inventario.qryconsulta_inventario, sql do
  begin
    close;
    clear;
    add('select P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque,');
    add('sum(P.Valor_Compra * P.Estoque) as Saldo, UM.Sigla as Unidade');
    add('from Produto P');
    add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

    Add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo ');
    Add('group by P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque, UM.Sigla order by P.Descricao');

    Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
    Parameters.ParamByName('Status').Value:= 'ATIVO';
    Parameters.ParamByName('Tipo').Value:= 0;
    open;
  end;
end;

procedure TConsulta.Consulta_Itens_Compra;
begin
  if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = false) then
  begin
    with FrmConsulta_Compra.qryitens_compra do
    begin
      close;
      sql.clear;
      sql.add('select IC.*, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Compra IC');
      sql.add('inner join Produto P on (IC.Codigo_Produto = P.Codigo)');
      sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      sql.Add('where IC.N_Pedido = :N_Pedido');
      Parameters.ParamByName('N_Pedido').Value:= FrmConsulta_Compra.qryconsulta_compraN_Pedido.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Cotacao;
begin
  if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = false) then
  begin
    with FrmConsulta_Cotacao_Preco_Produto.qryitens_cotacao do
    begin
      close;
      sql.clear;
      sql.add('select IC.*, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Cotacao_Preco_Produto IC');
      sql.add('left join Produto P on (P.Codigo = IC.Codigo_Produto)');
      sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade_Medida)');
      sql.Add('where IC.N_Cotacao = :N_Cotacao');
      Parameters.ParamByName('N_Cotacao').Value:= FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacaoN_Cotacao.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Entrada;
begin
  //if (FrmConsulta_Entrada.qryconsulta_entrada.IsEmpty = false) then
  //begin
    with FrmConsulta_Entrada.qryitens_entrada do
    begin
      close;
      sql.clear;
      sql.add('select IE.*, P.Codigo_Venda, P.Descricao from Itens_Entrada IE');
      sql.add('left join Produto P on(IE.Codigo_Produto = P.Codigo)');
      sql.Add('order by IE.Codigo, IE.N_Item');
      //sql.Add('where IE.N_Nota_Fiscal = :N_Nota_Fiscal');
      //Parameters.ParamByName('N_Nota_Fiscal').Value:= FrmConsulta_Entrada.qryconsulta_entradaN_Nota_Fiscal.AsString;
      open;
    end;
  //end;
end;

procedure TConsulta.Consulta_Itens_Entrada_Sintetico_1;
begin
  if (FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1.IsEmpty = false) then
  begin
    with FrmConsulta_Entrada.qryitens_entrada_sintetico do
    begin
      close;
      sql.clear;
      sql.add('select IE.N_Item, IE.Unidade, IE.Valor_Unitario, IE.Quantidade, IE.Valor_Total,');
      sql.add('P.Codigo_Venda, P.Descricao from Itens_Entrada IE');
      sql.add('inner join Produto P on(IE.Codigo_Produto = P.Codigo)');
      sql.add('where IE.N_Nota_Fiscal = :N_Nota_Fiscal');
      Parameters.ParamByName('N_Nota_Fiscal').Value:= FrmConsulta_Entrada.qryconsulta_entrada_sintetico_1N_Nota_Fiscal.AsString;
      open;
    end;
  end;

end;

procedure TConsulta.Consulta_Itens_Folha_Pagamento;
begin
  if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = false) then
  begin
    with FrmConsulta_Folha_Pagamento.qryitens_folha do
    begin
      close;
      sql.clear;
      sql.add('select IFP.*, IFF.Descricao, IFF.Natureza from Itens_Folha_Pagamento IFP');
      sql.add('inner join Itens_Folha IFF on (IFP.Codigo_Item = IFF.Codigo)');
      sql.Add('where IFP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= FrmConsulta_Folha_Pagamento.qryconsulta_folhaCodigo.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Patrimonio;
begin
  if (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex = 4) or (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex = 5) or
      (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex = 6)then
  begin
    if (FrmConsulta_Patrimonio.EdtCodigo.Text = '') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Patrimonio.EdtCodigo.SetFocus;
      abort;
    end;
  end;

  with FrmConsulta_Patrimonio.qryconsulta_bem, sql do
    begin
      close;
      sql.clear;
      sql.add('select P.*, M.Descricao as Marca, TBP.Descricao as Tipo_Bem, LP.Local, CS.Descricao as Status');
      sql.add('from Patrimonio P');
      sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      sql.add('left join Tipo_Bem_Patrimonial TBP on (P.Codigo_Tipo_Bem = TBP.Codigo)');
      sql.add('left join Localidade_Produto LP on (P.Codigo_Local_Bem = LP.Codigo)');
      sql.add('left join Cadastro_Status CS on (P.Codigo_Status = CS.Codigo)');

      case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
        0: add('where P.N_Bem like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
        1: add('where P.N_Identificacao like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
        2: add('where P.Descricao like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
        3: add('where P.Modelo like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''order by P.Codigo');
        4: add('where P.Codigo_Tipo_Bem = :1 order by P.Codigo');
        5: add('where P.Codigo_Local_Bem = :2 order by P.Codigo');
        6: add('where P.Codigo_Status = :3 order by P.Codigo');
      end;

      case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
        4: Parameters.ParamByName('1').Value:= StrToInt(FrmConsulta_Patrimonio.EdtCodigo.Text);
        5: Parameters.ParamByName('2').Value:= StrToInt(FrmConsulta_Patrimonio.EdtCodigo.Text);
        6: Parameters.ParamByName('3').Value:= StrToInt(FrmConsulta_Patrimonio.EdtCodigo.Text);
      end;

      open;

      if (FrmConsulta_Patrimonio.qryconsulta_bem.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Itens_OS;
begin
  if (FrmConsulta_OS.qryconsulta_os.IsEmpty = false) then
  begin
    with FrmConsulta_OS.qryitens_os do
    begin
      close;
      sql.clear;
      sql.add('select IP.*, P.Codigo_Venda, P.Descricao from Itens_Pedido IP');
      sql.add('inner join Produto P on(IP.Codigo_Produto = P.Codigo)');
      sql.add('where IP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= FrmConsulta_OS.qryconsulta_osCodigo.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Retorno_Cotacao;
begin
  if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = false) then
  begin
    with FrmConsulta_Retorno_Cotacao_Preco.qryitens_cotacao do
    begin
      close;
      sql.clear;
      sql.add('select IRC.*, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
      sql.add('left join Produto P on (P.Codigo = IRC.Codigo_Produto)');
      sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade_Medida)');
      sql.add('where IRC.N_Cotacao = :N_Cotacao and IRC.Codigo = :Codigo');
      Parameters.ParamByName('N_Cotacao').Value:= FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacaoN_Cotacao.AsInteger;
      Parameters.ParamByName('Codigo').Value:= FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacaoCodigo.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Tabela_Preco;
begin
  if (FrmConsulta_Tabela_Preco.qryconsulta_tabela.IsEmpty = false) then
  begin
    with FrmConsulta_Tabela_Preco.qryitens_tabela do
    begin
      close;
      sql.clear;
      sql.add('select ITP.*, P.Codigo_Venda, P.Descricao from Itens_Tabela_Preco ITP');
      sql.add('left join Produto P on (ITP.Codigo_Produto = P.Codigo)');
      sql.add('where ITP.Codigo = :Codigo order by P.Descricao');
      Parameters.ParamByName('Codigo').Value:= FrmConsulta_Tabela_Preco.qryconsulta_tabelaCodigo.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Venda;
begin
  if (FrmConsulta_Venda.qryconsulta_sintetico_1.IsEmpty = false) then
  begin
    with FrmConsulta_Venda.qryitens_venda do
    begin
      close;
      sql.clear;
      sql.add('select IP.Codigo_Produto, IP.Codigo, IP.Codigo_Venda, IP.Descricao, IP.UN, IP.Qtde,');
      sql.add('IP.Valor_Original, IP.Desc_Acr,IP.Valor_Unitario, IP.Valor_Compra, IP.Sub_Total, IP.Valor_ICMS_ST, IP.Codigo_Registro ');
      sql.Add('from Itens_Pedido IP where IP.Cancelado = '+QuotedStr('N')+' order by IP.Codigo ');//IP.Codigo = :Codigo ');
      //Parameters.ParamByName('Codigo').Value:= FrmConsulta_Venda.qryconsulta_sintetico_1Codigo.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Lancamento_Banco;
begin
  if (FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamento_Banco.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Lancamento_Banco.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamento_Banco.MEdtData_Final.SetFocus;
    abort;
  end;

  if (FrmConsulta_Lancamento_Banco.EdtCodigo_Conta.Text = '') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamento_Banco.EdtCodigo_Conta.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamento_Banco.qryconsulta_lancamento do
  begin
    close;
    sql.clear;
    sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Descricao as Plano from Lancamento_Banco LB');
    sql.add('left join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
    sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
    sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');

    sql.add('where LB.Codigo_Empresa = :Empresa and LB.Codigo_Conta = :Conta and LB.Data_Lancamento between :DI and :DF order by LB.Codigo');

    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('Conta').Value:= StrToInt(FrmConsulta_Lancamento_Banco.EdtCodigo_Conta.Text);
    {if (FrmConsulta_Lancamento_Banco.RGStatus.ItemIndex = 0) then
      Parameters.ParamByName('Status').Value:= 'LIBERADO'
    else
      Parameters.ParamByName('Status').Value:= 'BLOQUEADO';}
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamento_Banco.MEdtData_Final.Text);
    open;

    if (FrmConsulta_Lancamento_Banco.qryconsulta_lancamento.IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
    {end
    else
      if (FrmConsulta_Lancamento_Banco.RGConsulta_Por.ItemIndex = 1) then
        begin
          if (FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Lancamento_Banco.MEdtData_Final.Text = '  /  /    ') then
          begin
            Application.MessageBox('Por favor, informe uma data a consultar', 'Atenção', MB_OK+MB_ICONHAND);
            FrmConsulta_Lancamento_Banco.MEdtData_Inicial.SetFocus;
            abort
          end
          else
          begin
            with FrmConsulta_Lancamento_Banco.qryconsulta_lancamento do
              begin
                close;
                sql.clear;
                sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Plano from Lancamento_Banco LB');
                sql.add('left join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
                sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
                sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
                if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 0) then
                  sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Data_Lancamento between :DI and :DF order by LB.N_Documento')
                else if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 1) then
                  sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Data_Lancamento between :DI and :DF order by LB.Data_Lancamento')
                else if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 2) then
                  sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Data_Lancamento between :DI and :DF order by LB.Descricao');

                Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                if (FrmConsulta_Lancamento_Banco.RGStatus.ItemIndex = 0) then
                  Parameters.ParamByName('Status').Value:= 'LIBERADO'
                else
                  Parameters.ParamByName('Status').Value:= 'BLOQUEADO';

                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamento_Banco.MEdtData_Final.Text);
                open;

                if (FrmConsulta_Lancamento_Banco.qryconsulta_lancamento.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
              end;
          end;
        end
        else
          if (FrmConsulta_Lancamento_Banco.RGConsulta_Por.ItemIndex = 2) then
            begin
              if (FrmConsulta_Lancamento_Banco.EdtCodigo_Plano.Text = '') then
              begin
                Application.MessageBox('Por favor, informe um parametro a consultar', 'Atenção', MB_OK+MB_ICONHAND);
                FrmConsulta_Lancamento_Banco.EdtCodigo_Plano.SetFocus;
                abort
              end
              else
              begin
                with FrmConsulta_Lancamento_Banco.qryconsulta_lancamento do
                  begin
                    close;
                    sql.clear;
                    sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Plano from Lancamento_Banco LB');
                    sql.add('left join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
                    sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
                    sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
                    if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 0) then
                      sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Codigo_Plano = :Plano order by LB.N_Documento')
                    else if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 1) then
                      sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Codigo_Plano = :Plano order by LB.Data_Lancamento')
                    else if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 2) then
                      sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Codigo_Plano = :Plano order by LB.Descricao');

                    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                    if (FrmConsulta_Lancamento_Banco.RGStatus.ItemIndex = 0) then
                      Parameters.ParamByName('Status').Value:= 'LIBERADO'
                    else
                      Parameters.ParamByName('Status').Value:= 'BLOQUEADO';

                    Parameters.ParamByName('Plano').Value:= StrToInt(FrmConsulta_Lancamento_Banco.EdtCodigo_Plano.Text);
                    open;

                    if (FrmConsulta_Lancamento_Banco.qryconsulta_lancamento.IsEmpty = true) then
                      begin
                        Mensagem_Fim_Pesquisa;
                        abort;
                      end;
                  end;
              end;
            end
            else 
              if (FrmConsulta_Lancamento_Banco.RGConsulta_Por.ItemIndex = 3) then
              begin
                if (FrmConsulta_Lancamento_Banco.EdtCodigo_Plano.Text = '') then
                begin
                  Application.MessageBox('Por favor, informe um parametro a consultar', 'Atenção', MB_OK+MB_ICONHAND);
                  FrmConsulta_Lancamento_Banco.EdtCodigo_Plano.SetFocus;
                  abort
                end
                else
                  if (FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Lancamento_Banco.MEdtData_Final.Text = '  /  /    ') then
                  begin
                    Application.MessageBox('Por favor, informe uma data a consultar', 'Atenção', MB_OK+MB_ICONHAND);
                    FrmConsulta_Lancamento_Banco.MEdtData_Inicial.SetFocus;
                    abort
                  end
                  else
                  begin
                    with FrmConsulta_Lancamento_Banco.qryconsulta_lancamento do
                      begin
                        close;
                        sql.clear;
                        sql.add('select LB.*, CC.Conta, OB.Operacao, OB.Tipo, PF.Plano from Lancamento_Banco LB');
                        sql.add('left join Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo)');
                        sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
                        sql.add('left join Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
                        if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 0) then
                          sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Codigo_Plano = :Plano and LB.Data_Lancamento between :DI and :DF order by LB.N_Documento')
                        else if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 1) then
                          sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Codigo_Plano = :Plano and LB.Data_Lancamento between :DI and :DF order by LB.Data_Lancamento')
                        else if (FrmConsulta_Lancamento_Banco.RGOrdena_Por.ItemIndex = 2) then
                          sql.add('where LB.Codigo_Empresa = :Empresa and LB.Status = :Status and LB.Codigo_Plano = :Plano and LB.Data_Lancamento between :DI and :DF order by LB.Descricao');

                        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                        if (FrmConsulta_Lancamento_Banco.RGStatus.ItemIndex = 0) then
                          Parameters.ParamByName('Status').Value:= 'LIBERADO'
                        else
                          Parameters.ParamByName('Status').Value:= 'BLOQUEADO';

                        Parameters.ParamByName('Plano').Value:= StrToInt(FrmConsulta_Lancamento_Banco.EdtCodigo_Plano.Text);
                        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text);
                        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamento_Banco.MEdtData_Final.Text);
                        open;

                        if (FrmConsulta_Lancamento_Banco.qryconsulta_lancamento.IsEmpty = true) then
                          begin
                            Mensagem_Fim_Pesquisa;
                            abort;
                          end;
                      end;
                  end;
              end;}
end;

procedure TConsulta.Consulta_Lancamento_Caixa;
begin
  if (FrmConsulta_Lancamento_Caixa.MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamento_Caixa.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Lancamento_Caixa.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamento_Caixa.MEdtData_Final.SetFocus;
    abort;
  end;

  if (FrmConsulta_Lancamento_Caixa.EdtCodigo_Usuario.Text = '') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Lancamento_Caixa.EdtCodigo_Usuario.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamento_Caixa.qryconsulta_lancamento do
  begin
    close;
    sql.clear;
    sql.add('select FV.*, CU.Nome as Usuario from Fechamento_Venda FV');
    sql.add('left join Cadastro_Usuario CU on (FV.Codigo_Usuario = CU.Codigo)');

    sql.add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Usuario = :Usuario and FV.Data between :DI and :DF order by FV.Codigo_Registro');

    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('Usuario').Value:= StrToInt(FrmConsulta_Lancamento_Caixa.EdtCodigo_Usuario.Text);
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamento_Caixa.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamento_Caixa.MEdtData_Final.Text);
    open;

    if (FrmConsulta_Lancamento_Caixa.qryconsulta_lancamento.IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro(descricao: string);
begin
      with FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento do
        begin
          close;
          sql.clear;
          sql.add('select LF.*, Forn.Nome_Fantasia as Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano,');
          sql.add('Nome = case when (LF.Tipo = :Tipo) then');
          sql.add('(select Forn.Nome_Fantasia from Fornecedor Forn where LF.Codigo_Cli_For = Forn.Codigo)');
          sql.add('when (LF.Tipo = :Tipo2) then');
          sql.add('(select Cli.Nome_Nome_Fantasia from Cliente Cli where LF.Codigo_Cli_For = Cli.Codigo) end from Lancamento_Financeiro LF');
          //sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
          sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
          sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
          sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
          sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
          sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');



          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
               (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
            begin
              Mensagem_Falta_Dados;
              FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort;
            end
            else
            begin
              if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
              end
            end;
            open;
            if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
                abort;
              end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Mensagem_Falta_Dados;
              FrmConsulta_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort;
            end
            else
            begin
              if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
            end;
            open;
            if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
                abort;
              end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
                (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
            begin
              Mensagem_Falta_Dados;
              FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
              abort;
            end
            else
            begin
              if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
            end;
            open;
            if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
                abort;
              end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
                (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
            begin
              Mensagem_Falta_Dados;
              FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort;
            end
            else
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
                Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Tipo').value:= 'PAGAR';
                Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                  //Parameters.ParamByName('Status').Value:= 'PAGO';
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                begin
                  Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                  //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                end;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
              end
            end;
            open;
            if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                abort;
              end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
                (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
              begin
                Mensagem_Falta_Dados;
                FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                abort;
              end
              else
              begin
              if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end;
              end;
              open;
              if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
                  abort;
                end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
                (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
              begin
                Mensagem_Falta_Dados;
                FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                abort;
              end
              else
              begin
              if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end;
              end;
              open;
              if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
                  abort;
                end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
                (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
              begin
                Mensagem_Falta_Dados;
                FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                abort;
              end
              else
              begin
              if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end
                else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
                  Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
                  Parameters.ParamByName('Tipo').value:= 'PAGAR';
                  Parameters.ParamByName('Tipo2').value:= 'RECEBER';
                  Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
                  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                    //Parameters.ParamByName('Status').Value:= 'PAGO';
                  end
                  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
                  begin
                    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                    //Parameters.ParamByName('Status').Value:= 'PENDENTE';
                  end;
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
                end;
              end;
              open;
              if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
                begin
                  Mensagem_Fim_Pesquisa;
                  FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
                  abort;
                end;
          end;
        end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Sintetico;
begin
  with FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico do
    begin
      close;
      sql.clear;
      sql.add('select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Codigo_Empresa, LF.Tipo, LF.Codigo_Cli_For, ');
      sql.add('LF.Historico, LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor, PL.Valor_Pagar, PL.Valor_Pago, PL.Valor_Restante, PL.Status, datediff(day, getDate(), PL.Data_Vencimento) as Dias_Venc,');
      sql.add('Nome = case when (LF.Tipo = :Tipo) then');
      sql.add('(select Forn.Nome_Fantasia from Fornecedor Forn where LF.Codigo_Cli_For = Forn.Codigo)');
      sql.add('when (LF.Tipo = :Tipo2) then');
      sql.add('(select Cli.Nome_Nome_Fantasia from Cliente Cli where LF.Codigo_Cli_For = Cli.Codigo) end, ');
      sql.add('CP.Descricao as Cond_Pag, CP.Tipo_Pagamento, PF.Descricao as Plano_Financeiro, Dep.Descricao as Departamento');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      //sql.add('left join Parcelas_Lancamentos_Historico PLH on (PL.N_Documento = PLH.N_Documento)');
      sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.Add('left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)');
      sql.Add('left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)');
      sql.add('left join Condicao_Pagamento CP on (PL.Codigo_Forma_Pagamento_Parcela = CP.Codigo)');
      sql.add('left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');
      sql.add('left join Departamento Dep on (LF.Codigo_Departamento = Dep.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
          abort;
        end
        else
        begin

          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and (PL.Status = :Status1 or PL.Status = :Status2) and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and PL.Data_Vencimento between :DI and :DF and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and PL.Data_Pagamento between :DI and :DF and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) ');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;
          end
        end;
        Parameters.ParamByName('Tipo').value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').value:= 'RECEBER';

        //if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) or (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        //begin
          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PAGO';
            Parameters.ParamByName('Status2').Value:= 'PENDENTE';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PAGO';
            Parameters.ParamByName('Status2').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PENDENTE';
            Parameters.ParamByName('Status2').Value:= 'PENDENTE';
          end;
        //end;

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtConsulta.SetFocus;
          abort;
        end
        else
        begin
          sql.add('where LF.Codigo_Empresa = :Empresa and PL.N_Documento = :Documento and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
            Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
            Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
            Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
          end;
        end;
        Parameters.ParamByName('Tipo').value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').value:= 'RECEBER';

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Data_Lancamento between :DI and :DF and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and (PL.Status = :Status1 or PL.Status = :Status2) ');
            sql.add('and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text);

            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;

          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and LF.Codigo_Cli_For = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and PL.Data_Vencimento between :DI and :DF and');
            sql.add(' (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;

            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and LF.Codigo_Cli_For = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and PL.Data_Pagamento between :DI and :DF and');
            sql.add('(LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) ');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;

            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

          end
        end;

        Parameters.ParamByName('Tipo').value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').value:= 'RECEBER';
        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Status1').Value:= 'PAGO';
          Parameters.ParamByName('Status2').Value:= 'PENDENTE';
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Status1').Value:= 'PAGO';
          Parameters.ParamByName('Status2').Value:= 'PAGO';
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Status1').Value:= 'PENDENTE';
          Parameters.ParamByName('Status2').Value:= 'PENDENTE';
        end;

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and LF.Data_Lancamento between :DI and :DF  and (PL.Status = :Status1 or PL.Status = :Status2) and');
            sql.add(' (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;

            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and LF.Codigo_Plano = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and PL.Data_Vencimento between :DI and :DF and');
            sql.add(' (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;

            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and LF.Codigo_Plano = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and PL.Data_Pagamento between :DI and :DF and');
            sql.add(' (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) ');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;

            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            //Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            //Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

          end
        end;
        Parameters.ParamByName('Tipo').value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').value:= 'RECEBER';

        //if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) or (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        //begin
          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PAGO';
            Parameters.ParamByName('Status2').Value:= 'PENDENTE';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PAGO';
            Parameters.ParamByName('Status2').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PENDENTE';
            Parameters.ParamByName('Status2').Value:= 'PENDENTE';
          end;
        //end;

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and LF.Data_Lancamento between :DI and :DF and (PL.Status = :Status1 or PL.Status = :Status2) and');
            SQL.add(' (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and LF.Codigo_Departamento = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and PL.Data_Vencimento between :DI and :DF and');
            sql.add(' (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and (PL.Status = :Status1 or PL.Status = :Status2) and LF.Codigo_Departamento = :Codigo and (LF.Tipo = :Tipo_Lan1 or LF.Tipo = :Tipo_Lan2) and PL.Data_Pagamento between :DI and :DF and ');
            sql.add('(LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) ');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 2) then
            begin
              Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
              Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            //Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            //Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

          end
        end;
        Parameters.ParamByName('Tipo').value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').value:= 'RECEBER';

        //if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) or (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2)then
        //begin
          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PAGO';
            Parameters.ParamByName('Status2').Value:= 'PENDENTE';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PAGO';
            Parameters.ParamByName('Status2').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Status1').Value:= 'PENDENTE';
            Parameters.ParamByName('Status2').Value:= 'PENDENTE';
          end;
        //end;

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end;

    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Sintetico2;
begin
  if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) or
     (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5)then
  begin
    if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
      abort;
    end;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico2 do
    begin
      close;
      sql.clear;
      sql.add('select Y.Tipo_Pagamento,');
      sql.add('       Y.Nome,');
      sql.add('	   Y.Valor_Total,');
      sql.add('	   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('		case when (t.Tipo = :Tipo) then');
      sql.add('		(select Forn.Nome_Fantasia from Fornecedor Forn where t.Codigo_Cli_For = Forn.Codigo)');
      sql.add('		when (t.Tipo = :Tipo2) then');
      sql.add('		(select Cli.Nome_Nome_Fantasia from Cliente Cli where t.Codigo_Cli_For = Cli.Codigo) end as Nome,');

      sql.add('       sum(tip.Valor_Pagar) as Valor_Total,');

      sql.add('       case when GROUPING(CP.Tipo_Pagamento) = 0 then CP.Tipo_Pagamento');
      sql.add('			when GROUPING(CP.Tipo_Pagamento) = 1 then '+QuotedStr('TOTAL--->')+' end as Tipo_Pagamento,');

      sql.add('      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip');
      sql.add('      left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
      begin
        case (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex) of
          0: sql.add('where t.Codigo_Empresa = :Empresa1 and t.Data_Lancamento between :DI1 and :DF1 and t.Tipo = :Tipo_Lan1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
          1: sql.add('where t.Codigo_Empresa = :Empresa1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = '+QuotedStr('PENDENTE')+' and t.Tipo = :Tipo_Lan1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
          2: sql.add('where t.Codigo_Empresa = :Empresa1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = '+QuotedStr('PAGO')+' and t.Tipo = :Tipo_Lan1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
        end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        case (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex) of
          0: sql.add('where t.Codigo_Cli_For = :Codigo1 and t.Codigo_Empresa = :Empresa1 and t.Data_Lancamento between :DI1 and :DF1 and t.Tipo = :Tipo_Lan1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
          1: sql.add('where t.Codigo_Cli_For = :Codigo1 and t.Codigo_Empresa = :Empresa1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = '+QuotedStr('PENDENTE')+' and t.Tipo = :Tipo_Lan1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
          2: sql.add('where t.Codigo_Cli_For = :Codigo1 and t.Codigo_Empresa = :Empresa1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = '+QuotedStr('PAGO')+' and t.Tipo = :Tipo_Lan1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
        end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) then
      begin
        case (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex) of
          0: sql.add('where tip.Codigo_Forma_Pagamento_Parcela = :Codigo1 and t.Codigo_Empresa = :Empresa1 and t.Data_Lancamento between :DI1 and :DF1 and t.Tipo = :Tipo_Lan1 and tip.Status = :Status1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
          1: sql.add('where tip.Codigo_Forma_Pagamento_Parcela = :Codigo1 and t.Codigo_Empresa = :Empresa1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = '+QuotedStr('PENDENTE')+' and t.Tipo = :Tipo_Lan1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
          2: sql.add('where tip.Codigo_Forma_Pagamento_Parcela = :Codigo1 and t.Codigo_Empresa = :Empresa1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = '+QuotedStr('PAGO')+' and t.Tipo = :Tipo_Lan1 and (t.Conta_Fixa = :Conta1 or t.Conta_Fixa = :Conta2)) as Total_Geral');
        end;
      end;

      sql.add('        from Parcelas_Lancamentos tip');
      sql.add('left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');
      sql.add('left join Condicao_Pagamento CP on (t.Codigo_Forma_Pagamento = CP.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
      begin
        case (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex) of
          0: sql.add('where t.Codigo_Empresa = :Empresa2 and t.Data_Lancamento between :DI2 and :DF2 and t.Tipo = :Tipo_Lan2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
          1: sql.add('where t.Codigo_Empresa = :Empresa2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = '+QuotedStr('PENDENTE')+' and t.Tipo = :Tipo_Lan2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
          2: sql.add('where t.Codigo_Empresa = :Empresa2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = '+QuotedStr('PAGO')+' and t.Tipo = :Tipo_Lan2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
        end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        case (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex) of
          0: sql.add('where t.Codigo_Cli_For = :Codigo2 and t.Codigo_Empresa = :Empresa2 and t.Data_Lancamento between :DI2 and :DF2 and t.Tipo = :Tipo_Lan2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
          1: sql.add('where t.Codigo_Cli_For = :Codigo2 and t.Codigo_Empresa = :Empresa2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = '+QuotedStr('PENDENTE')+' and t.Tipo = :Tipo_Lan2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
          2: sql.add('where t.Codigo_Cli_For = :Codigo2 and t.Codigo_Empresa = :Empresa2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = '+QuotedStr('PAGO')+' and t.Tipo = :Tipo_Lan2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
        end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) then
      begin
        case (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex) of
          0: sql.add('where tip.Codigo_Forma_Pagamento_Parcela = :Codigo2 and t.Codigo_Empresa = :Empresa2 and t.Data_Lancamento between :DI2 and :DF2 and t.Tipo = :Tipo_Lan2 and tip.Status = :Status2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
          1: sql.add('where tip.Codigo_Forma_Pagamento_Parcela = :Codigo2 and t.Codigo_Empresa = :Empresa2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = '+QuotedStr('PENDENTE')+' and t.Tipo = :Tipo_Lan2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
          2: sql.add('where tip.Codigo_Forma_Pagamento_Parcela = :Codigo2 and t.Codigo_Empresa = :Empresa2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = '+QuotedStr('PAGO')+' and t.Tipo = :Tipo_Lan2 and (t.Conta_Fixa = :Conta3 or t.Conta_Fixa = :Conta4)');
        end;
      end;

      sql.add('group by t.Tipo, CP.Tipo_Pagamento, t.Codigo_Cli_For');
      sql.add('with rollup ) Y');

      Parameters.ParamByName('Tipo').value:= 'PAGAR';
      Parameters.ParamByName('Tipo2').value:= 'RECEBER';
      Parameters.ParamByName('Empresa1').value:= Codigo_Empresa;
      Parameters.ParamByName('Empresa2').value:= Codigo_Empresa;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Status1').Value:= 'PAGO';
          Parameters.ParamByName('Status2').Value:= 'PAGO';
        end
        else
        begin
          Parameters.ParamByName('Status1').Value:= 'PENDENTE';
          Parameters.ParamByName('Status2').Value:= 'PENDENTE';
        end;
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo_Lan1').Value:= 'PAGAR';
        Parameters.ParamByName('Tipo_Lan2').Value:= 'PAGAR';
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Tipo_Lan1').Value:= 'RECEBER';
        Parameters.ParamByName('Tipo_Lan2').Value:= 'RECEBER';
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) or
         (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5)then
      begin
        Parameters.ParamByName('Codigo1').Value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text);
        Parameters.ParamByName('Codigo2').Value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text);
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 1;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Conta1').Value:= 0;
        Parameters.ParamByName('Conta2').Value:= 0;
        Parameters.ParamByName('Conta3').Value:= 0;
        Parameters.ParamByName('Conta4').Value:= 0;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Conta1').Value:= 1;
        Parameters.ParamByName('Conta2').Value:= 1;
        Parameters.ParamByName('Conta3').Value:= 1;
        Parameters.ParamByName('Conta4').Value:= 1;
      end;

      open;
      if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico2.IsEmpty) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;

end;

procedure TConsulta.Consulta_Lucratividade_Grupo;
begin
    if (FrmConsulta_Lucratividade_Grupo.MEdtData_Final.Text = '  /  /    ') or (FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.SetFocus;
      abort;
    end;

    with FrmConsulta_Lucratividade_Grupo.qryconsulta_lucro do
    begin
      close;
      sql.clear;
      sql.add('select * from (');
      sql.add('select ');

      if (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex <> 0) then
        sql.add('H.Tipo, ');

      sql.add('H.Codigo_Grupo,');

      sql.add('	   H.Descricao_Grupo,');
      sql.add('	   H.Total_Vendido,');
      sql.add('	   H.Qtde,');
      sql.add('	   H.Custo_total,');
      sql.add('    (H.Total_vendido - H.Custo_total) as lucratividade,');
      sql.add('	   ((H.custo_total / H.totalgeral)*100) as percentual,');
      sql.add('    ((H.Total_vendido - H.Custo_total) / H.Qtde) as lucratividade_unitaria');
      sql.add('FROM(');
      sql.add('select ');

      if (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex <> 0) then
        sql.add('Y.Tipo, ');

      sql.add('Y.Codigo_Grupo,');
      sql.add('	   Y.Descricao_Grupo,');
      sql.add('	   sum(Y.Qtde) Qtde,');
      sql.add('	   sum(Y.Total_vendido) Total_vendido,');
      sql.add('	   sum(Y.Custo_total) Custo_total,');
      sql.add('	   (Y.totalgeral) totalgeral');
      sql.add('from(');
      sql.add('select');

      if (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex <> 0) then
        sql.add(' Ped.Tipo,');

      sql.add('Pro.Codigo_Venda AS CODIGO_VENDA,');
      sql.add('          Pro.Descricao AS DESCRICAO,');
      sql.add('          Pro.Codigo_Grupo as Codigo_Grupo,');
      sql.add('          Gru.Descricao as Descricao_Grupo,');
      sql.add('          sum(IP.Qtde) as Qtde,');
      sql.add('          sum(IP.Qtde * IP.Valor_Unitario) as Total_Vendido,');
      sql.add('          (sum(IP.Valor_Compra * IP.Qtde)) as Custo_Total,');

      sql.add('          (select sum(t.Qtde * t.Valor_Unitario) from Itens_Pedido t');
      sql.add('          left join Pedido Ped on (t.Codigo = Ped.Codigo)');
      sql.add('          left join Produto Pro on (Pro.Codigo = t.Codigo_Produto)');
      sql.add('          left join Grupo_Produto Gru on (Gru.Codigo = Pro.Codigo_Grupo)');

      case (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex) of
        0: sql.add('          where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status1 and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
        1: sql.add('          where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status1 and Ped.COO <> '+QuotedStr('')+' and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
        2: sql.add('          where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status1 and (Ped.Tipo = :Tipo1 or Ped.Tipo = :Tipo2) and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
      end;

      sql.add('from Itens_Pedido IP');
      sql.add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      sql.add('left join Produto Pro on (Pro.Codigo = IP.Codigo_Produto)');
      sql.add('left join Grupo_Produto Gru on (Gru.Codigo = Pro.Codigo_Grupo)');

      case (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex) of
        0: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');
        1: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.Status = :Status2 and Ped.COO <> '+QuotedStr('')+' and IP.Cancelado = '+QuotedStr('N')+'');
        2: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.Status = :Status2 and (Ped.Tipo = :Tipo3 or Ped.Tipo = :Tipo4) and IP.Cancelado = '+QuotedStr('N')+'');
      end;

      if (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex <> 0) then
        sql.add('group by Ped.Tipo, Pro.Codigo_Venda,Pro.Descricao,Pro.Codigo_Grupo, Gru.Descricao, IP.Valor_Compra) Y')
      else
        sql.add('group by Pro.Codigo_Venda,Pro.Descricao,Pro.Codigo_Grupo, Gru.Descricao, IP.Valor_Compra) Y');


      if (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex <> 0) then
        sql.add('group by Y.Tipo, Y.Codigo_grupo, Y.Descricao_Grupo, Y.totalgeral) H ) U')
      else
        sql.add('group by Y.Codigo_grupo, Y.Descricao_Grupo, Y.totalgeral) H ) U');

      if (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex = 1) then
      begin
        {Parameters.ParamByName('Tipo1').Value:= 'PRÉ-VENDA';
        Parameters.ParamByName('Tipo2').Value:= 'PDV';
        Parameters.ParamByName('Tipo3').Value:= 'PRÉ-VENDA';
        Parameters.ParamByName('Tipo4').Value:= 'PDV';}
      end
      else if (FrmConsulta_Lucratividade_Grupo.RGTipo.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'NFE';
        Parameters.ParamByName('Tipo2').Value:= 'NFE';
        Parameters.ParamByName('Tipo3').Value:= 'NFE';
        Parameters.ParamByName('Tipo4').Value:= 'NFE';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Final.Text);
      Parameters.ParamByName('DI3').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF3').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Final.Text);
      Parameters.ParamByName('DI4').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF4').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Final.Text);
      Parameters.ParamByName('Status1').Value:= 'PAGO';
      Parameters.ParamByName('Status2').Value:= 'PAGO';
      open;
    end;

    if (FrmConsulta_Lucratividade_Grupo.qryconsulta_lucro.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Lucratividade_Marca;
begin
    if (FrmConsulta_Lucratividade_Marca.MEdtData_Final.Text = '  /  /    ') or (FrmConsulta_Lucratividade_Marca.MEdtData_Inicial.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Lucratividade_Marca.MEdtData_Inicial.SetFocus;
      abort;
    end;

    with FrmConsulta_Lucratividade_Marca.qryconsulta_lucro do
    begin
      close;
      sql.clear;
      sql.add('select * from (');

      sql.add('select ');

      if (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex <> 0) then
        sql.add('H.Tipo, ');

      sql.add('H.Codigo_Marca,');
      sql.add('	   H.Descricao_Marca,');
      sql.add('	   H.Total_Vendido,');
      sql.add('    H.Qtde,');
      sql.add('	   H.Custo_total,');
      sql.add('    (H.Total_vendido - H.Custo_total) as lucratividade,');
      sql.add('	   ((H.custo_total / H.totalgeral)*100) as percentual,');
      sql.add('    ((H.Total_vendido - H.Custo_total) / H.Qtde) as lucratividade_unitaria, H.totalgeral');
      sql.add('FROM(');
      sql.add('select ');

      if (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex <> 0) then
        sql.add('Y.Tipo, ');

      sql.add('Y.Codigo_Marca,');
      sql.add('	   Y.Descricao_Marca,');
      sql.add('	   sum(Y.Qtde) Qtde,');
      sql.add('	   sum(Y.Total_vendido) Total_vendido,');
      sql.add('	   sum(Y.Custo_total) Custo_total,');
      sql.add('	   (Y.totalgeral) totalgeral');
      sql.add('from(');
      sql.add('select ');

      if (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex <> 0) then
        sql.add('Ped.Tipo, ');

      sql.add('Pro.Codigo_Venda AS CODIGO_VENDA,');
      sql.add('          Pro.Descricao AS DESCRICAO,');
      sql.add('          Pro.Codigo_Marca as Codigo_Marca,');
      sql.add('          Mar.Descricao as Descricao_Marca,');
      sql.add('          sum(IP.Qtde) as Qtde,');
      sql.add('          sum(IP.Qtde * IP.Valor_Unitario) as Total_Vendido,');
      sql.add('          (sum(IP.Valor_Compra * IP.Qtde)) as Custo_Total,');

      sql.add('          (select sum(t.Qtde * t.Valor_Unitario) from Itens_Pedido t');
      sql.add('          left join Pedido Ped on (t.Codigo = Ped.Codigo)');

      case (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex) of
        0: sql.add('          where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status1 and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
        1: sql.add('          where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status1 and Ped.COO <> '+QuotedStr('')+' and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
        2: sql.add('          where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status1 and (Ped.Tipo = :Tipo1 or Ped.Tipo = :Tipo2) and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
      end;

      sql.add('from Itens_Pedido IP');
      sql.add('left join Produto Pro on (Pro.Codigo = IP.Codigo_Produto)');
      sql.add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      sql.add('left join Marca Mar on (Mar.Codigo = Pro.Codigo_Marca)');

      case (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex) of
        0: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');
        1: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.Status = :Status2 and Ped.COO <> '+QuotedStr('')+' and IP.Cancelado = '+QuotedStr('N')+'');
        2: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.Status = :Status2 and (Ped.Tipo = :Tipo3 or Ped.Tipo = :Tipo4) and IP.Cancelado = '+QuotedStr('N')+'');
      end;

      if (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex <> 0) then
        sql.add('group by Ped.Tipo, Pro.Codigo_Venda,Pro.Descricao,Pro.Codigo_Marca, Mar.Descricao, IP.Valor_Compra) Y')
      else
        sql.add('group by Pro.Codigo_Venda,Pro.Descricao,Pro.Codigo_Marca, Mar.Descricao, IP.Valor_Compra) Y');

      if (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex <> 0) then
        sql.add('group by Y.Tipo, Y.Codigo_Marca, Y.Descricao_Marca, Y.totalgeral) H ) U')
      else
        sql.add('group by Y.Codigo_Marca, Y.Descricao_Marca, Y.totalgeral) H ) U');

      if (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex = 1) then
      begin
        {Parameters.ParamByName('Tipo1').Value:= 'PRÉ-VENDA';
        Parameters.ParamByName('Tipo2').Value:= 'PDV';
        Parameters.ParamByName('Tipo3').Value:= 'PRÉ-VENDA';
        Parameters.ParamByName('Tipo4').Value:= 'PDV';}
      end
      else if (FrmConsulta_Lucratividade_Marca.RGTipo.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'NFE';
        Parameters.ParamByName('Tipo2').Value:= 'NFE';
        Parameters.ParamByName('Tipo3').Value:= 'NFE';
        Parameters.ParamByName('Tipo4').Value:= 'NFE';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Final.Text);
      Parameters.ParamByName('DI3').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF3').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Final.Text);
      Parameters.ParamByName('DI4').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF4').Value:= StrToDateTime(FrmConsulta_Lucratividade_Marca.MEdtData_Final.Text);
      Parameters.ParamByName('Status1').Value:= 'PAGO';
      Parameters.ParamByName('Status2').Value:= 'PAGO';
      open;
    end;

    if (FrmConsulta_Lucratividade_Marca.qryconsulta_lucro.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Lucratividade_Produto;
begin
    if (FrmConsulta_Lucratividade_Produto.MEdtData_Final.Text = '  /  /    ') or (FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.SetFocus;
      abort;
    end;

    with FrmConsulta_Lucratividade_Produto.qryconsulta_lucro do
    begin
      close;
      sql.clear;
      sql.add('select ');

      if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex <> 0) then
        sql.add('Y.Tipo, ');

      sql.add('Y.Codigo_venda,');
      sql.add('	   Y.Descricao,');
      sql.add('	   Y.Qtde,');
      sql.add('	   Y.Total_vendido,');
      sql.add('	   Y.Custo_total,');
      sql.add('    (Y.Total_vendido - Y.Custo_total) as lucratividade,');
      sql.add('	   ((Y.custo_total / Y.totalgeral)*100) as percentual,');
      sql.add('    ((Y.Total_vendido - Y.Custo_total) / Y.Qtde) as lucratividade_unitaria from');

      sql.add('    (select ');

      if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex <> 0) then
        sql.add('    Ped.Tipo, ');

      sql.add('    Pro.Codigo_Venda AS CODIGO_VENDA,');
      sql.add('    Pro.Descricao AS DESCRICAO,');
      sql.add('    sum(IP.Qtde) as Qtde,');
      sql.add('    sum(IP.Qtde * IP.Valor_Unitario) as Total_Vendido,');
      sql.add('    (sum(IP.Valor_Compra * IP.Qtde)) as Custo_Total,');

      sql.add('    (select sum(t.Qtde * t.Valor_Unitario) from Itens_Pedido t');
      sql.add('    left join Pedido Ped on (t.Codigo = Ped.Codigo)');

      case (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex) of
        0:  sql.add('    where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status1 and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
        1:  sql.add('    where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.COO <> '+QuotedStr('')+' and Ped.Status = :Status1 and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
        2:  sql.add('    where (Ped.Data_Venda between :DI1 and :DF1 or Ped.Data_Emissao_NFe between :DI2 and :DF2) and (Ped.Tipo = :Tipo1 or Ped.Tipo = :Tipo2) and Ped.Status = :Status1 and t.Cancelado = '+QuotedStr('N')+') as totalgeral');
      end;

      sql.add('from Itens_Pedido IP');
      sql.add('left join Produto Pro on (Pro.Codigo = IP.Codigo_Produto)');
      sql.add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');

      case (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex) of
        0: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');
        1: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and Ped.COO <> '+QuotedStr('')+' and Ped.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');
        2: sql.add('where (Ped.Data_Venda between :DI3 and :DF3 or Ped.Data_Emissao_NFe between :DI4 and :DF4) and (Ped.Tipo = :Tipo3 or Ped.Tipo = :Tipo4) and Ped.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');
      end;

      if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex <> 0) then
        sql.add('group by Ped.Tipo, Pro.Codigo_Venda, Pro.Descricao, IP.Valor_Compra) Y')
      else
        sql.add('group by Pro.Codigo_Venda, Pro.Descricao) Y');

      if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex = 1) then
      begin
        {Parameters.ParamByName('Tipo1').Value:= 'PRÉ-VENDA';
        Parameters.ParamByName('Tipo2').Value:= 'PDV';
        Parameters.ParamByName('Tipo3').Value:= 'PRÉ-VENDA';
        Parameters.ParamByName('Tipo4').Value:= 'PDV';}
      end
      else if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'NFE';
        Parameters.ParamByName('Tipo2').Value:= 'NFE';
        Parameters.ParamByName('Tipo3').Value:= 'NFE';
        Parameters.ParamByName('Tipo4').Value:= 'NFE';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Final.Text);
      Parameters.ParamByName('DI3').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF3').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Final.Text);
      Parameters.ParamByName('DI4').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF4').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Final.Text);

      Parameters.ParamByName('Status1').Value:= 'PAGO';
      Parameters.ParamByName('Status2').Value:= 'PAGO';
      open;
    end;

    if (FrmConsulta_Lucratividade_Produto.qryconsulta_lucro.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Movimento_Saida();
begin
  with FrmMovimentacao_Saida.qryconsulta do
    begin
      close;
      sql.clear;
      sql.add('select VE.*, Fun.Nome from Venda_ECF VE');
      sql.add('left join Funcionario Fun on (VE.Codigo_Operador = Fun.Codigo)');
      sql.add('where VE.Data between :Di and :DF');
      Parameters.ParamByName('DI').Value:= FrmMovimentacao_Saida.MEdtData_Inicial.Text;
      Parameters.ParamByName('DF').Value:= FrmMovimentacao_Saida.MEdtData_Final.Text;
      open;

      if (FrmMovimentacao_Saida.qryconsulta.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Ocorrencia;
begin
  if (FrmConsulta_Ocorrencia.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Ocorrencia.MEdtData_Final.Text = '  /  /    ') then
  begin
    FrmConsulta_Ocorrencia.MEdtData_Inicial.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_Ocorrencia.RGConsulta_Por.ItemIndex = 1) or (FrmConsulta_Ocorrencia.RGConsulta_Por.ItemIndex = 2) then
  begin
    if (FrmConsulta_Ocorrencia.EdtCodigo.Text = '') then
    begin
      FrmConsulta_Ocorrencia.EdtCodigo.SetFocus;
      Mensagem_Falta_Dados;
      abort;
    end;
  end;

  with FrmConsulta_Ocorrencia.qryconsulta_ocorrencia, sql do
  begin
    close;
    clear;
    add('select F.Nome, TOO.Descricao as Ocorrencia, O.* from Ocorrencia O');
    add('left join Funcionario F on (O.Codigo_Funcionario = F.Codigo)');
    add('left join Tipo_Ocorrencia TOO on (O.Codigo_Tipo_Ocorrencia = TOO.Codigo)');

    case (FrmConsulta_Ocorrencia.RGConsulta_Por.ItemIndex) of
      0: Add('where O.Data_Ocorrencia between :DI and :DF');
      1: Add('where O.Data_Ocorrencia between :DI and :DF and O.Codigo_Funcionario = :Funcionario');
      2: Add('where O.Data_Ocorrencia between :DI and :DF and O.Codigo_Tipo_Ocorrencia = :Funcionario');
    end;

    case (FrmConsulta_Ocorrencia.RGOrdena_Por.ItemIndex) of
      0: Add('order by F.Nome');
      1: Add('order by TOO.Descricao');
    end;

    if (FrmConsulta_Ocorrencia.RGConsulta_Por.ItemIndex = 1) or (FrmConsulta_Ocorrencia.RGConsulta_Por.ItemIndex = 2) then
    begin
      Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Ocorrencia.EdtCodigo.Text);
    end;

    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Ocorrencia.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Ocorrencia.MEdtData_Final.Text);
    open;
    if (IsEmpty) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TConsulta.Consulta_Ocorrencia_Cobranca;
begin
  with FrmConsulta_Lancamentos_Financeiros.qryconsulta_ocorrencia, sql do
  begin
    close;
    Clear;
    Add('select * from Lancamento_Financeiro_Ocorrencia_Cobranca order by Codigo');
    open;
  end;
end;

procedure TConsulta.Consulta_OS;
begin
  if (FrmConsulta_OS.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_OS.MEdtData_Final.Text = '  /  /    ') then
  begin
    FrmConsulta_OS.MEdtData_Inicial.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_OS.CmbStatus.KeyValue = NULL) then
  begin
    FrmConsulta_OS.CmbStatus.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
  begin
    if (FrmConsulta_OS.EdtCodigo_Cliente.Text = '') then
    begin
      FrmConsulta_OS.EdtCodigo_Cliente.SetFocus;
      Mensagem_Falta_Dados;
      abort;
    end;
  end
  else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
  begin
    if (FrmConsulta_OS.EdtDAV_OS.Text = '') then
    begin
      FrmConsulta_OS.EdtDAV_OS.SetFocus;
      Mensagem_Falta_Dados;
      abort;
    end;
  end;

  if (FrmConsulta_OS.RGTipo.ItemIndex = 0) then
  begin
    with FrmConsulta_OS.qryconsulta_os, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.Data_Venda, P.Data_Vencimento, P.Qtde_Itens, P.Qtde_Servicos,');
      add('P.Total_Produtos, P.Total_Servicos, P.Total_Pedido, P.Data_Previsao_Entrega, P.Data_Entrega,');
      add('P.Hora_Venda, P.Kilometragem, CP.Descricao as Cond_Pag, C.Nome_Nome_Fantasia as Cliente, (V.Veiculo + ' + QuotedStr(' - ') +' + V.Placa) as Veiculo, Fun.Nome as Funcionario from Pedido P');
      add('left join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      add('left join Veiculo V on (V.Codigo = P.Codigo_Veiculo)');
      add('left join Funcionario Fun on (P.Codigo_Funcionario = Fun.Codigo)');
      add('left join Condicao_Pagamento CP on (P.Codigo_Forma_Pag = CP.Codigo)');

      case (FrmConsulta_OS.RGConsulta_Por.ItemIndex) of
        0: Add('where P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        1: Add('where P.N_Pedido = :Pedido and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        2: Add('where P.Codigo_Cliente = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        3: Add('where P.Codigo_Funcionario = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
      end;

      case (FrmConsulta_OS.RGData.ItemIndex) of
        0: Add('and Data_Venda between :DI and :DF');
        1: Add('and Data_Previsao_Entrega between :DI and :DF');
        2: Add('and Data_Entrega between :DI and :DF');
      end;

      case (FrmConsulta_OS.RGOrdena_Por.ItemIndex) of
        0: Add('order by Data_Venda');
        1: Add('order by Data_Previsao_Entrega');
        2: Add('order by Data_Entrega');
        3: Add('order by C.Nome_Nome_Fantasia');
      end;

      if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
      begin
        Parameters.ParamByName('Cliente').Value:= StrToInt(FrmConsulta_OS.EdtCodigo_Cliente.Text);
      end
      else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_OS.EdtDAV_OS.Text;
      end;

      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      //Parameters.ParamByName('Tipo').Value:= 'DAV';
      Parameters.ParamByName('Status_OS').Value:= FrmConsulta_OS.CmbStatus.KeyValue;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Final.Text);

      open;

      if (IsEmpty) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;
  end
  else if (FrmConsulta_OS.RGTipo.ItemIndex = 1) then
  begin
    with FrmConsulta_OS.qrysintetico_os, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.Data_Venda, P.Total_Pedido, P.Total_Produtos, P.Total_Servicos,');
      add('C.Nome_Nome_Fantasia as Cliente, (V.Veiculo + ' + QuotedStr(' - ') +' + V.Placa) as Veiculo, Fun.Nome as Funcionario from Pedido P');
      add('left join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      add('left join Veiculo V on (V.Codigo = P.Codigo_Veiculo)');
      add('left join Funcionario Fun on (P.Codigo_Funcionario = Fun.Codigo)');

      case (FrmConsulta_OS.RGConsulta_Por.ItemIndex) of
        0: Add('where P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        1: Add('where P.N_Pedido = :Pedido and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        2: Add('where P.Codigo_Cliente = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        3: Add('where P.Codigo_Funcionario = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
      end;

      case (FrmConsulta_OS.RGData.ItemIndex) of
        0: Add('and Data_Venda between :DI and :DF');
        1: Add('and Data_Previsao_Entrega between :DI and :DF');
        2: Add('and Data_Entrega between :DI and :DF');
      end;

      case (FrmConsulta_OS.RGOrdena_Por.ItemIndex) of
        0: Add('order by Data_Venda');
        1: Add('order by Data_Previsao_Entrega');
        2: Add('order by Data_Entrega');
        3: Add('order by C.Nome_Nome_Fantasia');
      end;

      if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
      begin
        Parameters.ParamByName('Cliente').Value:= StrToInt(FrmConsulta_OS.EdtCodigo_Cliente.Text);
      end
      else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_OS.EdtDAV_OS.Text;
      end;

      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      //Parameters.ParamByName('Tipo').Value:= 'DAV';
      Parameters.ParamByName('Status_OS').Value:= FrmConsulta_OS.CmbStatus.KeyValue;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Final.Text);

      open;

      if (IsEmpty) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;
  end
  else if (FrmConsulta_OS.RGTipo.ItemIndex = 2) then
  begin
    with FrmConsulta_OS.qrycomissao_os, sql do
    begin
      close;
      clear;
      add('select IOS.Descricao_Servico, IOS.Qtde, IOS.Valor_Unitario, IOS.Desconto, IOS.Sub_Total,');
      add('IOS.Comissao, P.N_Pedido, F.Nome as Funcionario, C.Nome_Nome_Fantasia from Itens_OS IOS');
      add('left join Pedido P on (IOS.Codigo = P.Codigo)');
      add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
      add('left join Funcionario F on (IOS.Codigo_Mecanico = F.Codigo)');

      case (FrmConsulta_OS.RGConsulta_Por.ItemIndex) of
        0: Add('where P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        1: Add('where P.N_Pedido = :Pedido and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        2: Add('where P.Codigo_Cliente = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
        3: Add('where IOS.Codigo_Mecanico = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
      end;

      case (FrmConsulta_OS.RGData.ItemIndex) of
        0: Add('and Data_Venda between :DI and :DF');
        1: Add('and Data_Previsao_Entrega between :DI and :DF');
        2: Add('and Data_Entrega between :DI and :DF');
      end;

      case (FrmConsulta_OS.RGOrdena_Por.ItemIndex) of
        0: Add('order by Data_Venda');
        1: Add('order by Data_Previsao_Entrega');
        2: Add('order by Data_Entrega');
        3: Add('order by F.Nome, IOS.Descricao_Servico');
      end;

      if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
      begin
        Parameters.ParamByName('Cliente').Value:= StrToInt(FrmConsulta_OS.EdtCodigo_Cliente.Text);
      end
      else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_OS.EdtDAV_OS.Text;
      end;

      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      //Parameters.ParamByName('Tipo').Value:= 'DAV';
      Parameters.ParamByName('Status_OS').Value:= FrmConsulta_OS.CmbStatus.KeyValue;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Final.Text);

      open;

      if (IsEmpty) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;
  end;
end;

procedure TConsulta.Consulta_OS_Sintetico;
begin

end;

procedure TConsulta.Consulta_Parcelas_Lancamento;
begin
    if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = false) then
    begin
      with FrmConsulta_Lancamentos_Financeiros.qryconsulta_parcelas do
      begin
        close;
        sql.clear;
        sql.add('select PL.*, MC.Dinheiro, MC.Cheque_Vista, MC.Cheque_Prazo, MC.Cartao, MC.Juros, MC.Desconto from Parcelas_Lancamentos PL');
        sql.add('left join Movimento_Caixa MC on (PL.N_Documento = MC.N_Documento)');
        sql.add('where PL.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamentoCodigo.AsInteger;
        open;
      end;
    end;
end;

procedure TConsulta.Consulta_Posicao_Estoque;
begin
  if (FrmConsulta_Posicao_Estoque.MEdtMes.Text = '  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Posicao_Estoque.MEdtMes.Setfocus;
    abort;
  end;

  with FrmConsulta_Posicao_Estoque.qryconsulta_posicao do
    begin
      close;
      sql.clear;
      sql.add('select P.Codigo_Venda, P.Descricao, UM.Sigla, FE.Codigo_Empresa, FE.Mes, FE.Ano, FE.Mes +''/''+ FE.Ano, FE.Codigo_Produto, Fe.Quantidade,');
      sql.add('FE.Valor_Compra, FE.Sub_Total from Fechamento_Estoque FE');
      sql.add('inner join Produto P on (FE.Codigo_Produto = P.Codigo)');
      sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

      if (FrmConsulta_Posicao_Estoque.RGOrdena_Por.ItemIndex = 0) then
      begin
        sql.add('where FE.Codigo_Empresa = :Empresa and FE.Mes = :Mes and FE.Ano = :Ano');
        sql.add('order by P.Codigo_Venda');
      end
      else if (FrmConsulta_Posicao_Estoque.RGOrdena_Por.ItemIndex = 1) then
      begin
        sql.add('where FE.Codigo_Empresa = :Empresa and FE.Mes = :Mes and FE.Ano = :Ano');
        sql.add('order by P.Descricao');
      end
      else if (FrmConsulta_Posicao_Estoque.RGOrdena_Por.ItemIndex = 2) then
      begin
        sql.add('where FE.Codigo_Empresa = :Empresa and FE.Mes = :Mes and FE.Ano = :Ano');
        sql.add('order by FE.MES, FE.Ano');
      end;

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Mes').Value:= FrmConsulta_Posicao_Estoque.mes;
      Parameters.ParamByName('Ano').Value:= FrmConsulta_Posicao_Estoque.ano;
      open;

      if (FrmConsulta_Posicao_Estoque.qryconsulta_posicao.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Preco_Produto;
begin
  if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Preco_Produto.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Preco_Produto.MEdtData_Inicial.SetFocus;
        abort;
      end;

      with FrmConsulta_Preco_Produto.qryconsulta_preco do
        begin
          close;
          sql.clear;
          sql.add('select ITP.*, TP.Descricao, TP.Data_Cadastro, TP.Data_Validade, P.Codigo_Venda, P.Descricao from Itens_Tabela_Preco ITP');
          sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
          sql.add('left join Produto P on (ITP.Codigo_Produto = P.Codigo)');

          if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 0) then
            sql.Add('where TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by P.Descricao, TP.Descricao')
          else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 1) then
            sql.Add('where TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by P.Descricao, TP.Descricao')

          else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 0) then
            sql.Add('where TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by TP.Descricao, TP.Descricao')
          else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 1) then
            sql.Add('where TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by TP.Descricao, TP.Descricao');

          Parameters.ParamByName('Data').Value:= date;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Preco_Produto.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Preco_Produto.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Preco_Produto.qryconsulta_preco.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Preco_Produto.EdtCodigo_Produto.Text = '') or (FrmConsulta_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Preco_Produto.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Preco_Produto.MEdtData_Inicial.SetFocus;
        abort;
      end
      else
      begin
        with FrmConsulta_Preco_Produto.qryconsulta_preco do
          begin
            close;
            sql.clear;
            sql.add('select ITP.*, TP.Descricao, TP.Data_Cadastro, TP.Data_Validade, P.Codigo_Venda, P.Descricao from Itens_Tabela_Preco ITP');
            sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
            sql.add('left join Produto P on (ITP.Codigo_Produto = P.Codigo)');

            if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 0) then
              sql.Add('where ITP.Codigo_Produto = :Produto and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by P.Descricao, TP.Descricao')
            else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 1) then
              sql.Add('where ITP.Codigo_Produto = :Produto and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by P.Descricao, TP.Descricao')

            else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 0) then
              sql.Add('where ITP.Codigo_Produto = :Produto and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by TP.Descricao, TP.Descricao')
            else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 1) then
              sql.Add('where ITP.Codigo_Produto = :Produto and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by TP.Descricao, TP.Descricao');

            Parameters.ParamByName('Produto').Value:= StrToInt(FrmConsulta_Preco_Produto.EdtCodigo_Produto.Text);
            Parameters.ParamByName('Data').Value:= date;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Preco_Produto.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Preco_Produto.MEdtData_Final.Text);
            open;

            if (FrmConsulta_Preco_Produto.qryconsulta_preco.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end;
    end
    else if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Preco_Produto.EdtCodigo_Tabela1.Text = '') or (FrmConsulta_Preco_Produto.EdtCodigo_Tabela2.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Preco_Produto.EdtCodigo_Tabela1.SetFocus;
        abort;
      end
      else
      begin
        with FrmConsulta_Preco_Produto.qryconsulta_preco do
          begin
            close;
            sql.clear;
            sql.add('select ITP.*, TP.Descricao, TP.Data_Cadastro, TP.Data_Validade, P.Codigo_Venda, P.Descricao from Itens_Tabela_Preco ITP');
            sql.add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
            sql.add('left join Produto P on (ITP.Codigo_Produto = P.Codigo)');

            if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 0) then
              sql.Add('where ITP.Codigo = :Codigo1 or ITP.Codigo = :Codigo2 and TP.Data_Validade >= :Data order by P.Descricao, TP.Descricao')
            else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 1) then
              sql.Add('where ITP.Codigo = :Codigo1 or ITP.Codigo = :Codigo2 and TP.Data_Validade <= :Data order by P.Descricao, TP.Descricao')

            else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 0) then
              sql.Add('where ITP.Codigo = :Codigo1 or ITP.Codigo = :Codigo2 and TP.Data_Validade >= :Data order by TP.Descricao, TP.Descricao')
            else if (FrmConsulta_Preco_Produto.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 1) then
              sql.Add('where ITP.Codigo = :Codigo1 or ITP.Codigo = :Codigo2 and TP.Data_Validade <= :Data order by TP.Descricao, TP.Descricao');

            Parameters.ParamByName('Codigo1').Value:= StrToInt(FrmConsulta_Preco_Produto.EdtCodigo_Tabela1.Text);
            Parameters.ParamByName('Codigo2').Value:= StrToInt(FrmConsulta_Preco_Produto.EdtCodigo_Tabela2.Text);
            Parameters.ParamByName('Data').Value:= date;
            open;

            if (FrmConsulta_Preco_Produto.qryconsulta_preco.IsEmpty = true) then
              begin
                Mensagem_Fim_Pesquisa;
                abort;
              end;
          end;
      end;
    end;
end;

procedure TConsulta.Consulta_Produto_Cadastrado;
begin
  if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmConsulta_Produto_Cadastrado.qryconsulta, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, P.Data_Fabricacao, P.Data_Validade, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Prazo,');
      add('GP.Descricao as Grupo_Produto, M.Descricao as Marca,');
      add('LP.Local, LP.Detalhe, F.Nome_Fantasia from Produto P');
      add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
      add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');
      add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');

      case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
        0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Descricao');
        1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by GP.Descricao');
        2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by M.Descricao');
        3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by LP.Local');
        4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by F.Nome_Fantasia');
        5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Data_Validade');
      end;

      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_ativo;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;

      case FrmConsulta_Produto_Cadastrado.RGStatus.ItemIndex of
        0: Parameters.ParamByName('Status').Value:= 'ATIVO';
        1: Parameters.ParamByName('Status').Value:= 'INATIVO';
      end;

      open;
      if (FrmConsulta_Produto_Cadastrado.qryconsulta.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;
  end
  else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 1) or
          (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 2) or
          (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 3) or
          (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 4) then
  begin
    if (FrmConsulta_Produto_Cadastrado.EdtCodigo.Text = '') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Produto_Cadastrado.EdtCodigo.SetFocus;
      abort;
    end;

    with FrmConsulta_Produto_Cadastrado.qryconsulta, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, P.Data_Fabricacao, P.Data_Validade, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Prazo,');
      add('GP.Descricao as Grupo_Produto, M.Descricao as Marca,');
      add('LP.Local, LP.Detalhe, F.Nome_Fantasia from Produto P');
      add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
      add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');
      add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');

      if FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 1 then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by P.Data_Validade');
        end;
      end
      else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 2) then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by P.Data_Validade');
        end;
      end
      else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 3) then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by P.Data_Validade');
        end;
      end
      else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 4) then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by P.Data_Validade');
        end;
      end;

      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_ativo;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;

      case FrmConsulta_Produto_Cadastrado.RGStatus.ItemIndex of
        0: Parameters.ParamByName('Status').Value:= 'ATIVO';
        1: Parameters.ParamByName('Status').Value:= 'INATIVO';
      end;

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Produto_Cadastrado.EdtCodigo.Text);
      open;
      if (FrmConsulta_Produto_Cadastrado.qryconsulta.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;
  end
  else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 5) then
  begin
    if (FrmConsulta_Produto_Cadastrado.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Produto_Cadastrado.MEdtData_Final.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Produto_Cadastrado.MEdtData_Inicial.SetFocus;
      abort;
    end;

    with FrmConsulta_Produto_Cadastrado.qryconsulta, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, P.Data_Fabricacao, P.Data_Validade, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Prazo,');
      add('GP.Descricao as Grupo_Produto, M.Descricao as Marca,');
      add('LP.Local, LP.Detalhe, F.Nome_Fantasia from Produto P');
      add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
      add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');
      add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');

      add('');

      case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
        0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by P.Descricao');
        1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by GP.Descricao');
        2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by M.Descricao');
        3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by LP.Local');
        4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by F.Nome_Fantasia');
        5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by P.Data_Validade');
      end;

      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_ativo;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;

      case FrmConsulta_Produto_Cadastrado.RGStatus.ItemIndex of
        0: Parameters.ParamByName('Status').Value:= 'ATIVO';
        1: Parameters.ParamByName('Status').Value:= 'INATIVO';
      end;

      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Produto_Cadastrado.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Produto_Cadastrado.MEdtData_Final.Text);
      open;
      if (FrmConsulta_Produto_Cadastrado.qryconsulta.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;
  end;
end;

procedure TConsulta.Consulta_Reposicao_Estoque;
begin
  with FrmConsulta_Reposicao_Estoque.qryconsulta_reposicao, sql do
    begin
      close;
      sql.clear;
      sql.add('select P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
      sql.add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao as Grupo, M.Descricao as Marca, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo from Produto P');
      sql.add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      sql.add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      sql.add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
      sql.add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');

      if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 0) then
      begin
        if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end; }

        end
        else
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Estoque <= P.Estoque_Minimo');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end;}
        end;

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('Tipo').Value:= 0;
        Parameters.ParamByName('CodigoTabela').Value:= codigo_tabela_preco_padrao;
        open;

        if (FrmConsulta_Reposicao_Estoque.qryconsulta_reposicao.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end
      else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 1) then
      begin
        if (FrmConsulta_Reposicao_Estoque.EdtCodigo.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Reposicao_Estoque.EdtCodigo.SetFocus;
          abort;
        end;

        if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Grupo = :Codigo');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end;}
        end
        else
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Grupo = :Codigo and P.Estoque <= P.Estoque_Minimo');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end;}
        end;

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('Tipo').Value:= 0;
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Reposicao_Estoque.EdtCodigo.Text);
        Parameters.ParamByName('CodigoTabela').Value:= codigo_tabela_preco_padrao;
        open;

        if (FrmConsulta_Reposicao_Estoque.qryconsulta_reposicao.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end
      else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 2) then
      begin
        if (FrmConsulta_Reposicao_Estoque.EdtCodigo.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Reposicao_Estoque.EdtCodigo.SetFocus;
          abort;
        end;

        if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Marca = :Codigo');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end;}
        end
        else
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Marca = :Codigo and P.Estoque <= P.Estoque_Minimo ');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end;}
        end;

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('Tipo').Value:= 0;
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Reposicao_Estoque.EdtCodigo.Text);
        Parameters.ParamByName('CodigoTabela').Value:= codigo_tabela_preco_padrao;
        open;

        if (FrmConsulta_Reposicao_Estoque.qryconsulta_reposicao.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end
      else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 3) then
      begin
        if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Em_Estoque_Minimo = :Codigo');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end;}
        end
        else
        begin
          sql.add('where P.Data_Validade > '+QuotedStr('1800-01-01')+' and ITP.Codigo = :CodigoTabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Em_Estoque_Minimo = :Codigo and P.Estoque <= P.Estoque_Minimo ');
          sql.Add('group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
          sql.Add('P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Descricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo');
          {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
            0: sql.add('order by P.Descricao');
            1: sql.add('order by GP.Descricao, P.Descricao');
            2: sql.add('order by M.Descricao, P.Descricao');
          end; }
        end;

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('Tipo').Value:= 0;
        Parameters.ParamByName('Codigo').Value:= 'BLOQUEAR VENDA';
        Parameters.ParamByName('CodigoTabela').Value:= codigo_tabela_preco_padrao;
        open;

        if (FrmConsulta_Reposicao_Estoque.qryconsulta_reposicao.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end;
    end;
end;

procedure TConsulta.Consulta_Retorno_Cotacao;
begin
  if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :Cotacao order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :Cotacao order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :Cotacao order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Cotacao').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Cotacao between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Cotacao between :DI and :DF order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Cotacao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Retorno between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Retorno between :DI and :DF order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Retorno between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo and RC.Data_Cotacao between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo and RC.Data_Cotacao between :DI and :DF order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo and RC.Data_Cotacao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 6) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo and RC.Data_Retorno between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo and RC.Data_Retorno between :DI and :DF order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Funcionario = :Codigo and RC.Data_Retorno between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 7) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Cotacao between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Cotacao between :DI and :DF order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Cotacao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 8) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome_Fantasia, CP.Descricao as Cond_Pag, F.Nome from Retorno_Cotacao_Preco RC');
          sql.add('inner join Fornecedor Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('inner join Funcionario F on (RC.Codigo_Funcionario = F.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Retorno between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Retorno between :DI and :DF order by F.Nome')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Retorno between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Saldo(descricao: string);
begin
  if (FrmConsulta_Saldo_Bancario.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConsulta_Saldo_Bancario.qryconsulta_saldo do
        begin
          close;
          sql.clear;
          sql.add('select CC.*, B.Nome from Conta_Corrente CC');
          sql.add('inner join Banco B on (CC.Codigo_Banco = B.Codigo)');
          sql.Add('where CC.Codigo_Empresa = :Empresa');
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          open;

          if (FrmConsulta_Saldo_Bancario.qryconsulta_saldo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmConsulta_Saldo_Bancario.RGConsulta_Por.ItemIndex = 1) then
        begin
          if (FrmConsulta_Saldo_Bancario.EdtCodigo_Conta.Text = '') then
          begin
            Mensagem_Falta_Dados;
            FrmConsulta_Saldo_Bancario.EdtCodigo_Conta.SetFocus;
            abort
          end
          else
          begin
            with FrmConsulta_Saldo_Bancario.qryconsulta_saldo do
              begin
                close;
                sql.clear;
                sql.add('select CC.*, B.Nome from Conta_Corrente CC');
                sql.add('inner join Banco B on (CC.Codigo_Banco = B.Codigo)');
                sql.add('where CC.Codigo_Empresa = :Empresa and CC.Codigo = :Conta');
                Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Conta').Value:= FrmConsulta_Saldo_Bancario.EdtCodigo_Conta.Text;
                open;

                if (FrmConsulta_Saldo_Bancario.qryconsulta_saldo.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
              end;
          end;
        end
end;

procedure TConsulta.Consulta_Saldo_Estoque;
begin
  if (FrmConsulta_Saldo_Estoque.MEdtData_Inicial.Text = '  /  /    ') or
      (FrmConsulta_Saldo_Estoque.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Saldo_Estoque.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Saldo_Estoque.RGNatureza.ItemIndex = 0) then
    begin
      with FrmConsulta_Saldo_Estoque.qryconsulta_saldo do
        begin
          close;
          sql.clear;
          sql.add('select ME.* from Movimentacao_Estoque ME');
          sql.Add('where ME.Codigo_Empresa = :Empresa and ME.Data between :DI and :DF');
          sql.Add('order by ME.Descricao');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Saldo_Estoque.qryconsulta_saldo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    begin
      with FrmConsulta_Saldo_Estoque.qryconsulta_saldo do
        begin
          close;
          sql.clear;
          sql.add('select ME.* from Movimentacao_Estoque ME');
          sql.Add('where ME.Codigo_Empresa = :Empresa and ME.Data between :DI and :DF and ME.Natureza = :Natureza');
          sql.Add('order by ME.Descricao');

          if (FrmConsulta_Saldo_Estoque.RGNatureza.ItemIndex = 1) then
            Parameters.ParamByName('Natureza').Value:= 'ENTRADA'
          else if (FrmConsulta_Saldo_Estoque.RGNatureza.ItemIndex = 2) then
            Parameters.ParamByName('Natureza').Value:= 'SAÍDA';

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Saldo_Estoque.qryconsulta_saldo.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Saldo_Estoque_Geral;
begin
  with FrmConsulta_Saldo_Estoque.qryconsulta_saldo_geral do
    begin
      close;
      sql.clear;
      sql.add('select UM.Sigla, sum(Estoque) as Est, sum(Valor_Compra) as Val_Compra,');
      sql.add('(sum(Estoque) * sum(Valor_Compra)) as Total from Produto P');
      sql.add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      sql.add('group by UM.Sigla');
      open;

      if (FrmConsulta_Saldo_Estoque.qryconsulta_saldo_geral.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Saldo_Estoque_Geral2;
begin
  with FrmConsulta_Saldo_Estoque.qryconsulta_saldo_geral2 do
    begin
      close;
      sql.clear;
      sql.add('select sum(Estoque) as Estoque, sum(Estoque * Valor_Compra) as Total from Produto P');
      open;

      if (FrmConsulta_Saldo_Estoque.qryconsulta_saldo_geral2.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Tabela_Preco;
begin
  if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConsulta_Tabela_Preco.qryconsulta_tabela do
        begin
          close;
          sql.clear;
          sql.add('select TP.* from Tabela_Preco TP');
          if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
            sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade >= :Data order by TP.Descricao')
          else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
            sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade <= :Data order by TP.Descricao')

          else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
            sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade >= :Data order by TP.Data_Cadastro')
          else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
            sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade <= :Data order by TP.Data_Cadastro')

          else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
            sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade >= :Data order by TP.Data_Validade')
          else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
            sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade <= :Data order by TP.Data_Validade');
          Parameters.ParamByName('Data').Value:= date;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          open;

          if (FrmConsulta_Tabela_Preco.qryconsulta_tabela.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 1) then
        begin
          if (FrmConsulta_Tabela_Preco.EdtCodigo_Tabela.Text = '') then
          begin
            Mensagem_Falta_Dados;
            FrmConsulta_Tabela_Preco.EdtCodigo_Tabela.SetFocus;
            abort;
          end
          else
          begin
            with FrmConsulta_Tabela_Preco.qryconsulta_tabela do
              begin
                close;
                sql.clear;
                sql.add('select TP.* from Tabela_Preco TP');
                if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Codigo = :Codigo and TP.Data_Validade >= :Data order by TP.Descricao')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Codigo = :Codigo and TP.Data_Validade <= :Data order by TP.Descricao')

                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Codigo = :Codigo and TP.Data_Validade >= :Data order by TP.Data_Cadastro')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Codigo = :Codigo and TP.Data_Validade <= :Data order by TP.Data_Cadastro')

                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Codigo = :Codigo and TP.Data_Validade >= :Data order by TP.Data_Validade')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Codigo = :Codigo and TP.Data_Validade <= :Data order by TP.Data_Validade');
                Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Tabela_Preco.EdtCodigo_Tabela.Text);
                Parameters.ParamByName('Data').Value:= date;
                open;

                if (FrmConsulta_Tabela_Preco.qryconsulta_tabela.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
              end;
          end;
        end
        else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 2) then
        begin
          if (FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Tabela_Preco.MEdtData_Final.Text = '  /  /    ') then
          begin
            Mensagem_Falta_Dados;
            FrmConsulta_Tabela_Preco.MEdtData_Inicial.SetFocus;
            abort;
          end
          else
          begin
            with FrmConsulta_Tabela_Preco.qryconsulta_tabela do
              begin
                close;
                sql.clear;
                sql.add('select TP.* from Tabela_Preco TP');
                if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by TP.Descricao')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by TP.Descricao')

                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by TP.Data_Cadastro')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by TP.Data_Cadastro')

                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by TP.Data_Validade')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by TP.Data_Validade');
                Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Final.Text);
                Parameters.ParamByName('Data').Value:= date;
                open;

                if (FrmConsulta_Tabela_Preco.qryconsulta_tabela.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
              end;
          end;
        end
        else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 3) then
        begin
          if (FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Tabela_Preco.MEdtData_Final.Text = '  /  /    ') then
          begin
            Mensagem_Falta_Dados;
            FrmConsulta_Tabela_Preco.MEdtData_Inicial.SetFocus;
            abort;
          end
          else
          begin
            with FrmConsulta_Tabela_Preco.qryconsulta_tabela do
              begin
                close;
                sql.clear;
                sql.add('select TP.* from Tabela_Preco TP');
                if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade between :DI and :DF and TP.Data_Validade >= :Data order by TP.Descricao')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade between :DI and :DF and TP.Data_Validade <= :Data order by TP.Descricao')

                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade between :DI and :DF and TP.Data_Validade >= :Data order by TP.Data_Cadastro')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade between :DI and :DF and TP.Data_Validade <= :Data order by TP.Data_Cadastro')

                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade between :DI and :DF and TP.Data_Validade >= :Data order by TP.Data_Validade')
                else if (FrmConsulta_Tabela_Preco.RGOrdena_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
                  sql.Add('where TP.Codigo_Empresa = :Empresa and TP.Data_Validade between :DI and :DF and TP.Data_Validade <= :Data order by TP.Data_Validade');
                Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
                Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text);
                Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Final.Text);
                Parameters.ParamByName('Data').Value:= date;
                open;

                if (FrmConsulta_Tabela_Preco.qryconsulta_tabela.IsEmpty = true) then
                  begin
                    Mensagem_Fim_Pesquisa;
                    abort;
                  end;
              end;
          end;
        end;
end;

procedure TConsulta.Consulta_Tabela_Produto;
var
  qAux: TADOQuery;
begin
  if (FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text = '') then
  begin
    Mensagem_Falta_Dados;
    FrmTabela_Produto.EdtCodigo_Tabela_Preco.SetFocus;
    abort;
  end;

  qAux:= TADOQuery.Create(nil);
  {if (FrmTabela_Produto.tipo = 'PRODUTO') then
  begin
    with FrmTabela_Produto.qryconsulta_produto do
      begin
        close;
        sql.clear;
        sql.add('select TP.Tipo, ITP.Preco_Vista, Pro.Codigo_Venda, Pro.Descricao, Pro.Producao_Propria, Pro.Arred_Trunc, Pro.Tipo_Tributacao,');
        sql.add('UM.Sigla, RI.Aliquota as Ali, CST.Codigo_Situacao from Itens_Tabela_Preco ITP');

        sql.add('inner join Produto Pro on (ITP.Codigo_Produto = Pro.Codigo)');
        sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
        sql.add('inner join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
        sql.add('inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
        sql.add('inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
        sql.add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)');
        sql.add('inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
        sql.add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');

        if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where ITI.Origem = :GO1 and ITI.Destino = :GO2 and Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Codigo_Venda')
        else if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where ITI.Origem = :GO1 and ITI.Destino = :GO2 and Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Codigo_Barra')
        else if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 2) then
          sql.add('where ITI.Origem = :GO1 and ITI.Destino = :GO2 and Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Descricao');
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('GO1').Value:= 'GO';
        Parameters.ParamByName('GO2').Value:= 'GO';
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text);
        open;

        if (FrmTabela_Produto.qryconsulta_produto.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmTabela_Produto.EdtTotal.Clear;
            abort;
          end;

        with qAux do
        begin
          close;
          sql.clear;
          Connection:= dm.ADOConnection1;
          sql.add('select Count(Pro.Codigo) as Conta from Produto Pro');
          sql.add('inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
          sql.add('inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
          sql.add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)');
          sql.add('inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
          sql.add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
          sql.add('inner join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
          sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
          sql.add('where ITI.Origem = :GO1 and ITI.Destino = :GO2 and Pro.Status = :Status and TP.Codigo = :Codigo ');
          Parameters.ParamByName('GO1').Value:= 'GO';
          Parameters.ParamByName('GO2').Value:= 'GO';
          Parameters.ParamByName('Status').Value:= 'ATIVO';
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text);
          open;
        end;
        FrmTabela_Produto.EdtTotal.Text:= qAux.FieldByName('Conta').AsString;
      end;
  end
  else if (FrmTabela_Produto.tipo = 'SERVIÇO') then
  begin
    with FrmTabela_Produto.qryconsulta_produto do
      begin
        close;
        sql.clear;
        sql.add('select TP.Tipo, ITP.Preco_Vista, Pro.Codigo_Venda, Pro.Descricao, Pro.Producao_Propria, Pro.Arred_Trunc, Pro.Tipo_Tributacao,');
        sql.add('UM.Sigla, RISS.Aliquota as Ali, CST.Codigo_Situacao from Itens_Tabela_Preco ITP');

        sql.add('inner join Produto Pro on (ITP.Codigo_Produto = Pro.Codigo)');
        sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
        sql.add('inner join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
        sql.add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
        sql.add('left join Cadastro_Situacao_Tributaria CST on (RISS.Codigo_Situacao_Tributaria = CST.Codigo)');

        if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Codigo_Venda')
        else if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Codigo_Barra')
        else if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 2) then
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Descricao');
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text);
        open;

        if (FrmTabela_Produto.qryconsulta_produto.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmTabela_Produto.EdtTotal.Clear;
            abort;
          end;

        with qAux do
        begin
          close;
          sql.clear;
          Connection:= dm.ADOConnection1;
          sql.add('select Count(Pro.Codigo) as Conta from Produto Pro');
          sql.add('inner join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
          sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
          sql.add('inner join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo ');
          Parameters.ParamByName('Status').Value:= 'ATIVO';
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text);
          open;
        end;
        FrmTabela_Produto.EdtTotal.Text:= qAux.FieldByName('Conta').AsString;
      end;
  end
  else if (FrmTabela_Produto.tipo = 'TUDO') then
  begin}
    with FrmTabela_Produto.qryconsulta_produto do
      begin
        close;
        sql.clear;
        sql.add('select ITP.Preco_Vista,');
        sql.add('Pro.Codigo, Pro.Tipo, Pro.Codigo_Venda, Pro.Descricao, Pro.Producao_Propria, Pro.Arred_Trunc,');
        sql.add('UM.Sigla, RI.Aliquota as ICMS, RISS.Aliquota as ISS, CST.Codigo_Situacao, ITI.Origem, ITI.Destino  from Produto Pro');

        sql.add('left join Itens_Tabela_Preco ITP on (ITP.Codigo_Produto = Pro.Codigo)');
        sql.add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
        sql.add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
        //sql.add('left join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
        sql.add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        sql.add('left join Itens_Tratamento_ICMS ITI on (ITI.Codigo = TI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        sql.add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
        sql.add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        sql.add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

        if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 0) then
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Codigo_Venda')
        else if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 1) then
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Codigo_Barra')
        else if (FrmTabela_Produto.RGOrdena_Por.ItemIndex = 2) then
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo order by Pro.Descricao');
        Parameters.ParamByName('Status').Value:= 'ATIVO';
        Parameters.ParamByName('GO1').Value:= uf;
        Parameters.ParamByName('GO2').Value:= uf;
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text);
        open;

        if (FrmTabela_Produto.qryconsulta_produto.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            FrmTabela_Produto.EdtTotal.Clear;
            abort;
          end;

        with qAux do
        begin
          close;
          sql.clear;
          Connection:= dm.ADOConnection1;
          sql.add('select Count(Pro.Codigo) as Conta from Produto Pro');
          sql.add('left join Itens_Tabela_Preco ITP on (ITP.Codigo_Produto = Pro.Codigo)');
          sql.add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
          sql.add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
          //sql.add('left join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
          sql.add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
          sql.add('left join Itens_Tratamento_ICMS ITI on (ITI.Codigo = TI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
          sql.add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
          sql.add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
          sql.add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
          sql.add('where Pro.Status = :Status and TP.Codigo = :Codigo ');
          Parameters.ParamByName('GO1').Value:= 'GO';
          Parameters.ParamByName('GO2').Value:= 'GO';
          Parameters.ParamByName('Status').Value:= 'ATIVO';
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text);
          open;
        end;
        FrmTabela_Produto.EdtTotal.Text:= qAux.FieldByName('Conta').AsString;
      end;
  //end;
end;

procedure TConsulta.Consulta_Venda;
begin
  {if (FrmConsulta_Venda.RGTipo.ItemIndex = 2) then
  begin
    if (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      FrmConsulta_Venda.MEdtData_Inicial.SetFocus;
      abort;
    end;

    with FrmConsulta_Venda.qryconsulta_venda do
      begin
        close;
        sql.clear;
        sql.add('select Ped.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela from Pedido Ped');
        sql.add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
        sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
        sql.add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Ped.N_Pre_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Fun.Nome');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by TP.Descricao');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        Parameters.ParamByName('Status').Value:= 'PAGO';
        Parameters.ParamByName('Tipo').Value:= 'PDV';

        open;

        if (FrmConsulta_Venda.qryconsulta_venda.IsEmpty = true) then
          begin
            Mensagem_Fim_Pesquisa;
            abort;
          end;
      end;
  end
  else
  begin}
  {if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.MEdtData_Inicial.SetFocus;
        abort;
      end;

      with FrmConsulta_Venda.qryconsulta_venda do
        begin
          close;
          sql.clear;
          sql.add('select Ped.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela from Pedido Ped');
          sql.add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';
          open;

          if (FrmConsulta_Venda.qryconsulta_venda.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Venda.EdtPedido.Text = '') or (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.EdtPedido.SetFocus;
        abort;
      end;

      with FrmConsulta_Venda.qryconsulta_venda do
        begin
          close;
          sql.clear;
          sql.add('select Ped.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela from Pedido Ped');
          sql.add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;

          if (FrmConsulta_Venda.qryconsulta_venda.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Venda.EdtPedido.Text = '') or (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.EdtPedido.SetFocus;
        abort;
      end;

      with FrmConsulta_Venda.qryconsulta_venda do
        begin
          close;
          sql.clear;
          sql.add('select Ped.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela from Pedido Ped');
          sql.add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;

          if (FrmConsulta_Venda.qryconsulta_venda.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Venda.EdtCodigo.Text = '') or (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.EdtCodigo.SetFocus;
        abort;
      end;

      with FrmConsulta_Venda.qryconsulta_venda do
        begin
          close;
          sql.clear;
          sql.add('select Ped.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela from Pedido Ped');
          sql.add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;

          if (FrmConsulta_Venda.qryconsulta_venda.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Venda.EdtCodigo.Text = '') or (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.EdtCodigo.SetFocus;
        abort;
      end;

      with FrmConsulta_Venda.qryconsulta_venda do
        begin
          close;
          sql.clear;
          sql.add('select Ped.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela from Pedido Ped');
          sql.add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;

          if (FrmConsulta_Venda.qryconsulta_venda.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Venda.EdtCodigo.Text = '') or (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.EdtCodigo.SetFocus;
        abort;
      end;

      with FrmConsulta_Venda.qryconsulta_venda do
        begin
          close;
          sql.clear;
          sql.add('select Ped.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela from Pedido Ped');
          sql.add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          sql.add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;

          if (FrmConsulta_Venda.qryconsulta_venda.IsEmpty = true) then
            begin
              Mensagem_Fim_Pesquisa;
              abort;
            end;
        end;
    end;}
  //end;

end;

procedure TConsulta.Consulta_Venda_Agrupado_Cliente;
begin
  with FrmConsulta_Venda.qrydados_agrupados_cliente, sql do
  begin
    close;
    clear;
    add('select C.Codigo as CodCliente, C.Nome_Nome_Fantasia, C.Razao_Social, IP.Codigo, IP.Codigo_Venda, IP.Descricao, IP.UN, IP.Qtde,');
    add('IP.Valor_Unitario, IP.Sub_Total, Ped.Data_Venda from Itens_Pedido IP');
    add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Cliente C on (Ped.Codigo_Cliente = C.Codigo)');
    Add('where Ped.Codigo_Empresa = :Empresa ');
    add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status and IP.Cancelado = '+QuotedStr('N')+'');
    add('order by C.Nome_Nome_Fantasia, IP.Descricao');
    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
    Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
    if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
      Parameters.ParamByName('Status').Value:= 'PAGO'
    else
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;

    if (IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end
end;

procedure TConsulta.Consulta_Venda_Agrupado_Grupo;
begin
  with FrmConsulta_Venda.qrydados_agrupados_grupo, sql do
  begin
    close;
    clear;
    add('select GP.Codigo as CodGrupo, GP.Descricao as Grupo, IP.Codigo, IP.Codigo_Venda, IP.Descricao, IP.UN, IP.Qtde,');
    add('IP.Valor_Unitario, IP.Sub_Total, Ped.Data_Venda from Itens_Pedido IP');
    add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
    Add('where Ped.Codigo_Empresa = :Empresa ');
    add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status and IP.Cancelado = '+QuotedStr('N')+'');
    add('order by GP.Descricao, IP.Descricao');
    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
    Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
    if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
      Parameters.ParamByName('Status').Value:= 'PAGO'
    else
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;

    if (IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TConsulta.Consulta_OS_Agrupado_Grupo;
begin
  if (FrmConsulta_OS.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_OS.MEdtData_Final.Text = '  /  /    ') then
  begin
    FrmConsulta_OS.MEdtData_Inicial.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_OS.CmbStatus.KeyValue = NULL) then
  begin
    FrmConsulta_OS.CmbStatus.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if ( (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) ) and (FrmConsulta_OS.EdtCodigo_Cliente.Text = '') then
  begin
    FrmConsulta_OS.EdtCodigo_Cliente.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  with FrmConsulta_OS.qryagrupado_grupo, sql do
  begin
    close;
    clear;
    add('select Ped.Data_Venda, GP.Codigo as CodGrupo, GP.Descricao as Grupo, IOS.Descricao_Servico, IOS.Qtde, IOS.Valor_Unitario, IOS.Desconto, IOS.Sub_Total');
    add('from Itens_OS IOS');
    add('left join Pedido Ped on (IOS.Codigo = Ped.Codigo)');
    add('left join Produto P on (IOS.Codigo_Servico = P.Codigo)');
    add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');

    case (FrmConsulta_OS.RGConsulta_Por.ItemIndex) of
      0: Add('where Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
      1: Add('where Ped.N_Pedido = :Pedido and Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
      2: Add('where Ped.Codigo_Cliente = :Cliente and Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
      3: Add('where Ped.Codigo_Funcionario = :Cliente and Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
    end;

    case (FrmConsulta_OS.RGData.ItemIndex) of
      0: Add('and Data_Venda between :DI and :DF');
      1: Add('and Data_Previsao_Entrega between :DI and :DF');
      2: Add('and Data_Entrega between :DI and :DF');
    end;

    case (FrmConsulta_OS.RGOrdena_Por.ItemIndex) of
      0: Add('order by Data_Venda');
      1: Add('order by Data_Previsao_Entrega');
      2: Add('order by Data_Entrega');
      3: Add('order by C.Nome_Nome_Fantasia');
    end;

    if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
    begin
      Parameters.ParamByName('Cliente').Value:= StrToInt(FrmConsulta_OS.EdtCodigo_Cliente.Text);
    end
    else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
    begin
      Parameters.ParamByName('Pedido').Value:= FrmConsulta_OS.EdtDAV_OS.Text;
    end;

    Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
    Parameters.ParamByName('Status_OS').Value:= FrmConsulta_OS.CmbStatus.KeyValue;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Final.Text);

    open;

    if (IsEmpty = true) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TConsulta.Consulta_Venda_Lucratividade_Cliente;
begin
  with FrmConsulta_Venda.qrylucratividade_cliente do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('	   Y.Nome_Nome_Fantasia,');
      sql.add('	   Y.Valor_Total,');
      sql.add('       ( Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('			     select case when grouping(C.Nome_Nome_Fantasia) = 0 then C.Nome_Nome_Fantasia');
      sql.add('				  	  when grouping(C.Nome_Nome_Fantasia) = 1  then '+QuotedStr('TOTAL GERAL---------->')+'');
      sql.add('    			      else C.Nome_Nome_Fantasia');
      sql.add('			     end as Nome_Nome_Fantasia,');
      sql.add('				 sum(IP.Valor_Unitario * IP.Qtde) as Valor_Total,');
      sql.add('				 convert(varchar(2),month(P.Data_Venda)) + '+QuotedStr('/')+' + convert(varchar(4),year(P.Data_Venda)) as Mes,');

      sql.add('          (select sum(tip.Valor_Unitario * tip.Qtde) from Itens_Pedido tip');
      sql.add('          left join Pedido t on (tip.Codigo = t.Codigo)');
      sql.add('          where t.Data_Venda between :DI1 and :DF1 and t.Status = '+QuotedStr('PAGO')+' and tip.Cancelado = '+QuotedStr('N')+') as Total_Geral');

      sql.add('		  from Itens_Pedido IP');
      sql.add('		  left join Pedido P on(IP.Codigo = P.Codigo)');
      sql.add('		  left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
      sql.add('          where P.Data_Venda between :DI2 and :DF2 and P.Status = '+QuotedStr('PAGO')+' and IP.Cancelado = '+QuotedStr('N')+'');
      sql.add('          group by convert(varchar(2),month(P.Data_Venda)) + '+QuotedStr('/')+' + convert(varchar(4),year(P.Data_Venda)), C.Nome_Nome_Fantasia with RollUP) Y');
      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      open;
    end;

    if (FrmConsulta_Venda.qrylucratividade_cliente.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Venda_Lucratividade_Geral;
begin
  with FrmConsulta_Venda.qrylucratividade_geral do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('	   Y.Custo_Total,');
      sql.add('	   Y.Venda_Total,');
      sql.add('       ( (Y.Venda_Total - Y.Custo_Total) / Y.Venda_Total) * 100 as Percentual');
      sql.add('from(');
      sql.add('          select sum(IP.Valor_Unitario * IP.Qtde) as Venda_Total,');
      sql.add('				 sum(IP.Valor_Compra * IP.Qtde) as Custo_Total,');
      sql.add('				 convert(varchar(2),month(P.Data_Venda)) + '+ QuotedStr('/') +' + convert(varchar(4),year(P.Data_Venda)) as Mes');

      sql.add('		  from Itens_Pedido IP');
      sql.add('		  left join Pedido P on(IP.Codigo = P.Codigo)');
      sql.add('          where P.Data_Venda between :DI and :DF and P.Status = '+QuotedStr('PAGO')+' and IP.Cancelado = '+QuotedStr('N')+'');
      sql.add('          group by convert(varchar(2),month(P.Data_Venda)) + '+ QuotedStr('/') +' + convert(varchar(4),year(P.Data_Venda))) Y');
      sql.add('order by mes, percentual desc');

      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      open;
    end;

    if (FrmConsulta_Venda.qrylucratividade_geral.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Venda_Lucratividade_Grupo;
begin
  with FrmConsulta_Venda.qrylucratividade_grupo do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('       Y.Descricao,');
      sql.add('	   Y.Venda_Total,');
      sql.add('	   (Y.Venda_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('	   case when grouping(GP.Descricao) = 0 then GP.Descricao');
      sql.add('			when grouping(GP.Descricao) = 1  then '+QuotedStr('TOTAL---------->')+'');
      sql.add('	   end as Descricao,');
      sql.add('       sum(tip.Valor_Unitario * tip.Qtde) as Venda_Total,');
      sql.add('	   convert(varchar(2),month(t.Data_Venda)) + '+ QuotedStr('/') +' + convert(varchar(4),year(t.Data_Venda)) as Mes,');
      sql.add('      (select sum(tip.Valor_Unitario * tip.Qtde) from Itens_Pedido tip');
      sql.add('      left join Pedido t on (tip.Codigo = t.Codigo)');
      sql.add('      where t.Data_Venda between :DI1 and :DF1 and t.Status = '+QuotedStr('PAGO')+' and tip.Cancelado = '+QuotedStr('N')+') as Total_Geral');

      sql.add('        from Itens_Pedido tip');
      sql.add('left join Pedido t on (tip.Codigo = t.Codigo)');
      sql.add('left join Produto Pro on (tip.Codigo_Produto = Pro.Codigo)');
      sql.add('left join Grupo_Produto GP on (Pro.Codigo_Grupo = GP.Codigo)');
      sql.add('where t.Data_Venda between :DI2 and :DF2 and t.Status = '+QuotedStr('PAGO')+' and tip.Cancelado = '+QuotedStr('N')+'');
      sql.add('group by convert(varchar(2),month(t.Data_Venda)) + '+ QuotedStr('/') +' + convert(varchar(4),year(t.Data_Venda)), GP.Codigo_Pai, GP.Descricao');
      sql.add('with RollUP) Y ');

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      open;
    end;

    if (FrmConsulta_Venda.qrylucratividade_grupo.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Venda_Lucratividade_Vendedor;
begin
  with FrmConsulta_Venda.qrylucratividade_vendedor do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('	   Y.Nome,');
      sql.add('	   Y.Custo_Total,');
      sql.add('	   Y.Venda_Total,');
      sql.add('       ( (Y.Venda_Total - Y.Custo_Total) / Y.Venda_Total) * 100 as Percentual');
      sql.add('from(');
      sql.add('          select');
      sql.add('			     case when grouping(F.Nome) = 0 then F.Nome');
      sql.add('					  when grouping(F.Nome) = 1  then '+ QuotedStr('TOTAL GERAL---------->') +'');
      sql.add('	    			  else F.Nome');
      sql.add('			     end as Nome, ');
      sql.add('				 sum(IP.Valor_Unitario * IP.Qtde) as Venda_Total,');
      sql.add('				 sum(IP.Valor_Compra * IP.Qtde) as Custo_Total,');
      sql.add('				 convert(varchar(2),month(P.Data_Venda)) + '+ QuotedStr('/') +' + convert(varchar(4),year(P.Data_Venda)) as Mes');

      sql.add('		  from Itens_Pedido IP');
      sql.add('		  left join Pedido P on(IP.Codigo = P.Codigo)');
      sql.add('		  left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)');
      sql.add('          where P.Data_Venda between :DI and :DF and P.Status = '+QuotedStr('PAGO')+' and IP.Cancelado = '+QuotedStr('N')+'');
      sql.add('          group by convert(varchar(2),month(P.Data_Venda)) + '+ QuotedStr('/') +' + convert(varchar(4),year(P.Data_Venda)), F.Nome with RollUP) Y');
      //sql.add('order by mes, percentual desc');

      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      //Parameters.ParamByName('Status').Value:= 'PAGO';
      open;
    end;

    if (FrmConsulta_Venda.qrylucratividade_vendedor.IsEmpty = true) then
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
end;

procedure TConsulta.Consulta_Venda_Sintetico_1;
begin
  if (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Venda.PageControl1.TabIndex:= 0;
    FrmConsulta_Venda.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Venda.PageControl1.TabIndex:= 0;
    FrmConsulta_Venda.MEdtData_Final.SetFocus;
    abort;
  end;

  with FrmConsulta_Venda.qryconsulta_sintetico_1, sql do
  begin
    close;
    clear;
    add('select Ped.Codigo, Ped.N_Pedido, Ped.Data_Venda, Ped.Data_Emissao_NFe, Ped.Total_Pedido, CP.Descricao as Cond_Pag,');
    add('Cli.Nome_Nome_Fantasia, Fun.Nome as Funcionario, CFOP.CFOP, Ped.Status, Ped.Total_Impostos from Pedido Ped');
    add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
    add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
    add('left join Condicao_Pagamento CP on (Ped.Codigo_Forma_Pag = CP.Codigo)');
    add('left join Cadastro_CFOP CFOP on (Ped.Codigo_CFOP = CFOP.Codigo)');


    if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Fun.Nome');
        end;

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
        Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 1) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
        //Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        //Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 2) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
        //Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        //Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) then
      begin
        if (FrmConsulta_Venda.EdtCodigo.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Venda.EdtCodigo.SetFocus;
          abort;
        end;

        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
        Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
      begin
        if (FrmConsulta_Venda.EdtCodigo.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Venda.EdtCodigo.SetFocus;
          abort;
        end;

        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
        Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 5) then
      begin
        if (FrmConsulta_Venda.EdtCodigo.Text = '') then
        begin
          Mensagem_Falta_Dados;
          FrmConsulta_Venda.EdtCodigo.SetFocus;
          abort;
        end;

        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and Ped.Status = :Status order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
        Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end
    end;

    if (FrmConsulta_Venda.qryconsulta_sintetico_1.IsEmpty) then
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
end;

procedure TConsulta.Consulta_Venda_Sintetico_2;
begin
  if (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Venda.PageControl1.TabIndex:= 0;
    FrmConsulta_Venda.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Venda.PageControl1.TabIndex:= 0;
    FrmConsulta_Venda.MEdtData_Final.SetFocus;
    abort;
  end;

  with FrmConsulta_Venda.qryconsulta_sintetico_produto, sql do
  begin
    close;
    clear;
    add('SELECT     P.Data_Venda, IP.Codigo_Venda, IP.Descricao, IP.UN, SUM(IP.Qtde) AS Qtde, SUM(IP.Qtde * IP.Valor_Unitario) AS Valor_Total');
    add('FROM         Itens_Pedido IP');
    add('LEFT JOIN Pedido P on (IP.Codigo = P.Codigo)');

    if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) then
    begin
      add('WHERE     (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and P.Status = :Status and P.Codigo_Empresa = :Empresa and IP.Cancelado = '+QuotedStr('N')+'');
      add('GROUP BY IP.Codigo_Venda, IP.Descricao, IP.UN, P.Data_Venda');
      add('ORDER BY P.Data_Venda, IP.Descricao');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

      if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PAGO'
      else
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Venda.EdtCodigo.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.SetFocus;
        abort;
      end;

      add('WHERE P.Codigo_Cliente = :Cliente and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and P.Status = :Status and P.Codigo_Empresa = :Empresa and IP.Cancelado = '+QuotedStr('N')+'');
      add('GROUP BY IP.Codigo_Venda, IP.Descricao, IP.UN, P.Data_Venda');
      add('ORDER BY P.Data_Venda, IP.Descricao');

      Parameters.ParamByName('Cliente').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

      if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PAGO'
      else
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Venda.EdtCodigo.Text = '') then
      begin
        Mensagem_Falta_Dados;
        FrmConsulta_Venda.SetFocus;
        abort;
      end;

      add('WHERE P.Codigo_Funcionario = :Funcionario and (Ped.Data_Venda between :DI and :DF or Ped.Data_Emissao_NFe between :DI2 and :DF2) and P.Status = :Status and P.Codigo_Empresa = :Empresa and IP.Cancelado = '+QuotedStr('N')+'');
      add('GROUP BY IP.Codigo_Venda, IP.Descricao, IP.UN, P.Data_Venda');
      add('ORDER BY P.Data_Venda, IP.Descricao');

      Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

      if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PAGO'
      else
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
    end;

    open;
  end;

  if (FrmConsulta_Venda.qryconsulta_sintetico_produto.IsEmpty) then
  begin
    Mensagem_Fim_Pesquisa;
    abort;
  end;
end;

procedure TConsulta.Consulta_Venda_Tributo;
begin
  if (FrmConsulta_Venda.MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Venda.PageControl1.TabIndex:= 0;
    FrmConsulta_Venda.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Venda.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    FrmConsulta_Venda.PageControl1.TabIndex:= 0;
    FrmConsulta_Venda.MEdtData_Final.SetFocus;
    abort;
  end;

  with FrmConsulta_Venda.qryconsulta_venda_tributo, sql do
  begin
    close;
    clear;
    add('select C.Nome_Nome_Fantasia, P.Data_Venda, P.N_Pedido, P.COO, P.COO_Vin,');
    add('P.N_Nota_Fiscal, P.Chave_NFe, P.Protocolo_NFe from Pedido P');
    add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
    add('where (P.Data_Venda between :DI and :DF or P.Data_Emissao_NFe between :DI2 and :DF2) and P.Status = :Status');
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
    Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
    Parameters.ParamByName('Status').Value:= 'PAGO';
    open;
  end;

  if (FrmConsulta_Venda.qryconsulta_venda_tributo.IsEmpty) then
  begin
    Mensagem_Fim_Pesquisa;
    abort;
  end;
end;

procedure TConsulta.Pega_Produto(Edt: TEdit);
var
  Posicao, Aux: Integer;
begin
  if (qAux_Produto = Nil) then
    qAux_Produto:= TADOQuery.Create(nil);
  try
    with qAux_Produto, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      open;
    end;

    If qAux_Produto.FieldByName('Descricao').AsString <> '' then
    begin
      Posicao := length(Edt.Text);
      For Aux := length(Edt.Text)+1 to Length(qAux_Produto.FieldByName('Descricao').AsString) do
      begin
        Edt.Text := Edt.Text + qAux_Produto.FieldByName('Descricao').AsString[Aux];
      end;
      Edt.SelStart := Posicao;
      Edt.SelLength := length(Edt.Text);
    end;
  finally
    //FreeAndNil(qAux_Produto);
  end;
end;

procedure TConsulta.Sugestao_Compra;
begin
  if (FrmSugestao_Compra.MEdtData_Inicial.Text = '  /  /    ') or (FrmSugestao_Compra.MEdtData_Final.Text = '  /  /    ') or
      (FrmSugestao_Compra.EdtDias_Entrega.Text = '') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;

  with FrmSugestao_Compra.qrysugestao_compra do
    begin
      close;
      sql.clear;
      sql.add('select IP.Codigo_Produto, P.Codigo_Original, P.Codigo_Venda, P.Descricao, P.Valor_Compra, UM.Sigla, ');
      sql.add('sum(IP.Qtde) as total_vendido, ((sum(IP.Qtde) / :Dias_Uteis1) * :Dias_Uteis2) as previsao_venda, ');
      sql.add('((sum(IP.Qtde) / :Dias_Uteis3) * :Dias_Entrega1) as previsao_venda_entrega,');
      sql.add('(sum(IP.Qtde) / :Dias_Uteis4) as media_diaria, P.Estoque, P.Estoque_Maximo, ');
      sql.add('(sum(IP.Qtde_Restante)) as pendente, (((sum(IP.Qtde) / :Dias_Uteis5) * :Dias_Entrega2) + P.Estoque_Maximo - P.Estoque) as sugestao from Produto P');
      sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      sql.add('inner join Itens_Pedido IP on (IP.Codigo_Produto = P.Codigo)');
      sql.add('inner join Pedido Ped on(IP.Codigo = Ped.Codigo)');
      sql.Add('where Ped.Data_Venda between :DI and :DF and Ped.Status = :Status');
      sql.add('group by IP.Codigo_Produto, P.Codigo_Original, P.Codigo_Venda, P.Descricao, P.Valor_Compra, UM.Sigla, P.Estoque, P.Estoque_Maximo');
      Parameters.ParamByName('Dias_Uteis1').Value:= StrToInt(FrmSugestao_Compra.EdtDias_Uteis.Text);
      Parameters.ParamByName('Dias_Uteis2').Value:= StrToInt(FrmSugestao_Compra.EdtDias_Uteis.Text);
      Parameters.ParamByName('Dias_Uteis3').Value:= StrToInt(FrmSugestao_Compra.EdtDias_Uteis.Text);
      Parameters.ParamByName('Dias_Entrega1').Value:= StrToInt(FrmSugestao_Compra.EdtDias_Entrega.Text);
      Parameters.ParamByName('Dias_Uteis4').Value:= StrToInt(FrmSugestao_Compra.EdtDias_Uteis.Text);
      Parameters.ParamByName('Dias_Uteis5').Value:= StrToInt(FrmSugestao_Compra.EdtDias_Uteis.Text);
      Parameters.ParamByName('Dias_Entrega2').Value:= StrToInt(FrmSugestao_Compra.EdtDias_Entrega.Text);
      Parameters.ParamByName('DI').Value:= FrmSugestao_Compra.MEdtData_Inicial.Text;
      Parameters.ParamByName('DF').Value:= FrmSugestao_Compra.MEdtData_Final.Text;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      open;
      if (FrmSugestao_Compra.qrysugestao_compra.IsEmpty = true) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
    end;
end;

end.


