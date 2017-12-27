object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 524
  Width = 1000
  object qrychama_produto: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from fProduto('#39'ATIVO'#39', '#39'GO'#39', '#39'GO'#39', '#39'1'#39', 4, '#39#39')')
    Left = 16
    Top = 64
    object qrychama_produtoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_produtoTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object qrychama_produtoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_produtoStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qrychama_produtoGera_Comissao: TStringField
      FieldName = 'Gera_Comissao'
      Size = 3
    end
    object qrychama_produtoAceita_Devolucao: TStringField
      FieldName = 'Aceita_Devolucao'
      Size = 3
    end
    object qrychama_produtoArred_Trunc: TStringField
      FieldName = 'Arred_Trunc'
      Size = 1
    end
    object qrychama_produtoProducao_Propria: TStringField
      FieldName = 'Producao_Propria'
      Size = 1
    end
    object qrychama_produtoCodigo_Original: TStringField
      FieldName = 'Codigo_Original'
    end
    object qrychama_produtoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qrychama_produtoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qrychama_produtoCodigo_Barra: TStringField
      FieldName = 'Codigo_Barra'
    end
    object qrychama_produtoCodigo_Similar: TStringField
      FieldName = 'Codigo_Similar'
    end
    object qrychama_produtoCodigo_Fornecedor: TIntegerField
      FieldName = 'Codigo_Fornecedor'
    end
    object qrychama_produtoCodigo_Fabricante: TIntegerField
      FieldName = 'Codigo_Fabricante'
    end
    object qrychama_produtoCodigo_Marca: TIntegerField
      FieldName = 'Codigo_Marca'
    end
    object qrychama_produtoCodigo_Unidade_Medida: TIntegerField
      FieldName = 'Codigo_Unidade_Medida'
    end
    object qrychama_produtoCodigo_Unidade_Volume: TIntegerField
      FieldName = 'Codigo_Unidade_Volume'
    end
    object qrychama_produtoCodigo_Grupo: TIntegerField
      FieldName = 'Codigo_Grupo'
    end
    object qrychama_produtoCodigo_Grupo_Tributacao: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao'
    end
    object qrychama_produtoCodigo_Grupo_Tributacao_IPI: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_IPI'
    end
    object qrychama_produtoCodigo_Grupo_Tributacao_PIS: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_PIS'
    end
    object qrychama_produtoCodigo_Grupo_Tributacao_COFINS: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_COFINS'
    end
    object qrychama_produtoCodigo_Grupo_Tributacao_ISSQN: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_ISSQN'
    end
    object qrychama_produtoCodigo_Local: TIntegerField
      FieldName = 'Codigo_Local'
    end
    object qrychama_produtoData_Fabricacao: TDateTimeField
      FieldName = 'Data_Fabricacao'
    end
    object qrychama_produtoData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
    end
    object qrychama_produtoUltima_Compra: TDateTimeField
      FieldName = 'Ultima_Compra'
    end
    object qrychama_produtoUltima_Venda: TDateTimeField
      FieldName = 'Ultima_Venda'
    end
    object qrychama_produtoValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
    end
    object qrychama_produtoValor_Compra_Unitario: TFloatField
      FieldName = 'Valor_Compra_Unitario'
    end
    object qrychama_produtoValor_Ultima_Compra_Unitario: TFloatField
      FieldName = 'Valor_Ultima_Compra_Unitario'
    end
    object qrychama_produtoValor_Medio: TFloatField
      FieldName = 'Valor_Medio'
    end
    object qrychama_produtoSaldo_Estoque: TFloatField
      FieldName = 'Saldo_Estoque'
    end
    object qrychama_produtoValor_Ultima_Compra: TFloatField
      FieldName = 'Valor_Ultima_Compra'
    end
    object qrychama_produtoEstoque_Maximo: TFloatField
      FieldName = 'Estoque_Maximo'
    end
    object qrychama_produtoEstoque_Minimo: TFloatField
      FieldName = 'Estoque_Minimo'
    end
    object qrychama_produtoEstoque: TFloatField
      FieldName = 'Estoque'
    end
    object qrychama_produtoEstoque_Reservado: TFloatField
      FieldName = 'Estoque_Reservado'
    end
    object qrychama_produtoVolume: TFloatField
      FieldName = 'Volume'
    end
    object qrychama_produtoVolume_Total: TFloatField
      FieldName = 'Volume_Total'
    end
    object qrychama_produtoEm_Estoque_Maximo: TStringField
      FieldName = 'Em_Estoque_Maximo'
      Size = 30
    end
    object qrychama_produtoEm_Estoque_Minimo: TStringField
      FieldName = 'Em_Estoque_Minimo'
      Size = 30
    end
    object qrychama_produtoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_produtoData_Atualizacao_Estoque: TDateTimeField
      FieldName = 'Data_Atualizacao_Estoque'
    end
    object qrychama_produtoStatus_Estoque_Data: TStringField
      FieldName = 'Status_Estoque_Data'
      Size = 1
    end
    object qrychama_produtoNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qrychama_produtoAplicacao: TStringField
      FieldName = 'Aplicacao'
      Size = 800
    end
    object qrychama_produtoNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qrychama_produtoFabricante: TStringField
      FieldName = 'Fabricante'
      Size = 50
    end
    object qrychama_produtoMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qrychama_produtoSigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
    object qrychama_produtoSigla2: TStringField
      FieldName = 'Sigla2'
      Size = 5
    end
    object qrychama_produtoGrupo_Produto: TStringField
      FieldName = 'Grupo_Produto'
      Size = 300
    end
    object qrychama_produtoCodigo_Sub_Grupo: TIntegerField
      FieldName = 'Codigo_Sub_Grupo'
    end
    object qrychama_produtoCodigo_Pai: TIntegerField
      FieldName = 'Codigo_Pai'
    end
    object qrychama_produtoPVistaG: TFloatField
      FieldName = 'PVistaG'
    end
    object qrychama_produtoPPrazoG: TFloatField
      FieldName = 'PPrazoG'
    end
    object qrychama_produtoPDesVistaG: TFloatField
      FieldName = 'PDesVistaG'
    end
    object qrychama_produtoPDesPrazoG: TFloatField
      FieldName = 'PDesPrazoG'
    end
    object qrychama_produtoDescricao_TICMS: TStringField
      FieldName = 'Descricao_TICMS'
      Size = 50
    end
    object qrychama_produtoDescricao_TIPI: TStringField
      FieldName = 'Descricao_TIPI'
      Size = 50
    end
    object qrychama_produtoLocal: TStringField
      FieldName = 'Local'
    end
    object qrychama_produtoDescricao_TPIS: TStringField
      FieldName = 'Descricao_TPIS'
      Size = 50
    end
    object qrychama_produtoDescricao_TCO: TStringField
      FieldName = 'Descricao_TCO'
      Size = 50
    end
    object qrychama_produtoPreco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      currency = True
    end
    object qrychama_produtoPreco_Prazo: TFloatField
      FieldName = 'Preco_Prazo'
      currency = True
    end
    object qrychama_produtoPercentual_Desconto_Vista: TFloatField
      FieldName = 'Percentual_Desconto_Vista'
    end
    object qrychama_produtoPercentual_Desconto_Prazo: TFloatField
      FieldName = 'Percentual_Desconto_Prazo'
    end
    object qrychama_produtoPercentual_Lucro_Vista: TFloatField
      FieldName = 'Percentual_Lucro_Vista'
    end
    object qrychama_produtoPercentual_Lucro_Prazo: TFloatField
      FieldName = 'Percentual_Lucro_Prazo'
    end
    object qrychama_produtoPercentual_Comissao_Vista: TFloatField
      FieldName = 'Percentual_Comissao_Vista'
    end
    object qrychama_produtoPercentual_Comissao_Prazo: TFloatField
      FieldName = 'Percentual_Comissao_Prazo'
    end
    object qrychama_produtoAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qrychama_produtoAliquota_NF: TStringField
      FieldName = 'Aliquota_NF'
      Size = 5
    end
    object qrychama_produtoISS: TStringField
      FieldName = 'ISS'
      Size = 5
    end
    object qrychama_produtoTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 30
    end
  end
  object qrychama_condicao: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from condicao_Pagamento where Status = '#39'ATIVO'#39' and Prog' +
        'rama_Impressora = '#39'SIM'#39)
    Left = 16
    Top = 112
    object qrychama_condicaoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_condicaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qrychama_condicaoParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qrychama_condicaoPrazo: TIntegerField
      FieldName = 'Prazo'
    end
    object qrychama_condicaoTaxa: TFloatField
      FieldName = 'Taxa'
    end
    object qrychama_condicaoTipo_Pagamento: TStringField
      FieldName = 'Tipo_Pagamento'
    end
    object qrychama_condicaoForma_Negociacao: TStringField
      FieldName = 'Forma_Negociacao'
    end
    object qrychama_condicaoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_condicaoTEF: TStringField
      FieldName = 'TEF'
      Size = 3
    end
    object qrychama_condicaoCheque: TStringField
      FieldName = 'Cheque'
      Size = 3
    end
    object qrychama_condicaoStatus: TStringField
      FieldName = 'Status'
      Size = 7
    end
    object qrychama_condicaoBandeira: TStringField
      FieldName = 'Bandeira'
      Size = 10
    end
    object qrychama_condicaoTipo_Juro: TStringField
      FieldName = 'Tipo_Juro'
      Size = 1
    end
    object qrychama_condicaoIndice: TStringField
      FieldName = 'Indice'
      Size = 10
    end
    object qrychama_condicaoPrograma_Impressora: TStringField
      FieldName = 'Programa_Impressora'
      Size = 3
    end
    object qrychama_condicaoCNPJ_Operadora: TStringField
      FieldName = 'CNPJ_Operadora'
      Size = 15
    end
  end
  object qrychama_veiculo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select V.*, M.Descricao, C.Nome_Nome_Fantasia from Veiculo V'
      'inner join Marca M on (V.Codigo_Marca = M.Codigo)'
      'inner join Cliente C on (V.Codigo_Cliente = C.Codigo)')
    Left = 16
    Top = 160
    object qrychama_veiculoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_veiculoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_veiculoVeiculo: TStringField
      FieldName = 'Veiculo'
      Size = 50
    end
    object qrychama_veiculoCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qrychama_veiculoCodigo_Marca: TIntegerField
      FieldName = 'Codigo_Marca'
    end
    object qrychama_veiculoModelo: TStringField
      FieldName = 'Modelo'
      Size = 30
    end
    object qrychama_veiculoAno_Fabricacao: TStringField
      FieldName = 'Ano_Fabricacao'
      Size = 15
    end
    object qrychama_veiculoPlaca: TStringField
      FieldName = 'Placa'
      Size = 10
    end
    object qrychama_veiculoChassi: TStringField
      FieldName = 'Chassi'
    end
    object qrychama_veiculoRenavam: TStringField
      FieldName = 'Renavam'
      Size = 40
    end
    object qrychama_veiculoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qrychama_veiculoNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
  end
  object qrychama_servico: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select Pro.Codigo, Pro.Descricao as Descricao_Servico, R.Aliquot' +
        'a, ITP.Preco_Vista from Produto Pro'
      
        'left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Pro' +
        'duto)'
      'left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)'
      
        'left join Regra_ISSQN R on (Pro.Codigo_Grupo_Tributacao_ISSQN = ' +
        'R.Codigo)'
      'where Pro.Status = '#39'ATIVO'#39' and Pro.Tipo = '#39'1'#39' and TP.Codigo = 1')
    Left = 616
    Top = 208
    object qrychama_servicoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_servicoDescricao_Servico: TStringField
      FieldName = 'Descricao_Servico'
      Size = 300
    end
    object qrychama_servicoAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qrychama_servicoPreco_Vista: TFloatField
      FieldName = 'Preco_Vista'
    end
  end
  object qryR06: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from R06')
    Left = 96
    Top = 112
    object qryR06Data_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object qryR06Tipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object qryR06N_Fabricacao: TStringField
      FieldName = 'N_Fabricacao'
    end
    object qryR06MF_Adicional: TStringField
      FieldName = 'MF_Adicional'
      Size = 5
    end
    object qryR06Modelo_ECF: TStringField
      FieldName = 'Modelo_ECF'
    end
    object qryR06COO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object qryR06GNF: TStringField
      FieldName = 'GNF'
      Size = 6
    end
    object qryR06GRG: TStringField
      FieldName = 'GRG'
      Size = 6
    end
    object qryR06CDC: TStringField
      FieldName = 'CDC'
      Size = 4
    end
    object qryR06Denominacao: TStringField
      FieldName = 'Denominacao'
      Size = 2
    end
    object qryR06Data_Final_Emissao: TStringField
      FieldName = 'Data_Final_Emissao'
      Size = 8
    end
    object qryR06Hora_Final_Emissao: TStringField
      FieldName = 'Hora_Final_Emissao'
      Size = 8
    end
    object qryR06Caixa: TStringField
      FieldName = 'Caixa'
      Size = 4
    end
    object qryR06Codigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryR06N_Usuario: TStringField
      FieldName = 'N_Usuario'
      Size = 5
    end
    object qryR06MD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
  end
  object qryr04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from R04')
    Left = 96
    Top = 160
    object qryr04Data_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object qryr04Tipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object qryr04MF_Adicional: TStringField
      FieldName = 'MF_Adicional'
      Size = 2
    end
    object qryr04Modelo_ECF: TStringField
      FieldName = 'Modelo_ECF'
    end
    object qryr04CCF: TStringField
      FieldName = 'CCF'
      Size = 6
    end
    object qryr04COO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object qryr04Data_Inicio_Emissao: TStringField
      FieldName = 'Data_Inicio_Emissao'
      Size = 8
    end
    object qryr04Sub_Total_Documento: TStringField
      FieldName = 'Sub_Total_Documento'
      Size = 14
    end
    object qryr04Desconto: TStringField
      FieldName = 'Desconto'
      Size = 13
    end
    object qryr04Tipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryr04Acrecimo: TStringField
      FieldName = 'Acrecimo'
    end
    object qryr04Tipo_Acrecimo: TStringField
      FieldName = 'Tipo_Acrecimo'
      Size = 1
    end
    object qryr04Valor_Total: TStringField
      FieldName = 'Valor_Total'
    end
    object qryr04Cancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 1
    end
    object qryr04Valor_Cancelamento_Acrecimo: TStringField
      FieldName = 'Valor_Cancelamento_Acrecimo'
    end
    object qryr04Indicador_Acre_Desc: TStringField
      FieldName = 'Indicador_Acre_Desc'
      Size = 1
    end
    object qryr04Adquirente: TStringField
      FieldName = 'Adquirente'
      Size = 50
    end
    object qryr04CPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object qryr04Caixa: TStringField
      FieldName = 'Caixa'
      Size = 4
    end
    object qryr04N_Pedido: TIntegerField
      FieldName = 'N_Pedido'
    end
    object qryr04N_Fabricacao: TStringField
      FieldName = 'N_Fabricacao'
    end
    object qryr04Codigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryr04N_Usuario: TStringField
      FieldName = 'N_Usuario'
      Size = 5
    end
    object qryr04MD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
  end
  object qryr07: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from R07')
    Left = 96
    Top = 208
    object qryr07Data_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object qryr07Tipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object qryr07N_Fabricacao: TStringField
      FieldName = 'N_Fabricacao'
    end
    object qryr07MF_Adicional: TStringField
      FieldName = 'MF_Adicional'
      Size = 2
    end
    object qryr07Modelo_ECF: TStringField
      FieldName = 'Modelo_ECF'
    end
    object qryr07COO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object qryr07CCF: TStringField
      FieldName = 'CCF'
      Size = 6
    end
    object qryr07GNF: TStringField
      FieldName = 'GNF'
      Size = 6
    end
    object qryr07Meio_Pagamento: TStringField
      FieldName = 'Meio_Pagamento'
    end
    object qryr07Valor_Pago: TStringField
      FieldName = 'Valor_Pago'
      Size = 13
    end
    object qryr07Estorno: TStringField
      FieldName = 'Estorno'
      Size = 1
    end
    object qryr07Valor_Estorno: TStringField
      FieldName = 'Valor_Estorno'
      Size = 13
    end
    object qryr07Caixa: TStringField
      FieldName = 'Caixa'
      Size = 4
    end
    object qryr07Codigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryr07N_Usuario: TStringField
      FieldName = 'N_Usuario'
      Size = 5
    end
    object qryr07MD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
  end
  object qryvenda: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Pedido')
    Left = 96
    Top = 256
    object qryvendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryvendaN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qryvendaN_Pre_Venda: TStringField
      FieldName = 'N_Pre_Venda'
      Size = 10
    end
    object qryvendaCOO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object qryvendaCOO_Vin: TStringField
      FieldName = 'COO_Vin'
      Size = 6
    end
    object qryvendaCCF: TStringField
      FieldName = 'CCF'
      Size = 6
    end
    object qryvendaCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryvendaCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryvendaCodigo_Veiculo: TIntegerField
      FieldName = 'Codigo_Veiculo'
    end
    object qryvendaCodigo_Funcionario: TIntegerField
      FieldName = 'Codigo_Funcionario'
    end
    object qryvendaCodigo_Tabela_Preco: TIntegerField
      FieldName = 'Codigo_Tabela_Preco'
    end
    object qryvendaData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryvendaQtde_Itens: TIntegerField
      FieldName = 'Qtde_Itens'
    end
    object qryvendaQtde_Servicos: TIntegerField
      FieldName = 'Qtde_Servicos'
    end
    object qryvendaTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
    end
    object qryvendaTotal_Servicos: TFloatField
      FieldName = 'Total_Servicos'
    end
    object qryvendaTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
    end
    object qryvendaTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qryvendaStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qryvendaValor_Recebido: TFloatField
      FieldName = 'Valor_Recebido'
    end
    object qryvendaTroco: TFloatField
      FieldName = 'Troco'
    end
    object qryvendaMesclada: TIntegerField
      FieldName = 'Mesclada'
    end
    object qryvendaProblema_Reclamado: TStringField
      FieldName = 'Problema_Reclamado'
      Size = 200
    end
    object qryvendaProblema_Constatado: TStringField
      FieldName = 'Problema_Constatado'
      Size = 200
    end
    object qryvendaSolucao: TStringField
      FieldName = 'Solucao'
      Size = 200
    end
    object qryvendaDAVC: TStringField
      FieldName = 'DAVC'
      Size = 3
    end
    object qryvendaDAVAnt: TStringField
      FieldName = 'DAVAnt'
      Size = 500
    end
    object qryvendaDesc_Acr: TFloatField
      FieldName = 'Desc_Acr'
      DisplayFormat = '#0.0,0'
    end
    object qryvendaTipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object qryvendaData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryvendaCodigo_Forma_Pag: TIntegerField
      FieldName = 'Codigo_Forma_Pag'
    end
    object qryvendaTotal_Desc_Acr: TFloatField
      FieldName = 'Total_Desc_Acr'
    end
    object qryvendaStatus_OS: TStringField
      FieldName = 'Status_OS'
      Size = 10
    end
    object qryvendaChave_NFe: TStringField
      FieldName = 'Chave_NFe'
      Size = 100
    end
    object qryvendaProtocolo_NFe: TStringField
      FieldName = 'Protocolo_NFe'
      Size = 100
    end
    object qryvendaN_Nota_Fiscal: TIntegerField
      FieldName = 'N_Nota_Fiscal'
    end
    object qryvendaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 800
    end
    object qryvendaHora_Venda: TWideStringField
      FieldName = 'Hora_Venda'
      Size = 16
    end
    object qryvendaAtualizou_Orcamento_Vencido: TIntegerField
      FieldName = 'Atualizou_Orcamento_Vencido'
    end
    object qryvendaData_Previsao_Entrega: TDateTimeField
      FieldName = 'Data_Previsao_Entrega'
    end
    object qryvendaData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qryvendaKilometragem: TFloatField
      FieldName = 'Kilometragem'
    end
    object qryvendaECF: TStringField
      FieldName = 'ECF'
      Size = 50
    end
    object qryvendaCodigo_CFOP: TIntegerField
      FieldName = 'Codigo_CFOP'
    end
    object qryvendaTotal_Impostos: TFloatField
      FieldName = 'Total_Impostos'
    end
    object qryvendaData_Emissao_NFe: TDateTimeField
      FieldName = 'Data_Emissao_NFe'
    end
  end
  object qryitens_venda: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Itens_Pedido')
    Left = 96
    Top = 304
    object qryitens_vendaCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryitens_vendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_vendaN_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object qryitens_vendaCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_vendaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_vendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryitens_vendaNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qryitens_vendaOrigem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object qryitens_vendaCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryitens_vendaUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qryitens_vendaTipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object qryitens_vendaTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 10
    end
    object qryitens_vendaICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object qryitens_vendaCST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object qryitens_vendaCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object qryitens_vendaBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object qryitens_vendaBC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object qryitens_vendaValor_ICMS: TStringField
      FieldName = 'Valor_ICMS'
    end
    object qryitens_vendaTipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object qryitens_vendaMVAST: TStringField
      FieldName = 'MVAST'
      Size = 10
    end
    object qryitens_vendaICMS_ST: TStringField
      FieldName = 'ICMS_ST'
      Size = 10
    end
    object qryitens_vendaCST_ST: TStringField
      FieldName = 'CST_ST'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_ST: TStringField
      FieldName = 'Base_Reduzida_ST'
      Size = 5
    end
    object qryitens_vendaBase_Acrescida_ST: TStringField
      FieldName = 'Base_Acrescida_ST'
      Size = 5
    end
    object qryitens_vendaBC_ST: TStringField
      FieldName = 'BC_ST'
      Size = 10
    end
    object qryitens_vendaAliquota_Calculo_Credito: TStringField
      FieldName = 'Aliquota_Calculo_Credito'
      Size = 10
    end
    object qryitens_vendaCredito_ICMS: TStringField
      FieldName = 'Credito_ICMS'
    end
    object qryitens_vendaTipo_Calculo_IPI: TStringField
      FieldName = 'Tipo_Calculo_IPI'
    end
    object qryitens_vendaIPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object qryitens_vendaCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object qryitens_vendaBC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object qryitens_vendaValor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
    object qryitens_vendaTipo_Calculo_PIS: TStringField
      FieldName = 'Tipo_Calculo_PIS'
    end
    object qryitens_vendaPIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object qryitens_vendaCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object qryitens_vendaBC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object qryitens_vendaValor_PIS: TFloatField
      FieldName = 'Valor_PIS'
    end
    object qryitens_vendaTipo_Calculo_COFINS: TStringField
      FieldName = 'Tipo_Calculo_COFINS'
    end
    object qryitens_vendaCOFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object qryitens_vendaCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object qryitens_vendaBC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object qryitens_vendaValor_COFINS: TFloatField
      FieldName = 'Valor_COFINS'
    end
    object qryitens_vendaQtde: TFloatField
      FieldName = 'Qtde'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaQtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object qryitens_vendaQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qryitens_vendaQtde_S_Previsao: TFloatField
      FieldName = 'Qtde_S_Previsao'
    end
    object qryitens_vendaValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
    end
    object qryitens_vendaValor_Original: TFloatField
      FieldName = 'Valor_Original'
    end
    object qryitens_vendaValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaDesc_Acr: TFloatField
      FieldName = 'Desc_Acr'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaDesc_Acr_P: TFloatField
      FieldName = 'Desc_Acr_P'
    end
    object qryitens_vendaTipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object qryitens_vendadOUa: TStringField
      FieldName = 'dOUa'
      Size = 1
    end
    object qryitens_vendaValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryitens_vendaValor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object qryitens_vendaOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryitens_vendaSub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaSub_Total_Liquido: TFloatField
      FieldName = 'Sub_Total_Liquido'
    end
    object qryitens_vendaCancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object qryitens_vendaIndica_Valor_Total: TStringField
      FieldName = 'Indica_Valor_Total'
      Size = 1
    end
    object qryitens_vendaData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qryitens_vendaHora_Entrega: TStringField
      FieldName = 'Hora_Entrega'
      Size = 8
    end
    object qryitens_vendaTipo_Venda: TStringField
      FieldName = 'Tipo_Venda'
      Size = 1
    end
    object qryitens_vendaTipo_Entrega: TStringField
      FieldName = 'Tipo_Entrega'
      Size = 1
    end
    object qryitens_vendaComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qryitens_vendaPerc_Desc_Vista: TFloatField
      FieldName = 'Perc_Desc_Vista'
    end
    object qryitens_vendaPerc_Desc_Prazo: TFloatField
      FieldName = 'Perc_Desc_Prazo'
    end
    object qryitens_vendaPermite_Credito: TIntegerField
      FieldName = 'Permite_Credito'
    end
    object qryitens_vendaCodigo_Obs_Fiscal: TIntegerField
      FieldName = 'Codigo_Obs_Fiscal'
    end
    object qryitens_vendaQtde_Estoque_Atual: TFloatField
      FieldName = 'Qtde_Estoque_Atual'
    end
    object qryitens_vendaValor_Compra_Nota: TFloatField
      FieldName = 'Valor_Compra_Nota'
    end
    object qryitens_vendaValor_ICMS_ST: TFloatField
      FieldName = 'Valor_ICMS_ST'
    end
  end
  object qryr05: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from R05')
    Left = 96
    Top = 64
    object qryr05N_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object qryr05Data_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object qryr05Tipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object qryr05N_Fabricacao: TStringField
      FieldName = 'N_Fabricacao'
      Size = 40
    end
    object qryr05MF_Adicional: TStringField
      FieldName = 'MF_Adicional'
      Size = 2
    end
    object qryr05Modelo_ECF: TStringField
      FieldName = 'Modelo_ECF'
    end
    object qryr05COO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object qryr05CCF: TStringField
      FieldName = 'CCF'
      Size = 6
    end
    object qryr05N_Item: TStringField
      FieldName = 'N_Item'
      Size = 4
    end
    object qryr05Codigo_Produto: TStringField
      FieldName = 'Codigo_Produto'
      Size = 14
    end
    object qryr05Descricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryr05Quantidade: TStringField
      FieldName = 'Quantidade'
      Size = 7
    end
    object qryr05Unidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object qryr05Valor_Unitario: TStringField
      FieldName = 'Valor_Unitario'
      Size = 8
    end
    object qryr05Desconto: TStringField
      FieldName = 'Desconto'
      Size = 8
    end
    object qryr05Acrecimo: TStringField
      FieldName = 'Acrecimo'
      Size = 8
    end
    object qryr05Valor_Total: TStringField
      FieldName = 'Valor_Total'
      Size = 14
    end
    object qryr05Totalizador_Parcial: TStringField
      FieldName = 'Totalizador_Parcial'
      Size = 7
    end
    object qryr05Cancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 1
    end
    object qryr05Quantidade_Cancelada: TStringField
      FieldName = 'Quantidade_Cancelada'
      Size = 7
    end
    object qryr05Valor_Cancelado: TStringField
      FieldName = 'Valor_Cancelado'
      Size = 13
    end
    object qryr05Valor_Cancelamento_Acrecimo: TStringField
      FieldName = 'Valor_Cancelamento_Acrecimo'
      Size = 13
    end
    object qryr05IAT: TStringField
      FieldName = 'IAT'
      Size = 1
    end
    object qryr05IPPT: TStringField
      FieldName = 'IPPT'
      Size = 1
    end
    object qryr05Casas_Decimais_Qtde: TStringField
      FieldName = 'Casas_Decimais_Qtde'
      Size = 1
    end
    object qryr05Casas_Decimais_Valor_Unitario: TStringField
      FieldName = 'Casas_Decimais_Valor_Unitario'
      Size = 1
    end
    object qryr05Caixa: TStringField
      FieldName = 'Caixa'
      Size = 4
    end
    object qryr05Codigo_Produto_Inteiro: TIntegerField
      FieldName = 'Codigo_Produto_Inteiro'
    end
    object qryr05Codigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryr05N_Usuario: TStringField
      FieldName = 'N_Usuario'
      Size = 4
    end
    object qryr05MD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
  end
  object qryitens_os: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IOS.*, P.Codigo_Venda, P.Descricao from Itens_OS IOS'
      'inner join Produto P on(IOS.Codigo_Servico = P.Codigo)')
    Left = 176
    Top = 64
    object qryitens_osN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qryitens_osCodigo_Servico: TIntegerField
      FieldName = 'Codigo_Servico'
    end
    object qryitens_osValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qryitens_osDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryitens_osTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryitens_osSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qryitens_osCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_osDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    Left = 208
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Controla_Pedido')
    Left = 176
    Top = 112
    object IntegerField1: TIntegerField
      FieldName = 'Codigo'
    end
    object IntegerField2: TIntegerField
      FieldName = 'N_Pedido'
    end
  end
  object ds_itens_venda: TDataSource
    DataSet = qryitens_venda
    Left = 128
    Top = 304
  end
  object qryItens_Venda_Aux: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IP.*, P.Codigo_Venda, P.Descricao from Itens_Pedido IP'
      'inner join Produto P on(IP.Codigo_Produto = P.Codigo) ')
    Left = 176
    Top = 160
    object qryItens_Venda_AuxCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryItens_Venda_AuxN_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object qryItens_Venda_AuxCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryItens_Venda_AuxCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryItens_Venda_AuxDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryItens_Venda_AuxNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qryItens_Venda_AuxOrigem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object qryItens_Venda_AuxCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryItens_Venda_AuxUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qryItens_Venda_AuxTipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object qryItens_Venda_AuxTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 10
    end
    object qryItens_Venda_AuxICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object qryItens_Venda_AuxCST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object qryItens_Venda_AuxCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object qryItens_Venda_AuxBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object qryItens_Venda_AuxBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 5
    end
    object qryItens_Venda_AuxBC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object qryItens_Venda_AuxValor_ICMS: TStringField
      FieldName = 'Valor_ICMS'
    end
    object qryItens_Venda_AuxTipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object qryItens_Venda_AuxMVAST: TStringField
      FieldName = 'MVAST'
      Size = 10
    end
    object qryItens_Venda_AuxICMS_ST: TStringField
      FieldName = 'ICMS_ST'
      Size = 10
    end
    object qryItens_Venda_AuxCST_ST: TStringField
      FieldName = 'CST_ST'
      Size = 10
    end
    object qryItens_Venda_AuxBase_Reduzida_ST: TStringField
      FieldName = 'Base_Reduzida_ST'
      Size = 5
    end
    object qryItens_Venda_AuxBase_Acrescida_ST: TStringField
      FieldName = 'Base_Acrescida_ST'
      Size = 5
    end
    object qryItens_Venda_AuxBC_ST: TStringField
      FieldName = 'BC_ST'
      Size = 10
    end
    object qryItens_Venda_AuxValor_ICMS_ST: TStringField
      FieldName = 'Valor_ICMS_ST'
    end
    object qryItens_Venda_AuxAliquota_Calculo_Credito: TStringField
      FieldName = 'Aliquota_Calculo_Credito'
      Size = 10
    end
    object qryItens_Venda_AuxCredito_ICMS: TStringField
      FieldName = 'Credito_ICMS'
    end
    object qryItens_Venda_AuxTipo_Calculo_IPI: TStringField
      FieldName = 'Tipo_Calculo_IPI'
    end
    object qryItens_Venda_AuxIPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object qryItens_Venda_AuxCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object qryItens_Venda_AuxBase_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object qryItens_Venda_AuxBase_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object qryItens_Venda_AuxBC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object qryItens_Venda_AuxValor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
    object qryItens_Venda_AuxTipo_Calculo_PIS: TStringField
      FieldName = 'Tipo_Calculo_PIS'
    end
    object qryItens_Venda_AuxPIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object qryItens_Venda_AuxCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object qryItens_Venda_AuxBase_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object qryItens_Venda_AuxBase_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object qryItens_Venda_AuxBC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object qryItens_Venda_AuxValor_PIS: TFloatField
      FieldName = 'Valor_PIS'
    end
    object qryItens_Venda_AuxTipo_Calculo_COFINS: TStringField
      FieldName = 'Tipo_Calculo_COFINS'
    end
    object qryItens_Venda_AuxCOFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object qryItens_Venda_AuxCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object qryItens_Venda_AuxBase_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object qryItens_Venda_AuxBase_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object qryItens_Venda_AuxBC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object qryItens_Venda_AuxValor_COFINS: TFloatField
      FieldName = 'Valor_COFINS'
    end
    object qryItens_Venda_AuxQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryItens_Venda_AuxQtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object qryItens_Venda_AuxQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qryItens_Venda_AuxValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qryItens_Venda_AuxValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryItens_Venda_AuxValor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object qryItens_Venda_AuxOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryItens_Venda_AuxSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qryItens_Venda_AuxSub_Total_Liquido: TFloatField
      FieldName = 'Sub_Total_Liquido'
    end
    object qryItens_Venda_AuxCancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object qryItens_Venda_AuxIndica_Valor_Total: TStringField
      FieldName = 'Indica_Valor_Total'
      Size = 1
    end
    object qryItens_Venda_AuxCodigo_Venda_1: TStringField
      FieldName = 'Codigo_Venda_1'
    end
    object qryItens_Venda_AuxDescricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 50
    end
    object qryItens_Venda_AuxDesc_Acr: TFloatField
      FieldName = 'Desc_Acr'
    end
    object qryItens_Venda_AuxTipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object qryItens_Venda_AuxValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
    end
  end
  object qryfechamento_venda_aux: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Fechamento_Venda')
    Left = 177
    Top = 208
    object qryfechamento_venda_auxCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryfechamento_venda_auxForma_Pagamento: TStringField
      FieldName = 'Forma_Pagamento'
      Size = 50
    end
    object qryfechamento_venda_auxValor: TFloatField
      FieldName = 'Valor'
    end
    object qryfechamento_venda_auxData: TDateTimeField
      FieldName = 'Data'
    end
    object qryfechamento_venda_auxTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 15
    end
    object qryfechamento_venda_auxTroco: TFloatField
      FieldName = 'Troco'
    end
    object qryfechamento_venda_auxCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryfechamento_venda_auxStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qryfechamento_venda_auxCodigo_Caixa: TIntegerField
      FieldName = 'Codigo_Caixa'
    end
    object qryfechamento_venda_auxAcerto: TIntegerField
      FieldName = 'Acerto'
    end
    object qryfechamento_venda_auxCodigo_Usuario: TIntegerField
      FieldName = 'Codigo_Usuario'
    end
    object qryfechamento_venda_auxTipo: TStringField
      FieldName = 'Tipo'
      Size = 5
    end
    object qryfechamento_venda_auxMovimenta: TIntegerField
      FieldName = 'Movimenta'
    end
    object qryfechamento_venda_auxN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryfechamento_venda_auxParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qryfechamento_venda_auxCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryfechamento_venda_auxDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryfechamento_venda_auxTransferencia: TIntegerField
      FieldName = 'Transferencia'
    end
    object qryfechamento_venda_auxCodigo_Conta: TIntegerField
      FieldName = 'Codigo_Conta'
    end
    object qryfechamento_venda_auxCodigo_Operacao: TIntegerField
      FieldName = 'Codigo_Operacao'
    end
    object qryfechamento_venda_auxCodigo_Lancamento_Banco: TIntegerField
      FieldName = 'Codigo_Lancamento_Banco'
    end
    object qryfechamento_venda_auxSaldo_Anterior: TFloatField
      FieldName = 'Saldo_Anterior'
    end
    object qryfechamento_venda_auxSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
    end
    object qryfechamento_venda_auxMD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
  end
  object ImgImagens_Comandos: TImageList
    AllocBy = 0
    Height = 32
    Width = 32
    Left = 408
    Top = 8
    Bitmap = {
      494C01010A000D00100020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000780018004830280048302800483028004830300048303000483030004830
      3000483030004830300048303000483030004830300048303000483030004830
      3000503830005038300050383800503838005038380050383800503838005038
      3800503838005038380040282800882828000000000000000000000000005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0303000F08C9000F0949000F0949800F0949800F0949800F0949800F09C
      9800F09CA000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4A800F0A4
      A800F8ACA800F8ACB000F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4
      B800F8B4B800F8BCB800A87C7800882828000000000000000000000000005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0383800F0949800F0949800F0949800F0949800F09C9800F09CA000F09C
      A000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4A800F8ACA800F8AC
      B000F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4B800F8B4B800F8B4
      B800F8BCB800F8BCC000A87C7800882828000000000000000000000000005953
      450059534500D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8
      BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8
      BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE00D1C8BE005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0383800F0949800F0949800F0949800F09C9800F09CA000F09CA000F09C
      A000F0A4A000F0A4A800F0A4A800F0A4A800F0A4A800F8ACA800F8ACB000F8AC
      B000F8ACB000F8ACB000F8B4B000F8B4B800F8B4B800F8B4B800F8BCB800F8BC
      C000F8BCC000F8BCC000A87C7800882828000000000000000000000000005953
      450059534500D3CAC000EBE7E300F4F1EF00F4F1EF00F4F1EF00F4F1EF00F4F1
      EF00F4F1EF00F4F1EF00F4F1EF00F4F1EF00F4F1EF00F4F1EF00F4F1EF00F4F1
      EF00F4F1EF00F4F1EF00F4F1EF00F4F1EF00F4F1EF00EBE7E300D3CAC0005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0383800F0949800F09C9800F09CA000F09CA000F09CA000F09CA000F0A4
      A000F0A4A800F0A4A800F0A4A800F8ACA800F8ACA800F8ACB000F8ACB000F8AC
      B000F8B4B000F8B4B800F8B4B800F8B4B800F8B4B800F8BCB800F8BCC000F8BC
      C000F8BCC000F8C8C000A8847800882828000000000000000000000000005953
      450059534500D4CCC200F4F2EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F2EF00D4CCC2005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8383800F09C9800F09CA000F09CA000F09CA000F0A4A000F0A4A000F0A4
      A800F0A4A800F0A4A800F8ACA800F8ACB000F8ACB000F8ACB000F8ACB000F8B4
      B000F8B4B800F8B4B800F8B4B800F8BCB800F8BCB800F8BCC000F8BCC000F8BC
      C000F8C8C000F8C8C800A8848800883030000000000000000000000000005953
      450059534500D6CEC500F4F2F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F2F000D6CEC5005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8444000F09CA000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4
      A800F8A4A800F8ACA800F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4
      B800F8B4B800F8B4B800F8BCB800F8BCC000F8BCC000F8BCC000F8BCC000F8C8
      C000F8C8C800F8C8C800A8848800883030000000000000000000000000005953
      450059534500D7CFC700F5F3F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F3F100D7CFC7005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8444000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4A800F8AC
      A800F8ACB000F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4B800F8B4
      B800F8B4B800F8BCB800F8BCC000F8BCC000F8BCC000F8C8C000F8C8C000F8C8
      C800F8C8C800F8C8C800A8848800903030000000000000000000000000005953
      450059534500D9D1C900F5F3F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F3F100D9D1C9005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8444000F0A4A000F0A4A800F0A4A800F0A4A800F8A4A800F8ACA800F8AC
      B000F8ACB000F8ACB000F8B4B000F8B4B000F8B4B800F8B4B800F8B4B800F8BC
      B800F8BCC000F8BCC000F8BCC000F8BCC000F8C8C000F8C8C800F8C8C800F8C8
      C800F8D0C800F8D0D000A88C9000903030000000000000000000000000005953
      450059534500DAD3CB00F5F4F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F4F200DAD3CB005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000887C8800885C6800982840009808
      3000980830009008300090083000880028007800180098284000C04068009010
      3000980830009008300090083000900830008800280088183000C0647000F0AC
      B000F0BCC000F8BCC000F8C8C000F8C8C000F8C8C800F8C8C800F8C8C800F8D0
      D000F8D0D000F8D0D000A88C9000903030005953450059534500595345005953
      450059534500AB9C8C00C5BAAD00D2C9BF00D8D0C700DDD6CF00E2DDD600E7E3
      DD00ECE8E400F0EDEA00F4F2EF00F7F6F400FAFAF800FCFCFC00FEFEFE000000
      00000000000000000000000000000000000000000000F6F4F200DBD4CD005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000090646800B8204800D0306000E038
      7000E0447800E0447800E0447800D8386800B018480090083000B0184800D830
      6000E8447000E0447800E0447800E0387000D0306000A010380078002800A044
      5000F0ACB000F0C8C000F8C8C800F8C8C800F8C8C800F8D0C800F8D0D000F8D0
      D000F8D8D800F8D8D800A88C9000903030005953450059534500595345005953
      4500595345009C8B7800B5A79700C3B7AA00CBC0B500D2C9BF00D9D2C900DFD9
      D200E6E1DB00EBE7E300F0EEEA00F5F3F100F9F8F600FCFCFB00FEFEFE000000
      00000000000000000000000000000000000000000000F6F4F300DDD6CF005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8386800F85C9800FF7CC000FF84
      C000FF94E800FFA4FF00FFA4FF00FFB4F800F884C000C8386800F85C9800FF7C
      C000FF84C800FF9CF800FFA4FF00FFACFF00FFB4F000F070A800B82048007800
      1800C87C8800F8C8C800F8C8C800F8C8C800F8D0D000F8D0D000F8D0D000F8D8
      D800F8D8D800F8E0D800A89498009038380059534500595345002D8764002D87
      64002D8764002D8764002D8764002D8764002D8764002D8764002D8764002D87
      64002D8764002D8764002D8764002D8764002D8764002D8764002D8764002D87
      64002D8764002D87640096C3B1000000000000000000F6F5F300DED8D1005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8548800FF94E800FF84C800E058
      8800F0589000FF7CC000FF7CC800FFC8F800FFE0FF00FF7CC000FF7CB800FF74
      A800E0508000F064A800FF7CC000FF84C800FFE0FF00FFBCF000E05080009008
      300098304800F8C8C800F8D0C800F8D0D000F8D0D000F8D8D800F8D8D800F8D8
      D800FFE0E000FFE0E000A89498009038380059534500595345002D8764002D87
      64002D8764002D8764002D8764002D8764002D8764002D8764002D8764002D87
      64002D8764002D8764002D8764002D8764002D8764002D8764002D8764002D87
      64002D8764002D87640096C3B1000000000000000000F7F5F400E0DAD3005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F870B000FFC8FF00F870B000B820
      480088082800C8245000D8286000F064A800FFE8FF00FFD8FF00FF84C000E038
      6800B0104000C8245000E8306000C0205000F064A800FFA4F000F0649000A010
      380078002800F8D0C800F8D0D000F8D0D000F8D8D800F8D8D800F8E0D800FFE0
      E000FFE0E000FFE8E800A89C98009838380059534500595345002D8764002D87
      640061A58A00000000002D8764002D876400CAE1D80096C3B1000000000061A5
      8A002D87640096C3B100CAE1D80096C3B1000000000000000000000000000000
      000061A58A002D87640096C3B1000000000000000000F7F6F400E1DCD5005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F870B000FFE8FF00FFACE000C838
      68009008300098103800D8285800F0387000FF9CD800FFE8FF00F070A800B820
      4800B0184000D8285800D8285800E0386800FF74A800FF8CC800E0588800A010
      3800B86C7800F8D0D000F8D8D000F8D8D800F8D8D800FFE0E000FFE0E000FFE8
      E000FFE8E800FFE8E800A89CA0009838380059534500595345002D8764002D87
      640061A58A000000000061A58A0047967700D7E8E10096C3B1000000000061A5
      8A002D87640096C3B100CAE1D80096C3B100D7E8E10061A58A0061A58A0061A5
      8A003A8E6D002D87640096C3B1000000000000000000F8F6F500E3DDD7005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8688800FFBCF000FFF0FF00FF94
      D000B820480088082800A8184000E0286000F0589000FFACE000E0508000A818
      4000C8245000D8285800D8285800F86C9800FF8CD000FF74A800C8345800A020
      4000D098A800F8D8D000F8D8D800F8D8D800FFE0E000FFE0E000FFE8E800FFE8
      E800FFE8E800FFF0F000A89CA0009838380059534500595345002D8764002D87
      64002D87640061A58A0000000000B0D2C400CAE1D8002D8764000000000061A5
      8A002D87640096C3B100CAE1D80096C3B100CAE1D8002D8764002D8764002D87
      64002D8764002D87640096C3B1000000000000000000F8F7F500E4DFD9005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A07C7800E084A800FFE0FF00FFE0
      FF00E8649000A018400088082800C0204800E8306800F85C9800C8386800C020
      5000D8286000D8285800F04C7800FF84C000FF84C000E03C7000A8184000D88C
      A000F0D8D000F8D0D800FFE0E000FFE0E000FFE0E000FFE8E800FFE8E800FFF0
      F000FFF0F000FFF0F000B0A4A8009844400059534500595345002D8764002D87
      64002D87640047967700CAE1D800CAE1D8007BB49E002D876400000000007BB4
      9E0096C3B10096C3B100CAE1D80096C3B100CAE1D8002D8764002D8764002D87
      64002D8764002D87640096C3B1000000000000000000F8F7F600E6E1DC005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098848800F88CC000FFF8
      FF00FFC8F000E05080008810300090103000D0285800D8285800C0205000D828
      5800D8285800E0446800FF7CB000FF8CC800F0589000B8204800A8446000F8D0
      D000F8D8D800FFE0E000FFE0E000FFE8E000FFE8E800FFE8E800FFF0F000FFF0
      F000FFF8F800FFF8F800B0A4A8009844400059534500595345002D8764002D87
      640047967700B0D2C400CAE1D8007BB49E00D7E8E10061A58A0000000000CAE1
      D800E4F0EB00CAE1D800CAE1D80096C3B100CAE1D8002D8764002D8764002D87
      64002D8764002D87640096C3B1000000000000000000F9F8F600E7E3DE005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B87C9800F8BC
      E000FFF0FF00FFA4D800C030500090103000A0183800D8285800E0306000E03C
      7000E0446800F86C9800FF94D000F86C9800C8305800A8446000F0BCC800FFE0
      E000FFE0E000FFE0E000FFE8E800FFE8E800FFF0F000FFF0F000FFF0F000FFF8
      F800FFF8F800FFF8F800B0A4A800A044400059534500595345002D8764002D87
      640061A58A00000000002D8764002D876400CAE1D80096C3B10000000000B0D2
      C40061A58A00CAE1D800CAE1D80096C3B100CAE1D8002D8764002D8764002D87
      64002D8764002D87640096C3B1000000000000000000F9F8F700E9E5E0005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000090747800E064
      8800FFB4E000FFB4F000F0689800B820480098103800C8245000E0306000F854
      8800FF94C800FFC8F000FF94D000D038600098103800B86C7800F8D8D800FFE0
      E000FFE8E000FFE8E800FFE8E800FFF0F000FFF0F000FFF0F000FFF8F800FFF8
      F800FFFFFF00FFFFFF00B0ACB000A044400059534500595345002D8764002D87
      64004796770096C3B1002D8764002D8764007BB49E0061A58A0096C3B1004796
      77002D87640061A58A007BB49E0061A58A007BB49E002D8764002D8764002D87
      64002D8764002D87640096C3B1000000000000000000F9F8F700EAE6E2005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0606800E844
      7000FF8CC800FF94C800E0507800B0204800B8204800D8305800E0306000E838
      6800FF84B800FFF0FF00FFD8F800E0588800A018380088183000D098A800FFE8
      E800FFE8E800FFE8E800FFF0F000FFF0F000FFF8F800FFF8F800FFF8F800FFFF
      FF00FFFFFF00FFFFFF00B0A4A800A044400059534500595345002D8764002D87
      64002D8764002D8764002D8764002D8764002D8764002D8764002D8764002D87
      64002D8764002D8764002D8764002D8764002D8764002D8764002D8764002D87
      64002D8764002D87640092BEAC00F6F4F300F4F2EF00EEEBE700E1DBD4005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000907C7800D0386000FF7C
      A800FF94D000F0689800C0245000B0204000D8305800D8305800B8204800D830
      5800F04C7800FFB4E000FFFFFF00FFB4D800D044680088102800A0445000F8E0
      E000FFF0F000FFF0F000FFF0F000FFF8F800FFF8F800FFF8F800FFFFFF00FFFF
      FF00FFF8F800FFF0F000A89CA000A04440005953450059534500595345005953
      450059534500A7988600B8AA9A00C3B7AA00CBC0B500D2C9BF00D9D2C900DFD9
      D200E6E1DB00EBE7E300F0EEEA00F5F3F100F9F8F600FBFBFA00FAFAF900F6F4
      F200F0EDE900E8E4DF00E0DAD400D7CFC700CDC4B900C3B8AA00B9AB9B005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000090747800C0406800F86C9800FF9C
      D000FF7CA800D0386000B0204000C0245000D8306000C8345800A0204000B020
      4000E0386000F85C9000FFD0F000FFF0FF00FF9CC800B828500088082800D098
      A800FFE8E800FFF8F800FFF8F800FFF8F800FFFFFF00FFFFFF00FFFFFF00FFF8
      F800FFE8E800F8E0E000A88C9000A04C48005953450059534500595345005953
      450059534500BAAE9F00C9BEB200D2C9BF00D8D0C700DDD6CF00E2DDD600E7E3
      DD00ECE8E400F0EDEA00F4F2EF00F7F6F400FAFAF800FAFAF900E1DDD800A098
      8700A0988700A0988700A0988700A0988700A0988700A0988700A09887005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A0606800F04C7800FF94C800FF94
      C000D84C7000B0204800B8284800D8386000D8305800E8446800C03458009010
      3000B8285000E8446800FF7CB000FFF0FF00FFE8FF00E86C9800A02040007818
      3000E0B8B800FFF8F800FFF8F800FFFFFF00FFFFFF00FFFFFF00FFF0F000FFE8
      E800F8E0E000F8D8D000A8848800A04C48000000000000000000000000005953
      450059534500F0EEEA00FBFAF900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAF8F700DCD8D200A098
      8700D5D1CA00E7E5E100E7E5E100E7E5E100E7E5E100E7E5E100C8C5BE005953
      4500595345000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F04C7800FF9CD000FF9CD000F064
      9000B8284800B0204000D8305800D8305800E0446800FF7CA800E85C88009818
      380090183000C8345800E8446800FFA4D000FFF8FF00FFC8E800D84C70008810
      3000B87C9800FFFFFF00FFFFFF00FFFFFF00FFF8F800FFF0F000F8E0E000F8D8
      D800F8D0C800F0C8C000A07C7800A84C48000000000000000000000000005953
      450059534500F2EFED00FBFBFA00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F5F300D7D2CA00A098
      8700E7E5E10000000000000000000000000000000000DFDEDC00635D50005953
      4500787368000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7CB000FFD0FF00F88CB800C030
      500098183000A8204000B8284800D0386000F8709800FF9CC800FF8CB800C034
      580088102800A0183800B8284800D0446800FFB4D800FFD8F800E86C9800A018
      380078183000FFFFFF00FFFFF800FFF8F800FFE8E800F8E0E000F8D8D000F8D0
      C800F0BCC000F0B4B800A0747000A84C48000000000000000000000000005953
      450059534500F3F1EF00FCFBFB00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F0ED00D1CAC100A098
      8700E7E5E100000000000000000000000000DFDEDC00635D5000595345007873
      6800F5F5F4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF8CB800FFF8FF00FFACD800C040
      68009818380098183800A0204000C8345800FF8CB800FF9CC800FFC8F000F884
      B000B83048009818380098183800A8204000E85C8800FFA4D800F0649000A820
      4000A0445000FFF8F800FFF0F000F8E8E000F8D8D800A89CA000686C6800686C
      6800686C6800686C6800484C4800A84C48000000000000000000000000005953
      450059534500F5F3F100FCFCFB00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEBE800CAC2B800A098
      8700E7E5E1000000000000000000DFDEDC00635D50005953450078736800F5F5
      F400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F07CA000FFE8FF00FFF8FF00F8A8
      C800E8649000E0648800E0648800F8709800FF94C000FF84A800FFD8E000FFE0
      F800F88CC000E8649000E0648800E8649000FF84B000FF94C000D84C7000A830
      4800E0B8B800FFF0E800F8E0E000F8D8D800F8D0C800A8949800B8ACB000A88C
      900090646800A0606800684C4800000000000000000000000000000000005953
      450059534500F6F5F300FCFCFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAE6E100C3BAAE00A098
      8700E7E5E10000000000DFDEDC00635D50005953450078736800F5F5F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098848800D098A800FFE8FF00FFF8
      FF00FFE0FF00FFD0FF00FFD0FF00FFBCF800FF8CB800E84C7000F88CB800FFE8
      F800FFF8FF00FFD8FF00FFD0FF00FFC8FF00FFB4E800F8709800C8345800C87C
      8800F8E0D800F8E0D800F8D0D000F8C8C800F0BCB800A8949800E0B8B800C88C
      9000A07470008854500000000000000000000000000000000000000000005953
      450059534500F8F7F500FCFBFA00FDFDFC00FDFDFC00FDFDFC00FDFDFC00FDFD
      FC00FDFDFC00FDFDFC00FDFDFC00FDFDFC00FDFDFC00E4DFD900BBB1A300A098
      8700E7E5E100DFDEDC00635D50005953450078736800F5F5F400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098848800D88CA000FF8C
      B800FF94C000FF8CB800FF8CB800FF7CA800D84C7000C86C7800F8ACC000F8A8
      C800FF94B800FF8CB800FF8CB800FF84B800F86C9800E05C7000E094A000F0D8
      D000F8D8D800F8D0D000F0C8C000F0B4B800F0ACB000A88C9000C88C9000C86C
      7800885450000000000000000000000000000000000000000000000000005953
      450059534500FAF9F700FAF9F700FAF9F700FAF9F700FAF9F700FAF9F700FAF9
      F700FAF9F700FAF9F700FAF9F700FAF9F700FAF9F700DDD6CF00B3A79700A098
      8700C8C5BE00635D50005953450078736800F5F5F40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07C7800FFE8E800FFE8E800FFF0F000FFF0F000FFF0F000FFF8F800FFF8
      F800FFFFFF00FFFFFF00FFFFFF00FFF8F800FFF0F000FFE8E800F8E0D800F8D0
      D000F8C8C800F0BCC000F0B4B000F0ACA800E8A4A000A88C9000A06068008854
      5000000000000000000000000000000000000000000000000000000000005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345005953450078736800F5F5F4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07C7800FFE8E800FFF0F000FFF0F000FFF8F800FFF8F800FFF8F800FFFF
      FF00FFFFFF00FFFFFF00FFF8F800FFF0F000F8E8E000F8D8D800F8D0D000F0C8
      C000F0BCB800F0ACB000E8A4A000E89CA000E8949800A8848800885450000000
      0000000000000000000000000000000000000000000000000000000000005953
      4500595345005953450059534500595345005953450059534500595345005953
      4500595345005953450059534500595345005953450059534500595345005953
      45005953450078736800F5F5F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00000000000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080006E6E6E006E6E6E006E6E6E006E6E6E008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF000000000000000000FFFEFF00FAFB
      FF00EFF1F900E4E6F100DBDDE800D8DAE500D7D9E400DADBE500E3E3E900EDEE
      F200F8F7F900FEFEFE000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A79000DFA79F00D09F9000CF979000CF97
      9000CF979000CF979000CF979000C0979000C0978F00C0978F00C0978F00C097
      8F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C097
      8F00C0979000DF978F0060676000000000000000000000000000808080006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E
      6E006E6E6E000176A9000171A3000171A3000273A5000275A800016FA2005C5C
      5C006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FFFFFE00000000000000
      000000000000000000000000000000000000FCFEFE00F6F8F900E6E7EB00CCCE
      D900AEB2CB009398B9008187AC00797FA400787FA0008084A0009496A800A9AA
      B400C2C3C700DCDCDC00F0F0F000FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0AFAF00FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD09F00DF978F0060676000000000000000000058585800585858005858
      5800585858005858580058585800585858005858580058585800585858005858
      58005858580015ADD9002BC1EB002AB8DF0029B9DE0028C0EA00057EAF005858
      5800585858005858580058585800585858005858580058585800585858005858
      58005858580058585800585858005C5C5C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FFFFFE00000000000000
      00000000000000000000FDFEFF00F6F7FF00E0E4F700BBC0DF008E94BF006F76
      AD005A65A9004955A300414D9F00414D9F00424E9C00535DA3005C649F00585E
      8D006065860083869B00B0B2BD00D8D8DE00F4F3F500FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CFB7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8B000FFD0B000FFD0
      B000FFD8C000DF978F0060676000000000000000000099999900A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A6009090
      90007373730025A4CD0073D6EE0086EAFF007FE5FF006CD5F100187296007B7B
      7B00A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600585858005C5C5C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFEFF00F2F3FD00CDD0EC008D95D0005864BC001A299D001023
      A8001226B400162ABD001629C000162ABF000D22B3000D20AB000B1B9D001220
      91003E49A30050599900575D8200888A9C00C0C0C600EAEAEA00F9FBFB00FDFF
      FF0000000000FEFEFE00FFFFFE00FFFFFE000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8
      B000FFD8C000DF978F0060676000000000000000000099999900FFF1DF00FFF1
      DF00FFF1DF00FFF1E000FFF1E000FFF1DF00FFF1DF00F2E5D4008E8881004D4D
      4D005C5C5C003535350068787C009EBBC000ABCFD9005C666A0080666600B0A6
      A6007F7E7B00A59E9300F2E5D400FFF1DF00FFF1DF00FFF1DF00FFF1DF00FFF1
      DF00FFF1DF00FFF1DF00585858006E6E6E000000000000000000000000000000
      0000000000000000000000000000969694008077730080777300877B7A00817C
      7E0080777300877B7A00877B7A00817C7E0080777300877B7A0080777300877B
      7A00817C7E0080777300877B7A00817C7E0080777300877B7A00817C7E008077
      73007A716D00807773000000000000000000000000000000000000000000FDFF
      FF00FCFCFF00E9EDFF00BAC0EB006A73BC002936A2001F31BA001F36D8001E35
      E8001C34EC001932EC001932EE001932EC001B33EB001D34E7001B30DF001429
      C8000B1EA90012209000434D9B004E5586006C708900ABADB700E1E2E600F8FA
      FA000000000000000000FFFFFE00FFFFFE000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8EF00FFE8D000FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000099999900999999009999
      9900999999009999990099999900999999006E6E6E004949490096969600F2F2
      F200C0C0C000A3A3A3006E6E6E00504D4D0080666600C2939300B8929200DAD4
      D400FFFFFF00E6E6E600868686006D6D6D008C8C8C0099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      00000000000000000000000000009B512A008F3C10008F3C10008F3C10008F3C
      10008F3C10008F3C10008F3C10008F3C10008F3C10008F3C10008F3C10008F3C
      10008F3C10008F3C10008F3C10008F3C10008F3C10008F3C10008F3C10009542
      180095421800675754000000000000000000000000000000000000000000FBFE
      FF00F0F1FF00B3B9EE004856C0002135C3002238DD001B35E7001932EE001731
      F0001530F200152FF300152FF300152FF3001530F2001731F0001731F0001933
      EB001D35E5001329C800091CA300202E9400525B9A005F648300A8AAB400E7E7
      E700FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0B7B000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFE0C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      00000000000000000000000000006060600082828200EAEAEA00F2F2F200EEEE
      EE00BDBDBD00B0B0B000B3B3B300BBAEAE00AD8686007A6D6D006F6F6F007E7E
      7E009B9B9B00D2D2D200F3F3F300F2F2F200A6A6A60099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC9C8100D3BBAD00D3BBAD00D3BBAD00D3BB
      AD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00D3BB
      AD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00D3BBAD00DBC4
      B100C58B5400725D5500000000000000000000000000FFFEFF00FDFEFF00F2F5
      FF00BCC3FA004552B4002638D1001B33EB001530F200142EF600142FF5001530
      F2001932EE001B33EB001B33E9001B33EB001731EF001530F200132EF400142F
      F500152FF3001932EC001A32DE000A1EAC0015238900555E9D00686B8700B9B8
      C100F1F0F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0
      C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000007A7A7A006D6D6D00D6D6D600F6F6F600F2F2F200EEEEEE00EAEA
      EA00BABABA00ADADAD00B0B0B000ABABAB003D3D3D00505050005F5F5F006F6F
      6F007E7E7E008E8E8E009D9D9D00C5C5C500EAEAEA00FFFFFF00CCCCCC00A6A6
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E68B2500DFF4FB00E4F1F500EEFDFF00EEFD
      FF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00EEFD
      FF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00EEFDFF00E4F7
      FE00C7A79000725D5500000000000000000000000000FDFEFF00FAFAFF00D6DC
      FF005C6BD900273BD6001D34E8001530F200142FF500142FF5001530F2001B33
      E9002239DB00273CD300293DD200283CD7002037E1001B33EB001530F200142E
      F600142FF5001630F4001731EF001B33DF000B1EAF00202D970050558C007E7F
      9400CFCED700FBF9F90000000000000000000000000000000000C05750009077
      7F006F676F000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F006067600000000000000000000000000000000000A0A0
      A00064646400C3C3C300FBFBFB00F6F6F600F2F2F200EEEEEE00EAEAEA00E6E6
      E600B6B6B600AAAAAA00ADADAD00B0B0B0008B8B8B006D6D6D00575757005F5F
      5F006F6F6F007E7E7E008E8E8E009D9D9D00AFAFAF00C6C6C600E6E6E600FAFA
      FA007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E68B2500E4F7FE00D5E1E500C2CDD000C1CD
      CE00C1CDCE00C2CDD000C2CDD000C1CDCE00C2CDD000C1CDCE00C1CDCE00C2CD
      D000C1CDCE00C1CDCE00C2CDD000C1CDCE00C2CDD000C1CDCE00C1CDCE00EAFD
      FF00C7A79000725D5500000000000000000000000000FAFCFF00E6E9FF008A95
      E700293DD2001831EB00152FF3001530F2001B33E9002037E000273CD400475A
      DF007787F800A0AEFF00A7B4FF009EABFF007483FD003D51DF001E36E2001731
      EF00152FF500142EF600142FF5001731EF001B33E1000C1DA900313B9200494E
      7B009E9EAE00ECEAEA00000000000000000000000000AF5750007F878F009F77
      9F00CF879F00705F6F0000000000DFBFB000EFE8EF00FFE8DF00FFE8DF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000A1A1A100A1A1
      A100FEFEFE00FBFBFB00F6F6F600F2F2F200EEEEEE00EAEAEA00E6E6E600E2E2
      E200ABABAB00A7A7A700AAAAAA00ADADAD00B0B0B000B3B3B300B6B6B6009999
      990084848400757575007E7E7E008E8E8E009D9D9D00A7A7A7008D8D8D007171
      71007E7E7E000000000000000000000000000000000000000000000000009696
      94008077730080777300877B7A00E68B2500E1F6FE00E1EEF200E4F1F500E4F2
      F400E4F2F400E4F1F500E4F1F500E4F2F400E4F1F500E4F2F400E4F2F400E4F1
      F500E4F2F400E4F2F400E4F1F500E4F2F400E4F1F500E4F2F400E4F2F400E9FB
      FF00CFAC8E00725D5500000000000000000000000000F1F4FF00ADB8FF00394B
      CE001E36E200152FF300142EF6001B33EB00293DD2005E6CDC00CDD6FF00ECF2
      FF00EFF4FF00F1F6FF00F3F5FF00F1F5FF00EBF1FF00D0DBFF00788BFF001E36
      E2001731F000142EF600142EF600142EF2001931EF001A30D5000D1D9800515B
      A90070748D00D0D0D000FBFAFC00FFFEFF00000000007F776F003077D0005F67
      A000A08FA000D08F9F00705F6000DFBFB000EFF0EF00FFE8DF00FFE8DF00FFE8
      DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8
      C000FFD8C000DF978F0060676000000000000000000000000000A2A2A200D0D0
      D000FBFBFB00F6F6F600F2F2F200EEEEEE00EAEAEA00E6E6E600B4B4B4007575
      7500666666007A7A7A008B8B8B00A2A2A200ADADAD00B0B0B000B3B3B300B6B6
      B600B9B9B900B7B7B700A2A2A200909090004E4E4E0033333300B9B9B9007878
      78007E7E7E000000000000000000000000000000000000000000000000009B51
      2A008F3C10008F3C10008F3C1000E68B2500E4F7FE00D9E6EA00C7D4D900C6D3
      D800C6D3D800C7D4D900C7D4D900C6D3D800C7D4D900C6D3D800C6D3D800C7D4
      D900C6D3D800C6D3D800C7D4D900C6D3D800C7D4D900C6D3D800C6D3D800EAFD
      FF00CFAC8E00745E55000000000000000000FBFBFF00DFE5FF005A6AE2002238
      DE001932EE00142EF2001B32EC00253BD7008F9DFF00E4EEFF00F6F8FF00FCFD
      FF00FFFEFF0000000000FFFEFF00FBFCFF00F4F7FF00D7E0FF004051D6001E36
      E2001731F000142EF600152FF700142EF600152FF5001B33E9001325BE00202D
      970052567F00AFB2B700F1F0F400FFFEFF00000000005FBFFF0030A7FF003077
      D0005F67A000A08FA000CF879F00706F6F00EFF0EF00FFF0DF00FFE8DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000A4A4A400CECE
      CE00F6F6F600F2F2F200EEEEEE00E1E1E100A7A7A7007676760092929200C3C3
      C300ADADAD008F8F8F00818181006E6E6E00737373008F8F8F00A7A7A700B3B3
      B300B6B6B600B9B9B900BCBCBC00BFBFBF00C3C3C300A1A1A100C8C8C8008989
      89007E7E7E00000000000000000000000000000000000000000000000000CC9C
      8100D3BBAD00D3BBAD00D3BBAD00E68B2500E2F6FB00E5F2F100EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EAFB
      FB00CFAC8E00745E55000000000000000000F3F5FF00BAC4FF002B3DD0001932
      EE00152FF3001B33EB00273BD600818FFF00E8EFFF00F6FAFF00FBFDFF00FFFE
      FF0000000000FFFEFF00FFFEFF00F4F6FF00BAC4FF004959D4002339DF001731
      EF00142EF400142EF600142EF600142EF600142EF6001931EF001D34DE000D1C
      9B0058609B008E92A400E1E1E70000000000000000007F87B00060D8FF003FAF
      FF003077CF005F6FAF00A08FA000CF879F008F778F00FFF0E000FFF0DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000A5A5A500CBCB
      CB00F2F2F200E5E5E500A9A9A9007676760094949400CECECE00DADADA00D6D6
      D600B3B3B3009E9E9E00A2A2A200A4A4A4009A9A9A0083838300737373007474
      740088888800A7A7A700B9B9B900BCBCBC00BFBFBF0070A0800059AF76007777
      77007E7E7E00000000000000000000000000000000000000000000000000E68B
      2500DDFAFF00DAF1F800DDF4FC00E68B2500E4F7FE00D9E6EA00C7D4D900C6D3
      D800C6D3D800C7D4D900C7D4D900C6D3D800C7D4D900C6D3D800C6D3D800C7D4
      D900C6D3D800C6D3D800C7D4D900C6D3D800C7D4D900C6D3D800C6D3D800EAFD
      FF00D3AD8700766055000000000000000000E6EEFF007884E2002238DD00132D
      F500142EF6001E36E4003545C000D5DEFF00F4F8FF0000000000000000000000
      0000FFFEFF00FAFCFF00F3F7FF00BEC7FF003040BB002239DB001932EE00152F
      F3001731F0001932EC001B33EB001932EE00152FF3001530F2001B33EB001425
      B4004D58A200767A9700D6D7E1000000000000000000000000008F87B0005FD0
      FF0040AFFF003077D0005F67A000A08FA000CF879F00706F7000FFF0E000FFF0
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      C000FFD8C000DF978F006067600000000000000000000000000086868600B7B7
      B700999999006E6E6E00A5A5A500DADADA00DEDEDE00DADADA00D6D6D600D3D3
      D300EBEBEB00E1E1E100CECECE00B8B8B800A8A8A800A7A7A700AAAAAA00A4A4
      A4008F8F8F0074747400707070008B8B8B00ACACAC006E9E7E0056BF79006565
      65007E7E7E00000000000000000000000000000000000000000000000000E68B
      2500DFF4FB00E4F1F500EEFDFF00E68B2500E2F6FB00E5F2F100EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EAFB
      FB00D3AD8700766055000000000000000000DAE5FF003E4FC4001E36E200132D
      F500152FF5002439DB006772CE00EDF3FF00FAFBFF000000000000000000FFFE
      FF00FDFEFF00F3F6FF00B8C3FF002E40BD002238DD001932EE00152FF3001731
      EF001E36E4002D43E300556AFF002439DB001932EE00152FF3001731EF00182C
      C70037439B0062689100CDCFDA00FFFFFE000000000000000000000000008F87
      AF0050BFFF003FA7FF003087EF005F67A000A08FA000CF879F00706F7000FFF0
      E000FFF0E000FFF0DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000000000007D7D7D007777
      7700B8B8B800E6E6E600E2E2E200DEDEDE00DADADA00D6D6D600D1D1D100DEDE
      DE00EEEEEE00E2E2E200EBEBEB00EAEAEA00E8E8E800DADADA00C7C7C700B5B5
      B500ADADAD00B0B0B000AEAEAE00979797008080800063636300656565007979
      79007E7E7E00000000000000000000000000000000000000000000000000E68B
      2500E4F7FE00D5E1E500C2CDD000E68B2500E4F7FE00D5E1E500C2CDD000C1CD
      CE00C1CDCE00C2CDD000C2CDD000C1CDCE00C2CDD000C1CDCE00C1CDCE00C2CD
      D000C1CDCE00C1CDCE00C2CDD000C1CDCE00C2CDD000C1CDCE00C1CDCE00EAFD
      FF00DBB28200766055000000000000000000B2C2FF002E41C8001C33E600142F
      F5001530F2001F34CC0098A2E800F6F8FF00FBFDFF0000000000FFFEFF00FAFC
      FF00F1F6FF00BCC7FF002E40BD002238DE001932EE00152FF5001731F0002037
      E1003649D0008293FF00B1C1FF002C3FCA001D34E800142FF500152FF3001F35
      D500172585005D639200C9CCDB00FFFFFE000000000000000000000000000000
      00008F87AF0060E0FF003FAFFF003077CF005F6FAF00A08FA000D087A000FFF0
      E000CFBFBF00BFAFAF00BFAFAF00BFAFAF00BFAFAF00C0A7AF00BFAFAF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE8CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000000000007F7F7F00D7D7
      D700E6E6E600E2E2E200DEDEDE00DADADA00D6D6D600D1D1D100D4D4D400F1F1
      F100BFBFBF00B9B9B900B3B3B300B8B8B800D1D1D100E3E3E300E7E7E700E6E6
      E600E1E1E100CFCFCF00C3C3C300B6B6B600B6B6B600B4B4B400A1A1A1007373
      73007E7E7E00000000000000000000000000000000000000000000000000E68B
      2500E1F6FE00E1EEF200E4F1F500E68B2500E1F6FE00E1EEF200E4F1F500E4F2
      F400E4F2F400E4F1F500E4F1F500E4F2F400E4F1F500E4F2F400E4F2F400E4F1
      F500E4F2F400E4F2F400E4F1F500E4F2F400E4F1F500E4F2F400E4F2F400E9FB
      FF00DBB282007A6255000000000000000000A4B4FF002B3DD0001B33E900152F
      F3001731EF00192CBD00B4BDFC00F8FBFF00FDFDFF00FFFEFF00FDFEFF00F3F7
      FF00B8C5FF002E40BD002137DC001932EE00152FF3001731F0001E36E400374A
      D100C2CCFF00D5DCFF00DBE6FF004F5FD7001E36E200142EF600142FF5002238
      DD00172388005B629400C9CCDB00000000000000000000000000000000000000
      0000000000008F87B0005FD0FF00309FFF003077D00050677F00706F90008F87
      7F00AF878F00A07F7F00A07F7F00A0676F00B0878F00AF779000906760009F6F
      8F00E0D0CF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0
      CF00FFD8C000DF978F006067600000000000000000000000000081818100E6E6
      E600E2E2E200DEDEDE00DADADA00D6D6D600D1D1D100CFCFCF00EFEFEF00D1D1
      D100C5C5C500EFEFEF00EEEEEE00E8E8E800D2D2D200BDBDBD00B2B2B200BBBB
      BB00CECECE00E0E0E000E3E3E300E1E1E100D8D8D800CDCDCD00C3C3C3008989
      89007E7E7E00000000000000000000000000000000000000000000000000E68B
      2500E4F7FE00D9E6EA00C7D4D900E68B2500E4F7FE00D9E6EA00C7D4D900C6D3
      D800C6D3D800C7D4D900C7D4D900C6D3D800C7D4D900C6D3D800C6D3D800C7D4
      D900C6D3D800C6D3D800C7D4D900C6D3D800C7D4D900C6D3D800C6D3D800EAFD
      FF00DBB282007A6255000000000000000000798AFF00273CD4001C34EC00152F
      F3001932EC001226B300B4BDFC00F8FAFF00FBFDFF00FAFCFF00F3F7FF00BEC7
      FF002E40BD002038DE001732EE00152FF3001731F0002037E100374AD100BDC8
      FF00F1F5FF00F4F5FF00E8EDFF005E6BD7002037E000152FF700142EF6002238
      DE001723880061689900CCCFDE00000000000000000000000000000000000000
      000000000000000000008F87AF005FD0FF0060A7FF00908FAF00A08FA000AF8F
      9F00BF7F7F00E0C8A000FFF0C000FFFFD000FFFFDF00FFFFD000EFD0BF00BF87
      7F00A07F8F00EFD0C000FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFD8C000DF978F00606760000000000000000000000000008D8D8D00D9D9
      D900DEDEDE00DADADA00D6D6D600D1D1D100D0D0D000EFEFEF00D3D3D300BBBB
      BB00F2F2F200F1F1F100EFEFEF00EEEEEE00EDEDED00EBEBEB00EAEAEA00DFDF
      DF00CACACA00B6B6B600B1B1B100BEBEBE00CFCFCF00E0E0E000DEDEDE008888
      88007E7E7E00000000000000000000000000000000000000000000000000E68B
      2500E2F6FB00E5F2F100EBF8F800E68B2500E2F6FB00E5F2F100EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EAFB
      FB00DBB282007A6255000000000000000000788AFF00273BD6001B33EB00152F
      F3001932EC001024B2008C96DC00F4F7FF00FAFBFF00F3F6FF00B8C3FF002E40
      BD002238DD001732EE00152FF3001731EF001E36E400374AD100C2CCFF00F1F5
      FF00FBFBFF00F8F9FF00E9EDFF00606DD7002237E000142FF500152FF7002238
      DD00172585007379A600D4D7E600000000000000000000000000000000000000
      000000000000000000000000000090C8EF00D0D8EF00D0C8D00090776F00E0A7
      9000FFF0B000FFFFDF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFFE000FFFF
      E000C08F90009F6F8F00E0D0CF00FFE8CF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000008D8D
      8D00DADADA00D6D6D600D1D1D100D6D6D600DFDFDF00B0B0B0009A9A9A00D1D1
      D100F4F4F400F2F2F200F1F1F100EFEFEF00EEEEEE00EDEDED00EBEBEB00EAEA
      EA00E8E8E800E7E7E700E6E6E600DBDBDB00BEBEBE00ABABAB00D0D0D0007B7B
      7B0000000000000000000000000000000000000000000000000000000000E68B
      2500E4F7FE00D9E6EA00C7D4D900C2884000BB884600BB884600BA874500BA87
      4500BA874500BA874500BA874500BB884600BA874500BB884600BB884600BB88
      4600BB864300BB864300BC874500BA874500BB864300BC874300C2884000C58B
      5400D28632007A695700000000000000000098A9FF00293CD3001B33EB001630
      F4001732EE001429C0005963BA00EAF1FF00ECF2FF00BFC9FF002E3FBE002339
      DF001932EE00152FF3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFD
      FF00FFFEFF00F8F9FF00E0E6FF005B69DA002037E100142FF5001530F600243A
      DA00404CA4008E94B900E2E4EF00000000000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFF8FF00C0A7AF00EFB79000FFE8
      BF00FFF8CF00FFF8CF00FFFFD000FFFFD000FFFFEF00FFFFEF00FFFFFF00FFFF
      FF00FFFFF000B07F7F0070576F00DFC8C000FFE8DF00FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000808080009696960097979700AAAAAA009B9B9B00B0B0B000AFAFAF009494
      94008A8A8A0096969600A3A3A300BDBDBD00D5D5D500EEEEEE00EDEDED00EBEB
      EB00EAEAEA00E8E8E800E7E7E700E6E6E600B5B5B500C8C8C800818181000000
      000000000000000000000000000000000000000000000000000000000000E68B
      2500E2F6FB00E5F2F100EBF8F800C0680900BC5B0000BB5B0000BB5B0000B95C
      0000B95C0000BB5B0000BB5B0000BB5B0000BB5B0000BB5B0000BB5D0000B95C
      0000BF630000D2863200C0680900C0680900D4802200B05F09002557FF004873
      FF00CC7511007A6957000000000000000000A6B6FF002D40CB001B34E800142F
      F5001531F000152BD00012209000C2CDFF00B1BFFF003447C8002238DE001932
      EE001630F4001731EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FFFE
      FF0000000000F3F6FF00C0CBFF003042C5001C34E4001530F600152FF3002438
      D3005861AB00B1B5CE00F1F3FB00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFF8FF00DFAFAF00FFE8B000FFFF
      D000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8D0009F5F6F00C0A7AF00FFE8DF00FFE8DF00FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      00000000000000000000A3A3A300EAEAEA00EAEAEA00EAEAEA00B6B6B600ABAB
      AB00B2B2B200B9B9B900BFBFBF00ADADAD009F9F9F008E8E8E009D9D9D00A1A1
      A100C1C1C100E2E2E200DEDEDE00B6B6B600C5C5C50084848400000000000000
      000000000000000000000000000000000000000000000000000000000000E68B
      2500E4F7FE00D5E1E500C2CDD000CC751100E28E2C00E58F2D00E68B2500E68E
      2900E68D2700E68B2200E48C2300E68B2200E5871A00E5871A00E5871A00E587
      1A00E68B2200F4A64D00E9912C00E9912C00F4A64D00D28632002557FF006B8F
      FF00D48022009D9081000000000000000000D8E4FF003445BE001E36E400142F
      F5001430F3001D34E7000B1CAB003B4CD1002B40D7001F36E0001731EF00152F
      F3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFDFF00FFFEFF00FDFF
      FF00FBFDFF00E1E7FF00828FFB00253BD6001B33EB00152FF3001B32EC002032
      BF00727AB600D4D4E400FCFCFF00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000EFC8DF00FFC8AF00FFF8D000FFE8
      BF00FFE8B000FFFFCF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFE000FFFFDF00B0877F007F677000FFE8DF00FFE8DF00FFE8DF00FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      000000000000000000009D9D9D00F7F7F700F8F8F800FAFAFA00DADADA00C7C7
      C700C1C1C100B2B2B200B9B9B900BFBFBF00C6C6C600CDCDCD00D3D3D300D3D3
      D300A2A2A200ABABAB00B1B1B100A2A2A2009393930000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E68B
      2500E1F6FE00E1EEF200E4F1F50000000000E2963C00E2963C00E4913100E491
      3100E4913100E58F2D00E4913100E4913100E28E2C00E38D2900E38D2900E38B
      2500E38B2500E2892100E38B2500E38B2500E38B2500E38D2900E38D2900E88F
      2900D5985100000000000000000000000000E4EDFF006D7ADC002339DF00142E
      F600142FF5001731F0001128D800162EDC001B33E9001731EF00152FF3001731
      EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FEFDFF0000000000FBFD
      FF00F4F8FF00A4ADF1003D50DB001C34EA001730F2001931EF002237E0003A4A
      C2009FA4D100ECECF200FFFEFF00FFFEFF000000000000000000000000000000
      0000000000000000000000000000F0D8BF00DF9F9F00FFD0AF00FFF8CF00FFD8
      A000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFE000FFFFF000FFFFFF00FFFF
      E000FFFFEF00FFFFDF00DFB7AF007F5F6F00FFE8DF00FFE8DF00FFE8DF00FFE8
      DF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000096969600B9B3B300E6B6AD00FFB3A600FFB3A600FFC5
      B900FFD6CC00FFE6DF00F1E3DE00EAEAEA00E0E0E000D5D5D500D3D3D300D5D5
      D500A0A0A000B2B2B200BCBCBC00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E68B
      2500E4F7FE00D9E6EA00C7D4D900C6D3D800C6D3D800C7D4D900C6D3D800C7D4
      D900C6D3D800C7D4D900C6D3D800C6D3D800C7D4D900C6D3D800C6D3D800C7D4
      D900C6D3D800C7D4D900C6D3D800C6D3D800EAFDFF00DBB282007A6255000000
      000000000000000000000000000000000000EFF5FF00AFBAFF00293CD3001731
      F000152FF500142FF500152FF300152FF300142FF500142FF500142EF2001D34
      E7003447D800B9C5FF00EFF3FF00FBFBFF00FBFCFF00FAFCFF00F8F9FF00EFF5
      FF00D8E0FF004B58C6002238DE00152FF300152FF5001D34E7002B3DC6006C78
      D000CFD2F100FBFAFC00FFFEFF00FFFEFF000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFC8B000FFE8C000FFF8C000FFD8
      A000FFE0B000FFF8BF00FFFFD000FFFFD000FFFFE000FFFFE000FFFFE000FFFF
      EF00FFFFDF00FFFFD000EFD0A000705F6000FFF0E000FFF0DF00FFE8DF00FFE8
      DF00FFD8C000DF8F7F0060676000000000000000000000000000000000000000
      000000000000000000000000000097979700E6BA9B00FFD6AD00FFD0AA00FFCC
      A800FFC8A500FFC5A200FFC29F00FFBC9900FFCAAC00FFD3B900F2D4C600D6CC
      CC008A8A8A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E68B
      2500E2F6FB00E5F2F100EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8F800EBF8
      F800EBF8F800EBF8F800EBF8F800EBF8F800EAFBFB00DBB282007A6255000000
      000000000000000000000000000000000000FAFCFF00EAF1FF004454D6001E35
      E5001832F100142EF600142FF500142FF500142EF600152FF3001731EF002D43
      E300B6C4FF00E4EDFF00F3F5FF00F8F9FF00F4F8FF00EFF5FF00E8EEFF00919C
      F6002C3DC2002238DE001932EE00152FF500152FF5002439DB005B67C700B5BB
      E800EFF2FF0000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFD0BF00FFE0C000FFF8C000FFD8
      AF00FFF0C000FFF0BF00FFF8CF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFF
      DF00FFFFD000FFFFDF00DFB790007F676F00FFF0E000FFB7B000FFAFB000FF9F
      A000FF9F9F00DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000B9969600F9D4B200FFDBB700FFDBB700FFDB
      B700FFDBB700FFDBB700FFDBB700FFDBB700FFDAB500FFD7B000E6BA9B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C288
      4000BB884600BB884600BA874500BA874500BA874500BA874500BA874500BA87
      4500BB884600BA874500BB884600BB884600BB884600BB864300BB864300BC87
      4500BA874500BB864300BC874300C2884000C58B5400D28632007A6957000000
      00000000000000000000000000000000000000000000F3F6FF00B3BEFF002D3F
      CC001D35E500152FF300142FF500142EF600142EF6001630F400162FEB00041A
      B9003544B2007F89D700A7B0F000B6BDFC008E96DC00646FC30024319D002133
      BC001E36E400152FF300142FF5001731F0001E36E4004052D5009CA4E000E5E9
      FC00FCFCFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00E0C8C000FFE0B000FFFFDF00FFF0
      C000FFE0B000FFE0AF00FFF0C000FFF8CF00FFFFCF00FFFFD000FFFFDF00FFF8
      C000FFFFCF00FFF8CF00CF9F9000D0B7B000EFB79000F09F4000EF973000E08F
      3000DF873000BF8F6F0060676000000000000000000000000000000000000000
      0000000000000000000000000000B3888500FFDFBE00FFDFBE00FFDFBE00FFDF
      BE00FFDFBE00FFDFBE00FFDFBE00FFDFBE00FFDFBE00FFDFBE00CCA292000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C068
      0900BC5B0000BB5B0000BB5B0000B95C0000B95C0000BB5B0000BB5B0000BB5B
      0000BB5B0000BB5B0000BB5B0000BB5D0000B95C0000BF630000D2863200C068
      0900C0680900D4802200B05F09002557FF004873FF00CC7511007A6957000000
      00000000000000000000000000000000000000000000FAFBFF00EDF3FF008D98
      F200273CD4001732EE00152FF300142EF600142EF600152FF500142EED000C23
      D600071DB9000B1DAA000719A2000E20A9001225B600182DC5002437DE001E34
      E7001731F000142FF500142EF6001E36E6003042C5008590E400D7DCFD00F8FB
      FF00FFFEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00F0E8DF00E0BFA000FFFFDF00FFFF
      F000FFF8EF00FFE8CF00FFD8A000FFF0C000FFE8B000FFF0C000FFF0C000FFF0
      C000FFF8D000FFE0B0009F5F6F00E0C8D000EFBFA000FFBF5F00FFA72F00FFA7
      1F00CF8F4F006067600000000000000000000000000000000000000000000000
      0000000000000000000000000000BF958B00FFE4C800FFE4C800FFE4C800FFE4
      C800FFE4C800FFE4C800FFE4C800FFE4C800FFE4C800FFE4C800BF958A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC75
      1100E28E2C00E58F2D00E68B2500E68E2900E68D2700E68B2200E68E2900E48C
      2300E68B2200E5871A00E5871A00E5871A00E5871A00E68B2200F4A64D00E991
      2C00E9912C00F4A64D00D28632002557FF006B8FFF00D48022009D9081000000
      00000000000000000000000000000000000000000000FDFEFF00FAFBFF00EAF1
      FF006F80EF00253BD6001D34E7001731F000142FF500142FF500152FF3001731
      EF001B33EB001D34E8001D34E8001D33E9001B32EC001731EF00152FF500152E
      F600152FF5001731EF001E36E4002D3FCC00828CE400CFD5FF00F6F6FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8CF00FFFFFF00CF979F00FFE8C000FFFF
      FF00FFFFFF00FFF8EF00FFD8B000FFE0BF00FFE0AF00FFD8A000FFE0AF00FFFF
      CF00FFF8BF00CF9F8F009F6F8F00FFF0EF00EFC8AF00FFD08F00FFB75000D09F
      6000606760000000000000000000000000000000000000000000000000000000
      00000000000000000000A6787800D9B7A800FFE7CF00FFE7CF00FFE7CF00FFE7
      CF00FFE7CF00FFE7CF00FFE7CF00FFE7CF00FFE7CF00FFE7CF00BF9C99000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2963C00E2963C00E4913100E4913100E4913100E58F2D00E4913100E491
      3100E4913100E28E2C00E38D2900E38D2900E38B2500E38B2500E2892100E38B
      2500E38B2500E38B2500E38D2900E38D2900E88F2900D5985100000000000000
      00000000000000000000000000000000000000000000FFFEFF00FDFEFF00F6F9
      FF00EAF1FF00828FEB002B3FCD001D35E5001531F000142EF600142FF500142E
      F400152FF3001730F2001730F2001730F200152FF300152FF300142EF600152F
      F5001731F0001F36DF003A4CC9008A95E700D9DDFF00F6F6FF00FDFDFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00EFA7B000FFFF
      F000FFFFFF00FFF8F000FFFFD000FFE8BF00FFE0A000FFF0BF00FFFFDF00FFE0
      AF00E0AF8F00C08F7F00FFF8EF00FFF0EF00F0D0B000FFD89F00CF976F006067
      6000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A6787800F2DBCA00FFECD900FFECD900FFECD900FFEC
      D900FFECD900FFECD900FFECD900FFECD900FFECD900F2DBCA00BF9C99000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FF00F8FBFF00EBF1FF00A9B5FF004254D700253BD6001E37E1001E35E8001B33
      EB001931EF001731F0001731F0001731F0001932EE001B33E9001E35E5002238
      DE00293CD3005465DD00AFB9FF00E4E8FF00F9FAFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00FFFFFF00BF77
      8F00F0D8BF00FFF0C000FFFFD000FFFFD000FFFFD000FFF0CF00FFD8A000CF97
      9F00C0978F00EFE8EF00E0E8EF00E0E8E000F0D0B000D0AF8F00606760000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AC807D00FFF0E000FFF0E000FFF0E000FFF0E000FFF0
      E000FFF0E000FFF0E000FFF0E000FFF0E000FFF0E000D9BCB200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFF00FFFEFF0000000000FFFE
      FF00FCFCFF00F8FBFF00F1F6FF00DCE5FF0099A4F8004859C8002E41C800273B
      D6002238DE001E36E4001E34E7001F37E5002439DB00293DD2003242C4006170
      D700BAC3FF00DEE4FF00F1F4FF00FAFBFF00FDFEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD8B000FFE0BF00FFD8BF00FFD8BF00F0D0
      B000DFAFAF00DF9F9F00C0977F00CF977F00DFAFA000F0B7BF00E0B7A000DFAF
      A000EFBFAF00E0BFAF00E0BFAF00E0BFAF00EFC8AF00AF9F9000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6787800D9BFB800FFF5EA00FFF5EA00FFF5EA00FFF5EA00FFF5
      EA00FFF5EA00FFF5EA00FFF5EA00FFF5EA00FFF5EA00C5A7A300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFF00FFFEFF00000000000000
      00000000000000000000FDFEFF00F6FAFF00EAF1FF00DCE9FF00B2C1FF008194
      FF007286FF00475DFF00475BFF005167FF007487FF008EA0FF00BFCDFF00E1EA
      FF00F1F6FF00FBFDFF00FDFEFF0000000000FDFFFF00FDFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6787800CCAFAB00CCAFAB00CCB3B300CCB1AF00CCB1AF00D3BB
      B900CCB3B300CCB3B300CCB3B300CCB3B300C9AEAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F500E2E3E300EBEBEC00F2F2F100FBFB
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000929292007979790092929200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600D0D0B700EBEBCD00FFFE
      DD00FFFEDD00F3F3D500D0D0B700B9B9A5009C9C8D0083837B00666666006666
      6600666666006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F90002629C0002629C00015C9100145B87001E5F
      85002A607F004F6B7B005F747D00828D930095989A00AEAEB200B9BAB900D9DA
      D900DEDFDF00F2F2F10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000089898900484848004A4A4A003939390045454500585858007979
      7900929292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF2CD00FFFEDD00FEF9D600FFF2CD00FEEC
      C500FFE9C100FFE9C100FEEEC900FEF5D100FEFAD800FFFEDD00F3F3D500C5C5
      AF00919185006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EEF500005D9B00005D9B0001609600016096000160
      96000160960002629C0001609600015C9100145B87001E5F85002A607F004F6B
      7B005F747D009B9D9E00E2E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E8E8E007373
      73004F4F4F0054545400A9A9A900C1B9B900BD9E9E00877373004B4545003D3D
      3D004F4F4F006565650092929200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FFFEDD00FFF2CD00FEECC500FEE8BE00FEE4
      B900FEE0B500FEDEB100FEDEB100FEEEC900FEE6BC00FEE4B900FEECC500FEF5
      D100FFFEDD00F3F3D500B9B9A500666666006666660066666600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100015C9100015C
      9100015C9100015C9100015C91000968A6001C79C7001F80CF001F80CF001F80
      CF001E7CCE001C79C7001C79C7001570BF001570BF00126EB9000968A600105D
      A80002629C001E5F8500AEAEB200000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6F006F6F6F006F6F6F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E0063636300575757009797
      97008887870086868600ABABAB00B0A6A600BB9F9F00C8A7A700D5B0B000A78C
      8C007666660039393900474747005B5B5B007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FEF9D600FEEEC900FFE9C100FEE4B900FEE0
      B500FFDCAF00FED8A900FEE0B500EFF8D800FEFCE500FDE0B300FCE6C000FEEE
      C900FFEFCE00FEF5D100FEFCDA00FFFEDD00A5A5940066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100094C7B000F3E
      68000F3E68000F3E68000C4470000E6BB1001E7CCE002184D1002588D3002184
      D1002184D1002184D1001F80CF001F80CF001F80CF001E7CCE001E7CCE001C79
      C7001570BF00145B8700A5A8A700000000000000000000000000000000000000
      00000000000000000000000000008C827A004A3F37003B3B3B003D3E3F004A4A
      4A006F6F6F006F6F6F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E8E8E00585858006B6B6B00ACACAC00DCDCDC00D7D7
      D7006363630080808000A0A0A000AFA6A600938282007D737300BAA3A300BEA4
      A400CEB8B800D8B3B3009A8181004E4848003F3F3F0050505000686868009292
      9200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFAD800FEF5D100FEECC500FEE8BE00FEE4B900FEDE
      B100FFDAAC00FFD4A400FEDEB100BFE6AC008FD28300FFFFF000FFFEF500FFFF
      FC00FFFFFC00FFFEF500FEFAD800FEF9D600FFFEDD00DBDBC100666666006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A8A700EEEEEE00016096000C4470001338
      6000133860001033530006642800126EB9002588D3002A91D800268CD5002A91
      D800288FD700288FD700268CD500278DD600268CD500258AD500258AD5002184
      D1001E7CCE00145B87009B9D9E00000000000000000000000000000000000000
      00000000000000000000A5A29F008E582700A53F020080300900612B10004731
      26003D3937003C3C3D0041414200595959006F6F6F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000828282005C5C5C0082828200CACACA00DBDBDB00D7D7D700D0D0D000CACA
      CA00C6C6C6007A7A7A00979797009B96960072686800000000000E0E0E002726
      260000000000454545008A7E7E00D6B8B800BE9D9D007C6A6A00474343004848
      48005B5B5B008080800000000000000000000000000000000000000000000000
      000000000000EDEBD500FBEBC000F8E0AE00FFF2CD00FEE8BE00FEE0B500FEDE
      B100FED8A900FED1A100FEE6BC00BFE6AC000099000060BF5B00009900000099
      00000099000060BF5B00DFF2D300FEF9DE00FEFCDA00FFFEDD00AAAA9A006666
      6600000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F6006F926F0059785900E7E7E700016096000C4470001338
      60001033530002521400269051001570BF00258AD5002D94DA00258AD5002C92
      D9002C92D9002C92D900228AD5002A91D800288FD700288FD700258AD500228A
      D5002184D100145B870095989A00000000000000000000000000000000000000
      00000000000000000000A5A29F00915B2600AE430100D28A5F00D28A5F00B560
      2D00953E100075321000552E1900403530003B3B3B003D3E3F004D4D4D006F6F
      6F006F6F6F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171006565
      6500A0A0A000D4D4D400D9D9D900D4D4D400CFCFCF00CACACA00C4C4C400BDBD
      BD00B7B6B600737373008C8C8C008A8989007570700079717100554E4E002421
      210000000000000000000000000037373700DBC0C000E6BBBB00E5B9B900AF91
      91005D535300404040005C5C5C009F9F9F000000000000000000000000000000
      000000000000F8EFCF00F5D09700EDB26A00F6D9A400FEF0CA00FEE6BC00FEDE
      B100FED8A900FED1A100FFE9C100BFE6AC000099000000990000009900000099
      00000099000000990000109F0F00CFEBC200FFFEDD00FFFEDD00E6E6C9006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000CDCDCC000C94110038C34B0059785900A5A8A7000C44700009213500056E
      0A0025982A0090E5A2005FB69E001977B9002D8ED8003097DB00258AD5003097
      DB003097DB003097DB00258AD5002D94DA002C92D9002C92D900268CD500288F
      D700258AD500145B8700828D9300000000000000000000000000000000000000
      00000000000000000000A5A29F009E5D2500AB400100E8BC9C00FFF2D700FEDB
      B900F3C59900E19E6D00C8764400A9522200843B0E0064311700483226003B39
      37003E3D3C004343430000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400A0A0A000DCDC
      DC00D9D9D900D3D3D300CDCDCD00C8C8C800C3C3C300BABABA00B7B6B600B1B1
      B100A9A9A90079797900AEAEAE00BDBDBD00757575006B696900777171006961
      610000000000000000000000000010101000292929007D737300D0B4B400E6BB
      BB00F3C4C400D7AEAE0040404000929292000000000000000000000000000000
      000000000000FEF4CE00F6C08200F0B56F00F0B56F00F2BE7D00F8DAA700FEF0
      CA00FFE9C100FFDAAC00FFE9C100BFE6AC000099000000990000009900000099
      000030AC3000109F10000099000030AC2D00FEFCE500FFFEDD00FFFEDD006666
      660066666600000000000000000000000000000000000000000000000000A5A8
      A700168125002ABE3C0038C34B00056E0A002C772D00056E0A001D8D220055C0
      63007BD8920090E5A20045A286001C79C7002D8ED8003097DB00228AD5003399
      DD003097DB003097DB00268CD5003097DB002D94DA002D94DA00278DD6002A91
      D800268CD500015C910081888D00000000000000000000000000000000000000
      00000000000000000000A5A29F009E5D2500AF460600E8BC9C00FFEACE00FFE3
      C600FFE2C200FFE4C100FFE0BB00FAD0A500F3BA8600DC905A00C06930009F4A
      180069371A003C3C3D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A900BDBDBD008E8E8E00D0D0
      D000CDCDCD00C6C6C600C0C0C000BABABA00B4B4B400AEAEAE00A9A9A900BEBE
      BE00DCDCDC00EFEFEF00A4A4A4006666660098989800B9B9B900A0A0A0007A78
      7800706A6A00514B4B002B27270088878700685B5B00352E2E0069616100CFAC
      AC00DBB4B400E8BDBD0040404000929292000000000000000000000000000000
      0000EEEADC00FEECC500F2B97600F2B97600F2B97600F2B97600F2B97600F2B9
      7600F5C68A00F9DCAC00FEF6D400AFDD9D0000990000009900000099000060BF
      5B00FFFFFC00EFF8E30070C66A00009900009FD89300F9DCAC00FFFEDD008383
      7B006666660000000000000000000000000000000000F6F6F6006F926F0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE710062CF76006FD3
      84007BD8920025982A00054A2F001F80CF003295DC00389CDE00228AD500389C
      DE003399DD003399DD00278DD6003399DD003399DD003399DD002A91D8002D94
      DA002D8ED800015C91006D7C8400000000000000000000000000000000000000
      00000000000000000000A5A29F00A5602200AF4B0E00EECBB200FFEBD300FFE3
      C600FFE0C200FFDFBC00FFDDB700FFDAB200FFDDB700FFD59B00FFCB7C00ECA1
      5F00903D0C003C3B3A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A900D0D0D000CACACA00C6C6
      C600BEBEBE00B9B9B900B3B3B300ACACAC00B7B6B600D4D4D400EAEAEA00E9E9
      E900E1E1E100DEDEDE00DCDCDC00D0D0D0009B9B9B0068686800656565009797
      9700B7B6B600A5A3A300837E7E00857B7B0093848400574D4D00AC9595008A76
      760041554200AC8E8E0040404000929292000000000000000000000000000000
      0000F0E1CB00F9DCAC00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD
      7D00F4BD7D00F6C08200FEEEC90080CC7200009900000099000000990000109F
      1000CFECCB00FEFEE800FEF9E2009FD8930030AC2D00FEF6D400FEF5D1009595
      8900666666000000000000000000000000000000000075AB7500068B090018B8
      290018B829002ABE3C0034BC440043C556004CC960005CCE710062CF760074D6
      8B006FD38400025214000C4470002184D1003295DC00389CDE002588D300389C
      DE00379EE100379EE100278DD600379EE1003399DD003399DD002C92D9003295
      DC002C92D900015C91006D7C8400000000000000000000000000000000000000
      00000000000000000000A5A29F00AF672800AF4B0E00EECBB200FFEEDA00FFE6
      CE00FFE6C600D5D9CA00CCD0C000FFDDB700FFDAB200FFBF7100FFBB5A00ECA1
      5F008A4013003B3B3B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00C4C4C400BDBDBD00B9B9
      B900B1B1B100B4B4B400CACACA00E3E3E300EDEDED00EAEAEA00E9E9E900C4C4
      C400C6C6C600CACACA00CFCFCF00D0D0D000D7D7D700DBDBDB00CFCFCF009B9B
      9B00666666006565650097979700B7B6B600A4A1A100878080008D7F7F007769
      69003AA45D005E4F4F0040404000929292000000000000000000000000000000
      0000FBE9C500FBD19D00F6C18400F6C18400F6C18400F6C18400F6C18400F6C1
      8400F6C18400FBD19D00EFF9D200BFE6AC0060BF5B0040B33C0030AC2D000099
      000030AC2D00FFFEF500FBF4CF00FEF9E20050B94A00EFF9D200FFF2CD00A5A5
      9400666666000000000000000000000000000000000000000000CDE3CD0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE71005CCE71001D8D
      2200054A2F0013386000094C7B002588D300389CDE00175B9A000D4D8F00164A
      75001E5F85003BA1E300288FD7003BA1E300379EE100379EE1002D94DA00389C
      DE003399DD00016096005F747D00000000000000000000000000000000000000
      00000000000000000000A5A29F00AF672800B4561B00F2DBCA00FFEEDA00FFEB
      D300F5E4CC002AA5CB0070B8C700FFE2BF00FFDAB200FFB33D00FFCB7C00EFB2
      82008A4013003A3B3C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00B7B6B600B3B3B300C0C0
      C000DBDBDB00EDEDED00F1F1F100F1F1F100EFEFEF00EDEDED00BDBDBD00CC80
      8000935353007B555500686868008A898900B1B1B100C6C6C600D0D0D000D7D7
      D700DBDBDB00D9D9D900A3A3A300717171006E6E6E0094949400B1B1B100A7A3
      A300867E7E00917F7F005353530092929200000000000000000000000000EEE3
      D100FFE9C100FBC99200FAC48B00FAC48B00FAC48B00FAC48B00FAC48B00FAC4
      8B00FAC48B00FBD19D00BFE6A800DFF1CC00FEF9DE00FEFCE500FFFEF500CFEC
      CB00FFFFFC00FFFFFC00FFFFF000FFFCEC00CFECBC00BFE6A800FEF4CE00D1D1
      B800666666000000000000000000000000000000000000000000000000004A8F
      4A000E9D16002ABE3C0034BC440038C34B0034BC440034A83C001D8D2200054A
      2F001338600013386000094C7B002D8ED8002F8BCB00105DA800126EB9000D53
      9B000F3E68003BA1E3002A91D8003BA1E3003BA1E3003BA1E3003097DB00379E
      E1003399DD0002629C004F6B7B00000000000000000000000000000000000000
      00000000000000000000A5A29F00BA6D2B00B4561B00F7E1D100FFF4E100FDEC
      D7005FB6CE000F99CC003EABCA00FFE4C900F3C28700CA9A5800C9BEA400DE95
      5500843B0E003E3D3C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A0A0A000CFCFCF00EAEAEA00F3F3
      F300FAFAFA00F8F8F800F6F6F600F4F4F400F3F3F300F1F1F100C0C0C000FF9C
      9C00CC666600CC66660089707000E4E4E400A0A0A0008B8B8B0086868600A0A0
      A000C3C3C300CFCFCF00D7D7D700DBDBDB00D9D9D900A3A3A3006E6E6E006E6E
      6E009494940094949400A3A3A30000000000000000000000000000000000EEE3
      D100FEE4B900FDC99300FDC99300FDC99300FDC99300FDC99300FDC99300FDC9
      9300FDC99300FED1A100CFECB70050B94A00FEFCE500FEF9D600FFFFF00050B9
      4A00009900000099000040B33C0040B33C00CFECBC00EFF5D000FEE6BC00DBDB
      C100666666000000000000000000000000000000000000000000000000000000
      0000F7FBF7001D8D220024AD31005978590058839B00084E8200133860001338
      60001338600013386000084E82002D8ED8001563A8001F80CF002184D1001C79
      C700105DA8003794CC002C92D9003FA5E5003FA5E5003FA5E5003399DD003BA1
      E300379EE1000968A6004F6B7B00000000000000000000000000000000000000
      00000000000000000000A5A29F00BA6D2B00B85E2300FAECDF00F3F1E40059B6
      D1002AA6CD00CBD8D10028A5CD00D5D9CA00C8A48400255B7100988C6600E09A
      4C00C17227007C4F220051453900545454007777770000000000000000000000
      00000000000000000000000000000000000000000000A0A0A000C3C3C300C4C4
      C400EAEAEA00FAFAFA00FAFAFA00F8F8F800F6F6F600F4F4F400C3C3C300FFA0
      A000CC666600CC66660081686800DCC3C300E5B9B900EDE1E100E7E7E700B1B1
      B1008E8E8E00827B7B008A898900BABABA00CFCFCF00BABABA0094949400A0A0
      A000A0A0A000000000000000000000000000000000000000000000000000F3E2
      C400FEDEB100FECC9900FECC9900FECC9900FECC9900FECC9900FECC9900FECC
      9900FECC9900FECC9900FEFAD80020A61D009FD89300FEFEE800FEFCE500EFF8
      E90020A62000009900000099000000990000BFE6AC00FFDAAC00FED8A900FFFE
      DD00666666000000000000000000000000000000000000000000000000000000
      000000000000CDE3CD00359736006F926F004C7CA100094C7B00133860001338
      60001338600013386000035789003092DB00105DA800469BD900469BD9002F8B
      CB00105DA8003E9BD1002C92D90042A8E6003FA5E5003FA5E500379EE1003FA5
      E500379EE1000968A6003B647B00000000000000000000000000000000000000
      00000000000000000000A9A49F00C46F2900B5602D00FFFDF100B4D8DF002BA8
      D000DFE4DA00FFF2D7004AB1CE007EBECB00FFEBCB00AEAFA100CA9A5800FDE2
      C200FFDEB500F4B26F00CA7C2D008F561E005D47340044444400777777000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0A0A000A0A0A000B7B6B600D3D3D300FAFAFA00F8F8F800C6C6C600FFA2
      A200CC666600CC666600765D5D00B8858500BE585800E2AFAF00F4F4F400E7E7
      E700D9D9D900CD9A9A00804D4D00935353006D4747004D4D4D00000000000000
      000000000000000000000000000000000000000000000000000000000000F8E0
      BA00FFDAAC00FED1A100FED1A100FED1A100FED1A100FED1A100FED1A100FED1
      A100FED1A100FED1A100FFE9C10080CC72000099000070C66A00EFF8E300FFFF
      FC008FD28D00009900000099000000990000BFE6AC00FEDEB100FFDAAC00FFFE
      DD00666666006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F8FA003280B2000F3E6800133860001338
      60001338600013386000035789003BA1E3002F8BCB00D3CFF200E2EEF5006E9F
      C0001563A80048AEEB002A91D80045AAEA0042A8E60045AAEA003BA1E3003FA5
      E5003FA5E5000B6CA9003B647B00000000000000000000000000000000000000
      000000000000000000009C968E00C7742C00B5602D00FFFAF700F3F2EC00F4ED
      E500FFF2E300FFF2DC0097CAD30034A9CC00FFE6CE00FFEBCB00EDC29900DE95
      5500E5AA7300FBD9B600FFDFBC00F3BA8600DD8C3C00865E3300484850003E3E
      4400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A0A0A000B4B4B400BDBDBD008B8B8B00FFA6
      A600CC666600CC66660079606000A7747400B44E4E00D6A3A300FDFDFD00F4F4
      F400E7E7E700D5A2A200804D4D00CC666600CC6666004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000000000000FEE0
      B500FFDAAC00FED8A900FED8A900FED8A900FED8A900FED8A900FED8A900FED8
      A900FED8A900FED8A900FFDAAC00EFF5D00020A61D00009900000099000030AC
      2D0000990000009900000099000000990000BFE6AC00FEE0B500FED8A900FFFE
      DD0083837B006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F5002A74A4000F3E6800133860001338
      6000133860000F3E6800035789003BA1E30042A8E600498BB30074ACD4001977
      B90049A3D90048AEEB002D94DA0048AEEB0045AAEA0048AEEB003FA5E50042A8
      E6003FA5E5001273B4002A607F00000000000000000000000000000000000000
      000000000000000000009C968E00D0762900BE754800FFFDFD00FFF8F200FFF7
      EC00FFF3E700FFF2E300EBE6D9001FA3CE00CBD8D100FFEACE00FFF1DA00DE9B
      6A0088390200915B2600E5A56D00FAD0A500D6BB9F00B9BABD004B55AF001521
      930039394E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFA9
      A900CC666600CC666600866C6C00BA878700A9434300BF8C8C00E7E7E700FDFD
      FD00F4F4F400DBA8A800804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F1DDC400FEE0
      B500FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDE
      B100FEDEB100FEDEB100FEDEB100FEE6BC00CFEBC200109F0F00009900000099
      000000990000009900000099000000990000BFE6AC00FEE8BE00FEDEB100FEFC
      DA00959589006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000D9E7F0000C64980013386000133860001338
      6000133860000F3E6800015C91003FA5E50045AAEA00379EE100379EE1004BB1
      EE004BB1EE004BB1EE002D94DA004BB1EE0048AEEB0048AEEB0045AAEA0045AA
      EA0042A8E6001977B9001E5F8500000000000000000000000000000000000000
      00000000000000000000968C8200D57A2D00BE754800FFFFFF00FFFAF700FFF8
      F200FFF7EC00FFF3E700FFF4E30053B5D20070BCCF00FFEDD300FFF1DA00DE9B
      6A006F3509004643400000000000EDC29900C69765009594AC002A55D200144E
      D1005E5E94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAC
      AC00CC666600CC6666008B727200CA9797009F393900A5727200C3C3C300E7E7
      E700FDFDFD00E1AEAE00804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F1DDC400FDE0
      B300FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4
      B900FEE4B900FEE4B900FEE4B900FEE4B900FEEEC900DFF1CC0060BF5B000099
      000000990000109F0F0080CC7E00109F0F00BFE6AC00FFEAC400FEE4B900FEF9
      D600A8A897006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000C9DDEA000160960013386000103353001338
      6000133860000C447000015C910045AAEA0048AEEB00379EE1003BA1E3004EB5
      F0004BB1EE004EB5F0002D94DA004EB5F0004BB1EE004BB1EE0048AEEB0042A8
      E60048AEEB001977B900145B8700FFFFFE000000000000000000000000000000
      00000000000000000000968C8200D3762500C4815800FFFFFF00FFFEFC00FFFA
      F700FFF8F200FFF7EC00FFF7E800B4D8DF0024A5CE00EBE6D900FFF4E100E19E
      6D0078380800424344000000000000000000000000007077BF007077BF006E74
      CB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAF
      AF00CC666600CC666600876E6E00DCC3C300C58C8C00B58E8E00A3A3A300C3C3
      C300E7E7E700E4B1B100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F3DCBA00FEE4
      B900FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEEC
      C500FEECC500FEECC500FEECC500FEECC500FEECC500FEEEC900FFF9E400FFFE
      F500FFFFFC00FFFBEC00FEF9E200BFE5B400BFE6AC00FFF2CD00FEECC500FEF9
      D600B1B19F006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000B9D1DD0002629C0006642800056E0A000921
      3500103353000C4470000160960045AAEA004BB1EE0049A3D9005CB2E80073BB
      E6007AC1E70086C2E40074ACD4009AC9DC009AC9DC009AC9DC00A7C8D700A7C8
      D70084BEDE001F81C600145B8700F9F9F9000000000000000000000000000000
      000000000000000000009E928300CF712200C98F6C00FFFFFF00FFFFFF00FFFE
      FB00FFFAF700FFF8F200FFF7EC00FBF2E6002EA9D10080C3D200FFF8E400DE9B
      6A00763A0A004F51510000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB3
      B300CC666600CC6666005B4F4F0098989800C6C6C600F4F4F400C6C6C600A3A3
      A300C3C3C300D4A1A100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FAD9AF00FEE8
      BE00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2
      CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FEF4CE00FEF5D100FEF5
      D100FEF5D100FEF5D100FFF2CD00FEF9E200FEFCE500FEF5D100FFF2CD00FEF9
      D600D1D1B8006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000A9BCC700015893000252140034BC44000252
      1400092135000C4470000160960042ACF10084BEDE00F1E3CF00F3E8D300FDEC
      D300FDECD300FDECD300FFF5D700FFF5D700FFF9D800F9F2D700FFF5D700FDEC
      D300FCE5C7001F81C60003578900F9F9F9000000000000000000000000000000
      000000000000000000009B8D7E00CF712200C98F6C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FFF8F200FFF7EC00B4D8DF00AAD3DC00FFF5E500D891
      5B00693B14005253530000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB6
      B600CC666600CC666600CC666600B96060009C565600804D4D00796060006D66
      66006B6B6B00A370700076494900CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FDD6A900FEF0
      CA00FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9
      D600FEF9D600FEF9D600FFF2CD00FFF2CD00FEF5D100FEF0CA00F6E3BB00F6E3
      BB00FEFCDA00FFFEDD00FFFEDD00FEFCDA00FEFAD800FEF9D600FEF9D600FEFC
      DA00D0D0B7006666660000000000000000000000000000000000000000000000
      000000000000B9BAB9006F926F0012841400189B1F0045B24D0062CF76007BD8
      920034A83C0009485200005D9B005CB2E800E7E2D3005D58F200544EF1006762
      F3003E39EF00FFFFFE00544EF1003E39EF00211BED00EEEEFD00B6B3F800E9E4
      F300FFF4DC002184D10003578900F6F6F6000000000000000000000000000000
      00000000000000000000A8968100D3762500B85E2300CA8A5F00D7A98E00E5CA
      BC00F1E4E000F8F3F200FFFFFF00FFFFFF00FFFFF700FFFDF100FFFAEE00DA95
      5F006A3C15005353540000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB9
      B900CC666600CC66660089505000A6595900C2636300CC666600CC666600CC66
      6600B9606000A6595900804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FFD4A400FEF5
      D100FFFEDD00F3DDB500F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00FEF5D100FEECC500F8DDB300E6AF7D00DB935A00DE996100E19C6400E19C
      6400E4A26A00ECAF7800F3CA9A00F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00F3F3D5006666660000000000000000000000000000000000000000000000
      0000E7E7E70012841400189B1F0043C5560055CA690062CF760067D17C0074D6
      8B0083DC9A000F785300005D9B005CB2E800EFEDD7000F08ED00544EF100A6A2
      F600544EF100BDBBFA00211BED00BDBBFA002B24EE00FFFFFE00B6B3F800EAE6
      F900FFF4DC002685C900015C9100F2F2F1000000000000000000000000000000
      00000000000000000000A3947C00D77C2500BF500000BD500000BC520000B951
      0000B9590F00C1703500C8855800D19D7D00E3BFAA00F2DBCA00F4EDE500D893
      5F006C3D15005253530000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBC
      BC00CC666600CC666600735F5F00C0C0C0009F9F9F00918B8B008A7171008C59
      590093535300A6595900CC666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FEF0
      CA00D3905900CA793D00CC7C4000E5B48200FFFEDD00FFFEDD00FFFEDD00FEF0
      CA00FFE9C100EBBB8B00DB935A00DB935A00DE996100E19C6400E19C6400E4A2
      6A00E6A46D00E7A77000E9A97200EAAC7500EEB47F00F8DDB300FFFEDD00FFFE
      DD00FFFEDD006666660000000000000000000000000000000000000000004A8F
      4A000E9D160034BC440034BC440043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D700211BED007974F500BDBB
      FA00FFFFFE000F08ED00B6B3F800D6D5FC002B27F000FFFFFE00B6B3F800E6E5
      FC00FFFBE400288FD700015C9100EEEEEE000000000000000000000000000000
      00000000000000000000A9A08700F3B06000D8791D00D06D0D00CB620000C759
      0000C7590000C2550000BF500000BD500000BC520000B8540600BD672800C362
      170070451D005C5D5E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBF
      BF00CC666600CC666600876E6E00CDCDCD00DBDBDB00E3E3E300F6F6F600F8F8
      F800EFEFEF00CACACA0066666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100ECC1
      9200CA793D00C8834E00CA8E6200D3A77D00FFFEDD00FFFEDD00FEECC500FEE4
      B900DB935A00DB935A00DB935A00DE996100E19C6400E19C6400E4A26A00E6A4
      6D00E7A77000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F4C59500FEFA
      D800FFFEDD006666660000000000000000000000000000000000000000000E9D
      160024BA35002ABE3C0038C34B0043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D7000F08ED003D36EF00BDBB
      FA00FFFFFE000F08ED008681F500DFDDFB00312AEE00FFFFFE00B6B3F800AEAE
      B200C8B7A4002D94DA0001609600EEEEEE000000000000000000000000000000
      00000000000000000000A5A5A200A69F8600B8A98700C7AA7900D7AE7100DBA5
      5E00E09A4C00DD8D3400D8791D00D4710F00D0670100CB5C0000C7590000CB5C
      0000644325006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC2
      C200CC666600CC666600866C6C00D0D0D000CDCDCD00C4C4C400B4B4B400BDBD
      BD00B1B1B100D7D7D70098989800CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FBD19D00CDB2
      9300000000000000000000000000DBDBC100FFFEDD00FFE9C100FEE0B5006666
      66000000000000000000E19C6400E19C6400E19C6400E4A26A00E6A46D00E7A7
      7000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100F3BA8400F8CD
      9E00FEEEC900666666000000000000000000000000000000000075AB750018B8
      290024BA350024BA350024AD310025982A00168125001D8D220055C063007BD8
      920045B24D00005774000968A6007AC1E700FFF5D7000F08ED004942F1006F6A
      F400322DF000FFFFFE00544EF100544EF1004942F1006F6AF4007469E800F4E5
      D50086C2E4003097DB0001609600E2E3E3000000000000000000000000000000
      000000000000000000000000000000000000000000009D9D94009D9D94009D9D
      94009D9D94009A988B00A69F8600B5A07800C3A06A00D4A56100E09A4C00DD8D
      34006F593E005C5D5E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC5
      C500CC666600CC666600866C6C00CACACA00B7B6B600B9B9B900B4B4B400BABA
      BA00C8C8C800E1E1E10097979700CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100F3DC
      BA006666660066666600EBEBCD00FEFCDA00FEE6BC00FEDEB100666666000000
      000000000000000000000000000000000000E6A46D00E6A46D00E7A77000E9A9
      7200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100EDBE9300F5BD8A00F8C1
      8D00F8C18D0066666600000000000000000000000000E2EDE2001D8D220018B8
      290018B829001D8D22004A8F4A00296F8C00035789000664280055C063002598
      2A0002521400035789000B6CA90086C2E400F9F2D7006762F3008681F500B6B3
      F800BDBBFA00FFFFFE00F4F6FB00F4F6FB00FBFBFC00FFFFFE00FFFBED009AC9
      DC0051BCF900389CDE0002629C00DEDFDF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D9D94009D9D9400A5A5A2009A98
      8B009D9D94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC9
      C900CC666600CC666600856B6B00C8C8C800AEAEAE00BDBDBD00C3C3C300DBDB
      DB00C6C6C600E4E4E40094949400CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FED8
      A900FEFCDA00FEF9D600FEECC500FED8A900FDD6A90066666600000000000000
      0000000000000000000000000000000000000000000000000000E9A97200EAAC
      7500ECAF7800EEB17C00E6AF7D00AF988400000000000000000000000000F4C5
      9500FBC69000666666000000000000000000000000008BC38B000C9411004A8F
      4A00D4D5D10000000000000000001B6D9F00015C910006642800056E0A001338
      600013386000035789001271AC0086C2E400FCE5C700FEF6EA00FEF6EA00FFF3
      E200FFF3E200FFEFDB00FFEFDB00FDECD300FAE7D500F1E3CF00D9DAD9004CB7
      F40055B8F500389CDE0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00FFCB
      CB00CC666600CC666600856B6B00E1E1E100E3E3E300E7E7E700D4D4D400D3D3
      D300C4C4C400D0D0D00094949400CC666600CC6666004F4F4F00000000000000
      000000000000000000000000000000000000000000000000000000000000FECF
      A000FBD19D00FED1A100FBD2A400FBD2A4000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ECAF
      7800EEB17C00F0B37E00A082670070707000000000000000000000000000E5BA
      9000FDC89500666666000000000000000000000000008BC38B00068B0900E2E3
      E3000000000000000000000000001B6D9F00015C910009485200094852000F3E
      680013386000035789001271AC0068BBEC00E7DCCA00FCE5C700F4E5D500E7DC
      CA00D4D5D100B9D1DD00A7C8D7007AC1E70068BBEC0055B8F5004CB7F4004EB5
      F0004EB5F0003092DB0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8C1
      C100EDBBBB00C6999900DEDEDE00C4C4C400E7E7E700F3F3F300EFEFEF00EFEF
      EF00EDEDED00EFEFEF0094949400CC666600CC66660075757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0B37E00F2B68100DAAB80008A7A6B008A7A6B0092817100D2AB8400FDC8
      950083837B006666660000000000000000000000000094C894004A8F4A000000
      0000000000000000000000000000A7C8D700498BB300498BB300498BB300498B
      B300498BB300016096001271AC0045AAEA0042ACF1003CA4EA00379EE1003293
      D4002F8BCB001F81C6001273B4000968A6000C649800015C9100015C91000158
      9300015C91001B6D9F004283AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9D9D900EFEFEF00E3E3
      E300E1E1E100FAFAFA00AF9F9F00E1AEAE00C78E8E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3BA8400F5BD8A00F8C18D00F8C18D00FBC69000FDC89500A8A8
      97006666660000000000000000000000000000000000ECF5EC00CDE3CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B6D9F0002629C001271AC000968A6000160960001609600015C
      910002629C00015C9100005D9B000C6498000C6498004E8FB7006E9FC000B9D1
      DD00D9E7F000F6F8FA00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBC69000FBC69000FACA9900A8A897006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB9D1004283AB0089A3B200A9BCC700E4EBEE00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF00F0000000E00000070000000000000000
      F0000000E00000070000000000000000F0000000E00000070000000000000000
      F0000000E00000070000000000000000F0000000E1FFFF870000000000000000
      F0000000E1FFFF870000000000000000F0000000E1FFFF870000000000000000
      F0000000E1FFFF870000000000000000F0000000E1FFFF870000000000000000
      0000000000001F8700000000000000000000000000001F870000000000000000
      0000000000000187000000000000000000000000000001870000000000000000
      000000000420F187000000000000000000000000042001870000000000000000
      0000000002200187000000000000000000000000002001870000000000000000
      80000000002001870000000000000000C0000000042001870000000000000000
      C0000000000001870000000000000000C0000000000000070000000000000000
      8000000000000007000000000000000000000000000000070000000000000000
      00000000E1FF8007000000000000000000000000E1FF87870000000000000000
      00000000E1FF8707000000000000000000000000E1FF860F0000000000000000
      00000001E1FF841F000000000000000000000003E000003F0000000000000000
      80000007E000007F0000000000000000F000000FE00000FF0000000000000000
      F000001FE00001FF0000000000000000ECBFF77FFF000001FFFC0FFFFFFFFFFF
      ECC0037FFE000001C0000000FFFFFFFF3F0000FFFE00000180000000FFFFFFFF
      3C00003FFE00000180000000FFFFFFFFF8000008FE00000180000000FE000003
      E000000CFE00000180000001FE000003E0000007FE000001FE00003FFE000003
      80000007FE000001F800000FFE00000380000003C6000001E0000007FE000003
      8000000382000001C0000007E00000038000000080000001C0000007E0000003
      0004000080000001C0000007E00000030008000180000001C0000007E0000003
      00700001C0000001C0000007E000000300600000E0000001C0000007E0000003
      00400000F0000001C0000007E000000300000001F8000001C0000007E0000003
      00000001FC000001C0000007E000000300000001FE000001E000000FE0000003
      00000001FE000001F000001FE000000300000801FE000001FC00003FE0000003
      00000001FE000001FC00007FE100000700002000FE000001FC0001FFE000001F
      00000000FE000001FE0007FFE000001F00000005FE000001FE001FFFE000001F
      80000007FE000001FE001FFFE000001F80000007FE000003FE001FFFE000001F
      8000001FFE000007FC001FFFF000003F8000001FFE00000FFC001FFFFFFFFFFF
      E000007FFE00001FFC003FFFFFFFFFFF2000007FFE00003FF8003FFFFFFFFFFF
      3C00013FFFFFFFFFF8007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF801FFFFFFE0FFF
      FFFFFFFFFFFE3FFFFF0003FFFFFC0003FFFFFFFFFFF807FFFE0000FFFFFC0001
      FFFFFFFFFFC001FFFC00003FFF800001FF1FFFFFFF00007FFC00001FFF800001
      FE03FFFFFC00000FFC00000FFE000001FC007FFFF0000003F800000FF8000001
      FC0007FFC0000000F800000FF0000001FC0003FF80000000F8000007E0000001
      FC0003FF00000000F000000780000001FC0003FF00000000F000000780000001
      FC0003FF00000000F0000007C0000001FC0003FF00000000E0000007E0000001
      FC0003FF00000001E0000007F0000001FC00007F80000007E0000007F8000001
      FC00001FF000003FE0000003FE000001FC00000FFE00003FE0000003FE000001
      FC000007FFC0003FC0000003FE000001FC000207FFC0003FC0000003FE000000
      FC00038FFFC0003FC0000003FE000000FC0003FFFFC0003FC0000003FE000000
      FC0003FFFFC0003FC0000003F8000000FC0003FFFFC0003FC0000003F0000000
      FC0003FFFFC0003FC0000003E0000000FC0003FFFFC0003FC0000003E0000000
      FC0003FFFFC0003FCE0C0003C0000000FF8003FFFFC0003FC01F000380000000
      FFFF07FFFFC0003FC03FC0E386000000FFFFFFFFFFC0003FE0FFE0E38E000000
      FFFFFFFFFFE0003FFFFFF0039E000001FFFFFFFFFFFF807FFFFFF8079FF80001
      FFFFFFFFFFFFFFFFFFFFFE0FFFF81FFF00000000000000000000000000000000
      000000000000}
  end
  object ImgImagens_Chama: TImageList
    Height = 32
    Width = 32
    Left = 448
    Top = 8
    Bitmap = {
      494C010103000500100020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F500E2E3E300EBEBEC00F2F2F100FBFB
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F90002629C0002629C00015C9100145B87001E5F
      85002A607F004F6B7B005F747D00828D930095989A00AEAEB200B9BAB900D9DA
      D900DEDFDF00F2F2F10000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A79000DFA79F00D09F9000CF979000CF97
      9000CF979000CF979000CF979000C0979000C0978F00C0978F00C0978F00C097
      8F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C097
      8F00C0979000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EEF500005D9B00005D9B0001609600016096000160
      96000160960002629C0001609600015C9100145B87001E5F85002A607F004F6B
      7B005F747D009B9D9E00E2E3E300000000000000000000000000000000000000
      0000000000000000000000000000D0AFAF00FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD09F00DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00080A0E00080C0E00080C0E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100015C9100015C
      9100015C9100015C9100015C91000968A6001C79C7001F80CF001F80CF001F80
      CF001E7CCE001C79C7001C79C7001570BF001570BF00126EB9000968A600105D
      A80002629C001E5F8500AEAEB200000000000000000000000000000000000000
      0000000000000000000000000000CFB7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8B000FFD0B000FFD0
      B000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0006080A00080C0E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000404
      060084B0CE0087B1D00086B1D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100094C7B000F3E
      68000F3E68000F3E68000C4470000E6BB1001E7CCE002184D1002588D3002184
      D1002184D1002184D1001F80CF001F80CF001F80CF001E7CCE001E7CCE001C79
      C7001570BF00145B8700A5A8A700000000000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8
      B000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000435D7300435D7300435D
      7300435D73004B6880004B6880004B6880004B6880004B6880004B6880000000
      00000000000000000000000000000000000083ADCC0084AFCE0084AFCD0083AF
      CD0088B4D20097C2E000A0CCE800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A8A700EEEEEE00016096000C4470001338
      6000133860001033530006642800126EB9002588D3002A91D800268CD5002A91
      D800288FD700288FD700268CD500278DD600268CD500258AD500258AD5002184
      D1001E7CCE00145B87009B9D9E00000000000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8EF00FFE8D000FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000009DC6DE0099C2DC0091BAD50089ADCA0000000000000000000000
      000000000000435D73004B68800061809F005B7B9600507087004B6880007D99
      B0007D9EB70000000000000000000000000088B3D10098C3E100A1CDE900A9D6
      F100AFDAF300AEDBF400B1DCF500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F6006F926F0059785900E7E7E700016096000C4470001338
      60001033530002521400269051001570BF00258AD5002D94DA00258AD5002C92
      D9002C92D9002C92D900228AD5002A91D800288FD700288FD700258AD500228A
      D5002184D100145B870095989A00000000000000000000000000000000000000
      0000000000000000000000000000D0B7B000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFE0C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000BBE2F700B8DEF500AFD5ED00A7C8E300A0C4DF00B4CCE100C8D9
      E60000000000435D7300526E87006D87A30080A4C2006B8EAA005B7D96005472
      8B0092AFC5008BB0CB0098C3E0000000000000000000B1DCF400B2DDF600B2DC
      F500B3DEF600B4DEF600B4DFF600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDCDCC000C94110038C34B0059785900A5A8A7000C44700009213500056E
      0A0025982A0090E5A2005FB69E001977B9002D8ED8003097DB00258AD5003097
      DB003097DB003097DB00258AD5002D94DA002C92D9002C92D900268CD500288F
      D700258AD500145B8700828D9300000000000000000000000000000000000000
      0000000000000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0
      C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000435D73004B688000779DB30094BAD90088B1CE007399B8005474
      8E0085A9C600ABCCE400AAD5EF000000000000000000B6DFF600B5DFF600B6E1
      F700B9E0F700BBE1F700BFE4F800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A8
      A700168125002ABE3C0038C34B00056E0A002C772D00056E0A001D8D220055C0
      63007BD8920090E5A20045A286001C79C7002D8ED8003097DB00228AD5003399
      DD003097DB003097DB00268CD5003097DB002D94DA002D94DA00278DD6002A91
      D800268CD500015C910081888D00000000000000000000000000C05750009077
      7F006F676F000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF000000
      0000000000009DC7DE009CC5DD0095BDD80085AFCB00739AB6007298B600BED3
      E400D4E3EE00000000004B6880007CA0B600A1C7E6009BC6E2008BB1D0007293
      B0005F7E9700ABCCE600B2D9F2000000000000000000BFE3F800C6E7F800CBE8
      F900D0EBF900DBF0FB00DCEFFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F6006F926F0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE710062CF76006FD3
      84007BD8920025982A00054A2F001F80CF003295DC00389CDE00228AD500389C
      DE003399DD003399DD00278DD6003399DD003399DD003399DD002A91D8002D94
      DA002D8ED800015C91006D7C84000000000000000000AF5750007F878F009F77
      9F00CF879F00705F6F0000000000DFBFB000EFE8EF00FFE8DF00FFE8DF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF000000
      00009DC7DE00B2DFF600B0DCF400A8D2EE0098C2E00083ABCB0080AAC80088B0
      CD008BB3D000000000004B6880007DA1BD00A7CDEB00A8D0EC009CC5E10090B6
      D30063829B00B4D2E900BCDCF1000000000000000000DFF2FB00DFF1FB00DEF1
      FB00DFF1FB00DEF1FB00DFF2FB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075AB7500068B090018B8
      290018B829002ABE3C0034BC440043C556004CC960005CCE710062CF760074D6
      8B006FD38400025214000C4470002184D1003295DC00389CDE002588D300389C
      DE00379EE100379EE100278DD600379EE1003399DD003399DD002C92D9003295
      DC002C92D900015C91006D7C840000000000000000007F776F003077D0005F67
      A000A08FA000D08F9F00705F6000DFBFB000EFF0EF00FFE8DF00FFE8DF00FFE8
      DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8
      C000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000BCE3F700BBE2F700B9DFF5000000000000000000000000000000
      000000000000435D73004B68800080A5BD00ADD3EE00B0D8F100A9CEEA009EC3
      DC009BB7D000BAD3E500D0E5F1000000000000000000E1F2FB00E1F2FC00DFF2
      FB00E0F2FB00E1F2FB00E1F2FB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDE3CD0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE71005CCE71001D8D
      2200054A2F0013386000094C7B002588D300389CDE00175B9A000D4D8F00164A
      75001E5F85003BA1E300288FD7003BA1E300379EE100379EE1002D94DA00389C
      DE003399DD00016096005F747D0000000000000000005FBFFF0030A7FF003077
      D0005F67A000A08FA000CF879F00706F6F00EFF0EF00FFF0DF00FFE8DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000007DA5C0006B8EAD007199B800BED4
      E400D5E3ED00000000004B68800087AAC300B4D9F200BCDFF600BCDBF000BDD6
      E900BED1E000C5D7E600D0E4F100D5E8F4000000000000000000E5F4FC00E5F4
      FC00E5F4FC00E5F4FC00E5F4FC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A8F
      4A000E9D16002ABE3C0034BC440038C34B0034BC440034A83C001D8D2200054A
      2F001338600013386000094C7B002D8ED8002F8BCB00105DA800126EB9000D53
      9B000F3E68003BA1E3002A91D8003BA1E3003BA1E3003BA1E3003097DB00379E
      E1003399DD0002629C004F6B7B0000000000000000007F87B00060D8FF003FAF
      FF003077CF005F6FAF00A08FA000CF879F008F778F00FFF0E000FFF0DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF000000
      00009DC7DE009DC7DE009AC2DB008CB5D1008AB4D20091B2CC008FB3CD0098BC
      D6009AC2DD00000000004B68800089ACC700BEE0F500C8E8F800CAE6F500D0E4
      F100D5E7F200D6E6F000DAEAF400DEEDF7000000000000000000EAF6FD00EAF6
      FD00EAF6FD00EAF6FD00EAF6FD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FBF7001D8D220024AD31005978590058839B00084E8200133860001338
      60001338600013386000084E82002D8ED8001563A8001F80CF002184D1001C79
      C700105DA8003794CC002C92D9003FA5E5003FA5E5003FA5E5003399DD003BA1
      E300379EE1000968A6004F6B7B000000000000000000000000008F87B0005FD0
      FF0040AFFF003077D0005F67A000A08FA000CF879F00706F7000FFF0E000FFF0
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      C000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF000000
      000000000000BCE3F700B8E0F500B0D5ED00A9D0E80000000000000000000000
      000000000000435D73004B68800091ADC400CDE8F700D7EEFA00DFF0FA00DCED
      F700DEECF6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDE3CD00359736006F926F004C7CA100094C7B00133860001338
      60001338600013386000035789003092DB00105DA800469BD900469BD9002F8B
      CB00105DA8003E9BD1002C92D90042A8E6003FA5E5003FA5E500379EE1003FA5
      E500379EE1000968A6003B647B00000000000000000000000000000000008F87
      AF0050BFFF003FA7FF003087EF005F67A000A08FA000CF879F00706F7000FFF0
      E000FFF0E000FFF0DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000075A0BA00759AB600D0DF
      EC00E2EBF200000000004B6880009CB9CC00D6EDF900E5F4FC00E3F3FC00E8F4
      FB000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F8FA003280B2000F3E6800133860001338
      60001338600013386000035789003BA1E3002F8BCB00D3CFF200E2EEF5006E9F
      C0001563A80048AEEB002A91D80045AAEA0042A8E60045AAEA003BA1E3003FA5
      E5003FA5E5000B6CA9003B647B00000000000000000000000000000000000000
      00008F87AF0060E0FF003FAFFF003077CF005F6FAF00A08FA000D087A000FFF0
      E000CFBFBF00BFAFAF00BFAFAF00BFAFAF00BFAFAF00C0A7AF00BFAFAF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE8CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF000000
      0000ABCDE000A8CBE000A4CADE0098C1DA008DB8D40094BEDC008EB1D0009DC1
      DC0096C0DE00000000004B688000B5C9D800E5F4FB00E5F4FC00EAF6FD000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F5002A74A4000F3E6800133860001338
      6000133860000F3E6800035789003BA1E30042A8E600498BB30074ACD4001977
      B90049A3D90048AEEB002D94DA0048AEEB0045AAEA0048AEEB003FA5E50042A8
      E6003FA5E5001273B4002A607F00000000000000000000000000000000000000
      0000000000008F87B0005FD0FF00309FFF003077D00050677F00706F90008F87
      7F00AF878F00A07F7F00A07F7F00A0676F00B0878F00AF779000906760009F6F
      8F00E0D0CF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF000000
      0000A7CAE000B9E2F800B8E2F800B3DEF600ABD6EE00A9D5EB009CC6E3000000
      00000000000091AEC600A5BDD200DFEFF900E5F4FC00EAF6FD00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9E7F0000C64980013386000133860001338
      6000133860000F3E6800015C91003FA5E50045AAEA00379EE100379EE1004BB1
      EE004BB1EE004BB1EE002D94DA004BB1EE0048AEEB0048AEEB0045AAEA0045AA
      EA0042A8E6001977B9001E5F8500000000000000000000000000000000000000
      000000000000000000008F87AF005FD0FF0060A7FF00908FAF00A08FA000AF8F
      9F00BF7F7F00E0C8A000FFF0C000FFFFD000FFFFDF00FFFFD000EFD0BF00BF87
      7F00A07F8F00EFD0C000FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000C2E5F900C7E8F800C5E4F600C3E2F500BDE0F500B9DCF1009EBC
      D1009AB8D000A7C4D900D9ECF900E2F2FB00EAF6FD000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9DDEA000160960013386000103353001338
      6000133860000C447000015C910045AAEA0048AEEB00379EE1003BA1E3004EB5
      F0004BB1EE004EB5F0002D94DA004EB5F0004BB1EE004BB1EE0048AEEB0042A8
      E60048AEEB001977B900145B8700FFFFFE000000000000000000000000000000
      000000000000000000000000000090C8EF00D0D8EF00D0C8D00090776F00E0A7
      9000FFF0B000FFFFDF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFFE000FFFF
      E000C08F90009F6F8F00E0D0CF00FFE8CF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000AACDE700CAE8F800E4F4FC00EAF6FD000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B9D1DD0002629C0006642800056E0A000921
      3500103353000C4470000160960045AAEA004BB1EE0049A3D9005CB2E80073BB
      E6007AC1E70086C2E40074ACD4009AC9DC009AC9DC009AC9DC00A7C8D700A7C8
      D70084BEDE001F81C600145B8700F9F9F9000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFF8FF00C0A7AF00EFB79000FFE8
      BF00FFF8CF00FFF8CF00FFFFD000FFFFD000FFFFEF00FFFFEF00FFFFFF00FFFF
      FF00FFFFF000B07F7F0070576F00DFC8C000FFE8DF00FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000097BC
      D500BADCEF00DFF0FB00EAF6FD000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9BCC700015893000252140034BC44000252
      1400092135000C4470000160960042ACF10084BEDE00F1E3CF00F3E8D300FDEC
      D300FDECD300FDECD300FFF5D700FFF5D700FFF9D800F9F2D700FFF5D700FDEC
      D300FCE5C7001F81C60003578900F9F9F9000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFF8FF00DFAFAF00FFE8B000FFFF
      D000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8D0009F5F6F00C0A7AF00FFE8DF00FFE8DF00FFE8D000FFE8
      D000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000BADA
      F000D9EDF900E6F5FC000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9BAB9006F926F0012841400189B1F0045B24D0062CF76007BD8
      920034A83C0009485200005D9B005CB2E800E7E2D3005D58F200544EF1006762
      F3003E39EF00FFFFFE00544EF1003E39EF00211BED00EEEEFD00B6B3F800E9E4
      F300FFF4DC002184D10003578900F6F6F6000000000000000000000000000000
      0000000000000000000000000000F0D8C000EFC8DF00FFC8AF00FFF8D000FFE8
      BF00FFE8B000FFFFCF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFE000FFFFDF00B0877F007F677000FFE8DF00FFE8DF00FFE8DF00FFE8
      D000FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000BCDFF400D5EC
      FA00E5F4FC000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E70012841400189B1F0043C5560055CA690062CF760067D17C0074D6
      8B0083DC9A000F785300005D9B005CB2E800EFEDD7000F08ED00544EF100A6A2
      F600544EF100BDBBFA00211BED00BDBBFA002B24EE00FFFFFE00B6B3F800EAE6
      F900FFF4DC002685C900015C9100F2F2F1000000000000000000000000000000
      0000000000000000000000000000F0D8BF00DF9F9F00FFD0AF00FFF8CF00FFD8
      A000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFE000FFFFF000FFFFFF00FFFF
      E000FFFFEF00FFFFDF00DFB7AF007F5F6F00FFE8DF00FFE8DF00FFE8DF00FFE8
      DF00FFD8C000DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C1E4F700DBEFFA00E0F2
      FB000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A8F
      4A000E9D160034BC440034BC440043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D700211BED007974F500BDBB
      FA00FFFFFE000F08ED00B6B3F800D6D5FC002B27F000FFFFFE00B6B3F800E6E5
      FC00FFFBE400288FD700015C9100EEEEEE000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFC8B000FFE8C000FFF8C000FFD8
      A000FFE0B000FFF8BF00FFFFD000FFFFD000FFFFE000FFFFE000FFFFE000FFFF
      EF00FFFFDF00FFFFD000EFD0A000705F6000FFF0E000FFF0DF00FFE8DF00FFE8
      DF00FFD8C000DF8F7F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000BFE3F800CCEAF900E2F3FB000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000E9D
      160024BA35002ABE3C0038C34B0043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D7000F08ED003D36EF00BDBB
      FA00FFFFFE000F08ED008681F500DFDDFB00312AEE00FFFFFE00B6B3F800AEAE
      B200C8B7A4002D94DA0001609600EEEEEE000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFD0BF00FFE0C000FFF8C000FFD8
      AF00FFF0C000FFF0BF00FFF8CF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFF
      DF00FFFFD000FFFFDF00DFB790007F676F00FFF0E000FFB7B000FFAFB000FF9F
      A000FF9F9F00DF978F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C5E7F800E3F3FC00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000075AB750018B8
      290024BA350024BA350024AD310025982A00168125001D8D220055C063007BD8
      920045B24D00005774000968A6007AC1E700FFF5D7000F08ED004942F1006F6A
      F400322DF000FFFFFE00544EF100544EF1004942F1006F6AF4007469E800F4E5
      D50086C2E4003097DB0001609600E2E3E3000000000000000000000000000000
      0000000000000000000000000000FFE0CF00E0C8C000FFE0B000FFFFDF00FFF0
      C000FFE0B000FFE0AF00FFF0C000FFF8CF00FFFFCF00FFFFD000FFFFDF00FFF8
      C000FFFFCF00FFF8CF00CF9F9000D0B7B000EFB79000F09F4000EF973000E08F
      3000DF873000BF8F6F00606760000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CCEAF900FAFDFE0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2EDE2001D8D220018B8
      290018B829001D8D22004A8F4A00296F8C00035789000664280055C063002598
      2A0002521400035789000B6CA90086C2E400F9F2D7006762F3008681F500B6B3
      F800BDBBFA00FFFFFE00F4F6FB00F4F6FB00FBFBFC00FFFFFE00FFFBED009AC9
      DC0051BCF900389CDE0002629C00DEDFDF000000000000000000000000000000
      0000000000000000000000000000FFE0CF00F0E8DF00E0BFA000FFFFDF00FFFF
      F000FFF8EF00FFE8CF00FFD8A000FFF0C000FFE8B000FFF0C000FFF0C000FFF0
      C000FFF8D000FFE0B0009F5F6F00E0C8D000EFBFA000FFBF5F00FFA72F00FFA7
      1F00CF8F4F0060676000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000EEF8FD0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008BC38B000C9411004A8F
      4A00D4D5D10000000000000000001B6D9F00015C910006642800056E0A001338
      600013386000035789001271AC0086C2E400FCE5C700FEF6EA00FEF6EA00FFF3
      E200FFF3E200FFEFDB00FFEFDB00FDECD300FAE7D500F1E3CF00D9DAD9004CB7
      F40055B8F500389CDE0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000FFE8CF00FFFFFF00CF979F00FFE8C000FFFF
      FF00FFFFFF00FFF8EF00FFD8B000FFE0BF00FFE0AF00FFD8A000FFE0AF00FFFF
      CF00FFF8BF00CF9F8F009F6F8F00FFF0EF00EFC8AF00FFD08F00FFB75000D09F
      60006067600000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008BC38B00068B0900E2E3
      E3000000000000000000000000001B6D9F00015C910009485200094852000F3E
      680013386000035789001271AC0068BBEC00E7DCCA00FCE5C700F4E5D500E7DC
      CA00D4D5D100B9D1DD00A7C8D7007AC1E70068BBEC0055B8F5004CB7F4004EB5
      F0004EB5F0003092DB0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00EFA7B000FFFF
      F000FFFFFF00FFF8F000FFFFD000FFE8BF00FFE0A000FFF0BF00FFFFDF00FFE0
      AF00E0AF8F00C08F7F00FFF8EF00FFF0EF00F0D0B000FFD89F00CF976F006067
      60000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094C894004A8F4A000000
      0000000000000000000000000000A7C8D700498BB300498BB300498BB300498B
      B300498BB300016096001271AC0045AAEA0042ACF1003CA4EA00379EE1003293
      D4002F8BCB001F81C6001273B4000968A6000C649800015C9100015C91000158
      9300015C91001B6D9F004283AB00000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00FFFFFF00BF77
      8F00F0D8BF00FFF0C000FFFFD000FFFFD000FFFFD000FFF0CF00FFD8A000CF97
      9F00C0978F00EFE8EF00E0E8EF00E0E8E000F0D0B000D0AF8F00606760000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECF5EC00CDE3CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B6D9F0002629C001271AC000968A6000160960001609600015C
      910002629C00015C9100005D9B000C6498000C6498004E8FB7006E9FC000B9D1
      DD00D9E7F000F6F8FA00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000FFD8B000FFE0BF00FFD8BF00FFD8BF00F0D0
      B000DFAFAF00DF9F9F00C0977F00CF977F00DFAFA000F0B7BF00E0B7A000DFAF
      A000EFBFAF00E0BFAF00E0BFAF00E0BFAF00EFC8AF00AF9F9000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB9D1004283AB0089A3B200A9BCC700E4EBEE00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFE0FFFFF0000010000000000000000
      FFFC0003FE0000010000000000000000FFFC0001FE0000010000000000000000
      FF800001FE0000010000000000000000FF800001FE0000010000000000000000
      FE000001FE0000010000000000000000F8000001FE0000010000000000000000
      F0000001FE0000010000000000000000E0000001C60000010000000000000000
      8000000182000001000000000000000080000001800000010000000000000000
      C0000001800000010000000000000000E0000001800000010000000000000000
      F0000001C00000010000000000000000F8000001E00000010000000000000000
      FE000001F00000010000000000000000FE000001F80000010000000000000000
      FE000001FC0000010000000000000000FE000000FE0000010000000000000000
      FE000000FE0000010000000000000000FE000000FE0000010000000000000000
      F8000000FE0000010000000000000000F0000000FE0000010000000000000000
      E0000000FE0000010000000000000000E0000000FE0000010000000000000000
      C0000000FE000001000000000000000080000000FE0000030000000000000000
      86000000FE00000700000000000000008E000000FE00000F0000000000000000
      9E000001FE00001F00000000000000009FF80001FE00003F0000000000000000
      FFF81FFFFFFFFFFF000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ImgImagens_PAF: TImageList
    AllocBy = 0
    Height = 32
    Width = 32
    Left = 360
    Top = 8
    Bitmap = {
      494C010102000500100020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F500E2E3E300EBEBEC00F2F2F100FBFB
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000929292007979790092929200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F90002629C0002629C00015C9100145B87001E5F
      85002A607F004F6B7B005F747D00828D930095989A00AEAEB200B9BAB900D9DA
      D900DEDFDF00F2F2F10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000089898900484848004A4A4A003939390045454500585858007979
      7900929292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EEF500005D9B00005D9B0001609600016096000160
      96000160960002629C0001609600015C9100145B87001E5F85002A607F004F6B
      7B005F747D009B9D9E00E2E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E8E8E007373
      73004F4F4F0054545400A9A9A900C1B9B900BD9E9E00877373004B4545003D3D
      3D004F4F4F006565650092929200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100015C9100015C
      9100015C9100015C9100015C91000968A6001C79C7001F80CF001F80CF001F80
      CF001E7CCE001C79C7001C79C7001570BF001570BF00126EB9000968A600105D
      A80002629C001E5F8500AEAEB200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E0063636300575757009797
      97008887870086868600ABABAB00B0A6A600BB9F9F00C8A7A700D5B0B000A78C
      8C007666660039393900474747005B5B5B007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100094C7B000F3E
      68000F3E68000F3E68000C4470000E6BB1001E7CCE002184D1002588D3002184
      D1002184D1002184D1001F80CF001F80CF001F80CF001E7CCE001E7CCE001C79
      C7001570BF00145B8700A5A8A700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E8E8E00585858006B6B6B00ACACAC00DCDCDC00D7D7
      D7006363630080808000A0A0A000AFA6A600938282007D737300BAA3A300BEA4
      A400CEB8B800D8B3B3009A8181004E4848003F3F3F0050505000686868009292
      9200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A8A700EEEEEE00016096000C4470001338
      6000133860001033530006642800126EB9002588D3002A91D800268CD5002A91
      D800288FD700288FD700268CD500278DD600268CD500258AD500258AD5002184
      D1001E7CCE00145B87009B9D9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000828282005C5C5C0082828200CACACA00DBDBDB00D7D7D700D0D0D000CACA
      CA00C6C6C6007A7A7A00979797009B96960072686800000000000E0E0E002726
      260000000000454545008A7E7E00D6B8B800BE9D9D007C6A6A00474343004848
      48005B5B5B008080800000000000000000000000000000000000000000000000
      000000000000F6F6F6006F926F0059785900E7E7E700016096000C4470001338
      60001033530002521400269051001570BF00258AD5002D94DA00258AD5002C92
      D9002C92D9002C92D900228AD5002A91D800288FD700288FD700258AD500228A
      D5002184D100145B870095989A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171006565
      6500A0A0A000D4D4D400D9D9D900D4D4D400CFCFCF00CACACA00C4C4C400BDBD
      BD00B7B6B600737373008C8C8C008A8989007570700079717100554E4E002421
      210000000000000000000000000037373700DBC0C000E6BBBB00E5B9B900AF91
      91005D535300404040005C5C5C009F9F9F000000000000000000000000000000
      0000CDCDCC000C94110038C34B0059785900A5A8A7000C44700009213500056E
      0A0025982A0090E5A2005FB69E001977B9002D8ED8003097DB00258AD5003097
      DB003097DB003097DB00258AD5002D94DA002C92D9002C92D900268CD500288F
      D700258AD500145B8700828D9300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400A0A0A000DCDC
      DC00D9D9D900D3D3D300CDCDCD00C8C8C800C3C3C300BABABA00B7B6B600B1B1
      B100A9A9A90079797900AEAEAE00BDBDBD00757575006B696900777171006961
      610000000000000000000000000010101000292929007D737300D0B4B400E6BB
      BB00F3C4C400D7AEAE004040400092929200000000000000000000000000A5A8
      A700168125002ABE3C0038C34B00056E0A002C772D00056E0A001D8D220055C0
      63007BD8920090E5A20045A286001C79C7002D8ED8003097DB00228AD5003399
      DD003097DB003097DB00268CD5003097DB002D94DA002D94DA00278DD6002A91
      D800268CD500015C910081888D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A900BDBDBD008E8E8E00D0D0
      D000CDCDCD00C6C6C600C0C0C000BABABA00B4B4B400AEAEAE00A9A9A900BEBE
      BE00DCDCDC00EFEFEF00A4A4A4006666660098989800B9B9B900A0A0A0007A78
      7800706A6A00514B4B002B27270088878700685B5B00352E2E0069616100CFAC
      AC00DBB4B400E8BDBD00404040009292920000000000F6F6F6006F926F0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE710062CF76006FD3
      84007BD8920025982A00054A2F001F80CF003295DC00389CDE00228AD500389C
      DE003399DD003399DD00278DD6003399DD003399DD003399DD002A91D8002D94
      DA002D8ED800015C91006D7C8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A900D0D0D000CACACA00C6C6
      C600BEBEBE00B9B9B900B3B3B300ACACAC00B7B6B600D4D4D400EAEAEA00E9E9
      E900E1E1E100DEDEDE00DCDCDC00D0D0D0009B9B9B0068686800656565009797
      9700B7B6B600A5A3A300837E7E00857B7B0093848400574D4D00AC9595008A76
      760041554200AC8E8E0040404000929292000000000075AB7500068B090018B8
      290018B829002ABE3C0034BC440043C556004CC960005CCE710062CF760074D6
      8B006FD38400025214000C4470002184D1003295DC00389CDE002588D300389C
      DE00379EE100379EE100278DD600379EE1003399DD003399DD002C92D9003295
      DC002C92D900015C91006D7C8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00C4C4C400BDBDBD00B9B9
      B900B1B1B100B4B4B400CACACA00E3E3E300EDEDED00EAEAEA00E9E9E900C4C4
      C400C6C6C600CACACA00CFCFCF00D0D0D000D7D7D700DBDBDB00CFCFCF009B9B
      9B00666666006565650097979700B7B6B600A4A1A100878080008D7F7F007769
      69003AA45D005E4F4F0040404000929292000000000000000000CDE3CD0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE71005CCE71001D8D
      2200054A2F0013386000094C7B002588D300389CDE00175B9A000D4D8F00164A
      75001E5F85003BA1E300288FD7003BA1E300379EE100379EE1002D94DA00389C
      DE003399DD00016096005F747D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00B7B6B600B3B3B300C0C0
      C000DBDBDB00EDEDED00F1F1F100F1F1F100EFEFEF00EDEDED00BDBDBD00CC80
      8000935353007B555500686868008A898900B1B1B100C6C6C600D0D0D000D7D7
      D700DBDBDB00D9D9D900A3A3A300717171006E6E6E0094949400B1B1B100A7A3
      A300867E7E00917F7F0053535300929292000000000000000000000000004A8F
      4A000E9D16002ABE3C0034BC440038C34B0034BC440034A83C001D8D2200054A
      2F001338600013386000094C7B002D8ED8002F8BCB00105DA800126EB9000D53
      9B000F3E68003BA1E3002A91D8003BA1E3003BA1E3003BA1E3003097DB00379E
      E1003399DD0002629C004F6B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A0A0A000CFCFCF00EAEAEA00F3F3
      F300FAFAFA00F8F8F800F6F6F600F4F4F400F3F3F300F1F1F100C0C0C000FF9C
      9C00CC666600CC66660089707000E4E4E400A0A0A0008B8B8B0086868600A0A0
      A000C3C3C300CFCFCF00D7D7D700DBDBDB00D9D9D900A3A3A3006E6E6E006E6E
      6E009494940094949400A3A3A300000000000000000000000000000000000000
      0000F7FBF7001D8D220024AD31005978590058839B00084E8200133860001338
      60001338600013386000084E82002D8ED8001563A8001F80CF002184D1001C79
      C700105DA8003794CC002C92D9003FA5E5003FA5E5003FA5E5003399DD003BA1
      E300379EE1000968A6004F6B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A000C3C3C300C4C4
      C400EAEAEA00FAFAFA00FAFAFA00F8F8F800F6F6F600F4F4F400C3C3C300FFA0
      A000CC666600CC66660081686800DCC3C300E5B9B900EDE1E100E7E7E700B1B1
      B1008E8E8E00827B7B008A898900BABABA00CFCFCF00BABABA0094949400A0A0
      A000A0A0A0000000000000000000000000000000000000000000000000000000
      000000000000CDE3CD00359736006F926F004C7CA100094C7B00133860001338
      60001338600013386000035789003092DB00105DA800469BD900469BD9002F8B
      CB00105DA8003E9BD1002C92D90042A8E6003FA5E5003FA5E500379EE1003FA5
      E500379EE1000968A6003B647B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0A0A000A0A0A000B7B6B600D3D3D300FAFAFA00F8F8F800C6C6C600FFA2
      A200CC666600CC666600765D5D00B8858500BE585800E2AFAF00F4F4F400E7E7
      E700D9D9D900CD9A9A00804D4D00935353006D4747004D4D4D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F8FA003280B2000F3E6800133860001338
      60001338600013386000035789003BA1E3002F8BCB00D3CFF200E2EEF5006E9F
      C0001563A80048AEEB002A91D80045AAEA0042A8E60045AAEA003BA1E3003FA5
      E5003FA5E5000B6CA9003B647B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A0A0A000B4B4B400BDBDBD008B8B8B00FFA6
      A600CC666600CC66660079606000A7747400B44E4E00D6A3A300FDFDFD00F4F4
      F400E7E7E700D5A2A200804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F5002A74A4000F3E6800133860001338
      6000133860000F3E6800035789003BA1E30042A8E600498BB30074ACD4001977
      B90049A3D90048AEEB002D94DA0048AEEB0045AAEA0048AEEB003FA5E50042A8
      E6003FA5E5001273B4002A607F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFA9
      A900CC666600CC666600866C6C00BA878700A9434300BF8C8C00E7E7E700FDFD
      FD00F4F4F400DBA8A800804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9E7F0000C64980013386000133860001338
      6000133860000F3E6800015C91003FA5E50045AAEA00379EE100379EE1004BB1
      EE004BB1EE004BB1EE002D94DA004BB1EE0048AEEB0048AEEB0045AAEA0045AA
      EA0042A8E6001977B9001E5F8500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAC
      AC00CC666600CC6666008B727200CA9797009F393900A5727200C3C3C300E7E7
      E700FDFDFD00E1AEAE00804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9DDEA000160960013386000103353001338
      6000133860000C447000015C910045AAEA0048AEEB00379EE1003BA1E3004EB5
      F0004BB1EE004EB5F0002D94DA004EB5F0004BB1EE004BB1EE0048AEEB0042A8
      E60048AEEB001977B900145B8700FFFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAF
      AF00CC666600CC666600876E6E00DCC3C300C58C8C00B58E8E00A3A3A300C3C3
      C300E7E7E700E4B1B100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B9D1DD0002629C0006642800056E0A000921
      3500103353000C4470000160960045AAEA004BB1EE0049A3D9005CB2E80073BB
      E6007AC1E70086C2E40074ACD4009AC9DC009AC9DC009AC9DC00A7C8D700A7C8
      D70084BEDE001F81C600145B8700F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB3
      B300CC666600CC6666005B4F4F0098989800C6C6C600F4F4F400C6C6C600A3A3
      A300C3C3C300D4A1A100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9BCC700015893000252140034BC44000252
      1400092135000C4470000160960042ACF10084BEDE00F1E3CF00F3E8D300FDEC
      D300FDECD300FDECD300FFF5D700FFF5D700FFF9D800F9F2D700FFF5D700FDEC
      D300FCE5C7001F81C60003578900F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB6
      B600CC666600CC666600CC666600B96060009C565600804D4D00796060006D66
      66006B6B6B00A370700076494900CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9BAB9006F926F0012841400189B1F0045B24D0062CF76007BD8
      920034A83C0009485200005D9B005CB2E800E7E2D3005D58F200544EF1006762
      F3003E39EF00FFFFFE00544EF1003E39EF00211BED00EEEEFD00B6B3F800E9E4
      F300FFF4DC002184D10003578900F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB9
      B900CC666600CC66660089505000A6595900C2636300CC666600CC666600CC66
      6600B9606000A6595900804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E70012841400189B1F0043C5560055CA690062CF760067D17C0074D6
      8B0083DC9A000F785300005D9B005CB2E800EFEDD7000F08ED00544EF100A6A2
      F600544EF100BDBBFA00211BED00BDBBFA002B24EE00FFFFFE00B6B3F800EAE6
      F900FFF4DC002685C900015C9100F2F2F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBC
      BC00CC666600CC666600735F5F00C0C0C0009F9F9F00918B8B008A7171008C59
      590093535300A6595900CC666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000004A8F
      4A000E9D160034BC440034BC440043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D700211BED007974F500BDBB
      FA00FFFFFE000F08ED00B6B3F800D6D5FC002B27F000FFFFFE00B6B3F800E6E5
      FC00FFFBE400288FD700015C9100EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBF
      BF00CC666600CC666600876E6E00CDCDCD00DBDBDB00E3E3E300F6F6F600F8F8
      F800EFEFEF00CACACA0066666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000E9D
      160024BA35002ABE3C0038C34B0043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D7000F08ED003D36EF00BDBB
      FA00FFFFFE000F08ED008681F500DFDDFB00312AEE00FFFFFE00B6B3F800AEAE
      B200C8B7A4002D94DA0001609600EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC2
      C200CC666600CC666600866C6C00D0D0D000CDCDCD00C4C4C400B4B4B400BDBD
      BD00B1B1B100D7D7D70098989800CC666600CC6666004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000075AB750018B8
      290024BA350024BA350024AD310025982A00168125001D8D220055C063007BD8
      920045B24D00005774000968A6007AC1E700FFF5D7000F08ED004942F1006F6A
      F400322DF000FFFFFE00544EF100544EF1004942F1006F6AF4007469E800F4E5
      D50086C2E4003097DB0001609600E2E3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC5
      C500CC666600CC666600866C6C00CACACA00B7B6B600B9B9B900B4B4B400BABA
      BA00C8C8C800E1E1E10097979700CC666600CC6666004A4A4A00000000000000
      00000000000000000000000000000000000000000000E2EDE2001D8D220018B8
      290018B829001D8D22004A8F4A00296F8C00035789000664280055C063002598
      2A0002521400035789000B6CA90086C2E400F9F2D7006762F3008681F500B6B3
      F800BDBBFA00FFFFFE00F4F6FB00F4F6FB00FBFBFC00FFFFFE00FFFBED009AC9
      DC0051BCF900389CDE0002629C00DEDFDF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC9
      C900CC666600CC666600856B6B00C8C8C800AEAEAE00BDBDBD00C3C3C300DBDB
      DB00C6C6C600E4E4E40094949400CC666600CC6666004A4A4A00000000000000
      000000000000000000000000000000000000000000008BC38B000C9411004A8F
      4A00D4D5D10000000000000000001B6D9F00015C910006642800056E0A001338
      600013386000035789001271AC0086C2E400FCE5C700FEF6EA00FEF6EA00FFF3
      E200FFF3E200FFEFDB00FFEFDB00FDECD300FAE7D500F1E3CF00D9DAD9004CB7
      F40055B8F500389CDE0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00FFCB
      CB00CC666600CC666600856B6B00E1E1E100E3E3E300E7E7E700D4D4D400D3D3
      D300C4C4C400D0D0D00094949400CC666600CC6666004F4F4F00000000000000
      000000000000000000000000000000000000000000008BC38B00068B0900E2E3
      E3000000000000000000000000001B6D9F00015C910009485200094852000F3E
      680013386000035789001271AC0068BBEC00E7DCCA00FCE5C700F4E5D500E7DC
      CA00D4D5D100B9D1DD00A7C8D7007AC1E70068BBEC0055B8F5004CB7F4004EB5
      F0004EB5F0003092DB0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8C1
      C100EDBBBB00C6999900DEDEDE00C4C4C400E7E7E700F3F3F300EFEFEF00EFEF
      EF00EDEDED00EFEFEF0094949400CC666600CC66660075757500000000000000
      0000000000000000000000000000000000000000000094C894004A8F4A000000
      0000000000000000000000000000A7C8D700498BB300498BB300498BB300498B
      B300498BB300016096001271AC0045AAEA0042ACF1003CA4EA00379EE1003293
      D4002F8BCB001F81C6001273B4000968A6000C649800015C9100015C91000158
      9300015C91001B6D9F004283AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9D9D900EFEFEF00E3E3
      E300E1E1E100FAFAFA00AF9F9F00E1AEAE00C78E8E0000000000000000000000
      00000000000000000000000000000000000000000000ECF5EC00CDE3CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B6D9F0002629C001271AC000968A6000160960001609600015C
      910002629C00015C9100005D9B000C6498000C6498004E8FB7006E9FC000B9D1
      DD00D9E7F000F6F8FA00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB9D1004283AB0089A3B200A9BCC700E4EBEE00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFE0FFF0000000000000000
      FFFE3FFFFFFC00030000000000000000FFF807FFFFFC00010000000000000000
      FFC001FFFF8000010000000000000000FF00007FFF8000010000000000000000
      FC00000FFE0000010000000000000000F0000003F80000010000000000000000
      C0000000F0000001000000000000000080000000E00000010000000000000000
      0000000080000001000000000000000000000000800000010000000000000000
      00000000C0000001000000000000000000000000E00000010000000000000000
      00000001F0000001000000000000000080000007F80000010000000000000000
      F000003FFE0000010000000000000000FE00003FFE0000010000000000000000
      FFC0003FFE0000010000000000000000FFC0003FFE0000000000000000000000
      FFC0003FFE0000000000000000000000FFC0003FFE0000000000000000000000
      FFC0003FF80000000000000000000000FFC0003FF00000000000000000000000
      FFC0003FE00000000000000000000000FFC0003FE00000000000000000000000
      FFC0003FC00000000000000000000000FFC0003F800000000000000000000000
      FFC0003F860000000000000000000000FFC0003F8E0000000000000000000000
      FFE0003F9E0000010000000000000000FFFF807F9FF800010000000000000000
      FFFFFFFFFFF81FFF000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ImgImagens_Consulta: TImageList
    Height = 32
    Width = 32
    Left = 321
    Top = 7
    Bitmap = {
      494C010109000D00100020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00E6E6E600DDDBDB00E2E2
      E200EBEBEB00EEEEEE00EEEEEE00EEEEEE00EBEBEB00E6E3E100DDDBDB00D8D7
      D700D4D4D40000000000C7C7C500BEBEBD00BEBEBD00B3B3B300A8A9A900A8A9
      A900B3B3B30000000000EBEBEB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00954D2B00C7C7C500D4D4
      D400E2E2E200EEEEEE00EEEEEE00EEEEEE00E6E6E60000000000B3B3B300A8A9
      A9009E9E9E00A8A9A900A8A9A900BEBEBD00C7C7C500D0D1D000D9E3DD00E2EE
      E300D5DED600B3B3B300D8D7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EBEBEB00EBEBEB00E6E6E600954D2B00954D2B00C7C7
      C500BEBEBD00E2E2E200EEEEEE003A8650003A753D0085A58700C3D5C800D5DE
      D600FBFFFC00F8FFFA00F8FFFA00F8FFFA00F6FEF800F3FFF800F3FFF800F3FF
      F800C3D5C800B3B3B300D8D7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EBEBEB00E6E3E100D8D7D700D0D1D000954D2B00B8684300954D
      2B00B3A79E00D4D4D400EEEEEE001F6F20009BB99D00C3D5C800FDFFFD00FDFF
      FD00FBFFFC00F8FFFA00F6FEF800F6FEF8008BC099000C6F32000C6F3200E8F8
      EF00D8E9DC00B3B3B300D4D4D400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00D9CCC400C1A09100B07A6000954D2B00B8684300C36F4A00B868
      4300954D2B00BEBEBD00EEEEEE001F6F2000B6CCB80085A58700FDFFFE00BBDD
      BD007FB982006CB771006CB7710064AC6900107235000C6F32005CA56E00DDF1
      DF00EEF8F200A8A9A900D0D1D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00EEEE
      EE00E1D7D100B5795C00AB593500B8684300D57C5400D57C5400D57C5400D57C
      5400C36F4A00954D2B00E6E3E1001F6F2000BBD2BC003A753D00FDFFFE00FDFF
      FE00BBDDBD006CB771006CB771001E7C3E000C6F32005CA56E0064AC69009FD0
      A400F3FFF800B3B3B300D0D1D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00EEEE
      EE00CDAA9900AB593500D78E6C00F2A27D00F2A27D00F2A27D00F4986C00F498
      6C00D78E6C00C2724B00E1D7D100277A2500BBD2BC001E602300EEEEEE00FDFF
      FE00FDFFFE00DDF1DF004B994A000C6F32001E7C3E00BBDDBD00F8FFFA00F8FF
      FA00F6FEF800B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00DDDB
      DB00B5795C00F2A27D00FCC1A300FCC1A300FCC1A300FCC1A300FDB89600FCC1
      A300C2724B00D9CCC400EEEEEE00277A2500BBD2BC001E602300B6CCB800FFFF
      FF00FDFFFE00C3D5C800107235001072350064AC69006CB771009FD0A400F6FE
      F800F8FFFA00BEBEBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EEEEEE00D8B3
      A100CB866600FCC1A300D78E6C00D2B2A100E3CDC200B8684300FCC1A300C272
      4B00D0AE9D00EBEBEB00EEEEEE00277A2500BBD2BC001F64240085A58700FFFF
      FF00EEF8F200107235000C6F32008EBDA000E3F1E4006CB771006CB771008AC6
      8E00EBF7EB00C7C7C50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E600E6E6E600D78E
      6C00FCC1A300CB866600D9CCC400E2E2E200E6E6E600C2724B00C2724B00D1C3
      BB00FAF6F400E6E6E600E6E6E600277A2500D3E5D20074AB770088B78A00FFFF
      FF003A8650003A8650005CA56E00FDFFFE00FDFFFD00FDFFFD00FBFFFC00FBFF
      FC00F8FFFA00D8DAD900D0D1D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8DAD900D4D4D400CB86
      6600CB866600D1C3BB00D0D1D000D4D4D400D4D4D400C2724B00CCB9AC00D0D1
      D000D4D4D400D8DAD900EBEBEB002F8C2700D3E5D20088B78A007FB98200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FDFFFE00FDFFFD00FDFFFD00FBFF
      FC00FBFFFC00EEEEEE00D8D7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3A79E00C4BAB100CB86
      6600CDAA9900B3A79E00968574008D7B690096857400A1928400A19284008D7B
      69009685740096857400C4BAB1002F8C2700D3E5D20093C895007FB98200D3E5
      D200CCE1CC00CCE1CC00CCE1CC00BBDDBD00B1D8B2009FD0A40093C89500D3E5
      D20064AC6900F0F0F000EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFBFA00FDFCFB00DB9E
      8100FBF7F400FDFBFA00FCFAF800C5B2A300FAF6F400FBF7F400FAF6F400FBF6
      F200FBF6F200FBF6F200E1D7D10073AE6F0093C89500E3F1E40093C8950093C8
      950093C8950093C8950093C8950093C8950093C8950093C8950093C89500EBF7
      EB004B994A00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFBFA00FDFCFB00FDFC
      FB00FDFCFB00FCFAF800FCFAF800C5B2A300FBF7F400FBF7F400FBF6F200FAF5
      F200FAF6F400FBF6F200E1D7D100D3E5D2002F8C2700BBDDBD00EBF7EB00B1D8
      B2009CD29F009CD29F009CD29F009CD29F009CD29F009CD29F0093C89500EBF7
      EB004B994A00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFCFB00FDFCFB00FDFC
      FB00FDFBFA00FDFBFA00FCFAF800C5B2A300FBF7F400FBF7F400FBF6F200FAF6
      F400FBF7F400FAF6F400DFD5CE00FEFDFD00AFD3AD002F8C270093C89500D7EB
      D600EBF7EB00EBF7EB00EBF7EB00EBF7EB00EBF7EB00EBF7EB00EBF7EB00EBF7
      EB004B994A00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFCFB00FDFCFB00FDFC
      FB00FDFBFA00FCFAF800FCFAF800C5B2A300FCF8F600FBF7F400FBF7F400FBF6
      F200FBF7F400FBF6F200D9CCC400FDFCFB00FEFDFD00E2EEE30077B571004499
      3C002F8C27002F8C27002F8C27002F8C27002F8C27002F8C27002F8C27002F8C
      27004B994A00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CAB7A800CAB7A800CAB7
      A800CAB7A800C7B5A500C7B5A500C5B2A300C5B2A300C5B2A300C5B2A300C5B2
      A300CCB9AC00C5B2A300CCB9AC00D9CCC400DFD5CE00E1D7D100E1D7D100E1D7
      D100E1D7D100C4BAB100EBEBEB00E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFC00FEFDFC00FDFC
      FB00FDFBFA00FDFBFA00FDFBFA00C7B5A500FCF8F600FCF8F600FCF8F600FAF6
      F400FAF6F400FAF5F200C5B2A300FAF5F200FAF4F100FAF4F100FAF4F100F9F3
      EF00F9F3EF0096857400D8DAD900E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFD00FDFCFB00FEFD
      FC00FDFCFB00FDFBFA00FDFBFA00C7B5A500FCFAF800FCF8F600FCF8F600FCF8
      F600FBF7F400FBF6F200C2AFA000FAF4F100F9F3EF00F9F2EE00F9F2EE00F9F2
      EE00F9F2EE00816E5B00D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFC00FEFDFC00FEFD
      FC00FDFCFB00FDFBFA00FDFBFA00C7B5A500FCFAF800FCF8F600FCF8F600FCF8
      F600FBF7F400FBF7F400C2AFA000FAF4F100F9F3EF00F9F3EF00F9F3EF00F9F2
      EE00F9F2EE00816E5B00D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFD00FEFDFC00FEFD
      FC00FDFCFB00FDFCFB00FDFBFA00C7B5A500FCFAF800FCF8F600FCF8F600FCF8
      F600FBF7F400FBF7F400C2AFA000FAF4F100FAF4F100F9F3EF00F9F2EE00F9F2
      EE00F9F2EE00816E5B00D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCB9AC00CCB9AC00CAB7
      A800CAB7A800CAB7A800CAB7A800C7B5A500C7B5A500C7B5A500C5B2A300C5B2
      A300C5B2A300C5B2A300C2AFA000C2AFA000C0AC9D00C0AC9D00C0AC9D00C0AC
      9D00C0AC9D00816E5B00D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFD00FEFDFD00FEFD
      FD00FDFCFB00FEFDFC00FDFBFA00C7B5A500FCFAF800FCFAF800FCFAF800FCF8
      F600FCF8F600FBF7F400C2AFA000FAF4F100FAF4F100FAF4F100F9F3EF00F9F3
      EF00F9F2EE00816E5B00D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFD00FEFDFD00FEFD
      FD00FEFDFD00FEFDFC00FDFCFB00C7B5A500FCFAF800FCFAF800FCFAF800FCF8
      F600FCF8F600FCF8F600C2AFA000FAF5F200FAF5F200FAF4F100FAF4F100F9F3
      EF00F9F2EE00816E5B00D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFD00FEFEFD00FEFE
      FD00FEFDFD00FDFCFB00FDFCFB00CAB7A800FDFBFA00FCFAF800FCFAF800FCFA
      F800FCFAF800FCF8F600C2AFA000FAF5F200FAF5F200FAF4F100FAF4F100F9F3
      EF00F9F3EF008D7B6900D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFD00FEFDFD00FEFE
      FD00FEFEFD00FEFDFD00FEFDFD00CAB7A800FDFBFA00FCFAF800FCFAF800FCFA
      F800FCF8F600FCFAF800C2AFA000FBF6F200FAF5F200FAF5F200FAF4F100FAF4
      F100F9F3EF0096857400D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B07A6000B07A6000B07A
      6000B07A6000B07A6000B5795C00AD735500AD735500AD735500AD735500AA6E
      5000AA6E5000AA6E5000A7674700A7674700A7674700A7674700A7674700A767
      4700A4614000A4614000D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7B9AA00D7B9AA00D7B9
      AA00D7B9AA00D7B9AA00D7B9AA00AD735500D7B9AA00D7B9AA00D7B9AA00D7B9
      AA00D7B9AA00D7B9AA00A7674700D0AE9D00D0AE9D00CDAA9900CCA89600CAA5
      9300CAA59300A4614000D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7B9AA00D7B9AA00D7B9
      AA00D7B9AA00D7B9AA00D7B9AA00AD735500D7B9AA00D7B9AA00D7B9AA00D7B9
      AA00D7B9AA00D7B9AA00A7674700D2B2A100D0AE9D00D0AE9D00CDAA9900CCA8
      9600CAA59300A4614000D4D4D400E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7B9AA00D7B9AA00D7B9
      AA00D7B9AA00D7B9AA00D7B9AA00AD735500D7B9AA00D7B9AA00D7B9AA00D7B9
      AA00D7B9AA00D7B9AA00A7674700D2B2A100D2B2A100D0AE9D00D0AE9D00CDAA
      9900CCA89600A4614000D8DAD900E6E6E600EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000070101000502C2800502C2800502C28004830300048303000483030004830
      3000483030004830300048303000483030004830300048303000483030004830
      3000503830005038300050383800503838005038380050383800503838005038
      38005038380050383800402C2000702828000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00E1E1E100ECECEC00FBFB
      FB0000000000F8F8F800DADADA00CACACA00EEEEEE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9F9000000000000000000FAF7F9000000000000000000FAF8
      F800DEE1DF00C3CBC400A9B5A9009EACA0009FADA100A9B4AA00B4BAB500D8D8
      D800F2EFF100F7F6F800FAF8F800F7F7F700F6F9F700F9F9F900F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0303000F08C9000F0988800F0949800F0949800F0949800F0949800F09C
      9800F09CA000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4A800F0A4
      A800F8ACA800F8ACB000F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4
      B800F8B4B800F8BCB800A87C7800802428000000000000000000000000000000
      0000000000000000000000000000F2F2F200828486005D6B7300797D7F00C6C6
      C600FCFCFC00C4C4C4005A6D7700416D8E0092939400E7E7E700000000000000
      0000FAFAFA00FAFAFA00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E800C3CBC4008AA0
      8D003F6A45002B6633002E7134002D7033002D7033002E6D35002F5D32004461
      470076857700A3A9A400D0D0D000EEEEEE00F7F7F70000000000FAF7F900F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0383800F0949800F0949800F0949800F0949800F09C9800F09CA000F09C
      A000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4A800F8ACA800F8AC
      B000F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4B800F8B4B800F8B4
      B800F8BCB800F8BCC000A87C7800882828000000000000000000000000000000
      0000000000000000000000000000D2D2D2003B8AC8003488CD003182C5005673
      8600EAEAEA00617989003A8DCF003A8DCE003C85BE00B9B9B900FDFDFD00F1F1
      F100AEAEAE00ABABAB00CFCFCF00F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8D3CB007E9B8200376B3C00267B
      3000097915000A7A14000A7A16000A7A1600097915000B7B17000A7917001580
      20002C713400325D380064786500A3A9A400EFEFEF000000000000000000F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0383800F0949800F0949800F0949800F09C9800F09CA000F09CA000F09C
      A000F0A4A000F0A4A800F0A4A800F0A4A800F0A4A800F8ACA800F8ACB000F8AC
      B000F8ACB000F8ACB000F8B4B000F8B4B800F8B4B800F8B4B800F8BCB800F8BC
      C000F8BCC000F8BCC000A87C7800882828000000000000000000000000000000
      00000000000000000000FBFBFB009FA1A3005AA9DE005DADE3004D9EDA004293
      D000D6D6D6004E92C00061AFE30061B1E6004296D7007C889100F3F3F300BCBC
      BC003D85BB003B83BA00536C7B00D2D2D2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F90000000000F7F7F700BFCDC2002F6D3700177723000A791700107D
      1B0036AF410039BB460031BB3E002FBD3C0032BC3F0037BB46003CB547002EA1
      3900077313000D78180022772C00305F38008C928D00E0E0E000F8F7F900F7F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0383800F0949800F09C9800F09CA000F09CA000F09CA000F09CA000F0A4
      A000F0A4A800F0A4A800F0A4A800F8ACA800F8ACA800F8ACB000F8ACB000F8AC
      B000F8B4B000F8B4B800F8B4B800F8B4B800F8B4B800F8BCB800F8BCC000F8BC
      C000F8BCC000F8C8C000A8847800882828000000000000000000000000000000
      00000000000000000000F5F5F5006382960095D2F20096D3F5007DC2EC005CA9
      DF0049544B007DC0E90096D2F30092D1F40068B2E3005385A800DCDCDC005180
      A00060AEE30058A9E2004297D7006E808C00F5F5F500C5C5C500ABABAB00C7C7
      C700FDFDFD000000000000000000000000000000000000000000FAF8F8000000
      000000000000D9E4DA00598E5C0020792A000B7A18004EC2570040BE4E0037BE
      440029B9380020B82F001DB72A001EB82B0020B8310028B938002CBA390037BF
      420043C1510052C7600045B04F000F7718002A7A33004C6E5000A0A0A000EFF1
      F100FBF9F9000000000000000000F6F8F9000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8383800F09C9800F09CA000F09CA000F09CA000F0A4A000F0A4A000F0A4
      A800F0A4A800F0A4A800F8ACA800F8ACB000F8ACB000F8ACB000F8ACB000F8B4
      B000F8B4B800F8B4B800F8B4B800F8BCB800F8BCB800F8BCC000F8BCC000F8BC
      C000F8C8C000F8C8C800A8848800883030000000000000000000000000000000
      00000000000000000000EBEBEB0058809A00B0E0F700ADE0F80093CFF0006DB4
      E3004E69580094CEEE00ACDFF700A7DCF7007ABEE700508BB3008282820062A6
      D20087CAF1007BC2ED0060ADE1004E83A700CBCBCB0044739500377DB2004771
      8F00EBEBEB0000000000000000000000000000000000F9F6F800F8F7F900F9F9
      F900DBE2DD003778400016741F00127A1D004FBF5B0043C052003CC1490037BE
      440032BC3F0007690F002FB73A0020B72B0021B72E0028BA36002BB8390034BE
      410043C151004AC0570055C05F0067C8710012761E0023782E0033613700A09F
      A100FAF7F900FAF8F800F8F9F700000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8444000F09CA000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4
      A800F8A4A800F8ACA800F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4
      B800F8B4B800F8B4B800F8BCB800F8BCC000F8BCC000F8BCC000F8BCC000F8C8
      C000F8C8C800F8C8C800A884880088303000000000000000000000000000FCFC
      FC00CCCCCC00868786006174670050829C00C1EBFB00BDE9FB00A2D7F30075B9
      E4004E6E5E00A2D5F000B9E6FA00B3E2F90086C4EA00528DB2005D795F0077B5
      DC00A4DBF70096D2F30077BCE8005191BC007F8A91004597D5004697D500388C
      D000DADADA00000000000000000000000000F9F9F90000000000F8F9F700F6F9
      F70058925C0015751B0011761A005FC76A004DC0590045C151003DBF48002FBB
      3E00338D3A00A1BEA400186D1D0024B22F001FB72E0028B9350029B7360035C0
      410042BF4B004CC0550051C05E005EC0660067C5700011751B0020792A00496E
      4E00E0E0E000F8F9F70000000000F8F7F9000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8444000F09CA000F09CA000F0A4A000F0A4A800F0A4A800F0A4A800F8AC
      A800F8ACB000F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F0ACB000C894
      980048383800604C4800C8949800F0BCB800F8BCC000F8C8C000F8C8C000F8C8
      C800F8C8C800F8C8C800A884880090343800000000000000000000000000CCCE
      CD0070937A006D8F7600698B7000508298008DC3E40095C7E4007AB9DF0075B8
      E20053736400A8D9F200C4ECFB00BBE7FA008BC8EA005288A500608068008AC2
      E200B7E5F900A7DBF60087C6EB005595BF005C7D920071B9E70071BAE80059A6
      DD00CACACA000000000000000000000000000000000000000000FAF8F800DDEE
      E00016721F001D7C25006DCA75005FC167004FBF590045C0520040BF4B0047B5
      4F00859F8700AEB1AF00ADC3B0002A9A340024B7310028B7380030B93F0035BF
      420044C04E004CC0550053C05E005CC0660069BF71006AC373000E7218002979
      3400949B9400F0F0F00000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8444000F0A4A000F0A4A800F0A4A800F0A4A800F8A4A800F8ACA800F8AC
      B000F8ACB000F8ACB000F8B4B000F8B4B000F8B4B800F8B4B800C89498005044
      3800201C00004850200068544800D8A4A000F8C8C000F8C8C800F8C8C800F8C8
      C800F8D0C800F8D0D000A88C900090343800000000000000000000000000C8CA
      C90049614B004E6652005A786100527E8B00C3EBFC00C8EEFE00CEF1FE005499
      C4006081640085C6EA00BEE2F300B8DFF20069B4E30058817D0064856D0093C8
      E500A7D9F100A5D9F30091CCED00528AAA005588A600A7DAF200A4D9F4007FC0
      E800C6C7C700000000000000000000000000F7F7F70000000000E7F6E8003376
      3900217E29006CC2740064C06D005EBF680055C15E004FBC5A003F91480083A1
      8400C9C7C700F7F8F600F0F0F000A7C6A9003BBA470032BF400032BE41003BC1
      470046C252004DC0580054C15F005FC1670068BF6F0073C47B007FD186000B6C
      150031613700AAB2AB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B84C4000F0A4A800F0A4A800F0A4A800F8ACA800F8ACA800F8ACB000F8AC
      B000F8ACB000F8B4B000F8B4B800F8B4B800F0B4B800C894980050443800201C
      000070701000C0BC00009084000068544800C0989800F0C8C800F8C8C800F8D0
      D000F8D0D000F8D0D000A88C90009034380000000000F6F6F600CCCCCC006A70
      6C00346481003575A5003A5A5D00527162009CD5F50093CFF2008CCCF3005F8D
      94006788660075BCE500CBF0FE00C7EEFE0067B2E100698F74006A8B6F0082BD
      E000B6DDF100B4DCEF006CB5E20055828B005A8DA70080BEE30095C7E50073B8
      E200E1E1E10000000000000000000000000000000000F7FBF6009BBE9C001374
      1D007ED0850074C67D0069BF71005FC06A0062C06B00135318009CB09D00B2B0
      B000F7F7F7000000000000000000CDCFD0001B6122003DBF4A003BC0480040C1
      4E004AC256004FBF590057C05F005FC1670067C071006EC0770076C47D005DB3
      650020792A006A806D00D8D8D800000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C04C4800F0A4A800F8A4A800F8ACA800F8ACB000F8ACB000F8ACB000F8AC
      B000F8B4B000F8B4B800F8B4B800F8B4B800C894980060505000201C00005854
      0000D0C80000F8F80000D8D400005854000068544800D0ACA800F8D0D000F8D0
      D000F8D8D800F8D8D800A88C900088303000EEEEEE00B4B4B4004F6979004690
      C70081BCE100ACD6EC004A98D20045635F007DA18C0097B3AC0083A49900759A
      7A007193740064A2C60097D4F5009AD3F3005C97B800769C7B006F92740071B2
      D900C7EDFD00C7EEFD0079C0EB005E82750053859900A9DCF700C8EEFE00A0D7
      F5008F8E8E00F6F6F600000000000000000000000000F0FFF100377A3C000A6B
      140079C7800073C67B0069BF71006DC37500154B1C00B7C5BA00B2B0B0000000
      000000000000000000000000000000000000B0C2B1003A8F3F0044C0500042BF
      51004CBF570051BE5B0057BF60005FC0690067C071006CC1760077C87F007BCD
      840010791E00325C3900ABB0AE00FAF8F8000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C04C4800F0A4A800F8ACA800F8ACB000F8ACB000F8ACB000F8B4B000F8B4
      B800F8B4B800F8B4B800F0B4B800C894980060505000201C000058540000C8C8
      0000F8F80000FFFF0000FFF80000B09C0000484C0000686C6000C8ACA800F8D8
      D800F8D8D800F8E0D800A894980090343800BCBCBC004680A70062AADB006FB6
      E200BDE4F600C0E7FA00BBE1F4004584AC00759A7E0071977900759A7F00779D
      81007FA88A007FA883009DBDBB00B0CBCF006F927400769C7D0074997C006197
      B100A3D9F50098D2F30066A9D700739974005A89930091D3F5008FCDF1006AAD
      D9009CF6F90068828200C7C7C70000000000F6F9F700B9D8BD00197C2600429F
      4A0078C5820075C5800072B97A0014401700BCC2BD00C0BFC10000000000F6F8
      F800F4FAF500A1B2A500F6F9F70000000000D6D9D700A0BAA3003C9042004BBE
      56004FBF590054BF5E0059BE620062C16A0069C070006CC2740071C7790077C7
      8000086C12002B7835007C8D7F00F0F1EF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C04C4800F8ACB000F8ACB000F8ACB000F8ACB000F8B4B000F8B4B800F8B4
      B800F8B4B800F8BCB800C894980060505000201C000048440000B0B00000FFFF
      0000FFFF0000FFFF0000FFFF0000E8E800009084000048502000706C6800E8C8
      C800F8E0E000FFE0E000A8949800903438007C8E9A0095CEEC00B0DFF500C2EA
      FA00CEF1FF00CCF1FE0083C9F2005B8D9C0082AE890084B2880089B88E0089B9
      8F00749D78007BA6800089B88E008EBF93008ABA8F0088B78D0082AD8A00789E
      83006E94760073997B00779F7C007CA386007DA78500749B7C00719876007092
      780097EEF10088CCD2009CA6A00000000000F1FCF200417D470012761E0087D4
      900079B67E00435C4200BCC4BD00B5B7B70000000000F9F8FA0000000000FBF8
      FA007DB5820059B76000B6D3B900F6F9F700FBF9F900E5E6E400B5C0B6002E67
      340059BE62005BC267005FC06A0060BE690069BF71006EC1760073C67B0077C7
      82005AB36300157E230042674700D4D9D7000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0545000F8ACB000F8ACB000F8B4B000F8B4B000F8B4B800F8B4B800F8B4
      B800F0BCB800D0ACA80068585800402C200048381000B08C0000F8E00000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000D0C80000686C0000504C3800A89C
      A000F8D8D800FFE8E800A89C980098383800DBDCDC0097D5F400CAEEFC00D5F1
      FC008ECBF00096CEF00078A1A900739D740082AF870077A07C0056735B00556F
      5B0074987E0072967E005E7C660055715C00698D6D0084B289008BBC910089B9
      8E0080A98B00769C8100749A7D00769C80007BA28400759C7C0079A282006E91
      760097EEF10088CBD000B3B8B50000000000EDFFEE002979340010711A0081CB
      8B0079C6820070A87500B3C2B400FBF9F900F7F7F7000000000000000000F4FA
      F5005CB4610052BE5B005EA16300F1FDF1000000000000000000E6E8E800B7C5
      B90060B267005FC0690061C0690062BF6A0069C0700069C2730070C6780073C8
      7D007ACE80000C7619002D663300BCC4BD000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0545000F8ACB000F8B4B000F8B4B800F8B4B800F8B4B800F8BCB800F8BC
      B800F0B4B800A08C90004050500048381000A8841000FFD01000FFF00000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000C0BC0000686C0000686C
      6000D8C8C800FFE8E800A89CA00098383800FEFEFE0094A5B000CBECFD00DCF4
      FF00B1CFDA00BDCCC400D4E1D400B4C4B5004F695600698A71007AA18400759C
      7C007BA385007BA28500779D8000759B7C00799E840065866D0056725E005C7B
      5F0087B68C0089B88E0081AC8A00759A7E0074997C00759B7F00769C7D006E92
      790097EEF10085C7CC0094A29A0000000000ECFFED0022772D001E7D26007BC5
      850075C77C006EC0750073BB79008CB59000FAF7F900FAF8F800F8F7F900C3D6
      C70059BD630059BE620060BE6900B8D2BA0000000000F7F8F600F7F7F700D0D0
      D000618063006CB7730062BE6B0065BF6C0069C0700069BF710069C1750073C7
      79007ACD820011751D002D723500A7B5A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8545000F8B4B000F8B4B800F8B4B800F8B4B800F8BCB800F8BCC000F8BC
      C000F0B4B800A894980080745800B0882800F8BC1000FFD80000FFE80000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F0F00000B0B00000605C
      1800888C9000FFF0F000A89CA000983838000000000000000000FCFCFC00FAFA
      FA0000000000C7C9C800445D4C006A8A7500779D8000789F80007FA8890078A1
      7E00759B7E00749A7C00769E7D0079A27F007DA5870079A08100779D8100789F
      80005B79620056725C00698E6D0083B188007BA3850073977C0072977C006D90
      790097EEF10086C7CB00B0B6B30000000000E2F8E60020782C00217E290076C3
      800071C67B0069C0700067C16E0067BD6F0078B07B00CEDFD200F7FAF80077A7
      7D0061C0690061C0690061C069006CAA7400FCF8FD000000000000000000F8F7
      F900AFB3AE006F8C7300589B5D0069C070006AC1710069C0700069C175006FC8
      790071C77900096D13002A743400A5B6A9000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8585800F8B4B800F8B4B800F8B4B800F8BCB800F8BCC000F8BCC000F8BC
      C000E8BCB800787C780088783000F0982000E8AC2000F0BC1000FFE00000FFF8
      0000FFFF0000FFFF0000FFFF0000FFFF0000F0F01000F0F01000E0E010008878
      300078746800FFF0F000B0A4A800984440000000000000000000E7E7E7008B8C
      8C0071957D006D917300769C810079A18000789E8200759B7C007CA587007DA6
      8400779E7F0079A08200769E7B007BA481007CA58600779D8000769C7D00779E
      80007CA584007CA38700759B7C007AA18500678370004B644E00688D6E007599
      840098EFF20083C2C600A0A9A40000000000E2F8E60021792D00218029006FC0
      770069BF710069C0700064C16C0060BF68005FC0690063BF6C006DB8740069C0
      700069BF71006BC1730072C678006EC27400A7C1A900F6F9F70000000000F9F9
      F90000000000D6D8D800B4BAB500395C3A0073C279006BBF710069C0700069C0
      70006FC87800096D130027743100A5B6A8000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C05C5800F8B4B800F8BCB800F8BCB800F8BCC000F8BCC000F8BCC000F8C8
      C000E8BCB80068585800504C3800807C480088783000B08C0000F8D00000FFF0
      0000FFFF0000FFFF0000FFFF0000E8E80000C8D42800B8B46000B8B46000807C
      4800787C7000FFF8F800B0A4A8009844400000000000000000008EA298006A8C
      73006E9277006D9372006F92760073997C007EA6880078A17D007AA283007FAA
      870077A07E00779F7F0078A17F007CA681007CA4860079A181007AA381007DA5
      8700789E8000759C7E0078A07F007DA58600769C7E0074997D00709178006394
      9D0076BBBD0080BCC100919F970000000000ECFFEE0020782C001D81290069BE
      730068BF6F0062BF6A0061C0690061C0690061C0690065C16E0069C0700071C8
      78006FBF780077C87F007BC780007EC7810087BE8D00E4ECE500F7F7F700FBF9
      F90000000000F9F8FA00F0F0F000B0B1AF00617C620056965B0069C0700069C0
      70006CC57500096D130027733300B5C6B8000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C05C5800F8BCB800F8BCC000F8BCC000F8BCC000F8C8C000F8C8C000F8C8
      C800F0C8C800D8ACB000D0ACB000C8ACA800A0746800987C0000F8D00000FFE8
      0000FFFF0000FFFF0000FFFF0000D8D81800D0D49000E8E0D800F0E0D800E8E0
      D800E8E0D800FFF8F800B0A4A800A04440000000000000000000A8B4AD00688B
      6F006E9077006C8E7300769D8000729877007DA787007AA47F007AA185007CA5
      8300759C7C00789E8200759C7C0078A07F007CA38500789F7E007CA682007EA8
      8700779F7C007CA584007CA38600759A7D00759A7C00759D7D0075997B0097EE
      F20088CBD0005671650090A2980000000000ECFFEE0022772D0011761A0067C0
      710064C06D0061C0690061C0690061C0690066C06D0067C0700071C8780075C8
      7D007BC6820082C8890085C78C0087C890008CC690008DAF9000F5F8F600F8F9
      F70000000000000000000000000000000000CCD2CD00618D640067C16E0069C0
      700074CB7B0011751D002E703500C7D5C9000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF0000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000C05C5800F8BCC000F8BCC000F8BCC000F8C8C000F8C8C800F8C8C800F8C8
      C800F8C8C800F8D0D000F0C8C80088848800605C1800B09C0000FFD00000FFE8
      0000FFF80000FFFF0000FFFF0000D0C81800E0D8A000FFF0F000FFF8F800FFF8
      F800FFFFFF00FFFFFF00B0ACB000A04440000000000000000000D6D7D6006A8B
      740072967B006A8E6F00779D8100759D790079A0840077A17E00769C7D00789E
      810072987900759A7F0071977800759A7D00769D8100769D7D0078A17F007CA3
      860079A280007DA885007CA4850079A180007BA2850075997D006E92740092E3
      E80095EAF00074917E000000000000000000EDFEF100307A3A000D7216006DC7
      740061C0690061C0690061C0690061BF6A0069BF710070C6780075C87D007DC9
      820086C78F008BC7910090C7960093C7970091C8970095C69A0092A89500F7F8
      F600F6F8F80000000000F9F9F900FBF9F900EBF6EC0076B3790067C0700067BE
      6E0071CB78000F771800376B3C00DBE3DC000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000D0646000F8BCC000F8BCC000F8C8C000F8C8C800F8C8C800F8C8C800F8D0
      D000F8D0D000E8C8C800889CA00048583800A8841000F0B40000FFC80000FFE0
      0000FFF00000FFFF0000FFFF0000C8D42800E0E0A800FFF8F800FFF8F800FFFF
      FF00FFFFFF00FFFFFF00B0A4A800A04440000000000000000000FCFCFC00809C
      8B006081630072967C006D92730073997E00759A7F0072987A007DA5880085B1
      8D0087B68C0088B68D0088B78D0087B68C0086B18E0080A88800779C82007399
      7A00749A7C00789F8100769D7D007AA28200759C7A0079A28100789E810087CB
      D0009AF4F70069846F000000000000000000F4FAF50087B38C000C7717005DBE
      670060BF680061C0690061C0690067C16E0073C7790079C87F0081C886008BC8
      900096C799009BC8A1009EC7A100A1CAA4009EC9A4009FCBA4009CC7A20096B0
      9900F6F9F700F6F8F8000000000000000000D8E9DB0071C17A0067C0700062BE
      6D00319137001B7C26008AA78E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000D0646000F8C8C000F8C8C000F8C8C800F8C8C800F8C8C800F8D0D000F8D0
      D000F0D0D000889CA00040505000786C1800D0840000FFB40000FFC80000FFD8
      0000FFE80000FFF80000F8F80000C8D42800E0E0A800FFF8F800FFFFFF00FFFF
      FF00FFF8F800FFF0F000A89CA000A04440000000000000000000FDFDFD009DA6
      A10065876A006D9077006D91740072957B0080A98B0085B38B0088B78D008BBB
      90008EBF94008FC094008FC094008FC094008CBD92008BBB910089B98D0087B6
      8D007CA58500779C810072987900769C7F00749B7C00759D7E0073987A0082BE
      BF009AF4F70068896F00000000000000000000000000EAFFEB0023792B001677
      200060BE690061C0690062BF6A0069C0700077C87F0081C987008BC88E0091C8
      97009CC7A200A2C9A900ABD0B000B0D0B100ADCFB000ABD0AE00A8CDAB00A3C8
      A600BDC4BD0000000000FAF8F800F7F7F700DAE9DB0073C37C0069C0700067C0
      7000086C120032753800C7D5C900000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000D0646000F8C8C800F8C8C800F8C8C800F8D0C800F8D0D000F0D0D000E8C8
      C800888C9000284C4800683C1800D0840000F8980000FFA00000FFBC0000FFD0
      0000FFE00000F8E80000D8D81800E0E87800F8F0D800FFFFFF00FFFFFF00FFF8
      F800FFE8E800F8E0E000A88C9000A04C4800000000000000000000000000899D
      9300688A7100688A7000779D80007DA8840083B1890087B68D008BBB91008EC0
      930092C3970092C5990094C6990093C6990092C5980091C297008FC195008EBE
      93008ABA900088B78D0086B28E007EA689007196790073987C00719578007DB3
      AE0099F2F500668A7300F4F4F4000000000000000000F3FCF200588F5E001176
      1A0064C26E0061BF6A0063C06B0068C1720079C87F0083C88B008FC895009BC9
      9F00A3CAAA00B2D1B400B2D1B600B6D1B700B3D2B700B0CFB200AFD1B300A5CA
      AA00A4C3A600D0D8CE00FBF9F90000000000E3F1E50076C380006BC1730073CC
      7C000F771A006B906E00E4E9E700000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000D0646000F8C8C800F8C8C800F8D0D000F8D0D000E0C8C00098A4A800787C
      880040444000683C1800C04C0000F8780000F8980000FFA00000FFB40000FFC8
      0000FFD80000F8E00000C8D42800F0F0C800FFFFFF00FFFFFF00FFF0F000FFE8
      E800F8E0E000F8D8D000A8848800A04C4800000000000000000000000000899E
      930073977C0071997600709B750086AD8A0082B0870087B68D008BBB91008EBF
      930092C3970093C6990094C89A0095C89B0096C99B00A1CEA400A4CFA6009FCB
      A1008EC294008FC094008CBD920089B98F0083B1880080A88A0074997D0076A6
      9B0098F0F3006D958C00C2C5C4000000000000000000F6F9F700E3FFE7001672
      21005ABB640062C0690067C16E006EC378007EC9850089C98E0093C798009FCA
      A500AED0B200B4D1B800BAD0BD00BFD2BF00BCD0BD00B6D0B900B4D1B700AED0
      B200A1CAA500A1C9A600AAB5AB00F9FAF800EDF9ED0075B77C006AC374003593
      3E002A7A3300CEE0CF00F9F9F900000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000D0646000F8D0C800F8D0D000D8BCC80098A4A80078848800304448005830
      1800A0441000E8481000F8780000FF7C0000FF880000FFA00000FFB40000FFC8
      0000FFD00000D8D02800D8D87000F8F0E000FFF8F800FFF0F000F8E0E000F8D8
      D800F8D0C800F0C8C000A07C7800A04C48000000000000000000000000000000
      0000C6CECA00A4BDAD0068936D00DFE9DF00E8F0E900BAD1BC00B9D4BC00B1D0
      B5008BBB90008DBE9300A8CFAA00C0DAC000B6D4B800B3D0C100BDF3F800BEF7
      F900B9D6C10099C89E00A9CFAD00CFE4D1008DBB9300DCE8DA00A6C4BD0094E9
      EF0097F0F20083BFC500939E97000000000000000000F6F8F800F6FAF500BCDE
      BF0013761A005CB8650068BF6F006EC1760081C8890091CA97009BC99F00A6C9
      A700B6D0B900BCCFC000C6D1C700C8D0C900C3D1C500BCCFBE00B6D0B900B1CF
      B200A4C9A7009BC99F0091C7980094BD9800CDE4CE0066A66B0043A14A001677
      2000CAE1CB00F8F9F700F7F6F800FAF8F8000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF000000
      0000C0C0C000000000000000000000000000787C8800787C7800707C7800687C
      7800A0646000C8A4B000C0989800887C880030444800502C280088201000C04C
      0000FF500000FF6C0000FF6C0000FF7C0000FF880000FFA00000FFB40000FFBC
      0000F0D01800D0D49000F8E8E000FFF8F800FFE8E800F8E0E000F8D8D000F8D0
      C800F0BCC000F0B4B800A0746800A85050000000000000000000000000000000
      0000000000000000000000000000BCC5C100729C7A00DCE7DD00D1E0D30090B5
      940083B0880082B18800C3DDC300B4D6D800BFF7FB00BFF8F900BFF7F900B5DA
      D900C4DDC40090C296008FC195008DBE900095C3B7008DE1E50099F2F40098F1
      F50092BDBB006D927000ADB7B20000000000000000000000000000000000F3FC
      F20025772C0013761A0052AF5A0069BE730081C889008FC895009BC99F00A4C9
      A900B9D0BA00C0CFC100C9D0C900CCD1CF00C5D0C600BED0BF00B6D0B900B0CF
      B200A3C8A6009BC99F0091C8970084CA8B0071BC78004192490012771B00387F
      3D00F6F9F7000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF000000
      000000000000000000000000000000000000707C780060646800685858006858
      580088545000783848007028280080242800A0181000E01C1800F0200000FF34
      1000FF341000FF500000FF6C1000F89C3800F89C3800F0982000F0B40000E8AC
      2000D8D86800F8F0D800FFF0F000F8E8E000F8D8D800A89CA000686C6800686C
      6800686C6800686C600040505000A85050000000000000000000000000000000
      00000000000000000000000000000000000000000000EBEDEC00A2B1A8007FA8
      880079A47E007DA78100A1C4A200C6E0C400B6D5C400B7D9CD00BBD9C900C9E1
      C6008CBC92008CBB8D0082AF9C008FDCE10098F0F30099F2F70082BEBB007399
      7A008DA89700FAFAFA0000000000000000000000000000000000000000000000
      0000C2EDC8001B70250013751B0061BF68006FC0770089CB900098C99D00A4C9
      A900B8CFB900C0CFC100C9D2C800C8CFCA00C6D1C700BCCFC000B6D0B800B0CF
      B2009FCAA50095CB9C0089CA92006BBC730051B0590011751B002A783100DAF2
      DA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007884880078746800D0404800E01C
      1800F8241800E01C1800F8101000F8101000F8101000F8101000FF341000FF34
      1000FF500000F0884000F8A05000FFD0A800FFC88800F89C3800E8AC2000D8D8
      7000F8F0D800FFF0E800F8E0E000F8D8D800F8D0C800A8949800B8ACB000A88C
      9000986C6800986C6800604C4800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CED5D2008CA793007CA6820076A17A0084AD870086B08A0082AF860080AE
      820085BDB40095EBF10099F2F40099F2F6007EB3AC00779F780080A18800D8DD
      DB0000000000000000000000000000000000F6F8F80000000000000000000000
      0000F5F8F600BFE7C40024772C001275190062C16A0069BF710078BB7D009FD3
      A400B0D2B400B8D1BD00C0CEC200C5D0C600BED0BF00B8CFB900B2D1B400ADD3
      AF008FC895006EBB780066BF700054B35C0013771F00327B3700E2F9E3000000
      0000F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000986C6800D040
      4800F8504800F8504800F8504800F8504800F8504800FF746000FF746000F098
      8800FFB4A000FFD8C000FFD0A800F0AC8800F8A05000F0884000D8BC8800F8E8
      D800F8E8E000F8E0D800F8D0D000F8C8C800F0BCB800A8949800E0B4B800D084
      8000B06C68008854500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAECEB0092AAAB0092E1EA009CF8
      FB0098F1F6007DB3AA0079A07E009DAFA300FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3FCF2009BC6A10014761C000F771A0023852B006AC7
      72006BBD72006BB972006CB773006DB874006CB9750069B9720068B970006EC5
      750060C36D00197D23000F77180020792900CBE8CE00F4F9F70000000000F8F7
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000887C88009074
      7000986C6800C8545000F8504800F8746800F8A4A800F8C8C800F8D0D000F8D0
      D000F8B4A800F0AC8800F8A05000F0884000E8C8A000F8E8D800F8E8D800F8E8
      E000F8D8D800F8D0D000F0C8C000F0B4B800F0ACB000A88C9000C8949800B06C
      6800885450000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00A5B1AA00EEF1EF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F9F70000000000000000000000
      0000FAF8F8000000000000000000F3FBF400D1F3D500377D400012761C000F77
      180010781B00278F320043AB4E0045AA4E0045AA4E003EA24800258A2E001276
      1C000E7919001F7B2A0053885600E0FAE300F6F9F70000000000FAF8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8747000A8949800A8505000C8545000D0585800D0585800D0646000D064
      6000C05C5800A8847800E0B4B800F8E0D000F8E8D800FFE8E800F8E0D800F8D0
      D000F8C8C800F0BCC000F0B4B000F0ACA800E8A4A000A88C9000B06C68008854
      5000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F9
      F70000000000000000000000000000000000F7FAF800EDFEF100C8EACC004C87
      540021792D0012761C000F7817000F7817000E7918000F771A001B7925002C79
      350069976D00E0FAE300F4FDF300F7FAF8000000000000000000F6F9F700F6F8
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0848000FFE8E800FFF0F000FFF0F000FFF8F800FFF8F800FFF8F800FFFF
      FF00FFFFFF00FFFFFF00FFF8F800FFF0F000F8E8E000F8D8D800F8D0D000F0C8
      C000F0BCB800F0ACB000E8A4A800E89CA000F0949800A8848800885450000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAF8
      F800000000000000000000000000F7F7F70000000000F7F7F700F6F9F700F1FC
      F200ECFFEE00D2EAD200A6C5AA00A5C4A700A6C5A800B3D0B600DFF6E000EDFE
      F000F4FAF50000000000F8F9F700F9F9F900F8F7F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F500E2E3E300EBEBEC00F2F2F100FBFB
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080006E6E6E006E6E6E006E6E6E006E6E6E008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F90002629C0002629C00015C9100145B87001E5F
      85002A607F004F6B7B005F747D00828D930095989A00AEAEB200B9BAB900D9DA
      D900DEDFDF00F2F2F10000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A79000DFA79F00D09F9000CF979000CF97
      9000CF979000CF979000CF979000C0979000C0978F00C0978F00C0978F00C097
      8F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C097
      8F00C0979000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000800000FF
      FF0000008000000000000000800000FFFF000000000000000000808080006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E
      6E006E6E6E000176A9000171A3000171A3000273A5000275A800016FA2005C5C
      5C006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EEF500005D9B00005D9B0001609600016096000160
      96000160960002629C0001609600015C9100145B87001E5F85002A607F004F6B
      7B005F747D009B9D9E00E2E3E300000000000000000000000000000000000000
      0000000000000000000000000000D0AFAF00FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD09F00DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF000000800000FFFF000000
      8000000000000000800000FFFF00000080000000000058585800585858005858
      5800585858005858580058585800585858005858580058585800585858005858
      58005858580015ADD9002BC1EB002AB8DF0029B9DE0028C0EA00057EAF005858
      5800585858005858580058585800585858005858580058585800585858005858
      58005858580058585800585858005C5C5C000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100015C9100015C
      9100015C9100015C9100015C91000968A6001C79C7001F80CF001F80CF001F80
      CF001E7CCE001C79C7001C79C7001570BF001570BF00126EB9000968A600105D
      A80002629C001E5F8500AEAEB200000000000000000000000000000000000000
      0000000000000000000000000000CFB7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8B000FFD0B000FFD0
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000800000FFFF00000080000000
      00000000800000FFFF000000800000FFFF000000000099999900A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A6009090
      90007373730025A4CD0073D6EE0086EAFF007FE5FF006CD5F100187296007B7B
      7B00A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600585858005C5C5C000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100094C7B000F3E
      68000F3E68000F3E68000C4470000E6BB1001E7CCE002184D1002588D3002184
      D1002184D1002184D1001F80CF001F80CF001F80CF001E7CCE001E7CCE001C79
      C7001570BF00145B8700A5A8A700000000000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000800000FFFF0000008000000000000000
      800000FFFF000000800000FFFF00000000000000000099999900FFF1DF00FFF1
      DF00FFF1DF00FFF1E000FFF1E000FFF1DF00FFF1DF00F2E5D4008E8881004D4D
      4D005C5C5C003535350068787C009EBBC000ABCFD9005C666A0080666600B0A6
      A6007F7E7B00A59E9300F2E5D400FFF1DF00FFF1DF00FFF1DF00FFF1DF00FFF1
      DF00FFF1DF00FFF1DF00585858006E6E6E000000000000000000000000000000
      0000000000000000000000000000A5A8A700EEEEEE00016096000C4470001338
      6000133860001033530006642800126EB9002588D3002A91D800268CD5002A91
      D800288FD700288FD700268CD500278DD600268CD500258AD500258AD5002184
      D1001E7CCE00145B87009B9D9E00000000000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8EF00FFE8D000FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000008000000000000000800000FF
      FF000000800000FFFF000000000000FFFF000000000099999900999999009999
      9900999999009999990099999900999999006E6E6E004949490096969600F2F2
      F200C0C0C000A3A3A3006E6E6E00504D4D0080666600C2939300B8929200DAD4
      D400FFFFFF00E6E6E600868686006D6D6D008C8C8C0099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      000000000000F6F6F6006F926F0059785900E7E7E700016096000C4470001338
      60001033530002521400269051001570BF00258AD5002D94DA00258AD5002C92
      D9002C92D9002C92D900228AD5002A91D800288FD700288FD700258AD500228A
      D5002184D100145B870095989A00000000000000000000000000000000000000
      0000000000000000000000000000D0B7B000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFE0C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000800000008000000080000000000000000000000000800000FFFF000000
      800000FFFF000000000000FFFF00000000000000000000000000000000000000
      00000000000000000000000000006060600082828200EAEAEA00F2F2F200EEEE
      EE00BDBDBD00B0B0B000B3B3B300BBAEAE00AD8686007A6D6D006F6F6F007E7E
      7E009B9B9B00D2D2D200F3F3F300F2F2F200A6A6A60099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDCDCC000C94110038C34B0059785900A5A8A7000C44700009213500056E
      0A0025982A0090E5A2005FB69E001977B9002D8ED8003097DB00258AD5003097
      DB003097DB003097DB00258AD5002D94DA002C92D9002C92D900268CD500288F
      D700258AD500145B8700828D9300000000000000000000000000000000000000
      0000000000000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0
      C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008000000080000000800000000000000000800000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000007A7A7A006D6D6D00D6D6D600F6F6F600F2F2F200EEEEEE00EAEA
      EA00BABABA00ADADAD00B0B0B000ABABAB003D3D3D00505050005F5F5F006F6F
      6F007E7E7E008E8E8E009D9D9D00C5C5C500EAEAEA00FFFFFF00CCCCCC00A6A6
      A60000000000000000000000000000000000000000000000000000000000A5A8
      A700168125002ABE3C0038C34B00056E0A002C772D00056E0A001D8D220055C0
      63007BD8920090E5A20045A286001C79C7002D8ED8003097DB00228AD5003399
      DD003097DB003097DB00268CD5003097DB002D94DA002D94DA00278DD6002A91
      D800268CD500015C910081888D00000000000000000000000000C05750009077
      7F006F676F000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      800000FFFF000000000000000000008000000080000000000000000000000000
      000000FFFF00000000000000000000000000000000000000000000000000A0A0
      A00064646400C3C3C300FBFBFB00F6F6F600F2F2F200EEEEEE00EAEAEA00E6E6
      E600B6B6B600AAAAAA00ADADAD00B0B0B0008B8B8B006D6D6D00575757005F5F
      5F006F6F6F007E7E7E008E8E8E009D9D9D00AFAFAF00C6C6C600E6E6E600FAFA
      FA007E7E7E0000000000000000000000000000000000F6F6F6006F926F0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE710062CF76006FD3
      84007BD8920025982A00054A2F001F80CF003295DC00389CDE00228AD500389C
      DE003399DD003399DD00278DD6003399DD003399DD003399DD002A91D8002D94
      DA002D8ED800015C91006D7C84000000000000000000AF5750007F878F009F77
      9F00CF879F00705F6F0000000000DFBFB000EFE8EF00FFE8DF00FFE8DF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000800000FF
      FF000000800000FFFF00000080000000000000800000008000000000000000FF
      FF00000000000000000000000000000000000000000000000000A1A1A100A1A1
      A100FEFEFE00FBFBFB00F6F6F600F2F2F200EEEEEE00EAEAEA00E6E6E600E2E2
      E200ABABAB00A7A7A700AAAAAA00ADADAD00B0B0B000B3B3B300B6B6B6009999
      990084848400757575007E7E7E008E8E8E009D9D9D00A7A7A7008D8D8D007171
      71007E7E7E000000000000000000000000000000000075AB7500068B090018B8
      290018B829002ABE3C0034BC440043C556004CC960005CCE710062CF760074D6
      8B006FD38400025214000C4470002184D1003295DC00389CDE002588D300389C
      DE00379EE100379EE100278DD600379EE1003399DD003399DD002C92D9003295
      DC002C92D900015C91006D7C840000000000000000007F776F003077D0005F67
      A000A08FA000D08F9F00705F6000DFBFB000EFF0EF00FFE8DF00FFE8DF00FFE8
      DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF000000800000FFFF000000
      800000FFFF000000800000FFFF00000000000000000000800000000000000000
      0000000000000000000000000000000000000000000000000000A2A2A200D0D0
      D000FBFBFB00F6F6F600F2F2F200EEEEEE00EAEAEA00E6E6E600B4B4B4007575
      7500666666007A7A7A008B8B8B00A2A2A200ADADAD00B0B0B000B3B3B300B6B6
      B600B9B9B900B7B7B700A2A2A200909090004E4E4E0033333300B9B9B9007878
      78007E7E7E000000000000000000000000000000000000000000CDE3CD0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE71005CCE71001D8D
      2200054A2F0013386000094C7B002588D300389CDE00175B9A000D4D8F00164A
      75001E5F85003BA1E300288FD7003BA1E300379EE100379EE1002D94DA00389C
      DE003399DD00016096005F747D0000000000000000005FBFFF0030A7FF003077
      D0005F67A000A08FA000CF879F00706F6F00EFF0EF00FFF0DF00FFE8DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000800000FF
      FF000000800000FFFF000000800000FFFF000000000000800000000000000000
      0000000000000000000000000000000000000000000000000000A4A4A400CECE
      CE00F6F6F600F2F2F200EEEEEE00E1E1E100A7A7A7007676760092929200C3C3
      C300ADADAD008F8F8F00818181006E6E6E00737373008F8F8F00A7A7A700B3B3
      B300B6B6B600B9B9B900BCBCBC00BFBFBF00C3C3C300A1A1A100C8C8C8008989
      89007E7E7E000000000000000000000000000000000000000000000000004A8F
      4A000E9D16002ABE3C0034BC440038C34B0034BC440034A83C001D8D2200054A
      2F001338600013386000094C7B002D8ED8002F8BCB00105DA800126EB9000D53
      9B000F3E68003BA1E3002A91D8003BA1E3003BA1E3003BA1E3003097DB00379E
      E1003399DD0002629C004F6B7B0000000000000000007F87B00060D8FF003FAF
      FF003077CF005F6FAF00A08FA000CF879F008F778F00FFF0E000FFF0DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000000000000000000000
      800000FFFF000000800000FFFF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500CBCB
      CB00F2F2F200E5E5E500A9A9A9007676760094949400CECECE00DADADA00D6D6
      D600B3B3B3009E9E9E00A2A2A200A4A4A4009A9A9A0083838300737373007474
      740088888800A7A7A700B9B9B900BCBCBC00BFBFBF0070A0800059AF76007777
      77007E7E7E000000000000000000000000000000000000000000000000000000
      0000F7FBF7001D8D220024AD31005978590058839B00084E8200133860001338
      60001338600013386000084E82002D8ED8001563A8001F80CF002184D1001C79
      C700105DA8003794CC002C92D9003FA5E5003FA5E5003FA5E5003399DD003BA1
      E300379EE1000968A6004F6B7B000000000000000000000000008F87B0005FD0
      FF0040AFFF003077D0005F67A000A08FA000CF879F00706F7000FFF0E000FFF0
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000000
      00000000800000FFFF000000800000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000086868600B7B7
      B700999999006E6E6E00A5A5A500DADADA00DEDEDE00DADADA00D6D6D600D3D3
      D300EBEBEB00E1E1E100CECECE00B8B8B800A8A8A800A7A7A700AAAAAA00A4A4
      A4008F8F8F0074747400707070008B8B8B00ACACAC006E9E7E0056BF79006565
      65007E7E7E000000000000000000000000000000000000000000000000000000
      000000000000CDE3CD00359736006F926F004C7CA100094C7B00133860001338
      60001338600013386000035789003092DB00105DA800469BD900469BD9002F8B
      CB00105DA8003E9BD1002C92D90042A8E6003FA5E5003FA5E500379EE1003FA5
      E500379EE1000968A6003B647B00000000000000000000000000000000008F87
      AF0050BFFF003FA7FF003087EF005F67A000A08FA000CF879F00706F7000FFF0
      E000FFF0E000FFF0DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000FF00FF00C0C0C000000000000000000000800000008000000000
      0000000000000000800000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D007777
      7700B8B8B800E6E6E600E2E2E200DEDEDE00DADADA00D6D6D600D1D1D100DEDE
      DE00EEEEEE00E2E2E200EBEBEB00EAEAEA00E8E8E800DADADA00C7C7C700B5B5
      B500ADADAD00B0B0B000AEAEAE00979797008080800063636300656565007979
      79007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F8FA003280B2000F3E6800133860001338
      60001338600013386000035789003BA1E3002F8BCB00D3CFF200E2EEF5006E9F
      C0001563A80048AEEB002A91D80045AAEA0042A8E60045AAEA003BA1E3003FA5
      E5003FA5E5000B6CA9003B647B00000000000000000000000000000000000000
      00008F87AF0060E0FF003FAFFF003077CF005F6FAF00A08FA000D087A000FFF0
      E000CFBFBF00BFAFAF00BFAFAF00BFAFAF00BFAFAF00C0A7AF00BFAFAF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE8CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000FF00FF00C0C0C000FF00FF00C0C0C000FF00FF0000000000008000000080
      00000000000000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00D7D7
      D700E6E6E600E2E2E200DEDEDE00DADADA00D6D6D600D1D1D100D4D4D400F1F1
      F100BFBFBF00B9B9B900B3B3B300B8B8B800D1D1D100E3E3E300E7E7E700E6E6
      E600E1E1E100CFCFCF00C3C3C300B6B6B600B6B6B600B4B4B400A1A1A1007373
      73007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F5002A74A4000F3E6800133860001338
      6000133860000F3E6800035789003BA1E30042A8E600498BB30074ACD4001977
      B90049A3D90048AEEB002D94DA0048AEEB0045AAEA0048AEEB003FA5E50042A8
      E6003FA5E5001273B4002A607F00000000000000000000000000000000000000
      0000000000008F87B0005FD0FF00309FFF003077D00050677F00706F90008F87
      7F00AF878F00A07F7F00A07F7F00A0676F00B0878F00AF779000906760009F6F
      8F00E0D0CF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000FF00FF00C0C0C00000000000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000081818100E6E6
      E600E2E2E200DEDEDE00DADADA00D6D6D600D1D1D100CFCFCF00EFEFEF00D1D1
      D100C5C5C500EFEFEF00EEEEEE00E8E8E800D2D2D200BDBDBD00B2B2B200BBBB
      BB00CECECE00E0E0E000E3E3E300E1E1E100D8D8D800CDCDCD00C3C3C3008989
      89007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9E7F0000C64980013386000133860001338
      6000133860000F3E6800015C91003FA5E50045AAEA00379EE100379EE1004BB1
      EE004BB1EE004BB1EE002D94DA004BB1EE0048AEEB0048AEEB0045AAEA0045AA
      EA0042A8E6001977B9001E5F8500000000000000000000000000000000000000
      000000000000000000008F87AF005FD0FF0060A7FF00908FAF00A08FA000AF8F
      9F00BF7F7F00E0C8A000FFF0C000FFFFD000FFFFDF00FFFFD000EFD0BF00BF87
      7F00A07F8F00EFD0C000FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FFFF
      FF00FF00FF00FFFFFF0000000000C0C0C000FF00FF00C0C0C000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008D8D8D00D9D9
      D900DEDEDE00DADADA00D6D6D600D1D1D100D0D0D000EFEFEF00D3D3D300BBBB
      BB00F2F2F200F1F1F100EFEFEF00EEEEEE00EDEDED00EBEBEB00EAEAEA00DFDF
      DF00CACACA00B6B6B600B1B1B100BEBEBE00CFCFCF00E0E0E000DEDEDE008888
      88007E7E7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9DDEA000160960013386000103353001338
      6000133860000C447000015C910045AAEA0048AEEB00379EE1003BA1E3004EB5
      F0004BB1EE004EB5F0002D94DA004EB5F0004BB1EE004BB1EE0048AEEB0042A8
      E60048AEEB001977B900145B8700FFFFFE000000000000000000000000000000
      000000000000000000000000000090C8EF00D0D8EF00D0C8D00090776F00E0A7
      9000FFF0B000FFFFDF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFFE000FFFF
      E000C08F90009F6F8F00E0D0CF00FFE8CF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FFFFFF00FF00
      FF00FFFFFF00FF00FF0000000000FF00FF00C0C0C000FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008D8D
      8D00DADADA00D6D6D600D1D1D100D6D6D600DFDFDF00B0B0B0009A9A9A00D1D1
      D100F4F4F400F2F2F200F1F1F100EFEFEF00EEEEEE00EDEDED00EBEBEB00EAEA
      EA00E8E8E800E7E7E700E6E6E600DBDBDB00BEBEBE00ABABAB00D0D0D0007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B9D1DD0002629C0006642800056E0A000921
      3500103353000C4470000160960045AAEA004BB1EE0049A3D9005CB2E80073BB
      E6007AC1E70086C2E40074ACD4009AC9DC009AC9DC009AC9DC00A7C8D700A7C8
      D70084BEDE001F81C600145B8700F9F9F9000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFF8FF00C0A7AF00EFB79000FFE8
      BF00FFF8CF00FFF8CF00FFFFD000FFFFD000FFFFEF00FFFFEF00FFFFFF00FFFF
      FF00FFFFF000B07F7F0070576F00DFC8C000FFE8DF00FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF00FF00FFFF
      FF00FF00FF00FFFFFF000000000000000000FF00FF00C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080009696960097979700AAAAAA009B9B9B00B0B0B000AFAFAF009494
      94008A8A8A0096969600A3A3A300BDBDBD00D5D5D500EEEEEE00EDEDED00EBEB
      EB00EAEAEA00E8E8E800E7E7E700E6E6E600B5B5B500C8C8C800818181000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9BCC700015893000252140034BC44000252
      1400092135000C4470000160960042ACF10084BEDE00F1E3CF00F3E8D300FDEC
      D300FDECD300FDECD300FFF5D700FFF5D700FFF9D800F9F2D700FFF5D700FDEC
      D300FCE5C7001F81C60003578900F9F9F9000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFF8FF00DFAFAF00FFE8B000FFFF
      D000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8D0009F5F6F00C0A7AF00FFE8DF00FFE8DF00FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FFFFFF00FF00
      FF00FFFFFF00FF00FF00FFFFFF0000000000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3A3A300EAEAEA00EAEAEA00EAEAEA00B6B6B600ABAB
      AB00B2B2B200B9B9B900BFBFBF00ADADAD009F9F9F008E8E8E009D9D9D00A1A1
      A100C1C1C100E2E2E200DEDEDE00B6B6B600C5C5C50084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9BAB9006F926F0012841400189B1F0045B24D0062CF76007BD8
      920034A83C0009485200005D9B005CB2E800E7E2D3005D58F200544EF1006762
      F3003E39EF00FFFFFE00544EF1003E39EF00211BED00EEEEFD00B6B3F800E9E4
      F300FFF4DC002184D10003578900F6F6F6000000000000000000000000000000
      0000000000000000000000000000F0D8C000EFC8DF00FFC8AF00FFF8D000FFE8
      BF00FFE8B000FFFFCF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFE000FFFFDF00B0877F007F677000FFE8DF00FFE8DF00FFE8DF00FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF00FF00FFFF
      FF00FF00FF00FFFFFF00FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009D9D9D00F7F7F700F8F8F800FAFAFA00DADADA00C7C7
      C700C1C1C100B2B2B200B9B9B900BFBFBF00C6C6C600CDCDCD00D3D3D300D3D3
      D300A2A2A200ABABAB00B1B1B100A2A2A2009393930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E70012841400189B1F0043C5560055CA690062CF760067D17C0074D6
      8B0083DC9A000F785300005D9B005CB2E800EFEDD7000F08ED00544EF100A6A2
      F600544EF100BDBBFA00211BED00BDBBFA002B24EE00FFFFFE00B6B3F800EAE6
      F900FFF4DC002685C900015C9100F2F2F1000000000000000000000000000000
      0000000000000000000000000000F0D8BF00DF9F9F00FFD0AF00FFF8CF00FFD8
      A000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFE000FFFFF000FFFFFF00FFFF
      E000FFFFEF00FFFFDF00DFB7AF007F5F6F00FFE8DF00FFE8DF00FFE8DF00FFE8
      DF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      FF00FFFFFF00FF00FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000096969600B9B3B300E6B6AD00FFB3A600FFB3A600FFC5
      B900FFD6CC00FFE6DF00F1E3DE00EAEAEA00E0E0E000D5D5D500D3D3D300D5D5
      D500A0A0A000B2B2B200BCBCBC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A8F
      4A000E9D160034BC440034BC440043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D700211BED007974F500BDBB
      FA00FFFFFE000F08ED00B6B3F800D6D5FC002B27F000FFFFFE00B6B3F800E6E5
      FC00FFFBE400288FD700015C9100EEEEEE000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFC8B000FFE8C000FFF8C000FFD8
      A000FFE0B000FFF8BF00FFFFD000FFFFD000FFFFE000FFFFE000FFFFE000FFFF
      EF00FFFFDF00FFFFD000EFD0A000705F6000FFF0E000FFF0DF00FFE8DF00FFE8
      DF00FFD8C000DF8F7F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FFFF
      FF00FF00FF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000097979700E6BA9B00FFD6AD00FFD0AA00FFCC
      A800FFC8A500FFC5A200FFC29F00FFBC9900FFCAAC00FFD3B900F2D4C600D6CC
      CC008A8A8A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000E9D
      160024BA35002ABE3C0038C34B0043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D7000F08ED003D36EF00BDBB
      FA00FFFFFE000F08ED008681F500DFDDFB00312AEE00FFFFFE00B6B3F800AEAE
      B200C8B7A4002D94DA0001609600EEEEEE000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFD0BF00FFE0C000FFF8C000FFD8
      AF00FFF0C000FFF0BF00FFF8CF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFF
      DF00FFFFD000FFFFDF00DFB790007F676F00FFF0E000FFB7B000FFAFB000FF9F
      A000FF9F9F00DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B9969600F9D4B200FFDBB700FFDBB700FFDB
      B700FFDBB700FFDBB700FFDBB700FFDBB700FFDAB500FFD7B000E6BA9B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000075AB750018B8
      290024BA350024BA350024AD310025982A00168125001D8D220055C063007BD8
      920045B24D00005774000968A6007AC1E700FFF5D7000F08ED004942F1006F6A
      F400322DF000FFFFFE00544EF100544EF1004942F1006F6AF4007469E800F4E5
      D50086C2E4003097DB0001609600E2E3E3000000000000000000000000000000
      0000000000000000000000000000FFE0CF00E0C8C000FFE0B000FFFFDF00FFF0
      C000FFE0B000FFE0AF00FFF0C000FFF8CF00FFFFCF00FFFFD000FFFFDF00FFF8
      C000FFFFCF00FFF8CF00CF9F9000D0B7B000EFB79000F09F4000EF973000E08F
      3000DF873000BF8F6F0060676000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3888500FFDFBE00FFDFBE00FFDFBE00FFDF
      BE00FFDFBE00FFDFBE00FFDFBE00FFDFBE00FFDFBE00FFDFBE00CCA292000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2EDE2001D8D220018B8
      290018B829001D8D22004A8F4A00296F8C00035789000664280055C063002598
      2A0002521400035789000B6CA90086C2E400F9F2D7006762F3008681F500B6B3
      F800BDBBFA00FFFFFE00F4F6FB00F4F6FB00FBFBFC00FFFFFE00FFFBED009AC9
      DC0051BCF900389CDE0002629C00DEDFDF000000000000000000000000000000
      0000000000000000000000000000FFE0CF00F0E8DF00E0BFA000FFFFDF00FFFF
      F000FFF8EF00FFE8CF00FFD8A000FFF0C000FFE8B000FFF0C000FFF0C000FFF0
      C000FFF8D000FFE0B0009F5F6F00E0C8D000EFBFA000FFBF5F00FFA72F00FFA7
      1F00CF8F4F006067600000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000000000000000000000000000808080000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF958B00FFE4C800FFE4C800FFE4C800FFE4
      C800FFE4C800FFE4C800FFE4C800FFE4C800FFE4C800FFE4C800BF958A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008BC38B000C9411004A8F
      4A00D4D5D10000000000000000001B6D9F00015C910006642800056E0A001338
      600013386000035789001271AC0086C2E400FCE5C700FEF6EA00FEF6EA00FFF3
      E200FFF3E200FFEFDB00FFEFDB00FDECD300FAE7D500F1E3CF00D9DAD9004CB7
      F40055B8F500389CDE0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000FFE8CF00FFFFFF00CF979F00FFE8C000FFFF
      FF00FFFFFF00FFF8EF00FFD8B000FFE0BF00FFE0AF00FFD8A000FFE0AF00FFFF
      CF00FFF8BF00CF9F8F009F6F8F00FFF0EF00EFC8AF00FFD08F00FFB75000D09F
      6000606760000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A6787800D9B7A800FFE7CF00FFE7CF00FFE7CF00FFE7
      CF00FFE7CF00FFE7CF00FFE7CF00FFE7CF00FFE7CF00FFE7CF00BF9C99000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008BC38B00068B0900E2E3
      E3000000000000000000000000001B6D9F00015C910009485200094852000F3E
      680013386000035789001271AC0068BBEC00E7DCCA00FCE5C700F4E5D500E7DC
      CA00D4D5D100B9D1DD00A7C8D7007AC1E70068BBEC0055B8F5004CB7F4004EB5
      F0004EB5F0003092DB0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00EFA7B000FFFF
      F000FFFFFF00FFF8F000FFFFD000FFE8BF00FFE0A000FFF0BF00FFFFDF00FFE0
      AF00E0AF8F00C08F7F00FFF8EF00FFF0EF00F0D0B000FFD89F00CF976F006067
      6000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A6787800F2DBCA00FFECD900FFECD900FFECD900FFEC
      D900FFECD900FFECD900FFECD900FFECD900FFECD900F2DBCA00BF9C99000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094C894004A8F4A000000
      0000000000000000000000000000A7C8D700498BB300498BB300498BB300498B
      B300498BB300016096001271AC0045AAEA0042ACF1003CA4EA00379EE1003293
      D4002F8BCB001F81C6001273B4000968A6000C649800015C9100015C91000158
      9300015C91001B6D9F004283AB00000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00FFFFFF00BF77
      8F00F0D8BF00FFF0C000FFFFD000FFFFD000FFFFD000FFF0CF00FFD8A000CF97
      9F00C0978F00EFE8EF00E0E8EF00E0E8E000F0D0B000D0AF8F00606760000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C00000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AC807D00FFF0E000FFF0E000FFF0E000FFF0E000FFF0
      E000FFF0E000FFF0E000FFF0E000FFF0E000FFF0E000D9BCB200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECF5EC00CDE3CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B6D9F0002629C001271AC000968A6000160960001609600015C
      910002629C00015C9100005D9B000C6498000C6498004E8FB7006E9FC000B9D1
      DD00D9E7F000F6F8FA00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000FFD8B000FFE0BF00FFD8BF00FFD8BF00F0D0
      B000DFAFAF00DF9F9F00C0977F00CF977F00DFAFA000F0B7BF00E0B7A000DFAF
      A000EFBFAF00E0BFAF00E0BFAF00E0BFAF00EFC8AF00AF9F9000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000000000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6787800D9BFB800FFF5EA00FFF5EA00FFF5EA00FFF5EA00FFF5
      EA00FFF5EA00FFF5EA00FFF5EA00FFF5EA00FFF5EA00C5A7A300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB9D1004283AB0089A3B200A9BCC700E4EBEE00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6787800CCAFAB00CCAFAB00CCB3B300CCB1AF00CCB1AF00D3BB
      B900CCB3B300CCB3B300CCB3B300CCB3B300C9AEAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      8000040500000000000000000000000080004001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000300000000000000000000000080000003000000000000000000000000
      8000000300000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      FFFFFFFF000000000000000000000000F0000000FF083FFFFB60001FFFFFFFFF
      F0000000FE0031FFFF80004FFE0001FFF0000000FE0000FFFF00006FFE0000FF
      F0000000FC0000FFF400000FFC0000FFF0000000FC000007D8000006FC0000FF
      F0000000FC00000780000001FC0000FFF0000000E000000740000002FC0000FF
      F0000000E0000007C0000003FC0000FFF0000000E000000740000003FE0000FF
      F00000008000000780060001FC0000FFF000000000000003801F0000FC0000FF
      F00000000000000100210000FC0000FFF00000000000000100A00000FC0000FF
      F0000000000000010060C000FC0000FFF00000000000000100008000FE0000FF
      F0000000C800000100006000FC00007FF0000000C000000100002800FC00003F
      F0000000C000000100000800FC00001FF0000000C000000100000F00FC00000F
      F0000000C000000300000400FC00000FF0000000C000000300000301FE000007
      F0000000C000000380000401FC000007F0000000E000000180000101FC000007
      F0000000E000000180000001FE000007F0000000F000000180000000FE000007
      00000000FE000001E0000007FF00000F00000000FF800003F000000FFF80001F
      00000001FFF0000F70000017FFFFFFFFC0000003FFFF007FFC00002FFFFFFFFF
      C0000007FFFFE3FF7600005FFFFFFFFFF000000FFFFFFFFFEF0000CFFFFFFFFF
      F000001FFFFFFFFFEE80047FFFFFFFFFFFFE0FFFFF000001FFFFFFFFFFFC0FFF
      FFFC0003FE000001FFFFFF00C0000000FFFC0001FE000001FFFFFE0080000000
      FF800001FE000001FFFFFC0080000000FF800001FE000001FFFFF80080000000
      FE000001FE000001FFFFF00080000001F8000001FE000001FFFFE000FE00003F
      F0000001FE000001FFFFC001F800000FE0000001C6000001FFFF8003E0000007
      8000000182000001FFFF0007C00000078000000180000001FFFE000FC0000007
      C000000180000001FFFC001FC0000007E000000180000001FFF8003FC0000007
      F0000001C0000001FFF0007FC0000007F8000001E0000001FFE000FFC0000007
      FE000001F0000001FFC001FFC0000007FE000001F8000001FF8003FFC0000007
      FE000001FC000001FF8007FFC0000007FE000000FE000001FF000FFFE000000F
      FE000000FE000001FF001FFFF000001FFE000000FE000001FF003FFFFC00003F
      F8000000FE000001FF007FFFFC00007FF0000000FE000001FF80FC7FFC0001FF
      E0000000FE000001DF81FD7FFE0007FFE0000000FE000001CFC30D9FFE001FFF
      C0000000FE000001D7D765E0FE001FFF80000000FE000003D9DB39FFFE001FFF
      86000000FE000007DFEDBFFFFC001FFF8E000000FE00000F2FEEBFFFFC001FFF
      9E000001FE00001F8E6F3FFFFC003FFF9FF80001FE00003FFF4FFFFFF8003FFF
      FFF81FFFFFFFFFFFFFFFFFFFF8007FFF00000000000000000000000000000000
      000000000000}
  end
  object qrycontrola_codigo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Controla_Codigo')
    Left = 16
    Top = 304
    object qrycontrola_codigoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=FAV;Initial Catalog=db_proj_fav2;Data Source=FL' +
      'AVIO;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 8
  end
  object qryicms: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Rec' +
        'olhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, ' +
        'RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, ' +
        'RI.Percentual_BC_Acrescida,'
      
        'CST.Codigo_Situacao, CST.Codigo_CSOSN, Pro.Codigo_Grupo_Tributac' +
        'ao from Produto Pro'
      
        'inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tri' +
        'butacao = GPT.Codigo)'
      
        'inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = T' +
        'I.Codigo)'
      'inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      
        'inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Cod' +
        'igo)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situac' +
        'ao_Tributaria = CST.Codigo)')
    Left = 177
    Top = 256
    object qryicmsCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryicmsAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qryicmsCFOP_D: TStringField
      FieldName = 'CFOP_D'
      Size = 10
    end
    object qryicmsCFOP_F: TStringField
      FieldName = 'CFOP_F'
      Size = 10
    end
    object qryicmsTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 30
    end
    object qryicmsTipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object qryicmsTipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object qryicmsBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object qryicmsBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object qryicmsPercentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object qryicmsPercentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object qryicmsCodigo_Situacao: TStringField
      FieldName = 'Codigo_Situacao'
      Size = 5
    end
    object qryicmsCodigo_CSOSN: TStringField
      FieldName = 'Codigo_CSOSN'
      Size = 5
    end
    object qryicmsCodigo_Grupo_Tributacao: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao'
    end
  end
  object qryiss: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RISS.Codigo, RISS.Aliquota, RISS.Tributacao, RISS.Base_Re' +
        'duzida, RISS.Base_Acrescida, RISS.Percentual_BC_Reduzida, RISS.P' +
        'ercentual_BC_Acrescida,'
      'Pro.Codigo_Grupo_Tributacao_ISSQN from Produto Pro'
      
        'inner join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQ' +
        'N = RISS.Codigo)')
    Left = 177
    Top = 304
    object qryissCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryissAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qryissTributacao: TStringField
      FieldName = 'Tributacao'
      Size = 30
    end
    object qryissBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object qryissBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object qryissPercentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object qryissPercentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object qryissCodigo_Grupo_Tributacao_ISSQN: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_ISSQN'
    end
  end
  object qryipi: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RIPI.Codigo, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Base_' +
        'Reduzida, RIPI.Base_Acrescida, RIPI.Percentual_BC_Reduzida, RIPI' +
        '.Percentual_BC_Acrescida,'
      
        'CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_IPI from Produt' +
        'o Pro'
      
        'inner join Grupo_Produto_Tributacao_IPI GPTI on (Pro.Codigo_Grup' +
        'o_Tributacao_IPI = GPTI.Codigo)'
      
        'inner join Tratamento_IPI TIPI on (GPTI.Codigo_Tratamento_IPI = ' +
        'TIPI.Codigo)'
      
        'inner join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Co' +
        'digo)'
      
        'inner join Regra_IPI RIPI on (ITIPI.Entrada_Regra_ME = RIPI.Codi' +
        'go)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situ' +
        'acao_Tributaria = CST.Codigo)')
    Left = 177
    Top = 360
    object qryipiCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryipiAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qryipiTipo_Calculo: TStringField
      FieldName = 'Tipo_Calculo'
    end
    object qryipiBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object qryipiBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object qryipiPercentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object qryipiPercentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object qryipiCodigo_Situacao: TStringField
      FieldName = 'Codigo_Situacao'
      Size = 5
    end
    object qryipiCodigo_Grupo_Tributacao_IPI: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_IPI'
    end
  end
  object qrypis: TADOQuery
    Connection = ADOConnectionLocal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_' +
        'Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS' +
        '.Percentual_BC_Acrescida,'
      
        'CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produt' +
        'o Pro'
      
        'inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_P' +
        'IS = TPIS.Codigo)'
      
        'inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Co' +
        'digo)'
      
        'inner join Regra_PIS RPIS on (ITPIS.Saida_Regra_EPP = RPIS.Codig' +
        'o)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situ' +
        'acao_Tributaria = CST.Codigo)')
    Left = 17
    Top = 352
    object qrypisCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrypisAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qrypisTipo_Calculo: TStringField
      FieldName = 'Tipo_Calculo'
    end
    object qrypisBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object qrypisBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object qrypisPercentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object qrypisPercentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object qrypisCodigo_Situacao: TStringField
      FieldName = 'Codigo_Situacao'
      Size = 5
    end
    object qrypisCodigo_Grupo_Tributacao_PIS: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_PIS'
    end
  end
  object qrycofins: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, R' +
        'COFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual' +
        '_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,'
      
        'CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Pro' +
        'duto Pro'
      
        'inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tribut' +
        'acao_COFINS = TCOFINS.Codigo)'
      
        'inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo =' +
        ' ITCOFINS.Codigo)'
      
        'inner join Regra_COFINS RCOFINS on (ITCOFINS.Saida_Regra_EPP = R' +
        'COFINS.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_S' +
        'ituacao_Tributaria = CST.Codigo)')
    Left = 97
    Top = 352
    object qrycofinsCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrycofinsAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qrycofinsTipo_Calculo: TStringField
      FieldName = 'Tipo_Calculo'
    end
    object qrycofinsBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object qrycofinsBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object qrycofinsPercentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object qrycofinsPercentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object qrycofinsCodigo_Situacao: TStringField
      FieldName = 'Codigo_Situacao'
      Size = 5
    end
    object qrycofinsCodigo_Grupo_Tributacao_COFINS: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_COFINS'
    end
  end
  object ADOConnectionLocal: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=FAV;Initial Catalog=sac_estacao;Data Source=FLA' +
      'VIO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=' +
      '4096;Workstation ID=PROGRAMACAO;Use Encryption for Data=False;Ta' +
      'g with column collation when possible=False;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 384
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = qrychama_produto
    Left = 48
    Top = 64
  end
  object DataSource4: TDataSource
    DataSet = qrychama_condicao
    Left = 48
    Top = 112
  end
  object DataSource5: TDataSource
    DataSet = qryfechamento_venda_aux
    Left = 208
    Top = 208
  end
  object qryendereco_cliente: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select EC.*, S.Descricao as Setor, C.Descricao as Cidade, C.UF, ' +
        'C.Codigo_Municipio from Endereco_Cliente EC'
      'left join Setor S on (EC.Codigo_Setor = S.Codigo)'
      'left join Cidade C on (EC.Codigo_Cidade =  C.Codigo)')
    Left = 288
    Top = 112
    object qryendereco_clienteCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryendereco_clienteCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qryendereco_clienteNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qryendereco_clienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object qryendereco_clienteTipo_Endereco: TStringField
      FieldName = 'Tipo_Endereco'
      Size = 30
    end
    object qryendereco_clienteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object intgrfld_clienteCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qryendereco_clienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qryendereco_clienteCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryendereco_clienteSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qryendereco_clienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qryendereco_clienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qryendereco_clienteCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
  end
  object DataSource6: TDataSource
    DataSet = qryendereco_cliente
    Left = 328
    Top = 112
  end
  object IdIcmpClient1: TIdIcmpClient
    Protocol = 1
    ProtocolIPv6 = 58
    IPVersion = Id_IPv4
    PacketSize = 1024
    Left = 384
    Top = 216
  end
  object ftpupdate: TIdFTP
    OnStatus = ftpupdateStatus
    OnDisconnected = ftpupdateDisconnected
    OnWork = ftpupdateWork
    OnWorkBegin = ftpupdateWorkBegin
    IPVersion = Id_IPv4
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 392
    Top = 156
  end
  object qrychama_produto_similar: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro' +
        '.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Produ' +
        'cao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descrica' +
        'o,'
      
        'Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro' +
        '.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida,' +
        ' Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_T' +
        'ributacao,'
      
        'Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS' +
        ', Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributaca' +
        'o_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,'
      
        'Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valo' +
        'r_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Uni' +
        'tario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Comp' +
        'ra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,'
      
        'Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Esto' +
        'que_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_A' +
        'tualizacao_Estoque, Pro.Status_Estoque_Data,'
      
        'NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar' +
        '.Descricao as Marca, UM.Sigla, UM2.Sigla, Gru.Descricao as Grupo' +
        '_Produto, Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo ' +
        'as PPrazoG,'
      
        'Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desc' +
        'onto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.' +
        'Descricao as Descricao_TIPI, LP.Local,'
      
        'TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO' +
        ', ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vist' +
        'a, ITP.Percentual_Desconto_Prazo, '
      
        'ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Perc' +
        'entual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquot' +
        'a, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produt' +
        'o Pro'
      ''
      
        'left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codig' +
        'o)'
      
        'left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Cod' +
        'igo)'
      'left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)'
      
        'left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.C' +
        'odigo)'
      
        'left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2' +
        '.Codigo)'
      'left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)'
      ''
      
        'left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = T' +
        'I.Codigo)'
      'left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      
        'left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codi' +
        'go)'
      
        'left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Co' +
        'digo)'
      ''
      
        'left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_' +
        'COFINS = TCO.Codigo)'
      
        'left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IP' +
        'I = TIPI.Codigo)'
      
        'left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PI' +
        'S = TPIS.Codigo)'
      ''
      
        'left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo' +
        ')'
      ''
      
        'left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN' +
        ' = RISS.Codigo)'
      ''
      
        'left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Pro' +
        'duto)'
      'left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)')
    Left = 16
    Top = 416
    object IntegerField3: TIntegerField
      FieldName = 'Codigo'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Tipo'
    end
    object IntegerField5: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object StringField1: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'Gera_Comissao'
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'Aceita_Devolucao'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'Arred_Trunc'
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'Producao_Propria'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'Codigo_Original'
    end
    object StringField7: TStringField
      FieldName = 'Codigo_Venda'
    end
    object StringField8: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'Codigo_Barra'
    end
    object IntegerField6: TIntegerField
      FieldName = 'Codigo_Fornecedor'
    end
    object IntegerField7: TIntegerField
      FieldName = 'Codigo_Fabricante'
    end
    object IntegerField8: TIntegerField
      FieldName = 'Codigo_Marca'
    end
    object IntegerField9: TIntegerField
      FieldName = 'Codigo_Unidade_Medida'
    end
    object IntegerField10: TIntegerField
      FieldName = 'Codigo_Unidade_Volume'
    end
    object IntegerField11: TIntegerField
      FieldName = 'Codigo_Grupo'
    end
    object IntegerField12: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao'
    end
    object IntegerField13: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_IPI'
    end
    object IntegerField14: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_PIS'
    end
    object IntegerField15: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_COFINS'
    end
    object IntegerField16: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao_ISSQN'
    end
    object IntegerField17: TIntegerField
      FieldName = 'Codigo_Local'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Data_Fabricacao'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Data_Validade'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'Ultima_Compra'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'Ultima_Venda'
    end
    object FloatField1: TFloatField
      FieldName = 'Valor_Compra'
    end
    object FloatField2: TFloatField
      FieldName = 'Valor_Medio'
    end
    object FloatField3: TFloatField
      FieldName = 'Saldo_Estoque'
    end
    object FloatField4: TFloatField
      FieldName = 'Valor_Ultima_Compra'
    end
    object FloatField5: TFloatField
      FieldName = 'Estoque_Maximo'
    end
    object FloatField6: TFloatField
      FieldName = 'Estoque_Minimo'
    end
    object FloatField7: TFloatField
      FieldName = 'Estoque'
      DisplayFormat = '#0.0,0'
    end
    object FloatField8: TFloatField
      FieldName = 'Estoque_Reservado'
    end
    object FloatField9: TFloatField
      FieldName = 'Volume'
    end
    object FloatField10: TFloatField
      FieldName = 'Volume_Total'
    end
    object StringField10: TStringField
      FieldName = 'Em_Estoque_Maximo'
      Size = 30
    end
    object StringField11: TStringField
      FieldName = 'Em_Estoque_Minimo'
      Size = 30
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'Data_Atualizacao_Estoque'
    end
    object StringField12: TStringField
      FieldName = 'Status_Estoque_Data'
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object StringField14: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object StringField15: TStringField
      FieldName = 'Nome_Fantasia_1'
      Size = 50
    end
    object StringField16: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object StringField17: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
    object StringField18: TStringField
      FieldName = 'Sigla_1'
      Size = 5
    end
    object StringField19: TStringField
      FieldName = 'Grupo_Produto'
      Size = 30
    end
    object FloatField11: TFloatField
      FieldName = 'PVistaG'
      DisplayFormat = '#0.0,0'
    end
    object FloatField12: TFloatField
      FieldName = 'PPrazoG'
      DisplayFormat = '#0.0,0'
    end
    object FloatField13: TFloatField
      FieldName = 'PDesVistaG'
      DisplayFormat = '#0.0,0'
    end
    object FloatField14: TFloatField
      FieldName = 'PDesPrazoG'
      DisplayFormat = '#0.0,0'
    end
    object StringField20: TStringField
      FieldName = 'Descricao_TICMS'
      Size = 50
    end
    object StringField21: TStringField
      FieldName = 'Descricao_TIPI'
      Size = 50
    end
    object StringField22: TStringField
      FieldName = 'Local'
    end
    object StringField23: TStringField
      FieldName = 'Descricao_TPIS'
      Size = 50
    end
    object StringField24: TStringField
      FieldName = 'Descricao_TCO'
      Size = 50
    end
    object FloatField15: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object FloatField16: TFloatField
      FieldName = 'Preco_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object FloatField17: TFloatField
      FieldName = 'Percentual_Desconto_Vista'
    end
    object FloatField18: TFloatField
      FieldName = 'Percentual_Desconto_Prazo'
    end
    object FloatField19: TFloatField
      FieldName = 'Percentual_Lucro_Vista'
    end
    object FloatField20: TFloatField
      FieldName = 'Percentual_Lucro_Prazo'
    end
    object StringField25: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object StringField26: TStringField
      FieldName = 'Aliquota_NF'
      Size = 5
    end
    object StringField27: TStringField
      FieldName = 'ISS'
      Size = 5
    end
    object StringField28: TStringField
      FieldName = 'Aplicacao'
      Size = 800
    end
    object qrychama_produto_similarCodigo_Similar: TStringField
      FieldName = 'Codigo_Similar'
    end
    object qrychama_produto_similarValor_Compra_Unitario: TFloatField
      FieldName = 'Valor_Compra_Unitario'
    end
    object qrychama_produto_similarValor_Ultima_Compra_Unitario: TFloatField
      FieldName = 'Valor_Ultima_Compra_Unitario'
    end
    object qrychama_produto_similarPercentual_Comissao_Vista: TFloatField
      FieldName = 'Percentual_Comissao_Vista'
    end
    object qrychama_produto_similarPercentual_Comissao_Prazo: TFloatField
      FieldName = 'Percentual_Comissao_Prazo'
    end
  end
  object DataSource7: TDataSource
    DataSet = qrychama_produto_similar
    Left = 48
    Top = 416
  end
  object qryveiculo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select V.Codigo, V.Veiculo, Modelo, Ano_Fabricacao, Placa, Renav' +
        'am, M.Descricao from Veiculo V'
      'left join Marca M on (V.Codigo_Marca = M.Codigo)')
    Left = 552
    Top = 56
    object qryveiculoVeiculo: TStringField
      FieldName = 'Veiculo'
      Size = 50
    end
    object qryveiculoModelo: TStringField
      FieldName = 'Modelo'
      Size = 30
    end
    object qryveiculoAno_Fabricacao: TStringField
      FieldName = 'Ano_Fabricacao'
      Size = 15
    end
    object qryveiculoPlaca: TStringField
      FieldName = 'Placa'
      Size = 10
    end
    object qryveiculoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qryveiculoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryveiculoRenavam: TStringField
      FieldName = 'Renavam'
      Size = 40
    end
  end
  object DataSource8: TDataSource
    DataSet = qryveiculo
    Left = 584
    Top = 56
  end
  object qrystatus: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cadastro_Status')
    Left = 656
    Top = 56
    object qrystatusDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrystatusData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrystatusEncerrado: TIntegerField
      FieldName = 'Encerrado'
    end
    object qrystatusCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
  end
  object DataSource9: TDataSource
    DataSet = qrystatus
    Left = 688
    Top = 56
  end
  object qrychama_funcionario: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select F.Codigo, F.Nome, F.Comissao, F.Comissao_Servico from Fun' +
        'cionario F')
    Left = 616
    Top = 256
    object qrychama_funcionarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychama_funcionarioComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qrychama_funcionarioCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_funcionarioComissao_Servico: TFloatField
      FieldName = 'Comissao_Servico'
    end
  end
  object qrychama_cargo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cargo ')
    Left = 616
    Top = 312
    object qrychama_cargoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_cargoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qrychama_cargoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object qrychama_tipo_ocorrencia: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Tipo_Ocorrencia')
    Left = 616
    Top = 368
    object qrychama_tipo_ocorrenciaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_tipo_ocorrenciaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_tipo_ocorrenciaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object qryautorizados: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CA.* from Cliente_Autorizados CA')
    Left = 376
    Top = 112
    object qryautorizadosCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryautorizadosCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryautorizadosNome_Autorizado: TStringField
      FieldName = 'Nome_Autorizado'
      Size = 100
    end
    object qryautorizadosCPF_Autorizado: TStringField
      FieldName = 'CPF_Autorizado'
    end
  end
  object DataSource10: TDataSource
    DataSet = qryautorizados
    Left = 408
    Top = 112
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM4'
    ReTentar = False
    TimeOut = 30
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    ExibeMensagem = False
    BloqueiaMouseTeclado = False
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    OnMsgPoucoPapel = ACBrECF1MsgPoucoPapel
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    Device.ProcessMessages = False
    ArqLOG = 'c:\acbrlog'
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 320
    Top = 288
  end
  object ACBrBAL1: TACBrBAL
    Porta = 'COM1'
    Left = 696
    Top = 160
  end
  object qrychama_cliente: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Cli.*, Ci.Descricao as Cidade, Ci.UF, Ci.Codigo_Municipio' +
        ', Se.Descricao as Setor, GC.Descricao as Grupo, '
      'TP.Descricao as Tabela_Preco from Cliente Cli'
      'left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)'
      'left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)'
      'left join Grupo_Cliente GC on (Cli.Codigo_Grupo = GC.Codigo)'
      
        'left join Tabela_Preco TP on (Cli.Codigo_Tabela_Preco = TP.Codig' +
        'o)'
      'order by Cli.Nome_Nome_Fantasia')
    Left = 16
    Top = 208
    object qrychama_clienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_clienteCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_clienteTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qrychama_clienteEnquadramento: TStringField
      FieldName = 'Enquadramento'
      Size = 3
    end
    object qrychama_clienteNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qrychama_clienteRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrychama_clienteCPF: TStringField
      FieldName = 'CPF'
    end
    object qrychama_clienteRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object qrychama_clienteOrgao_Expedidor: TStringField
      FieldName = 'Orgao_Expedidor'
      Size = 10
    end
    object qrychama_clienteData_Emissao_RG: TDateTimeField
      FieldName = 'Data_Emissao_RG'
    end
    object qrychama_clienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qrychama_clienteInsc_Estadual: TStringField
      FieldName = 'Insc_Estadual'
      Size = 15
    end
    object qrychama_clienteInsc_Municipal: TStringField
      FieldName = 'Insc_Municipal'
      Size = 15
    end
    object qrychama_clienteNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrychama_clienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrychama_clienteReferencia: TStringField
      FieldName = 'Referencia'
      Size = 70
    end
    object qrychama_clienteCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_clienteCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_clienteCodigo_Grupo: TIntegerField
      FieldName = 'Codigo_Grupo'
    end
    object qrychama_clienteSuframa: TStringField
      FieldName = 'Suframa'
    end
    object qrychama_clienteTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychama_clienteCelular: TStringField
      FieldName = 'Celular'
    end
    object qrychama_clienteContato: TStringField
      FieldName = 'Contato'
      Size = 50
    end
    object qrychama_clienteTelefone_Contato: TStringField
      FieldName = 'Telefone_Contato'
    end
    object qrychama_clienteEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qrychama_clienteSite: TStringField
      FieldName = 'Site'
      Size = 50
    end
    object qrychama_clienteProfissao: TStringField
      FieldName = 'Profissao'
      Size = 30
    end
    object qrychama_clienteData_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object qrychama_clienteEstado_Civil: TStringField
      FieldName = 'Estado_Civil'
    end
    object qrychama_clienteData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_clienteCredito: TFloatField
      FieldName = 'Credito'
    end
    object qrychama_clienteLimite_Credito: TFloatField
      FieldName = 'Limite_Credito'
    end
    object qrychama_clienteAcima_Limite_Credito: TStringField
      FieldName = 'Acima_Limite_Credito'
      Size = 30
    end
    object qrychama_clienteLimite_Desconto: TFloatField
      FieldName = 'Limite_Desconto'
    end
    object qrychama_clienteAcima_Limite_Desconto: TStringField
      FieldName = 'Acima_Limite_Desconto'
      Size = 30
    end
    object qrychama_clienteObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 800
    end
    object qrychama_clienteCodigo_Tabela_Preco: TIntegerField
      FieldName = 'Codigo_Tabela_Preco'
    end
    object qrychama_clienteBloqueado: TStringField
      FieldName = 'Bloqueado'
      Size = 3
    end
    object qrychama_clienteCodigo_Usuario: TIntegerField
      FieldName = 'Codigo_Usuario'
    end
    object qrychama_clienteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrychama_clienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrychama_clienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qrychama_clienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_clienteCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qrychama_clienteSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qrychama_clienteGrupo: TStringField
      FieldName = 'Grupo'
      Size = 30
    end
    object qrychama_clienteTabela_Preco: TStringField
      FieldName = 'Tabela_Preco'
      Size = 50
    end
  end
  object DataSource3: TDataSource
    DataSet = qrychama_cliente
    Left = 48
    Top = 208
  end
  object qrysetor: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Setor'
      'order by descricao')
    Left = 176
    Top = 416
    object qrysetorCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrysetorDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object qrysetorData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object qrycidade: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cidade'
      'order by Descricao')
    Left = 176
    Top = 464
    object qrycidadeCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrycidadeDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qrycidadeUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrycidadeDDD: TStringField
      FieldName = 'DDD'
      Size = 2
    end
    object qrycidadeData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrycidadeCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qrycidadeCodigo_Pais: TIntegerField
      FieldName = 'Codigo_Pais'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 824
    Top = 64
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMenu
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object qrytratamento_icms: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Tratamento_ICMS')
    Left = 97
    Top = 416
    object qrytratamento_icmsCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrytratamento_icmsDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrytratamento_icmsData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object qrychama_produto_teste: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Status'
        DataType = ftString
        Size = 16
        Value = '0'
      end
      item
        Name = 'Origem'
        DataType = ftString
        Size = 16
        Value = '0'
      end
      item
        Name = 'Destino'
        DataType = ftString
        Size = 16
        Value = '0'
      end
      item
        Name = 'Tabela'
        DataType = ftString
        Size = 16
        Value = '0'
      end>
    SQL.Strings = (
      'select * from fProduto(:Status, :Origem, :Destino, :Tabela)')
    Left = 336
    Top = 384
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'fProduto;0'
    Parameters = <
      item
        Name = '@TABLE_RETURN_VALUE'
        Direction = pdReturnValue
        Size = -1
        Value = Null
      end
      item
        Name = '@Status'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Origem'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@Destino'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@Tabela'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 448
    Top = 336
  end
  object ds_dados_adicionais: TDataSource
    DataSet = qrydados_adicionais
    Left = 328
    Top = 168
  end
  object qrydados_adicionais: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select DA.*, CI.UF, CI.Descricao as Cidade, S.Descricao as Setor' +
        ', CI.Codigo_Municipio from Dados_Adicionais_Cliente DA'
      'left join Cliente C on (DA.Codigo_Cliente = C.Codigo)'
      'left join Cidade CI on (DA.Codigo_Cidade = CI.Codigo)'
      'left join Setor S on (DA.Codigo_Setor = S.Codigo)'
      '')
    Left = 288
    Top = 168
    object qrydados_adicionaisEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 70
    end
    object qrydados_adicionaisInscricao: TStringField
      FieldName = 'Inscricao'
    end
    object qrydados_adicionaisEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrydados_adicionaisNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrydados_adicionaisCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrydados_adicionaisUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrydados_adicionaisCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qrydados_adicionaisSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qrydados_adicionaisCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qrydados_adicionaisComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrydados_adicionaisCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
  end
  object qrymarca: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from marca')
    Left = 616
    Top = 416
    object ADOCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrymarcaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qrymarcaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ImageList1: TImageList
    Left = 488
    Top = 11
    Bitmap = {
      494C010106000900100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000396C
      7B00000000000000000000000000000000000000000000000000000000000000
      000000000000E0E0E000B0B0B0009E9FA3009EA0A100A9A9A900D9D9D9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3C3C3006E8877007CA38600799F8300667E6E00DEDEDE00000000000FD0
      FF001C556600F9F9F9000000000000000000000000000000000000000000F0F0
      F0008889C10016159A000909A3000809A7000809A7000B0B9F00232395008B8C
      9A00E8E8E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000709379007196
      7900779F7D0026A9C3000495BE000595BF000495BF000595BF000798C10026D1
      FF005DDFFF002FCCF700D8D8D8000000000000000000FAF8F800D5D7DF001A1A
      9C000303A3003334F0001817F9000909F5001917F9002829F5004446EA000707
      A7003E3D8500C8C7C900F7F7F700FAF8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B8D7300789F
      8200779F7F0023B3CC0088EFFE0088EFFE0088EFFE0088EFFE0088EFFE0088EF
      FE0088EFFE0088EFFE0039CBEF00BABABA0000000000000000000F109E000002
      9C004A48F8003030FA001112F6000102F4001211F5002828F8004848F8005F60
      F600080AA50043428C00EFEFEF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000688A70006E94
      7400779E7E0020AFCC00A2F6FE00A2F6FE00A2F6FE00A2F6FE00A2F6FE00A2F6
      FE00A2F6FE00A2F6FE00A2F6FE0003CAFD00000000008080CC000D0CA200696A
      F6004B4BF7003836FA002120F8001819F7002022F8002F2FF7004949F9005E5F
      F700817FFA00090BA6009D9EA800F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006F927A007BA1
      870081AE86002AB8CF00A1EEFD00A1EEFD00A1EEFD00A1EEFD00A1EEFD00A1EE
      FD00A1EEFD00A1EEFD0011C0EF00789B8400EEF0F0000C0D9D008986F9007171
      F9004F4FF7003F3FF7003031F7002A28F6003230F800403FF9004F50F8006161
      F500787AF7005D5DE500292A9200E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBE0DE006992
      6D00BDD3BF0087B4860096C291009BC895009AC996009BC8970095C0900039D1
      FF0094DBFD005490830099F1F50079908200D5D3FF000808A8005F62B300BEBE
      D000B6B5CF00BDBAD400BEBBD400BCBCD400BCBCD400BBBAD400B8B5CF00B9B7
      CD00B9B7CB008787F3000C0AA300C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949D980079A0
      8300759E7F0093B5970084B18900C4DEC400B8E0DE00BEF4F700B3D2CA0034C8
      FF00D7DFD7007DAC820098F1F4006F8C78009491D90006049D005B5BA9000000
      0000FAF7F900FAF7F900F8F7F90000000000000000000000000000000000FAF8
      F800CBC9C8008280F7000607AB00B6B5BE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007CA486007BA2
      840078A27D007BA385007DA58800779E7E0095BB98009EC59F008ABA8B0086BE
      B40099F3F70099F3F80086AB970097AD9F009090DC0004029B005354AC00F8F9
      F7000000000000000000F8F9F70000000000000000000000000000000000F7F7
      F700C8C9C7007172F2000A08A800BBBBC7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB007BA580007BA5
      80007DA588007DA4870089B9900092C59800B4D3BA0093EAEE009AF4F8007EB4
      A60080A88900E1E2E1000000000000000000BBBCFF00080AA4004F51BD00D7D9
      FC00D9D8F800DADBF700E2E3F700E2E3F700E4E3F700E2E3F800DDDCF600DADA
      F800D7D8FA007271F6000807AA00D1CFD5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BA186007AA282007BA7
      80007AA3820085B28A0093C6990095C89B00BFFAFD00C1DBBE009BF7FC000000
      000000000000000000000000000000000000F6F6FC000708A6006162F2006769
      F7007D80FA008F91F700AAAAF600B5B6FA00B3B2F600A9A8F8009998FA008686
      FA007071F7007776FB0011119900F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000759B7D007AA281007CA4
      84007CA684008AB98F0091C396008BBD9100A3C4A30089AD9200000000000000
      00000000000000000000000000000000000000000000171793007071FF006869
      F5008587F700A0A2F600BFC0F800C7C7F700C8C6FA00B5B7F7009E9FF5008D8F
      FB007172F8001413A9007C7BC500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D1D1006E927400759B7E00799F
      82007CA7810080B08500D4E4D50082AD88000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F7FC000808A8007374
      FF008B8DF900A7A8F800C8C8F600D9D9F700D1CFF900BFC0FA00A4A6FA008D8E
      FC003737C9000C0AA40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099A9A000648868007499
      7D00CCDBCE00E0EAE10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B4B3EB000B09
      A9007676FF009D9BFF00C6C2F600D2D1F800CBC9F700B9B8FC007C7BF3005E5E
      EE000908AB00EAE8FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5E6E5007094
      7B00EBEBEB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F9F700F4F4
      FF00131199000F0EAC001C1BB100504FE100504FE1001413A9000708A6001818
      9400F8F7FB00F9F6F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F6F8
      F80000000000EDECFF00232496001A1C99001B1D9A003636A000F1F2FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000736D5A0052453900524139005A4D39007B7D6B00AAAAAA000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000003959
      290000650000006D0000007D0800007D08000065000000650000393418007B75
      6300B6B6B6000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000006900000082
      0800089210000892100008961800089210000892100008921000006D0000184D
      080063594A00B6B6B6000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000690000109618000892
      100010AE310018B2310018B6390018B6390010A6290010A62900089210000082
      0800184D0800948E84000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000007BA27B00108E210018A2290010AA
      290010AE29000892100010AE310018B2310018B2310018B2310010A629000892
      1000006900004A342900AAAAAA0000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000065000029B2420010A6210010A6
      210010A62900FFFFFF000892100010AE310018B2310018B2310018B2310010A6
      29000892100008590000AAAAAA0000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000071080031BA4A00109E210010A2
      2100FFFFFF00FFFFFF00FFFFFF000892100010AE310018B2310018B2310010A6
      290008921000006500007B75630000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000001896310031BE5A00089A1800FFFF
      FF00FFFFFF00089A1800FFFFFF00FFFFFF000892100010AE310010AE310010A6
      2900089210000065000073715A0000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000219A390042C76300089610000896
      100008961000089A1800089A1800FFFFFF00FFFFFF000892100010A2210010A2
      210008921000006500007B7D6B0000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000069000042CF7300089210000896
      100008961000089610000896100008961800FFFFFF00FFFFFF0008921000109E
      18000892100000650000AAAAAA0000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000006900004AD77B00189E21000892
      10000892100008921000089210000892100008921000FFFFFF00FFFFFF000896
      1000088E100018551000B6B6B60000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000107D18004AD77B000892
      1000089210000892100008921000089210000892100008921000089610000892
      100000650000AAAAAA0000000000000000000000000080808000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      400000000000FFFFFF0000000000000000000000000080808000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      400000000000FFFFFF0000000000000000000000000080808000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      400000000000FFFFFF00000000000000000000000000297D290031B252004AD7
      7B0031BA52000892100008921000089210000892100018A6290018A22900006D
      00005A7D52000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF0000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF0000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF00000000000000000000000000000000004A8E4200006D
      08004AD77B0042CF730042C7630039C35A0031BA4A0021AA3900006500007B9A
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000018751800006500000065000000650000006500004A8A4A00000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFEFF81F00000000F023E00700000000
      C001800000000000C000C00100000000C000800000000000C000000000000000
      C000000000000000C00011E000000000C0000DE0000000008003000000000000
      801F000000000000803F80010000000000FF80030000000083FFC00300000000
      C7FFC00300000000FFFFE81F00000000FFFFFFFFFFFFFC1FFFFFFFFFFFFFF007
      800380038003C003BFFBBFFBBFFB8001800B800B800B8001800B800B800B0000
      800B800B800B0000800B800B800B0000800B800B800B0000800B800B800B0000
      800B800B800B0000800B800B800B0001800B800B800B8001800B800B800B8003
      800380038003C00FFFFFFFFFFFFFF03F00000000000000000000000000000000
      000000000000}
  end
  object ACBrPAF1: TACBrPAF
    LinesBuffer = 1000
    EAD = ACBrEAD1
    AssinarArquivo = False
    Left = 392
    Top = 296
  end
  object ACBrEAD1: TACBrEAD
    Left = 472
    Top = 232
  end
  object ACBrNFe1: TACBrNFe
    MAIL = ACBrMail1
    OnStatusChange = ACBrNFe1StatusChange
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.Salvar = False
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.IdCSC = '000000'
    Configuracoes.Arquivos.SepararPorModelo = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SepararPorMes = True
    Configuracoes.Arquivos.EmissaoPathNFe = True
    Configuracoes.Arquivos.SalvarApenasNFeProcessadas = True
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.Ambiente = taProducao
    Configuracoes.WebServices.AguardarConsultaRet = 30000
    Configuracoes.WebServices.Tentativas = 15
    Configuracoes.WebServices.IntervaloTentativas = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = ACBrNFeDANFCeFortes1
    Left = 792
    Top = 266
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    MostrarPreview = False
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 4
    CasasDecimais._vUnCom = 4
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    LarguraCodProd = 54
    ExibirEAN = False
    QuebraLinhaEmDetalhamentoEspecifico = True
    ExibeCampoFatura = False
    ImprimirUnQtVlComercial = iuComercial
    ImprimirDadosDocReferenciados = True
    Left = 832
    Top = 272
  end
  object ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes
    ACBrNFe = ACBrNFe1
    MostrarPreview = False
    MostrarStatus = True
    TipoDANFE = tiNFCe
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    LarguraBobina = 280
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = ',0.00'
    CasasDecimais._Mask_vUnCom = ',0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 8
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    ImprimeLogoLateral = True
    Left = 808
    Top = 328
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 752
    Top = 264
  end
  object ACBrTEFD1: TACBrTEFD
    EsperaSTS = 7
    TEFDial.ArqTemp = 'C:\TEF_DIAL\req\intpos.tmp'
    TEFDial.ArqReq = 'C:\TEF_DIAL\req\intpos.001'
    TEFDial.ArqSTS = 'C:\TEF_DIAL\resp\intpos.sts'
    TEFDial.ArqResp = 'C:\TEF_DIAL\resp\intpos.001'
    TEFDial.GPExeName = 'C:\TEF_DIAL\tef_dial.exe'
    TEFDisc.ArqTemp = 'C:\TEF_Disc\req\intpos.tmp'
    TEFDisc.ArqReq = 'C:\TEF_Disc\req\intpos.001'
    TEFDisc.ArqSTS = 'C:\TEF_Disc\resp\intpos.sts'
    TEFDisc.ArqResp = 'C:\TEF_Disc\resp\intpos.001'
    TEFDisc.GPExeName = 'C:\TEF_Disc\tef_Disc.exe'
    TEFHiper.ArqTemp = 'c:\HiperTEF\req\IntPos.tmp'
    TEFHiper.ArqReq = 'C:\HiperTEF\req\IntPos.001'
    TEFHiper.ArqSTS = 'C:\HiperTEF\resp\IntPos.sts'
    TEFHiper.ArqResp = 'C:\HiperTEF\resp\IntPos.001'
    TEFHiper.GPExeName = 'C:\HiperTEF\HiperTEF.exe'
    TEFVeSPague.EnderecoIP = 'localhost'
    TEFVeSPague.Porta = '60906'
    TEFVeSPague.TemPendencias = False
    TEFVeSPague.TransacaoCRT = 'Cartao Vender'
    TEFVeSPague.TransacaoCHQ = 'Cheque Consultar'
    TEFVeSPague.TransacaoCNC = 'Administracao Cancelar'
    TEFVeSPague.TransacaoReImpressao = 'Administracao Reimprimir'
    TEFVeSPague.TransacaoPendente = 'Administracao Pendente'
    TEFGPU.ArqTemp = 'C:\TEF_GPU\req\intpos.tmp'
    TEFGPU.ArqReq = 'C:\TEF_GPU\req\intpos.001'
    TEFGPU.ArqSTS = 'C:\TEF_GPU\resp\intpos.sts'
    TEFGPU.ArqResp = 'C:\TEF_GPU\resp\intpos.001'
    TEFGPU.GPExeName = 'C:\TEF_GPU\GPU.exe'
    TEFBanese.ArqTemp = 'C:\bcard\req\pergunta.tmp'
    TEFBanese.ArqReq = 'C:\bcard\req\pergunta.txt'
    TEFBanese.ArqSTS = 'C:\bcard\resp\status.txt'
    TEFBanese.ArqResp = 'C:\bcard\resp\resposta.txt'
    TEFBanese.ArqRespBkp = 'C:\bcard\resposta.txt'
    TEFBanese.ArqRespMovBkp = 'C:\bcard\copiamovimento.txt'
    TEFAuttar.ArqTemp = 'C:\Auttar_TefIP\req\intpos.tmp'
    TEFAuttar.ArqReq = 'C:\Auttar_TefIP\req\intpos.001'
    TEFAuttar.ArqSTS = 'C:\Auttar_TefIP\resp\intpos.sts'
    TEFAuttar.ArqResp = 'C:\Auttar_TefIP\resp\intpos.001'
    TEFAuttar.GPExeName = 'C:\Program Files (x86)\Auttar\IntegradorTEF-IP.exe'
    TEFGood.ArqTemp = 'C:\good\gettemp.dat'
    TEFGood.ArqReq = 'C:\good\getreq.dat'
    TEFGood.ArqSTS = 'C:\good\getstat.dat'
    TEFGood.ArqResp = 'C:\good\getresp.dat'
    TEFGood.GPExeName = 'C:\good\GETGoodMed.exe'
    TEFFoxWin.ArqTemp = 'C:\FwTEF\req\intpos.tmp'
    TEFFoxWin.ArqReq = 'C:\FwTEF\req\intpos.001'
    TEFFoxWin.ArqSTS = 'C:\FwTEF\rsp\intpos.sts'
    TEFFoxWin.ArqResp = 'C:\FwTEF\rsp\intpos.001'
    TEFFoxWin.GPExeName = 'C:\FwTEF\bin\FwTEF.exe'
    TEFPetrocard.ArqTemp = 'C:\CardTech\req\intpos.tmp'
    TEFPetrocard.ArqReq = 'C:\CardTech\req\intpos.001'
    TEFPetrocard.ArqSTS = 'C:\CardTech\resp\intpos.sts'
    TEFPetrocard.ArqResp = 'C:\CardTech\resp\intpos.001'
    TEFPetrocard.GPExeName = 'C:\CardTech\sac.exe'
    TEFCrediShop.ArqTemp = 'C:\tef_cshp\req\intpos.tmp'
    TEFCrediShop.ArqReq = 'C:\tef_cshp\req\intpos.001'
    TEFCrediShop.ArqSTS = 'C:\tef_cshp\resp\intpos.sts'
    TEFCrediShop.ArqResp = 'C:\tef_cshp\resp\intpos.001'
    TEFCrediShop.GPExeName = 'C:\tef_cshp\vpos_tef.exe'
    TEFTicketCar.ArqTemp = 'C:\TCS\TX\INTTCS.tmp'
    TEFTicketCar.ArqReq = 'C:\TCS\TX\INTTCS.001'
    TEFTicketCar.ArqSTS = 'C:\TCS\RX\INTTCS.RET'
    TEFTicketCar.ArqResp = 'C:\TCS\RX\INTTCS.001'
    TEFTicketCar.GPExeName = 'C:\TCS\tcs.exe'
    TEFTicketCar.NumLoja = 0
    TEFTicketCar.NumCaixa = 0
    TEFTicketCar.AtualizaPrecos = False
    TEFConvCard.ArqTemp = 'C:\ger_convenio\tx\crtsol.tmp'
    TEFConvCard.ArqReq = 'C:\ger_convenio\tx\crtsol.001'
    TEFConvCard.ArqSTS = 'C:\ger_convenio\rx\crtsol.ok'
    TEFConvCard.ArqResp = 'C:\ger_convenio\rx\crtsol.001'
    TEFConvCard.GPExeName = 'C:\ger_convcard\convcard.exe'
    Left = 584
    Top = 160
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    MostrarPreview = False
    MostrarStatus = True
    TipoDANFE = tiSemGeracao
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = ',0.00'
    CasasDecimais._Mask_vUnCom = ',0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 8
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    PosPrinter = ACBrPosPrinter1
    Left = 808
    Top = 376
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    Modelo = ppEscDiebold
    Device.HandShake = hsRTS_CTS
    Device.HardFlow = True
    Device.ArqLOG = 'C:\ArqLog'
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    ControlePorta = True
    ArqLOG = 'C:\ArqLog'
    Left = 760
    Top = 440
  end
  object qryfechamento_venda: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Fechamento_Venda')
    Left = 408
    Top = 463
    object qryfechamento_vendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryfechamento_vendaForma_Pagamento: TStringField
      FieldName = 'Forma_Pagamento'
      Size = 50
    end
    object qryfechamento_vendaValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryfechamento_vendaData: TDateTimeField
      FieldName = 'Data'
    end
    object qryfechamento_vendaTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 15
    end
    object qryfechamento_vendaTroco: TFloatField
      FieldName = 'Troco'
    end
    object qryfechamento_vendaCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryfechamento_vendaStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qryfechamento_vendaCodigo_Caixa: TIntegerField
      FieldName = 'Codigo_Caixa'
    end
    object qryfechamento_vendaAcerto: TIntegerField
      FieldName = 'Acerto'
    end
    object qryfechamento_vendaCodigo_Usuario: TIntegerField
      FieldName = 'Codigo_Usuario'
    end
    object qryfechamento_vendaTipo: TStringField
      FieldName = 'Tipo'
      Size = 5
    end
    object qryfechamento_vendaMovimenta: TIntegerField
      FieldName = 'Movimenta'
    end
    object qryfechamento_vendaN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryfechamento_vendaParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qryfechamento_vendaCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryfechamento_vendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryfechamento_vendaTransferencia: TIntegerField
      FieldName = 'Transferencia'
    end
    object qryfechamento_vendaCodigo_Conta: TIntegerField
      FieldName = 'Codigo_Conta'
    end
    object qryfechamento_vendaCodigo_Operacao: TIntegerField
      FieldName = 'Codigo_Operacao'
    end
    object qryfechamento_vendaCodigo_Lancamento_Banco: TIntegerField
      FieldName = 'Codigo_Lancamento_Banco'
    end
    object qryfechamento_vendaSaldo_Anterior: TFloatField
      FieldName = 'Saldo_Anterior'
    end
    object qryfechamento_vendaSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
    end
    object qryfechamento_vendaMD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
  end
  object ds_fechamento_Venda: TDataSource
    DataSet = qryfechamento_venda
    Left = 448
    Top = 463
  end
end
