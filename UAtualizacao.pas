unit UAtualizacao;

interface

uses
  Windows, SysUtils, Forms, Dialogs, ExtCtrls, DateUtils, Classes, URegistro,
  ADODB, DBClient, UGeral, IniFiles, StdCtrls, Registry, Mask, ShellAPI,
  Controls, Graphics,
  WinInet, ComCtrls, DBGrids, SHDocVw, ACBrUtil, ACBrNFe, Math, Printers,
  Consts, UImpressora_Fiscal,
  StrUtils, ACBrECF, Variants, Types;

type
  TAtualizacoes = class
    procedure Verifica_Atualizacoes;
    procedure Atualiza(Versao: integer);

    procedure Atualizacao1;
    procedure atualizacao2;
    procedure fAtualizaVersao;
    procedure AtualizacaoEnderecos;
    procedure AtualizacaoLocal;
    procedure Atualizacao3;
    procedure AtualizacaoEtiqueta;
    procedure AtualizacaoMD5;
    procedure AtualizacaoCriaTabelasHomologacao;
    procedure AtualizacaoRelacionamentos;
  end;

const
  versao_bd_atual = 2;

implementation

uses UDM, UDeclaracao;

{ TAtualizacoes }

procedure TAtualizacoes.Atualiza(Versao: integer);
begin
  case Versao of
    1:
      Atualizacao1;
  end;

  if (Versao = versao_bd_atual) then
    fAtualizaVersao;
end;

procedure TAtualizacoes.Atualizacao3;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Localidade_Produto') + ')and name = ' +
            QuotedStr('Local') + ')');
          add('begin ');
          add('ALTER TABLE Localidade_Produto ALTER COLUMN Local VARCHAR(300)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Localidade_Produto - Alterar campo Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Localidade_Produto') + ')and name = ' +
            QuotedStr('Detalhe') + ')');
          add('begin ');
          add('UPDATE Localidade_Produto SET Local = Local +' + QuotedStr(' ') +
            '+ Detalhe');
          add('ALTER TABLE Localidade_Produto DROP COLUMN Detalhe');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          // Application.MessageBox(PChar('Causa do erro em Localidade_Produto - Alterar campo Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
          // abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Lancamento_Financeiro_Ocorrencia_Cobranca') + '))');
          add('CREATE TABLE Lancamento_Financeiro_Ocorrencia_Cobranca ');
          add('(Codigo int primary key identity (1,1), ');
          add('Data_Cadastro datetime, ');
          add('Data_Cobranca datetime, ');
          add('Responsavel_Atendimento varchar(50), ');
          add('Origem_Atendimento int, ');
          add('Codigo_Lancamento_Financeiro int, ');
          add('N_Documento int, ');
          add('Observacoes varchar(800)) ');
          ExecSQL;
          // FreeAndNil(qAux);
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Lancamento_Financeiro_Ocorrencia_Cobranca : '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Ocorrencia_Cobranca') + ')');
        add('begin ');
        add('ALTER TABLE Perfil_Usuario ADD Ocorrencia_Cobranca int not null default(1)');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario - ADD Ocorrencia_Cobranca: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Limpar_Memoria_Impressora_Etiqueta') + ')');
        add('begin ');
        add('ALTER TABLE Configuracao_Sistema ADD Limpar_Memoria_Impressora_Etiqueta int not null default(1)');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema - ADD Limpar_Memoria_Impressora_Etiquet: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    if (tipo_local = '0101') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Localidade_Produto') + ')and name = ' +
            QuotedStr('Local') + ')');
          add('begin ');
          add('ALTER TABLE Localidade_Produto ALTER COLUMN Local VARCHAR(300)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Localidade_Produto - Alterar campo Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Localidade_Produto') + ')and name = ' +
            QuotedStr('Detalhe') + ')');
          add('begin ');
          add('UPDATE Localidade_Produto SET Local = Local +' + QuotedStr(' ') +
            '+ Detalhe');
          add('ALTER TABLE Localidade_Produto DROP COLUMN Detalhe');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          // Application.MessageBox(PChar('Causa do erro em Localidade_Produto - Alterar campo Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
          // abort;
        end;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TAtualizacoes.AtualizacaoCriaTabelasHomologacao;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    if (eservidor = '0') then
    begin

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('PAFQuantidadeRegistros') + '))');
          add(' CREATE TABLE PAFQuantidadeRegistros ');
          add('	( Codigo int identity primary key, ');
          add('	QtdeDAV int, ');
          add('	QtdeItensDAV int, ');
          add('	QtdeProduto int, ');
          add('	QtdeProdutoEstoque int, ');
          add('	QtdeECF int, ');
          add('	QtdeR01 int, ');
          add('	QtdeR02 int, ');
          add('	QtdeR03 int, ');
          add('	QtdeR04 int, ');
          add('	QtdeR05 int, ');
          add('	QtdeR06 int, ');
          add('	QtdeR07 int, ');
          add('	QtdeMeiosPagamento int,');
          add('	QtdeDAVRegD2 int)');
          ExecSQL;

          Add('if (select COUNT(Codigo) as codigo from PAFQuantidadeRegistros) = 0');
          Add('insert into PAFQuantidadeRegistros(QtdeDAV, QtdeItensDAV, QtdeProduto, QtdeProdutoEstoque, ');
          Add('QtdeECF, QtdeR01, QtdeR02, QtdeR03, QtdeR04, QtdeR05, QtdeR06, QtdeR07, QtdeMeiosPagamento, QtdeDAVRegD2)');
          Add('values(0,0,0,0,0,0,0,0,0,0,0,0,0,0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela PAFQuantidadeRegistros Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R01') + '))');
          add(' CREATE TABLE R01 ');
          add('	( Codigo int identity primary key, ');
          add('	codigo_empresa int,');
          add('	MD5 varchar(50))');
          ExecSQL;

          Add('if (select COUNT(Codigo) as codigo from R01) = 0');
          Add('insert into R01(MD5, codigo_empresa)');
          Add('values(1,1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela R01 Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;




      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido_Informacoes_ECF') + '))');
          add(' CREATE TABLE Pedido_Informacoes_ECF ');
          add('	( Codigo int identity primary key, ');
          add('	Codigo_Pedido int, ');
          add('	N_Fabricacao_ECF varchar(20), ');
          add('	MF_Adicional varchar(20), ');
          add('	Tipo_ECF varchar(20), ');
          add('	Marca_ECF varchar(20), ');
          add('	Modelo_ECF varchar(20), ');
          add(' COO varchar(20), ');
          add('	COO_Vin varchar(20), ');
          add('	N_Sequencia varchar(20),');
          add(' MD5 varchar(20))');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Pedido_Informacoes_ECF Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;



      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('PAFE3') + '))');
          add(' CREATE TABLE PAFE3 ');
          add('	( Codigo int identity primary key, ');
          add('	num_fab varchar(20), ');
          add('	mf_adicional varchar(20), ');
          add('	tipo_ecf varchar(20), ');
          add('	marca_ecf varchar(20), ');
          add('	modelo_ecf varchar(20), ');
          add('	md5 varchar(40), ');
          add('	dt_estoque datetime,');
          add('	hr_estoque varchar(8))');

          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela PafE3 Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;





      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('LogItensPedido') + '))');
          add(' CREATE TABLE LogItensPedido ');
          add('	( Codigo int identity primary key, ');
          add('	N_Pedido int, ');
          add('	Codigo_Registro int, ');
          add('	Codigo_Produto int, ');
          add(' dtAlteracao datetime, ');
          add(' hrAlteracao datetime, ');
          add('	tipo_alteracao varchar(2)) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela LogItensPedido Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;



      try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('R06') + ')and name = ' +
          QuotedStr('MD5D2') + ')');
        add('begin ');
        add('ALTER TABLE R06 ADD MD5D2 varchar(50) ');
        add('ALTER TABLE R06 ADD MD5D3 varchar(50) ');
        add('end ');
        ExecSQL;
      end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em R06 - Criar MD5D2 E MD5D3: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Transporte_NF') + ')and name = ' +
          QuotedStr('Codigo_Pedido') + ')');
        add('ALTER TABLE Transporte_NF ADD Codigo_Pedido int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Transporte_NF Codigo_Pedidos: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NF') + ')and name = ' +
          QuotedStr('Codigo_Pedido') + ')');
        add('ALTER TABLE NF ADD Codigo_Pedido int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em NF Codigo_Pedido: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Caixa') + ')and name = ' +
          QuotedStr('MD5') + ')');
        add('ALTER TABLE Fechamento_Caixa ADD MD5 varchar(50)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Caixa MD5: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;


    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('LogItensPedido') + ')and name = ' +
          QuotedStr('MD5') + ')');
        add('ALTER TABLE LogItensPedido ADD MD5 varchar(50)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em LogItensPedido MD5: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    {try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NF') + ')and name = ' +
          QuotedStr('Codigo_Obs_Fiscal') + ')');
        add('ALTER TABLE NF ADD Codigo_Obs_Fiscal int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em NF Codigo_Obs_Fiscal: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;}

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Controla_N_NFCe') + '))');
          add(' CREATE TABLE Controla_N_NFCe(');
          add(' 	N_NFCe int primary key)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Controla_N_NFCe: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (tipo_local = '0101') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('NCM') + '))');
          add(' CREATE TABLE NCM(');
          add(' 	Codigo int primary key IDENTITY(1,1) NOT NULL,');
          add(' 	Codigo_NCM varchar(50) NULL,');
          add(' 	Descricao varchar(500) NULL,');
          add(' 	Data_Cadastro datetime NULL,');
          add(' 	Ex varchar(50) NULL,');
          add(' 	Aliquota_Nacional float NOT NULL,');
          add(' 	Aliquota_Importada float NOT NULL,');
          add(' 	Versao varchar(50) NULL,');
          add(' 	Tabela int NOT NULL,');
          add(' 	Aliquota_Estadual float NULL,');
          add(' 	Aliquota_Municipal float NULL,');
          add(' 	Vigencia_Inicio date NULL,');
          add(' 	Vigencia_Fim date NULL,');
          add(' 	IVA float NOT NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela NCM Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TAtualizacoes.AtualizacaoEnderecos;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  if (eservidor = '0') then
  begin
    // CADASTRO DE EMPRESA
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Empresa') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('ALTER TABLE Empresa ADD Endereco varchar(200) ');
        add('ALTER TABLE Empresa ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Empresa - Adicionar Endereço: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Empresa') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('update Empresa set Endereco = (select Descricao from Logradouro where Empresa.Codigo_Logradouro = Logradouro.Codigo) ');
        add('update Empresa set CEP = (select Logradouro.CEP from Logradouro where Empresa.Codigo_Logradouro = Logradouro.Codigo) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        // Application.MessageBox(PChar('Causa do erro em Empresa - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        // abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Empresa') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('ALTER TABLE Empresa DROP COLUMN Codigo_Logradouro');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Empresa - Deletar Codigo_Logradouro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // CADASTRO DE CLIENTES
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cliente') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('ALTER TABLE Cliente ADD Endereco varchar(200) ');
        add('ALTER TABLE Cliente ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cliente - Adicionar Endereço: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cliente') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('update Cliente set Endereco = (select Descricao from Logradouro L where Cliente.Codigo_Logradouro = L.Codigo)');
        add('update Cliente set CEP = (select L.CEP from Logradouro L where Cliente.Codigo_Logradouro = L.Codigo)');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        // Application.MessageBox(PChar('Causa do erro em Cliente - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        // abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cliente') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('ALTER TABLE Cliente DROP COLUMN Codigo_Logradouro');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cliente - Deletar Codigo_Logradouro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;


    // CADASTRO DE CLIENTES LOCAL
    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cliente')+')and name = '+QuotedStr('Codigo_Logradouro')+')');
      Add('begin ');
      add('ALTER TABLE Cliente ADD Endereco varchar(200) ');
      add('ALTER TABLE Cliente ADD CEP varchar(10) ');
      Add('end ');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Cliente Local - Adicionar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cliente')+')and name = '+QuotedStr('Codigo_Logradouro')+')');
      Add('begin ');
      Add('update Cliente set Endereco = (select Descricao from Logradouro L where Cliente.Codigo_Logradouro = L.Codigo)');
      Add('update Cliente set CEP = (select L.CEP from Logradouro L where Cliente.Codigo_Logradouro = L.Codigo)');
      Add('end ');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Cliente Local - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cliente')+')and name = '+QuotedStr('Codigo_Logradouro')+')');
      Add('ALTER TABLE Cliente DROP COLUMN Codigo_Logradouro');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Cliente Local - Deletar Codigo_Logradouro: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    // CADASTRO DE CLIENTES_ENDERECO
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Endereco_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Endereco') + ')');
        add('begin ');
        add('ALTER TABLE Endereco_Cliente ADD Endereco varchar(200) ');
        add('ALTER TABLE Endereco_Cliente ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Endereco_Cliente - Adicionar Endereço: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Endereco_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Endereco') + ')');
        add('begin ');
        add('update Endereco_Cliente set Endereco = (select Descricao from Logradouro where Endereco_Cliente.Codigo_Endereco = Logradouro.Codigo) ');
        add('update Endereco_Cliente set CEP = (select Logradouro.CEP from Logradouro where Endereco_Cliente.Codigo_Endereco = Logradouro.Codigo) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        // Application.MessageBox(PChar('Causa do erro em Endereco_Cliente - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        // abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Endereco_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Endereco') + ')');
        add('ALTER TABLE Endereco_Cliente DROP COLUMN Codigo_Endereco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Endereco_Cliente - Deletar Codigo_Logradouro: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;





    // CADASTRO DE CLIENTES_ENDERECO_LOCAL
    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Endereco_Cliente')+')and name = '+QuotedStr('Codigo_Endereco')+')');
      Add('begin ');
      add('ALTER TABLE Endereco_Cliente ADD Endereco varchar(200) ');
      add('ALTER TABLE Endereco_Cliente ADD CEP varchar(10) ');
      Add('end ');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Endereco_Cliente - Adicionar Endereço Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end;

      try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Endereco_Cliente')+')and name = '+QuotedStr('Codigo_Endereco')+')');
      Add('begin ');
      Add('update Endereco_Cliente set Endereco = (select Descricao from Logradouro where Endereco_Cliente.Codigo_Endereco = Logradouro.Codigo) ');
      Add('update Endereco_Cliente set CEP = (select Logradouro.CEP from Logradouro where Endereco_Cliente.Codigo_Endereco = Logradouro.Codigo) ');
      Add('end ');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Endereco_Cliente - Atualizar Endereço Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end;

      try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Endereco_Cliente')+')and name = '+QuotedStr('Codigo_Endereco')+')');
      Add('ALTER TABLE Endereco_Cliente DROP COLUMN Codigo_Endereco');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Endereco_Cliente - Deletar Codigo_Logradouro Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    // CADASTRO DE FORNECEDOR
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fornecedor') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('ALTER TABLE Fornecedor ADD Endereco varchar(200) ');
        add('ALTER TABLE Fornecedor ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fornecedor - Adicionar Endereço: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fornecedor') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('update Fornecedor set Endereco = (select Descricao from Logradouro where Fornecedor.Codigo_Logradouro = Logradouro.Codigo) ');
        add('update Fornecedor set CEP = (select Logradouro.CEP from Logradouro where Fornecedor.Codigo_Logradouro = Logradouro.Codigo) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        // Application.MessageBox(PChar('Causa do erro em Fornecedor - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        // abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fornecedor') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('ALTER TABLE Fornecedor DROP COLUMN Codigo_Logradouro');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fornecedor - Deletar Codigo_Logradouro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;


    // //CADASTRO DE FORNECEDOR LOCAL
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Fornecedor')+')and name = '+QuotedStr('Codigo_Logradouro')+')');
    // Add('begin ');
    // add('ALTER TABLE Fornecedor ADD Endereco varchar(200) ');
    // add('ALTER TABLE Fornecedor ADD CEP varchar(10) ');
    // Add('end ');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Fornecedor - Adicionar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Fornecedor')+')and name = '+QuotedStr('Codigo_Logradouro')+')');
    // Add('begin ');
    // Add('update Fornecedor set Endereco = (select Descricao from Logradouro where Fornecedor.Codigo_Logradouro = Logradouro.Codigo) ');
    // Add('update Fornecedor set CEP = (select Logradouro.CEP from Logradouro where Fornecedor.Codigo_Logradouro = Logradouro.Codigo) ');
    // Add('end ');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // //Application.MessageBox(PChar('Causa do erro em Fornecedor - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // //abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Fornecedor')+')and name = '+QuotedStr('Codigo_Logradouro')+')');
    // Add('ALTER TABLE Fornecedor DROP COLUMN Codigo_Logradouro');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Fornecedor - Deletar Codigo_Logradouro: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //

    // CADASTRO DE FUNCIONÁRIOS
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Funcionario') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('ALTER TABLE Funcionario ADD Endereco varchar(200) ');
        add('ALTER TABLE Funcionario ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Funcionario - Adicionar Endereço: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Funcionario') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('update Funcionario set Endereco = (select Descricao from Logradouro where Funcionario.Codigo_Logradouro = Logradouro.Codigo) ');
        add('update Funcionario set CEP = (select Logradouro.CEP from Logradouro where Funcionario.Codigo_Logradouro = Logradouro.Codigo) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        // Application.MessageBox(PChar('Causa do erro em Funcionario - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        // abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Funcionario') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('ALTER TABLE Funcionario DROP COLUMN Codigo_Logradouro');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Funcionario - Deletar Codigo_Logradouro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // CADASTRO DE CONTABILISTA
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Contabilista') + ')and name = ' +
          QuotedStr('Codigo_Endereco') + ')');
        add('begin ');
        add('ALTER TABLE Contabilista ADD Endereco varchar(200) ');
        add('ALTER TABLE Contabilista ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Contabilista - Adicionar Endereço: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Contabilista') + ')and name = ' +
          QuotedStr('Codigo_Endereco') + ')');
        add('ALTER TABLE Contabilista DROP COLUMN Codigo_Endereco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Contabilista - Deletar Codigo_Endereco: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // CADASTRO DE TRANSPORTADORA
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Transportadora') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('ALTER TABLE Transportadora ADD Endereco varchar(200) ');
        add('ALTER TABLE Transportadora ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Transportadora - Adicionar Endereço: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Transportadora') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('update Transportadora set Endereco = (select Descricao from Logradouro where Transportadora.Codigo_Logradouro = Logradouro.Codigo) ');
        add('update Transportadora set CEP = (select Logradouro.CEP from Logradouro where Transportadora.Codigo_Logradouro = Logradouro.Codigo) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        // Application.MessageBox(PChar('Causa do erro em Transportadora - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        // abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Transportadora') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('ALTER TABLE Transportadora DROP COLUMN Codigo_Logradouro');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Transportadora - Deletar Codigo_Logradouro: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

  end;

  if (tipo_local = '0101') then
  begin
    // CADASTRO DE FORNECEDOR LOCAL
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fornecedor') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('ALTER TABLE Fornecedor ADD Endereco varchar(200) ');
        add('ALTER TABLE Fornecedor ADD CEP varchar(10) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fornecedor - Adicionar Endereço: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fornecedor') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('begin ');
        add('update Fornecedor set Endereco = (select Descricao from Logradouro where Fornecedor.Codigo_Logradouro = Logradouro.Codigo) ');
        add('update Fornecedor set CEP = (select Logradouro.CEP from Logradouro where Fornecedor.Codigo_Logradouro = Logradouro.Codigo) ');
        add('end ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        // Application.MessageBox(PChar('Causa do erro em Fornecedor - Atualizar Endereço: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        // abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fornecedor') + ')and name = ' +
          QuotedStr('Codigo_Logradouro') + ')');
        add('ALTER TABLE Fornecedor DROP COLUMN Codigo_Logradouro');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fornecedor - Deletar Codigo_Logradouro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
  end;

end;

procedure TAtualizacoes.AtualizacaoEtiqueta;
var
  qAux, qAux2: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  if (eservidor = '0') then
  begin
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Etiquetadora') + '))');
        add('CREATE TABLE Etiquetadora ');
        add('(Codigo int primary key, ');
        add('Data_Cadastro date, ');
        add('Descricao varchar(50), ');

        add('Tipo_Barra_Etiqueta float, ');
        add('Largura_Barra_Larga float, ');
        add('Largura_Barra_Fina float, ');
        add('Distancia_Horizontal_Etiqueta float, ');
        add('Distancia_Vertical_Etiqueta float, ');
        add('Altura_Codigo float, ');
        add('Horizontal_Barra_Etiqueta float, ');
        add('Vertical_Barra_Etiqueta float, ');

        add('Orientacao_Impressao_Texto_Etiqueta varchar(10), ');

        add('Tamanho_Fonte_Texto_Etiqueta_Campo_1 float, ');
        add('Multiplicador_V_Texto_Etiqueta_Campo_1 float, ');
        add('Multiplicador_H_Texto_Etiqueta_Campo_1 float, ');
        add('Horizontal_Texto_Etiqueta_Campo_1 float, ');
        add('Vertical_Texto_Etiqueta_Campo_1 float, ');

        add('Tamanho_Fonte_Texto_Etiqueta_Campo_2 float, ');
        add('Multiplicador_V_Texto_Etiqueta_Campo_2 float, ');
        add('Multiplicador_H_Texto_Etiqueta_Campo_2 float, ');
        add('Horizontal_Texto_Etiqueta_Campo_2 float, ');
        add('Vertical_Texto_Etiqueta_Campo_2 float, ');

        add('Tamanho_Fonte_Texto_Etiqueta_Campo_3 float, ');
        add('Multiplicador_V_Texto_Etiqueta_Campo_3 float, ');
        add('Multiplicador_H_Texto_Etiqueta_Campo_3 float, ');
        add('Horizontal_Texto_Etiqueta_Campo_3 float, ');
        add('Vertical_Texto_Etiqueta_Campo_3 float, ');

        add('Tamanho_Fonte_Texto_Etiqueta_Campo_4 float, ');
        add('Multiplicador_V_Texto_Etiqueta_Campo_4 float, ');
        add('Multiplicador_H_Texto_Etiqueta_Campo_4 float, ');
        add('Horizontal_Texto_Etiqueta_Campo_4 float, ');
        add('Vertical_Texto_Etiqueta_Campo_4 float, ');

        add('Tamanho_Fonte_Texto_Etiqueta_Campo_5 float, ');
        add('Multiplicador_V_Texto_Etiqueta_Campo_5 float, ');
        add('Multiplicador_H_Texto_Etiqueta_Campo_5 float, ');
        add('Horizontal_Texto_Etiqueta_Campo_5 float, ');
        add('Vertical_Texto_Etiqueta_Campo_5 float)');
        ExecSQL;
        // FreeAndNil(qAux);
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em Etiquetadora : ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;




    // remover as colunas de etiqueta em config sistema
    // try
    // qAux2 := TADOQuery.Create(nil);
    // with qAux2, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Etiquetadora')+')and name = '+QuotedStr('Largura_Barra_Fina')+') ');
    // Add('begin ');
    // add('ALTER TABLE Configuracao_Sistema DROP COLUMN Orientacao_Impressao_Texto_Etiqueta');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Tamanho_Fonte_Texto_Etiqueta_Campo_1');
    // add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_V_Texto_Etiqueta_Campo_1');
    // add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_H_Texto_Etiqueta_Campo_1');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Horizontal_Texto_Etiqueta_Campo_1');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMNVertical_Texto_Etiqueta_Campo_1');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Tamanho_Fonte_Texto_Etiqueta_Campo_2');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_V_Texto_Etiqueta_Campo_2');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_H_Texto_Etiqueta_Campo_2');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Horizontal_Texto_Etiqueta_Campo_2');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Vertical_Texto_Etiqueta_Campo_2');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Tamanho_Fonte_Texto_Etiqueta_Campo_3');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_V_Texto_Etiqueta_Campo_3');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_H_Texto_Etiqueta_Campo_3');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Horizontal_Texto_Etiqueta_Campo_3');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Vertical_Texto_Etiqueta_Campo_3');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Tamanho_Fonte_Texto_Etiqueta_Campo_4');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_V_Texto_Etiqueta_Campo_4');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_H_Texto_Etiqueta_Campo_4');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Horizontal_Texto_Etiqueta_Campo_4');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Vertical_Texto_Etiqueta_Campo_4');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Tamanho_Fonte_Texto_Etiqueta_Campo_5');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_V_Texto_Etiqueta_Campo_5');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Multiplicador_H_Texto_Etiqueta_Campo_5');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Horizontal_Texto_Etiqueta_Campo_5');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Vertical_Texto_Etiqueta_Campo_5');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Largura_Barra_Larga');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Largura_Barra_Fina');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Tipo_Barra_Etiqueta');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Horizontal_Barra_Etiqueta');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Vertical_Barra_Etiqueta');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Distancia_Horizontal_Etiqueta');
    // Add('ALTER TABLE Configuracao_Sistema DROP COLUMN Distancia_Vertical_Etiqueta');
    // Add('end ');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Remover coluna config sistema etiqueta : '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

  end;

end;

procedure TAtualizacoes.AtualizacaoLocal;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  if (eservidor = '0') then
  begin
    // inserir local produto
    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Produto')+')and name = '+QuotedStr('Codigo_Local')+')');
      Add('begin ');
      add('ALTER TABLE Produto ADD Local varchar(200)');
      Add('end ');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Produto - Adicionar Localidade: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Produto')+')and name = '+QuotedStr('Codigo_Local')+')');
      Add('begin ');
      Add('update Produto set Local = (select Local from Localidade_Produto where Produto.Codigo_Local = Localidade_Produto.Codigo) ');
      Add('end ');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Produto - Atualizar Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Produto')+')and name = '+QuotedStr('Codigo_Local')+')');
    // Add('ALTER TABLE Produto DROP CONSTRAINT FK_Produto_Local');
    // Add('ALTER TABLE Produto DROP COLUMN Codigo_Local');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Produto - Deletar Codigo_Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
  end;

end;

procedure TAtualizacoes.AtualizacaoMD5;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE Produto ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - ADD campo MD5 Servidor: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' + QuotedStr('MD52') + ')');
          add('begin ');
          add('ALTER TABLE Produto ADD MD52 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - ADD campo MD52: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R02') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R02 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R02 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R03') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R03 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R03 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R04') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R04 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R04 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R05') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R05 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R05 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R06') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R06 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R06 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R07') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R07 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R07 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE Pedido ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido - ADD campo MD5: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE Itens_Pedido ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - ADD campo MD5: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Fechamento_Venda') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE Fechamento_Venda ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Fechamento_Venda - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (tipo_local = '0101') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE Produto ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - ADD campo MD5 Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' + QuotedStr('MD52') + ')');
          add('begin ');
          add('ALTER TABLE Produto ADD MD52 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - ADD campo MD52: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R02') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R02 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R02 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R03') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R03 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R03 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R04') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R04 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R04 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R05') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R05 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R05 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R06') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R06 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R06 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('R07') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE R07 ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em R07 - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Fechamento_Venda') + ')and name = ' + QuotedStr('MD5') + ')');
          add('begin ');
          add('ALTER TABLE Fechamento_Venda ADD MD5 varchar(50)');
          add('end ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Fechamento_Venda - ADD campo MD5: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TAtualizacoes.AtualizacaoRelacionamentos;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  if (eservidor = '0') then
  begin
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Itens_Pedido_Produto') + ')');
        add('ALTER TABLE Itens_Pedido with NOCHECK ADD CONSTRAINT FK_Itens_Pedido_Produto FOREIGN KEY(Codigo_Produto) ');
        add('References Produto(Codigo) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido. Criar Chave estrageira para Produto: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Itens_Entrada_Produto') + ')');
        add('ALTER TABLE Itens_Entrada with NOCHECK ADD CONSTRAINT FK_Itens_Entrada_Produto FOREIGN KEY(Codigo_Produto) ');
        add('References Produto(Codigo) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada. Criar Chave estrageira para Produto: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Fornecedor') + ')');
        add('ALTER TABLE Produto with NOCHECK ADD CONSTRAINT FK_Produto_Fornecedor FOREIGN KEY(Codigo_Fornecedor)');
        add('References Fornecedor(Codigo) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada. Criar Chave estrageira FK_Produto_Fornecedor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Fornecedor') + ')');
        add('ALTER TABLE Produto NOCHECK CONSTRAINT FK_Produto_Fornecedor');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Produto. Setar NOCHECK em FK_Produto_Fornecedor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Marca') + ')');
        add('ALTER TABLE Produto with NOCHECK ADD CONSTRAINT FK_Produto_Marca FOREIGN KEY(Codigo_Marca) ');
        add('References Marca(Codigo) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada. Criar Chave estrageira FK_Produto_Marca: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Marca') + ')');
        add('ALTER TABLE Produto NOCHECK CONSTRAINT FK_Produto_Marca');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Produto. Setar NOCHECK em FK_Produto_Marca: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Unidade_Medida') + ')');
        add('ALTER TABLE Produto with NOCHECK ADD CONSTRAINT FK_Produto_Unidade_Medida FOREIGN KEY(Codigo_Unidade_Medida) ');
        add('References Unidade_Medida(Codigo) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada. Criar Chave estrageira FK_Produto_Unidade_Medida: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Unidade_Medida') + ')');
        add('ALTER TABLE Produto NOCHECK CONSTRAINT FK_Produto_Unidade_Medida');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Produto. Setar NOCHECK em FK_Produto_Unidade_Medida: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Unidade_Volume') + ')');
        add('ALTER TABLE Produto with NOCHECK ADD CONSTRAINT FK_Produto_Unidade_Volume FOREIGN KEY(Codigo_Unidade_Volume) ');
        add('References Unidade_Medida(Codigo) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada. Criar Chave estrageira FK_Produto_Unidade_Volume: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Unidade_Volume') + ')');
        add('ALTER TABLE Produto NOCHECK CONSTRAINT FK_Produto_Unidade_Volume');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Produto. Setar NOCHECK em FK_Produto_Unidade_Volume: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Grupo_Produto') + ')');
        add('ALTER TABLE Produto with NOCHECK ADD CONSTRAINT FK_Produto_Grupo_Produto FOREIGN KEY(Codigo_Grupo) ');
        add('References Grupo_Produto(Codigo) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada. Criar Chave estrageira FK_Produto_Grupo_Produto: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Produto_Grupo_Produto') + ')');
        add('ALTER TABLE Produto NOCHECK CONSTRAINT FK_Produto_Grupo_Produto');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Produto. Setar NOCHECK em FK_Produto_Grupo_Produto: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('if not exists(select 1 from sysobjects where name = '+QuotedStr('FK_Produto_Local')+')');
      add('ALTER TABLE Produto with NOCHECK ADD CONSTRAINT FK_Produto_Local FOREIGN KEY(Codigo_Local) ');
      Add('References Localidade_Produto(Codigo)');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Produto. Criar Chave estrageira FK_Produto_Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('if exists(select 1 from sysobjects where name = '+QuotedStr('FK_Produto_Local')+')');
      add('ALTER TABLE Produto NOCHECK CONSTRAINT FK_Produto_Local');
      ExecSQL;
      end;
      except on E:Exception do
      begin
      Application.MessageBox(PChar('Causa do erro em Produto. Setar NOCHECK em FK_Produto_Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end;
      end; }

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Pedido_Cliente') + ')');
        add('ALTER TABLE Pedido NOCHECK CONSTRAINT FK_Pedido_Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Produto. Setar NOCHECK em FK_Pedido_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;


    // Relacionamento do campo Codigo setor da tabela de cliente

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Setor_Cliente') + ')');
        add('ALTER TABLE Cliente with NOCHECK ADD CONSTRAINT FK_Setor_Cliente FOREIGN KEY(Codigo_Setor) ');
        add('References Setor(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Setor. Criar Chave estrageira FK_Setor_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Setor_Cliente') + ')');
        add('ALTER TABLE Cliente NOCHECK CONSTRAINT FK_Setor_Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Setor. Setar NOCHECK em FK_Setor_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----


    // Relacionamento do campo Codigo cidade da tabela de cliente

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Cidade_Cliente') + ')');
        add('ALTER TABLE Cliente with NOCHECK ADD CONSTRAINT FK_Cidade_Cliente FOREIGN KEY(Codigo_Cidade) ');
        add('References Cidade(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Cidade. Criar Chave estrageira FK_Cidade_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Cidade_Cliente') + ')');
        add('ALTER TABLE Cliente NOCHECK CONSTRAINT FK_Cidade_Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cidade_Setor. Setar NOCHECK em FK_Cidade_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----


    // Relacionamento do campo Codigo grupo da tabela de cliente

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Grupo_Cliente') + ')');
        add('ALTER TABLE Cliente with NOCHECK ADD CONSTRAINT FK_Grupo_Cliente FOREIGN KEY(Codigo_Grupo) ');
        add('References Grupo_Cliente(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Grupo. Criar Chave estrageira FK_Grupo_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Grupo_Cliente') + ')');
        add('ALTER TABLE Cliente NOCHECK CONSTRAINT FK_Grupo_Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Grupo. Setar NOCHECK em FK_Grupo_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----

    // Relacionamento do campo Codigo_Tabela_Preco da tabela de cliente

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Tabela_Preco') + ')');
        add('ALTER TABLE Cliente with NOCHECK ADD CONSTRAINT FK_Codigo_Tabela_Preco FOREIGN KEY(Codigo_Tabela_Preco) ');
        add('References Tabela_Preco(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Tabela_Preco. Criar Chave estrageira FK_Codigo_Tabela_Preco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Tabela_Preco') + ')');
        add('ALTER TABLE Cliente NOCHECK CONSTRAINT FK_Codigo_Tabela_Preco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Tabela_Preco. Setar NOCHECK em FK_Codigo_Tabela_Preco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----

    // Relacionamento do campo Codigo_Usuario da tabela de cliente

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Usuario') + ')');
        add('ALTER TABLE Cliente with NOCHECK ADD CONSTRAINT FK_Codigo_Usuario FOREIGN KEY(Codigo_Usuario) ');
        add('References Cadastro_Usuario(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Usuario. Criar Chave estrageira FK_Codigo_Usuario: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Usuario') + ')');
        add('ALTER TABLE Cliente NOCHECK CONSTRAINT FK_Codigo_Usuario');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Usuario. Setar NOCHECK em FK_Codigo_Usuario: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----




    // Relacionamento do campo Codigo_Empresa da tabela de cliente

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Empresa') + ')');
        add('ALTER TABLE Cliente with NOCHECK ADD CONSTRAINT FK_Codigo_Empresa FOREIGN KEY(Codigo_Empresa) ');
        add('References Empresa(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Empresa. Criar Chave estrageira FK_Codigo_Empresa: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Empresa') + ')');
        add('ALTER TABLE Cliente NOCHECK CONSTRAINT FK_Codigo_Empresa');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Empresa. Setar NOCHECK em FK_Codigo_Empresa: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----



    // Relacionamento do campo Codigo_Setor da tabela de Empresa

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Setor') + ')');
        add('ALTER TABLE Empresa with NOCHECK ADD CONSTRAINT FK_Codigo_Setor FOREIGN KEY(Codigo_Setor) ');
        add('References Setor(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Setor. Criar Chave estrageira FK_Codigo_Setor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Setor') + ')');
        add('ALTER TABLE Empresa NOCHECK CONSTRAINT FK_Codigo_Setor');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Setor. Setar NOCHECK em FK_Codigo_Setor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----

    // Relacionamento do campo Codigo_Cidade da tabela de Empresa

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Cidade') + ')');
        add('ALTER TABLE Empresa with NOCHECK ADD CONSTRAINT FK_Codigo_Cidade FOREIGN KEY(Codigo_Cidade) ');
        add('References Cidade(Codigo)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Cidade. Criar Chave estrageira FK_Codigo_Cidade: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('FK_Codigo_Cidade') + ')');
        add('ALTER TABLE Empresa NOCHECK CONSTRAINT FK_Codigo_Cidade');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Codigo_Cidade. Setar NOCHECK em FK_Codigo_Cidade: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    // -----

  end;
end;

procedure TAtualizacoes.atualizacao2;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  if (eservidor = '0') then
  begin
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from sysobjects where name = ' +
          QuotedStr('PK_R02') + ')');
        add('ALTER TABLE R02 DROP CONSTRAINT PK_R02');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em R02 Alterar Data_Movimento Servidor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('R02') + ')and name = ' +
          QuotedStr('Data_Movimento') + ')');
        add('ALTER TABLE R02 ALTER COLUMN Data_Movimento date not null');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em R02 Data_Movimento: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('R02') + ')and name = ' + QuotedStr('N_Fabricacao') + ')');
        add('ALTER TABLE R02 ALTER COLUMN N_Fabricacao varchar(40) not null');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em R02 N_Fabricacao: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from sysobjects where name = ' +
          QuotedStr('PK_R02') + ')');
        add('ALTER TABLE R02 ADD CONSTRAINT PK_R02 PRIMARY KEY (N_Fabricacao, Data_Movimento)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em R02 Alterar chave primária Servidor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Tamanho_Impressao') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Tamanho_Impressao int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Tamanho_Impressao: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Qtde_Copias') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Qtde_Copias int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Qtde_Copias: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NF_Devolucao_Referencia') + '))');
        add(' CREATE TABLE NF_Devolucao_Referencia ');
        add('	( Codigo int primary key, ');
        add('	Codigo_Pedido bigint, ');
        add('	Codigo_Entrada_Produto bigint, ');
        add('	Numero varchar(20), ');
        add('	Chave varchar(50), ');
        add('	Caixa_ecf int, ');
        add('	Modelo varchar(3), ');
        add('	Serie varchar(3), ');
        add(' Valor	 float,');
        add(' Data_Emissao datetime)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em criar tabela NF_Devolucao_Referencia Servidor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Entrada_Produtos') + ')and name = ' +
          QuotedStr('Caixa_ECF') + ')');
        add('ALTER TABLE Entrada_Produtos ADD Caixa_ECF int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em Entrada_Produtos - Ex: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cliente') + ')and name = ' +
          QuotedStr('Observacoes') + ')');
        add('ALTER TABLE Cliente ALTER COLUMN Observacoes varchar(800)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cliente Alterar Observacoes Servidor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cliente')+')and name = '+QuotedStr('Observacoes')+')');
    // add('ALTER TABLE Cliente ALTER COLUMN Observacoes varchar(800)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Cliente Alterar Observacoes Servidor: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Entrada_Produtos') + ')and name = ' +
          QuotedStr('Chave_NFe_Entrada') + ')');
        add('ALTER TABLE Entrada_Produtos ADD Chave_NFe_Entrada varchar(50)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Entrada_Produtos Alterar Chave_NFe_Entrada Servidor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Ficha_Estoque') + '))');
        add(' CREATE TABLE Ficha_Estoque ');
        add('	( Codigo int primary key, ');
        add('	Data_Lancamento datetime, ');
        add('	Data_Movimentacao datetime, ');
        add('	Tipo varchar(10), ');
        add('	Tipo_Documento varchar(20), ');
        add('	Numero_Documento int, ');
        add('	Codigo_Produto int, ');
        add('	Quantidade float, ');
        add('	Valor_Unitario float, ');
        add('	Valor_UnitarioTotal float, ');
        add(' PrecoVendaVista	 float,');
        add(' PrecoVendaPrazo float,');
        add(' QuantidadeTotal float,');
        add(' CustoMedio float,');
        add(' Saldo float)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em criar tabela NF_Devolucao_Referencia Servidor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Entrada') + ')and name = ' +
          QuotedStr('Ficha_Estoque_Codigo') + ')');
        add('ALTER TABLE Itens_Entrada ADD Ficha_Estoque_Codigo int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Entrada_Produtos criando campo Ficha_Estoque_Codigo: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Ficha_Estoque_Codigo') + ')');
        add('ALTER TABLE Itens_Pedido ADD Ficha_Estoque_Codigo int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido criando campo Ficha_Estoque_Codigo: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Caminho_PDF_Carne') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Caminho_PDF_Carne varchar(500)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Caminho_PDF_Carne: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Observacoes_Carne') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Observacoes_Carne varchar(500)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Observacoes_Carne: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Tipo_Dias') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Tipo_Dias int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Tipo_Dias: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NCM') + ')and name = ' +
          QuotedStr('Aliquota_Estadual') + ')');
        add('ALTER TABLE NCM ADD Aliquota_Estadual float');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em NCM Aliquota_Estadual: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NCM') + ')and name = ' +
          QuotedStr('Aliquota_Municipal') + ')');
        add('ALTER TABLE NCM ADD Aliquota_Municipal float');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em NCM Aliquota_Municipal: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NCM') + ')and name = ' +
          QuotedStr('Vigencia_Inicio') + ')');
        add('ALTER TABLE NCM ADD Vigencia_Inicio date');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em NCM Vigencia_Inicio: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NCM') + ')and name = ' + QuotedStr('Vigencia_Fim') + ')');
        add('ALTER TABLE NCM ADD Vigencia_Fim date');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em NCM Vigencia_Fim: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NCM') + ')and name = ' + QuotedStr('Descricao') + ')');
        add('ALTER TABLE NCM ALTER COLUMN Descricao varchar(500)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em NCM Descricao: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Condicao_Pagamento') + ')and name = ' +
          QuotedStr('Programa_Impressora') + ')');
        add('ALTER TABLE Condicao_Pagamento ADD Programa_Impressora varchar(3) not null default('
          + QuotedStr('SIM') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Condicao_Pagamento Programa_Impressora: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Condicao_Pagamento')+')and name = '+QuotedStr('Programa_Impressora')+')');
    // add('ALTER TABLE Condicao_Pagamento ADD Programa_Impressora varchar(3) not null default('+QuotedStr('SIM')+')');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Condicao_Pagamento Programa_Impressora: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_ECF') + '))');
        add(' CREATE TABLE Configuracao_ECF ');
        add('	( Codigo int identity primary key, ');
        add('	Codigo_Empresa int, ');
        add('	N_Fabricacao varchar(30), ');
        add('	GT float, ');
        add('	Porta varchar(5), ');
        add('	Marca varchar(20), ');
        add('	CIECF varchar(10), ');
        add('	MD5 varchar(50), ');
        add('	Data_Ativacao datetime)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em criar tabela Configuracao_Impressora Servidor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_ECF') + ')and name = ' +
          QuotedStr('Modelo_ECF') + ')');
        add('ALTER TABLE Configuracao_ECF ADD Modelo_ECF varchar(20)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_ECF Modelo_ECF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_ECF') + ')and name = ' +
          QuotedStr('N_Caixa') + ')');
        add('ALTER TABLE Configuracao_ECF ADD N_Caixa varchar(10)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_ECF N_Caixa: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Gera_Pre_Venda') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Gera_Pre_Venda varchar(4) not null default('
          + QuotedStr('0202') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Gera_Pre_Venda: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Gera_OS') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Gera_OS varchar(4) not null default('
          + QuotedStr('0202') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Gera_OS: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Gera_DAV') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Gera_DAV varchar(4) not null default('
          + QuotedStr('0101') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Gera_DAV: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Gera_NFE') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Gera_NFE varchar(4) not null default('
          + QuotedStr('0101') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Gera_NFE: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Qtde_Maq') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Qtde_Maq int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Qtde_Maq: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Tipo_OS') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Tipo_OS int not null default(2)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Tipo_OS: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Pre_Venda') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Pre_Venda');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Pre_Venda Servidor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NFCarta_Correcao') + '))');
        add(' CREATE TABLE NFCarta_Correcao ');
        add('	( Codigo int identity primary key, ');
        add('	N_Nota_Fiscal int, ');
        add('	Chave_NFE varchar(50), ');
        add('	CNPJ varchar(20), ');
        add('	DataEvento datetime, ');
        add('	N_Carta_Correcao int, ');
        add('	Observacao varchar(800), ');
        add('	Protocolo varchar(50) )');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em criar tabela NFCarta_Correcao Servidor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Controla_Codigo_Lancamento_Financeiro') + '))');
        add(' CREATE TABLE Controla_Codigo_Lancamento_Financeiro ');
        add('	(Codigo int primary key)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em criar tabela Controla_Codigo_Lancamento_Financeiro Servidor: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if ( (select Max(C.Codigo) from Controla_Codigo_Lancamento_Financeiro C) is null)');
        add('begin');
        add('	Insert into Controla_Codigo_Lancamento_Financeiro (Codigo) values(');
        add('(select max(Lancamento_Financeiro.Codigo) as Codigo from Lancamento_Financeiro)	)');
        add('end');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em inserir código lançamento financeiro na tabela Controla_Codigo_Lancamento_Financeiro: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Entrada') + ')and name = ' +
          QuotedStr('Data_Validade') + ')');
        add('ALTER TABLE Itens_Entrada ADD Data_Validade datetime');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada Data_Validade: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Funcionario') + ')and name = ' +
          QuotedStr('Comissao_Servico') + ')');
        add('ALTER TABLE Funcionario ADD Comissao_Servico float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Funcionario Comissao_Servico: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    { TODO -oOwner -cGeneral : REMOVER OS CAMPOS QUANDO CRIOYU ETIQUETA }
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Modelo_Etiqueta') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Modelo_Etiqueta int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Modelo_Etiqueta: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('DPI_Impressora_Etiqueta') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD DPI_Impressora_Etiqueta int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema DPI_Impressora_Etiqueta: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Avanco_Impressora_Etiqueta') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Avanco_Impressora_Etiqueta int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Avanco_Impressora_Etiqueta: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Porta_Impressora_Etiqueta') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Porta_Impressora_Etiqueta varchar(50)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Porta_Impressora_Etiqueta: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Temperatura_Impressora_Etiqueta') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Temperatura_Impressora_Etiqueta int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuracao_Sistema Temperatura_Impressora_Etiqueta: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Limpar_Memoria_Impressora_Etiqueta')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Limpar_Memoria_Impressora_Etiqueta int not null default(1)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Limpar_Memoria_Impressora_Etiqueta: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Orientacao_Impressao_Texto_Etiqueta')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Orientacao_Impressao_Texto_Etiqueta int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Orientacao_Impressao_Texto_Etiqueta: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;





    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Tamanho_Fonte_Texto_Etiqueta_Campo_1')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Tamanho_Fonte_Texto_Etiqueta_Campo_1 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Tamanho_Fonte_Texto_Etiqueta_Campo_1: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_V_Texto_Etiqueta_Campo_1')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_V_Texto_Etiqueta_Campo_1 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_V_Texto_Etiqueta_Campo_1: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_H_Texto_Etiqueta_Campo_1')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_H_Texto_Etiqueta_Campo_1 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_H_Texto_Etiqueta_Campo_1: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Horizontal_Texto_Etiqueta_Campo_1')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Horizontal_Texto_Etiqueta_Campo_1 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Horizontal_Texto_Etiqueta_Campo_1: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Vertical_Texto_Etiqueta_Campo_1')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Vertical_Texto_Etiqueta_Campo_1 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Vertical_Texto_Etiqueta_Campo_1: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;



    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Tamanho_Fonte_Texto_Etiqueta_Campo_2')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Tamanho_Fonte_Texto_Etiqueta_Campo_2 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Tamanho_Fonte_Texto_Etiqueta_Campo_2: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_V_Texto_Etiqueta_Campo_2')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_V_Texto_Etiqueta_Campo_2 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_V_Texto_Etiqueta_Campo_2: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_H_Texto_Etiqueta_Campo_2')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_H_Texto_Etiqueta_Campo_2 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_H_Texto_Etiqueta_Campo_2: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Horizontal_Texto_Etiqueta_Campo_2')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Horizontal_Texto_Etiqueta_Campo_2 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Horizontal_Texto_Etiqueta_Campo_2: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Vertical_Texto_Etiqueta_Campo_2')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Vertical_Texto_Etiqueta_Campo_2 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Vertical_Texto_Etiqueta_Campo_2: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    //
    //
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Tipo_Barra_Etiqueta')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Tipo_Barra_Etiqueta varchar(50)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Tipo_Barra_Etiqueta: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Largura_Barra_Larga')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Largura_Barra_Larga int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Largura_Barra_Larga: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Largura_Barra_Fina')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Largura_Barra_Fina int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Largura_Barra_Fina: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Horizontal_Barra_Etiqueta')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Horizontal_Barra_Etiqueta int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Horizontal_Barra_Etiqueta: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Vertical_Barra_Etiqueta')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Vertical_Barra_Etiqueta int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Vertical_Barra_Etiqueta: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Altura_Barra')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Altura_Barra int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Altura_Barra: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;






    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Tamanho_Fonte_Texto_Etiqueta_Campo_3')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Tamanho_Fonte_Texto_Etiqueta_Campo_3 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Tamanho_Fonte_Texto_Etiqueta_Campo_3: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_V_Texto_Etiqueta_Campo_3')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_V_Texto_Etiqueta_Campo_3 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_V_Texto_Etiqueta_Campo_3: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_H_Texto_Etiqueta_Campo_3')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_H_Texto_Etiqueta_Campo_3 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_H_Texto_Etiqueta_Campo_3: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Horizontal_Texto_Etiqueta_Campo_3')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Horizontal_Texto_Etiqueta_Campo_3 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Horizontal_Texto_Etiqueta_Campo_3: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Vertical_Texto_Etiqueta_Campo_3')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Vertical_Texto_Etiqueta_Campo_3 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Vertical_Texto_Etiqueta_Campo_3: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    //
    //
    //
    //
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Tamanho_Fonte_Texto_Etiqueta_Campo_4')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Tamanho_Fonte_Texto_Etiqueta_Campo_4 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Tamanho_Fonte_Texto_Etiqueta_Campo_4: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_V_Texto_Etiqueta_Campo_4')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_V_Texto_Etiqueta_Campo_4 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_V_Texto_Etiqueta_Campo_4: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_H_Texto_Etiqueta_Campo_4')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_H_Texto_Etiqueta_Campo_4 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_H_Texto_Etiqueta_Campo_4: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Horizontal_Texto_Etiqueta_Campo_4')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Horizontal_Texto_Etiqueta_Campo_4 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Horizontal_Texto_Etiqueta_Campo_4: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Vertical_Texto_Etiqueta_Campo_4')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Vertical_Texto_Etiqueta_Campo_4 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Vertical_Texto_Etiqueta_Campo_4: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    //
    //
    //
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Tamanho_Fonte_Texto_Etiqueta_Campo_5')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Tamanho_Fonte_Texto_Etiqueta_Campo_5 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Tamanho_Fonte_Texto_Etiqueta_Campo_5: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_V_Texto_Etiqueta_Campo_5')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_V_Texto_Etiqueta_Campo_5 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_V_Texto_Etiqueta_Campo_5: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Multiplicador_H_Texto_Etiqueta_Campo_5')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Multiplicador_H_Texto_Etiqueta_Campo_5 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Multiplicador_H_Texto_Etiqueta_Campo_5: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Horizontal_Texto_Etiqueta_Campo_5')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Horizontal_Texto_Etiqueta_Campo_5 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Horizontal_Texto_Etiqueta_Campo_5: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Vertical_Texto_Etiqueta_Campo_5')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Vertical_Texto_Etiqueta_Campo_5 int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Vertical_Texto_Etiqueta_Campo_5: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;




    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Distancia_Horizontal_Etiqueta')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Distancia_Horizontal_Etiqueta int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Distancia_Horizontal_Etiqueta: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnection1;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Configuracao_Sistema')+')and name = '+QuotedStr('Distancia_Vertical_Etiqueta')+')');
    // add('ALTER TABLE Configuracao_Sistema ADD Distancia_Vertical_Etiqueta int not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Configuracao_Sistema Distancia_Vertical_Etiqueta: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Opcao_Servico_Padrao') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Opcao_Servico_Padrao int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema - Opcao_Servico_Padrao: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Desbloqueia_Cliente') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Desbloqueia_Cliente varchar(20) not null default('
          + QuotedStr('SIM') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema - Desbloqueia_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // Remover campos do Perfil do Usuario
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Cotacao_Preco') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Cotacao_Preco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Cotacao_Preco: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Retorno_Cotacao') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Retorno_Cotacao');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Retorno_Cotacao: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Comparativo_Preco') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Comparativo_Preco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Comparativo_Preco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Compra') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Compra');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Compra: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Conciliacao_Compra') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Conciliacao_Compra');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Conciliacao_Compra: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Sugestao_Compra') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Sugestao_Compra');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Sugestao_Compra: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Preco') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Preco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Preco: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Produto_Cadastrado') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Produto_Cadastrado');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Produto_Cadastrado: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Grupo_Tributacao') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Grupo_Tributacao');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Grupo_Tributacao: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Curva_ABC_Produto') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Curva_ABC_Produto');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Curva_ABC_Produto: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Comparativo_Custo_Venda') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Comparativo_Custo_Venda');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Comparativo_Custo_Venda: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Historico_Preco') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Historico_Preco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Historico_Preco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Cotacao_Preco') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Cotacao_Preco');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Cotacao_Preco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Retorno_Cotacao') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Retorno_Cotacao');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Retorno_Cotacao: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Consulta_Compra') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Consulta_Compra');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Consulta_Compra: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Cadastro_Caixa') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Cadastro_Caixa');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Cadastro_Caixa: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Conta_Fixa') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Conta_Fixa');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Conta_Fixa: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Perfil_Usuario') + ')and name = ' +
          QuotedStr('Mov_Ordem_Servico') + ')');
        add('ALTER TABLE Perfil_Usuario DROP COLUMN Mov_Ordem_Servico');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Perfil_Usuario Deletar Mov_Ordem_Servico: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Controla_Credito_Cliente') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Controla_Credito_Cliente int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema - Controla_Credito_Cliente: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // codigo registro na tabela endereco_cliente
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Endereco_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Registro') + ')');
        add('ALTER TABLE Endereco_Cliente ADD Codigo_Registro int primary key not null identity (1,1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Endereco_Cliente - Codigo_Registro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;




    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cliente')+'))');
    // add('DROP TABLE Cliente');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em DROP TABLE Cliente: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Endereco_Cliente')+'))');
    // add('DROP TABLE Endereco_Cliente');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em DROP TABLE Endereco_Cliente: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Grupo_Cliente')+'))');
    // add('DROP TABLE Grupo_Cliente');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em DROP TABLE Grupo_Cliente: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Telefone_Cliente')+'))');
    // add('DROP TABLE Telefone_Cliente');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em DROP TABLE Telefone_Cliente: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;
    //
    //

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Endereco_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Registro') + ')');
        add('ALTER TABLE Endereco_Cliente ADD Codigo_Registro int primary key not null identity (1,1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Endereco_Cliente - Codigo_Registro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Dados_Adicionais_Cliente') + ')and name = ' +
          QuotedStr('Endereco') + ')');
        add('ALTER TABLE Dados_Adicionais_Cliente ADD Endereco varchar(200)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Dados_Adicionais_Cliente - Endereco: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Dados_Adicionais_Cliente') + ')and name = ' +
          QuotedStr('Numero') + ')');
        add('ALTER TABLE Dados_Adicionais_Cliente ADD Numero varchar(5)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Dados_Adicionais_Cliente - Numero: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Dados_Adicionais_Cliente') + ')and name = ' +
          QuotedStr('CEP') + ')');
        add('ALTER TABLE Dados_Adicionais_Cliente ADD CEP varchar(10)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Dados_Adicionais_Cliente - CEP: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Dados_Adicionais_Cliente') + ')and name = ' +
          QuotedStr('Complemento') + ')');
        add('ALTER TABLE Dados_Adicionais_Cliente ADD Complemento varchar(50)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Dados_Adicionais_Cliente - Complemento: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Dados_Adicionais_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Setor') + ')');
        add('ALTER TABLE Dados_Adicionais_Cliente ADD Codigo_Setor int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Dados_Adicionais_Cliente - Codigo_Setor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Dados_Adicionais_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Cidade') + ')');
        add('ALTER TABLE Dados_Adicionais_Cliente ADD Codigo_Cidade int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Dados_Adicionais_Cliente - Codigo_Cidade: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Dados_Adicionais_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Registro') + ')');
        add('ALTER TABLE Dados_Adicionais_Cliente ADD Codigo_Registro int primary key not null identity (1,1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Dados_Adicionais_Cliente - Codigo_Registro: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Entrada') + ')and name = ' +
          QuotedStr('Saldo_Estoque_Atual') + ')');
        add('ALTER TABLE Itens_Entrada DROP COLUMN Saldo_Estoque_Atual');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada Deletar Saldo_Estoque_Atual: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Entrada') + ')and name = ' +
          QuotedStr('Volume_Atual') + ')');
        add('ALTER TABLE Itens_Entrada DROP COLUMN Volume_Atual');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Entrada Deletar Volume_Atual: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Busca_Parametro_Calculo_Preco') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Busca_Parametro_Calculo_Preco int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Busca_Parametro_Calculo_Preco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Entrada_Produtos') + ')and name = ' +
          QuotedStr('Finalizada') + ')');
        add('ALTER TABLE Entrada_Produtos ADD Finalizada int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Entrada_Produtos ADD Finalizada: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Gera_Cupom_Fiscal') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Gera_Cupom_Fiscal varchar(4) not null default('
          + QuotedStr('0101') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Gera_Cupom_Fiscal: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cadastro_CFOP') + ')and name = ' +
          QuotedStr('Faturar_NFe') + ')');
        add('ALTER TABLE Cadastro_CFOP ADD Faturar_NFe int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cadastro_CFOP - Faturar_NFe: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Gera_Codigo_EAN_Valido') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Gera_Codigo_EAN_Valido int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Gera_Codigo_EAN_Valido: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Codigo_CFOP') + ')');
        add('ALTER TABLE Pedido ADD Codigo_CFOP int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em Pedido Codigo_CFOP: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Pedido')+')and name = '+QuotedStr('Codigo_CFOP')+')');
    // add('ALTER TABLE Pedido ADD Codigo_CFOP int not null default(1)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Pedido Codigo_CFOP: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Codigo_CFOP_Padrao') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Codigo_CFOP_Padrao int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Codigo_CFOP_Padrao: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Trazer_Somente_Cond_Pag_ECF') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Trazer_Somente_Cond_Pag_ECF int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Trazer_Somente_Cond_Pag_ECF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('NCM') + ')and name = ' + QuotedStr('IVA') + ')');
        add('ALTER TABLE NCM ADD IVA float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em NCM IVA: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cadastro_UF') + '))');
        add(' CREATE TABLE Cadastro_UF ');
        add('	( Codigo int primary key, ');
        add('	Descricao varchar(50), ');
        add('	UF varchar(2), ');
        add('	Aliquota_ICMS int, ');
        add(' Data_Cadastro datetime)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em criar tabela Cadastro_UF: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Total_Impostos') + ')');
        add('ALTER TABLE Pedido ADD Total_Impostos float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido Total_Impostos Servidor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Pedido')+')and name = '+QuotedStr('Total_Impostos')+')');
    // add('ALTER TABLE Pedido ADD Total_Impostos float not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em Pedido Total_Impostos Servidor Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '
          + QuotedStr('Itens_Pedido') + ' and COLUMN_NAME = ' +
          QuotedStr('Valor_ICMS_ST') + ' and DATA_TYPE = ' +
          QuotedStr('varchar') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Valor_ICMS_ST');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em DROP COLUMN Valor_ICMS_ST Servidor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '+QuotedStr('Itens_Pedido')+' and COLUMN_NAME = '+QuotedStr('Valor_ICMS_ST')+' and DATA_TYPE = '+QuotedStr('varchar')+')');
    // add('ALTER TABLE Itens_Pedido DROP COLUMN Valor_ICMS_ST');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em DROP COLUMN Valor_ICMS_ST Servidor Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '
          + QuotedStr('Itens_Pedido') + ' and COLUMN_NAME = ' +
          QuotedStr('Valor_ICMS_ST') + ' and DATA_TYPE = ' +
          QuotedStr('float') + ')');
        add('ALTER TABLE Itens_Pedido ADD Valor_ICMS_ST float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em ADD Valor_ICMS_ST Servidor: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    // try
    // with qAux, sql do
    // begin
    // close;
    // Connection:= dm.ADOConnectionLocal;
    // clear;
    // add('if not exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '+QuotedStr('Itens_Pedido')+' and COLUMN_NAME = '+QuotedStr('Valor_ICMS_ST')+' and DATA_TYPE = '+QuotedStr('float')+')');
    // add('ALTER TABLE Itens_Pedido ADD Valor_ICMS_ST float not null default(0)');
    // ExecSQL;
    // end;
    // except on E:Exception do
    // begin
    // Application.MessageBox(PChar('Causa do erro em ADD Valor_ICMS_ST Servidor Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    // abort;
    // end;
    // end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Base_Acrescida') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Base_Acrescida');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Base_Acrescida: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Tipo_Calculo_BC_ICMS_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Tipo_Calculo_BC_ICMS_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Tipo_Calculo_BC_ICMS_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Tipo_Recolhimento_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Tipo_Recolhimento_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Tipo_Recolhimento_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('ICMS_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN ICMS_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN ICMS_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('CST_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN CST_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN CST_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('CSOSN_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN CSOSN_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN CSOSN_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Base_Reduzida_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Base_Reduzida_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Base_Reduzida_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Base_Acrescida_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Base_Acrescida_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Base_Acrescida_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('BC_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN BC_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN BC_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Valor_ICMS_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Valor_ICMS_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Valor_ICMS_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Lancamento_Banco') + ')and name = ' +
          QuotedStr('Saldo_Anterior') + ')');
        add('ALTER TABLE Lancamento_Banco ADD Saldo_Anterior float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Lancamento_Banco Adicionar Saldo_Anterior: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Lancamento_Banco') + ')and name = ' +
          QuotedStr('Saldo_Atual') + ')');
        add('ALTER TABLE Lancamento_Banco ADD Saldo_Atual float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Lancamento_Banco Adicionar Saldo_Atual: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Lancamento_Banco') + ')and name = ' +
          QuotedStr('Codigo_Cheque') + ')');
        add('ALTER TABLE Lancamento_Banco ADD Codigo_Cheque int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Lancamento_Banco Adicionar Codigo_Cheque: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Parcelas_Lancamentos_Historico') + ')and name = ' +
          QuotedStr('Codigo_Lancamento_Bancario') + ')');
        add('ALTER TABLE Parcelas_Lancamentos_Historico ADD Codigo_Lancamento_Bancario int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Parcelas_Lancamentos_Historico Adicionar Codigo_Lancamento_Bancario: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Parcelas_Lancamentos_Historico') + ')and name = ' +
          QuotedStr('Codigo_Lancamento_Caixa') + ')');
        add('ALTER TABLE Parcelas_Lancamentos_Historico ADD Codigo_Lancamento_Caixa int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Parcelas_Lancamentos_Historico Adicionar Codigo_Lancamento_Caixa: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Lancamento_Banco') + ')and name = ' +
          QuotedStr('Transferencia') + ')');
        add('ALTER TABLE Lancamento_Banco ADD Transferencia int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Lancamento_Banco Adicionar Transferencia: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Registro') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Registro int primary key not null identity (1,1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Registro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Descricao') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Descricao varchar(100)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Descricao: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Transferencia') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Transferencia int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Transferencia: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Conta') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Conta int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Conta: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Operacao') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Operacao int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Operacao: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Lancamento_Banco') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Lancamento_Banco int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Lancamento_Banco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Saldo_Anterior') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Saldo_Anterior float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Saldo_Anterior: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Saldo_Atual') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Saldo_Atual float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Saldo_Atual: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cadastro_Usuario') + ')and name = ' +
          QuotedStr('Saldo_Atual') + ')');
        add('ALTER TABLE Cadastro_Usuario ADD Saldo_Atual float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cadastro_Usuario - Saldo_Atual: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Data_Emissao_NFe') + ')');
        add('ALTER TABLE Pedido ADD Data_Emissao_NFe datetime');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido - Data_Emissao_NFe: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cadastro_Status') + ')and name = ' +
          QuotedStr('Encerrado') + ')');
        add('ALTER TABLE Cadastro_Status ADD Encerrado int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cadastro_Status - Encerrado: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Endereco_Cliente') + ')and name = ' +
          QuotedStr('Codigo_Cidade') + ')');
        add('ALTER TABLE Endereco_Cliente ADD Codigo_Cidade int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Endereco_Cliente - Codigo_Cidade : ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido_Endereco_Cliente') + ')and name = ' +
          QuotedStr('Inscricao_Estadual') + ')');
        add('ALTER TABLE Pedido_Endereco_Cliente ADD Inscricao_Estadual varchar(20)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido_Endereco_Cliente - Inscricao_Estadual : '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('IdCSC') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD IdCSC varchar(20)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema IdCSC: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('NumeroCSC') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD NumeroCSC varchar(50)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema IdCSC: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Chave_NFCe') + ')');
        add('ALTER TABLE Pedido ADD Chave_NFCe varchar(100)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido Chave_NFCe: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Protocolo_NFCe') + ')');
        add('ALTER TABLE Pedido ADD Protocolo_NFCe varchar(100)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido Protocolo_NFCe: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('N_NFCE') + ')');
        add('ALTER TABLE Pedido ADD N_NFCE int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido N_NFCE: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Data_Emissao_NFCe') + ')');
        add('ALTER TABLE Pedido ADD Data_Emissao_NFCe datetime');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido Data_Emissao_NFCe: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Condicao_Pagamento') + ')and name = ' +
          QuotedStr('CNPJ_Operadora') + ')');
        add('ALTER TABLE Condicao_Pagamento ADD CNPJ_Operadora varchar(15)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Condicao_Pagamento CNPJ_Operadora: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

  end;

  if (tipo_local = '0101') then
  begin
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cliente') + ')and name = ' +
          QuotedStr('Observacoes') + ')');
        add('ALTER TABLE Cliente ALTER COLUMN Observacoes varchar(800)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Cliente Alterar Observacoes Servidor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Condicao_Pagamento') + ')and name = ' +
          QuotedStr('Programa_Impressora') + ')');
        add('ALTER TABLE Condicao_Pagamento ADD Programa_Impressora varchar(3) not null default('
          + QuotedStr('SIM') + ')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Condicao_Pagamento Programa_Impressora: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Cliente') + '))');
        add('DROP TABLE Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em DROP TABLE Cliente: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Endereco_Cliente') + '))');
        add('DROP TABLE Endereco_Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em DROP TABLE Endereco_Cliente: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Grupo_Cliente') + '))');
        add('DROP TABLE Grupo_Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em DROP TABLE Grupo_Cliente: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Telefone_Cliente') + '))');
        add('DROP TABLE Telefone_Cliente');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em DROP TABLE Telefone_Cliente: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Codigo_CFOP') + ')');
        add('ALTER TABLE Pedido ADD Codigo_CFOP int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Causa do erro em Pedido Codigo_CFOP: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Total_Impostos') + ')');
        add('ALTER TABLE Pedido ADD Total_Impostos float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido Total_Impostos Local: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '
          + QuotedStr('Itens_Pedido') + ' and COLUMN_NAME = ' +
          QuotedStr('Valor_ICMS_ST') + ' and DATA_TYPE = ' +
          QuotedStr('varchar') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Valor_ICMS_ST');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em DROP COLUMN Valor_ICMS_ST Local: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '
          + QuotedStr('Itens_Pedido') + ' and COLUMN_NAME = ' +
          QuotedStr('Valor_ICMS_ST') + ' and DATA_TYPE = ' +
          QuotedStr('float') + ')');
        add('ALTER TABLE Itens_Pedido ADD Valor_ICMS_ST float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em ADD Valor_ICMS_ST Local: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Base_Acrescida') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Base_Acrescida');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Base_Acrescida: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Tipo_Calculo_BC_ICMS_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Tipo_Calculo_BC_ICMS_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Tipo_Calculo_BC_ICMS_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Tipo_Recolhimento_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Tipo_Recolhimento_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Tipo_Recolhimento_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('ICMS_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN ICMS_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN ICMS_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('CST_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN CST_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN CST_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('CSOSN_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN CSOSN_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN CSOSN_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Base_Reduzida_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Base_Reduzida_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Base_Reduzida_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Base_Acrescida_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Base_Acrescida_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Base_Acrescida_NF: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('BC_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN BC_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN BC_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Itens_Pedido') + ')and name = ' +
          QuotedStr('Valor_ICMS_NF') + ')');
        add('ALTER TABLE Itens_Pedido DROP COLUMN Valor_ICMS_NF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Itens_Pedido DROP COLUMN Valor_ICMS_NF: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Registro') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Registro int primary key not null identity (1,1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Registro: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Descricao') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Descricao varchar(100)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Descricao: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Transferencia') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Transferencia int not null default(1)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Transferencia: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Conta') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Conta int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Conta: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Operacao') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Operacao int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Operacao: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Codigo_Lancamento_Banco') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Codigo_Lancamento_Banco int not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Codigo_Lancamento_Banco: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Saldo_Anterior') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Saldo_Anterior float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Saldo_Anterior: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Fechamento_Venda') + ')and name = ' +
          QuotedStr('Saldo_Atual') + ')');
        add('ALTER TABLE Fechamento_Venda ADD Saldo_Atual float not null default(0)');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Fechamento_Venda - Saldo_Atual: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnectionLocal;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Pedido') + ')and name = ' +
          QuotedStr('Data_Emissao_NFe') + ')');
        add('ALTER TABLE Pedido ADD Data_Emissao_NFe datetime');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Pedido - Data_Emissao_NFe: ' + E.Message),
          'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

  end;
end;

procedure TAtualizacoes.Atualizacao1;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('EAN_Balanca') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD EAN_Balanca int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema EAN_Balanca: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id(' +
          QuotedStr('Configuracao_Sistema') + ')and name = ' +
          QuotedStr('Gerar_Financeiro') + ')');
        add('ALTER TABLE Configuracao_Sistema ADD Gerar_Financeiro int');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Configuração do Sistema Versão BD: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Aplicacao') + ')');
          add('ALTER TABLE Produto ADD Aplicacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Produto Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Aplicacao') + ')');
          add('ALTER TABLE Produto_Aux ADD Aplicacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Produto Aux Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Aplicacao') + ')');
          add('ALTER TABLE Produto ADD Aplicacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Produto Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Aplicacao') + ')');
          add('ALTER TABLE Produto_Aux ADD Aplicacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Produto Aux Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Aplicacao') + ')');
          add('ALTER TABLE Produto ADD Aplicacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Produto Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Aplicacao') + ')');
          add('ALTER TABLE Produto_Aux ADD Aplicacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Produto Aux Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido_Endereco_Cliente') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('ALTER TABLE Pedido_Endereco_Cliente ADD Codigo_Registro int identity primary key');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido_Endereco_Cliente: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Telefone_Cliente') + '))');

          add(' CREATE TABLE Telefone_Cliente ');
          add('	( Codigo_Cliente int NULL, ');
          add('	Codigo_Telefone int NULL, ');
          add('	Telefone varchar(50) NULL, ');
          add('	Tipo varchar(20) NULL ) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Telefone_Cliente Servidor: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Telefone_Cliente') + '))');

          add('CREATE TABLE Telefone_Cliente( ');
          add('	Codigo_Cliente int NULL, ');
          add('	Codigo_Telefone int NULL, ');
          add('	Telefone varchar(50) NULL, ');
          add('	Tipo varchar(20) NULL) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Telefone_Cliente Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Telefone_Cliente') + '))');

          add('CREATE TABLE Telefone_Cliente( ');
          add('	Codigo_Cliente int NULL, ');
          add('	Codigo_Telefone int NULL, ');
          add('	Telefone varchar(50) NULL, ');
          add('	Tipo varchar(20) NULL) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Telefone_Cliente Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Observacao') + ')');
          add('ALTER TABLE Pedido ADD Observacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Observacao Servidor: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Observacao') + ')');
          add('ALTER TABLE Pedido ADD Observacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Observacao Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Observacao') + ')');
          add('ALTER TABLE Pedido ADD Observacao varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Observacao Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Usuario') + ')and name = ' +
            QuotedStr('Atualiza_Preco_Orcamento') + ')');
          add('ALTER TABLE Cadastro_Usuario ADD Atualiza_Preco_Orcamento varchar(3)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Usuario Atualiza_Preco_Orcamento Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Dias_Orcamento_Vencido') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Dias_Orcamento_Vencido int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema Dias_Orcamento_Vencido Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Hora_Venda') + ')');
          add('ALTER TABLE Pedido ADD Hora_Venda varchar(10)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Hora_Venda Servidor: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Hora_Venda') + ')');
          add('ALTER TABLE Pedido ADD Hora_Venda varchar(10)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Hora_Venda Servidor Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Hora_Venda') + ')');
          add('ALTER TABLE Pedido ADD Hora_Venda varchar(10)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Hora_Venda Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Fechar_Caixa') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Fechar_Caixa int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Fechar_Caixa: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Codigo_Fornecedor') + '))');

          add('CREATE TABLE Produto_Codigo_Fornecedor( ');
          add('	Codigo_Produto_Fornecedor varchar(20) NULL, ');
          add('	Codigo_Produto_Inteiro int NULL, ');
          add('	Codigo_Fornecedor int NULL) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Codigo_Fornecedor - Criar Tabela: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Checado') + ')');
          add('ALTER TABLE Itens_Entrada ADD Checado varchar(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada - Checado: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Codigo_Produto_Fornecedor') + ')');
          add('ALTER TABLE Itens_Entrada ADD Codigo_Produto_Fornecedor varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada - Codigo_Produto_Fornecedor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Descricao_Produto') + ')');
          add('ALTER TABLE Itens_Entrada ADD Descricao_Produto varchar(50)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada - Descricao_Produto: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Codigo_Usuario') + ')');
          add('ALTER TABLE Cliente ADD Codigo_Usuario int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Servidor - Codigo_Usuario: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Perc_Desc_Vista') + ')');
          add('ALTER TABLE Itens_Pedido ADD Perc_Desc_Vista float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido Servidor - Perc_Desc_Vista: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Perc_Desc_Prazo') + ')');
          add('ALTER TABLE Itens_Pedido ADD Perc_Desc_Prazo float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido Servidor - Perc_Desc_Prazo: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido_Aux') + ')and name = ' +
            QuotedStr('Perc_Desc_Vista') + ')');
          add('ALTER TABLE Itens_Pedido_Aux ADD Perc_Desc_Vista float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido_Aux Servidor - Perc_Desc_Vista: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido_Aux') + ')and name = ' +
            QuotedStr('Perc_Desc_Prazo') + ')');
          add('ALTER TABLE Itens_Pedido_Aux ADD Perc_Desc_Prazo float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido_Aux Servidor - Perc_Desc_Prazo: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Perc_Desc_Vista') + ')');
          add('ALTER TABLE Itens_Pedido ADD Perc_Desc_Vista float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido Local - Perc_Desc_Vista: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Perc_Desc_Prazo') + ')');
          add('ALTER TABLE Itens_Pedido ADD Perc_Desc_Prazo float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido Local - Perc_Desc_Prazo: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Perc_Desc_Vista') + ')');
          add('ALTER TABLE Itens_Pedido ADD Perc_Desc_Vista float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido Local - Perc_Desc_Vista: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Perc_Desc_Prazo') + ')');
          add('ALTER TABLE Itens_Pedido ADD Perc_Desc_Prazo float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido Local - Perc_Desc_Prazo: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos') + ')and name = ' +
            QuotedStr('Data_Atualizacao') + ')');
          add('ALTER TABLE Parcelas_Lancamentos ADD Data_Atualizacao datetime');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos - Data_Atualizacao: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Codigo_Sub_Grupo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Codigo_Sub_Grupo int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor - Codigo_Sub_Grupo: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Sub_Grupo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Sub_Grupo varchar(100)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor - Sub_Grupo: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Codigo_Pai') + ')');
          add('ALTER TABLE Grupo_Produto ADD Codigo_Pai int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor - Codigo_Pai: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      // ATUALIZANDO OS CAMPOS PARA QUE NÃO FIQUEM NULL. PEGA O CÓDIGO DO GRUPO E COLOCA NOS TRES
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('update Grupo_Produto set Codigo_Sub_Grupo = Codigo, Sub_Grupo = Codigo, Codigo_Pai = Codigo where (Codigo_Sub_Grupo is null) and (Sub_Grupo is null) and (Codigo_Pai is null)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor - Atualizar Valores Nulos: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Codigo_Sub_Grupo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Codigo_Sub_Grupo int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor Local - Codigo_Sub_Grupo: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Sub_Grupo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Sub_Grupo varchar(100)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor Local - Sub_Grupo: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Codigo_Pai') + ')');
          add('ALTER TABLE Grupo_Produto ADD Codigo_Pai int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor Local - Codigo_Pai: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      // ATUALIZANDO OS CAMPOS PARA QUE NÃO FIQUEM NULL. PEGA O CÓDIGO DO GRUPO E COLOCA NOS TRES
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('update Grupo_Produto set Codigo_Sub_Grupo = Codigo, Sub_Grupo = Codigo, Codigo_Pai = Codigo where (Codigo_Sub_Grupo is null) and (Sub_Grupo is null) and (Codigo_Pai is null)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Servidor Local - Atualizar Valores Nulos: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Codigo_Sub_Grupo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Codigo_Sub_Grupo int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Local - Codigo_Sub_Grupo: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Sub_Grupo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Sub_Grupo varchar(100)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Local - Sub_Grupo: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Codigo_Pai') + ')');
          add('ALTER TABLE Grupo_Produto ADD Codigo_Pai int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Local - Codigo_Pai: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      // ATUALIZANDO OS CAMPOS PARA QUE NÃO FIQUEM NULL. PEGA O CÓDIGO DO GRUPO E COLOCA NOS TRES
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('update Grupo_Produto set Codigo_Sub_Grupo = Codigo, Sub_Grupo = Codigo, Codigo_Pai = Codigo where (Codigo_Sub_Grupo is null) and (Sub_Grupo is null) and (Codigo_Pai is null)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Local - Atualizar Valores Nulos: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Calcula_Juro') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Calcula_Juro int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Calcula_Juro: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Atualiza_Orcamento_Vencido') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Atualiza_Orcamento_Vencido int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Atualiza_Orcamento_Vencido: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Atualizou_Orcamento_Vencido') + ')');
          add('ALTER TABLE Pedido ADD Atualizou_Orcamento_Vencido int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Servidor - Atualizou_Orcamento_Vencido: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Atualizou_Orcamento_Vencido') + ')');
          add('ALTER TABLE Pedido ADD Atualizou_Orcamento_Vencido int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Servidor Local - Atualizou_Orcamento_Vencido: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Atualizou_Orcamento_Vencido') + ')');
          add('ALTER TABLE Pedido ADD Atualizou_Orcamento_Vencido int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Local - Atualizou_Orcamento_Vencido: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Consulta_Padrao_Produto') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Consulta_Padrao_Produto int not null default(3)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema Consulta_Padrao_Produto Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Plano_Financeiro') + ')and name = ' +
            QuotedStr('Sub_Nivel') + ')');
          add('ALTER TABLE Plano_Financeiro ADD Sub_Nivel varchar(50)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Plano_Financeiro Sub_Nivel Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Plano_Financeiro') + ')and name = ' +
            QuotedStr('Codigo_Pai') + ')');
          add('ALTER TABLE Plano_Financeiro ADD Codigo_Pai int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Plano_Financeiro Codigo_Pai Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear; // VERIFICANDO SE EXISTE
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Plano_Financeiro') + ')and name = ' +
            QuotedStr('Plano') + ')');
          add('ALTER TABLE Plano_Financeiro DROP COLUMN Plano');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Plano_Financeiro Deletar Plano Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Plano_Financeiro') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Plano_Financeiro ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Plano_Financeiro Alterar Descricao Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Codigo_Similar') + ')');
          add('ALTER TABLE Produto ADD Codigo_Similar varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Codigo_Similar Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Codigo_Similar') + ')');
          add('ALTER TABLE Produto_Aux ADD Codigo_Similar varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Codigo_Similar Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Codigo_Similar') + ')');
          add('ALTER TABLE Produto ADD Codigo_Similar varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Codigo_Similar Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Codigo_Similar') + ')');
          add('ALTER TABLE Produto_Aux ADD Codigo_Similar varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Codigo_Similar Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Codigo_Similar') + ')');
          add('ALTER TABLE Produto ADD Codigo_Similar varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Codigo_Similar Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Codigo_Similar') + ')');
          add('ALTER TABLE Produto_Aux ADD Codigo_Similar varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Codigo_Similar Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Tipo_Desc_Acr_Padrao') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Tipo_Desc_Acr_Padrao int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Tipo_Desc_Acr_Padrao: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Valor_Compra_Unitario') + ')');
          add('ALTER TABLE Produto ADD Valor_Compra_Unitario float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Valor_Compra_Unitario Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Valor_Ultima_Compra_Unitario') + ')');
          add('ALTER TABLE Produto ADD Valor_Ultima_Compra_Unitario float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Valor_Ultima_Compra_Unitario Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('update Produto set Valor_Compra_Unitario = Valor_Compra where (Valor_Compra_Unitario is null) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto Servidor - Atualizar Valor_Compra_Unitario: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Valor_Compra_Unitario') + ')');
          add('ALTER TABLE Produto_Aux ADD Valor_Compra_Unitario float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Valor_Compra_Unitario Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Valor_Ultima_Compra_Unitario') + ')');
          add('ALTER TABLE Produto_Aux ADD Valor_Ultima_Compra_Unitario float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Valor_Ultima_Compra_Unitario Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('update Produto_Aux set Valor_Compra_Unitario = Valor_Compra where (Valor_Compra_Unitario is null) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto Servidor - Atualizar Valor_Compra_Unitario: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Valor_Compra_Unitario') + ')');
          add('ALTER TABLE Produto ADD Valor_Compra_Unitario float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Valor_Compra_Unitario Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Valor_Ultima_Compra_Unitario') + ')');
          add('ALTER TABLE Produto ADD Valor_Ultima_Compra_Unitario float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Valor_Ultima_Compra_Unitario Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('update Produto set Valor_Compra_Unitario = Valor_Compra where (Valor_Compra_Unitario is null) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto Local - Atualizar Valor_Compra_Unitario: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Valor_Compra_Unitario') + ')');
          add('ALTER TABLE Produto ADD Valor_Compra_Unitario float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Valor_Compra_Unitario Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Valor_Ultima_Compra_Unitario') + ')');
          add('ALTER TABLE Produto ADD Valor_Ultima_Compra_Unitario float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Valor_Ultima_Compra_Unitario Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('update Produto set Valor_Compra_Unitario = Valor_Compra where (Valor_Compra_Unitario is null) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto Local - Atualizar Valor_Compra_Unitario: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Valor_Ultima_Compra_Unitario') + ')');
          add('ALTER TABLE Itens_Entrada ADD Valor_Ultima_Compra_Unitario float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada - Valor_Ultima_Compra_Unitario Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Lancamento_Financeiro') + ')and name = ' +
            QuotedStr('Conta_Fixa') + ')');
          add('ALTER TABLE Lancamento_Financeiro ADD Conta_Fixa int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Lancamento_Financeiro Conta_Fixa: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Versao_BD') + ')');
          add('ALTER TABLE Configuracao_Sistema DROP COLUMN Versao_BD');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - DROP COLUMN Versao_BD: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos') + ')and name = ' +
            QuotedStr('Valor_Pagar') + ')');
          add('ALTER TABLE Parcelas_Lancamentos ADD Valor_Pagar float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos - Valor_Pagar Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Parcelas_Lancamentos set Valor_Pagar = Valor where (Valor_Pagar is null) ');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox
          (PChar('Causa do erro em Parcelas_Lancamentos Servidor - Atualizar Valor_Pagar: '
          + E.Message), 'Erro', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Impostos_Entrada') + ')and name = ' +
            QuotedStr('Custo_Total') + ')');
          add('ALTER TABLE Impostos_Entrada ADD Custo_Total float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Impostos_Entrada - Custo_Total Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Lancamento_Financeiro') + ')and name = ' +
            QuotedStr('Calcula_Juro') + ')');
          add('ALTER TABLE Lancamento_Financeiro ADD Calcula_Juro int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Lancamento_Financeiro - Calcula_Juro Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Tabela_Preco') + ')and name = ' +
            QuotedStr('Tipo_Valor') + ')');
          add('ALTER TABLE Tabela_Preco ADD Tipo_Valor int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Tabela_Preco - Tipo_Valor Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      { try
        with qAux, sql do
        begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Tabela_Preco_Aux')+')and name = '+QuotedStr('Tipo_Valor')+')');
        add('ALTER TABLE Tabela_Preco_Aux ADD Tipo_Valor int not null default(0)');
        ExecSQL;
        end;
        except on E:Exception do
        begin
        Application.MessageBox(PChar('Causa do erro em Tabela_Preco_Aux - Tipo_Valor Servidor: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        abort;
        end;
        end; }

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Tabela_Preco') + ')and name = ' +
            QuotedStr('Tipo_Valor') + ')');
          add('ALTER TABLE Tabela_Preco ADD Tipo_Valor int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Tabela_Preco - Tipo_Valor Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Tabela_Preco') + ')and name = ' +
            QuotedStr('Tipo_Valor') + ')');
          add('ALTER TABLE Tabela_Preco ADD Tipo_Valor int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Tabela_Preco - Tipo_Valor Estação: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Situacao_Tributaria') + ')and name = ' +
            QuotedStr('Permite_Credito') + ')');
          add('ALTER TABLE Cadastro_Situacao_Tributaria ADD Permite_Credito int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Situacao_Tributaria - Permite_Credito Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Situacao_Tributaria') + ')and name = ' +
            QuotedStr('Codigo_Obs_Fiscal') + ')');
          add('ALTER TABLE Cadastro_Situacao_Tributaria ADD Codigo_Obs_Fiscal int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Situacao_Tributaria - Codigo_Obs_Fiscal Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Situacao_Tributaria') + ')and name = ' +
            QuotedStr('Permite_Credito') + ')');
          add('ALTER TABLE Cadastro_Situacao_Tributaria ADD Permite_Credito int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Situacao_Tributaria - Permite_Credito Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Situacao_Tributaria') + ')and name = ' +
            QuotedStr('Codigo_Obs_Fiscal') + ')');
          add('ALTER TABLE Cadastro_Situacao_Tributaria ADD Codigo_Obs_Fiscal int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Situacao_Tributaria - Codigo_Obs_Fiscal Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Situacao_Tributaria') + ')and name = ' +
            QuotedStr('Permite_Credito') + ')');
          add('ALTER TABLE Cadastro_Situacao_Tributaria ADD Permite_Credito int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Situacao_Tributaria - Permite_Credito Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Situacao_Tributaria') + ')and name = ' +
            QuotedStr('Codigo_Obs_Fiscal') + ')');
          add('ALTER TABLE Cadastro_Situacao_Tributaria ADD Codigo_Obs_Fiscal int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Situacao_Tributaria - Codigo_Obs_Fiscal Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Permite_Credito') + ')');
          add('ALTER TABLE Itens_Pedido ADD Permite_Credito int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Permite_Credito Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Codigo_Obs_Fiscal') + ')');
          add('ALTER TABLE Itens_Pedido ADD Codigo_Obs_Fiscal int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Codigo_Obs_Fiscal Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido_Aux') + ')and name = ' +
            QuotedStr('Permite_Credito') + ')');
          add('ALTER TABLE Itens_Pedido_Aux ADD Permite_Credito int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido_Aux - Permite_Credito Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido_Aux') + ')and name = ' +
            QuotedStr('Codigo_Obs_Fiscal') + ')');
          add('ALTER TABLE Itens_Pedido_Aux ADD Codigo_Obs_Fiscal int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido_Aux - Codigo_Obs_Fiscal Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Permite_Credito') + ')');
          add('ALTER TABLE Itens_Pedido ADD Permite_Credito int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Permite_Credito Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Codigo_Obs_Fiscal') + ')');
          add('ALTER TABLE Itens_Pedido ADD Codigo_Obs_Fiscal int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Codigo_Obs_Fiscal Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Permite_Credito') + ')');
          add('ALTER TABLE Itens_Pedido ADD Permite_Credito int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Permite_Credito Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Codigo_Obs_Fiscal') + ')');
          add('ALTER TABLE Itens_Pedido ADD Codigo_Obs_Fiscal int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Codigo_Obs_Fiscal Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Gerar_Estoque') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Gerar_Estoque int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Gerar_Estoque Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Nome') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Nome int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Nome Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Razao_Social') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Razao_Social int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Razao_Social Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_CPF') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_CPF int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_CPF Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_RG') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_RG int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_RG Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_CNPJ') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_CNPJ int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_CNPJ Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Insc_Estadual') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Insc_Estadual int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Insc_Estadual Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Endereco') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Endereco int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Endereco Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Numero') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Numero int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Numero Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Setor') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Setor int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Setor Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Email') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Email int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Email Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Cidade') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Cidade int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Cidade Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Data_Nascimento') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Data_Nascimento int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Data_Nascimento Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Ob_Cliente_Telefone') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Ob_Cliente_Telefone int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Ob_Cliente_Telefone Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Produto ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Produto_Aux ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Itens_Pedido ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Qtde_Estoque_Atual') + ')');
          add('ALTER TABLE Itens_Pedido ADD Qtde_Estoque_Atual float not null default(0) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Qtde_Estoque_Atual Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Qtde_Estoque_Atual') + ')');
          add('ALTER TABLE Itens_Entrada ADD Qtde_Estoque_Atual float not null default(0) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada - Qtde_Estoque_Atual Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Produto ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Produto_Aux ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Itens_Pedido ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Descricao Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Qtde_Estoque_Atual') + ')');
          add('ALTER TABLE Itens_Pedido ADD Qtde_Estoque_Atual float not null default(0) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Qtde_Estoque_Atual Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Produto ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Produto_Aux') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Produto_Aux ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Produto_Aux - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Itens_Pedido ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Descricao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Qtde_Estoque_Atual') + ')');
          add('ALTER TABLE Itens_Pedido ADD Qtde_Estoque_Atual float not null default(0) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Qtde_Estoque_Atual Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Consulta_Historico_Movimentacao') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Consulta_Historico_Movimentacao int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario - Consulta_Historico_Movimentacao: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Mov_NFe') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Mov_NFe int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario - Mov_NFe: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Entrada_Produtos') + ')and name = ' +
            QuotedStr('Codigo_Funcionario') + ')');
          add('ALTER TABLE Entrada_Produtos ADD Codigo_Funcionario int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Entrada_Produtos - Codigo_Funcionario: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Movimentacao_Estoque') + ')and name = ' +
            QuotedStr('Codigo_Funcionario') + ')');
          add('ALTER TABLE Movimentacao_Estoque ADD Codigo_Funcionario int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Movimentacao_Estoque - Codigo_Funcionario: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Movimentacao_Estoque') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('delete from Movimentacao_Estoque');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Deletar Conteúdo Movimentacao_Estoque: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Movimentacao_Estoque') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('ALTER TABLE Movimentacao_Estoque ADD Codigo_Registro int identity(1,1) not null');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Movimentacao_Estoque - Codigo_Registro: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido_Endereco_Cliente') + ')and name = ' +
            QuotedStr('Telefone') + ')');
          add('ALTER TABLE Pedido_Endereco_Cliente ALTER COLUMN Telefone varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido_Endereco_Cliente Servidor - Atualizar tamanho do campo telefone: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Telefone') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Telefone varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Servidor - Atualizar tamanho do campo telefone: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Telefone_Contato') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Telefone_Contato varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Servidor - Atualizar tamanho do campo Telefone Contato: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' + QuotedStr('Celular') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Celular varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Servidor - Atualizar tamanho do campo Celular: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Telefone_Cliente') + ')and name = ' +
            QuotedStr('Telefone') + ')');
          add('ALTER TABLE Telefone_Cliente ALTER COLUMN Telefone varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Telefone_Cliente Servidor - Atualizar tamanho do campo telefone: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Telefone') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Telefone varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Servidor - Atualizar tamanho do campo telefone: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Telefone_Contato') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Telefone_Contato varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Local - Atualizar tamanho do campo Telefone Contato: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' + QuotedStr('Celular') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Celular varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Servidor - Atualizar tamanho do campo Celular: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Telefone_Cliente') + ')and name = ' +
            QuotedStr('Telefone') + ')');
          add('ALTER TABLE Telefone_Cliente ALTER COLUMN Telefone varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Telefone_Cliente Servidor - Atualizar tamanho do campo telefone: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Telefone') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Telefone varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Local - Atualizar tamanho do campo telefone: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Telefone_Contato') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Telefone_Contato varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Local - Atualizar tamanho do campo Telefone Contato: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' + QuotedStr('Celular') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Celular varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Local - Atualizar tamanho do campo Celular: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Telefone_Cliente') + ')and name = ' +
            QuotedStr('Telefone') + ')');
          add('ALTER TABLE Telefone_Cliente ALTER COLUMN Telefone varchar(20)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Telefone_Cliente Local - Atualizar tamanho do campo telefone: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Movimentacao_Estoque') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Movimentacao_Estoque ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Movimentacao_Estoque - Descricao Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Status') + '))');

          add(' CREATE TABLE Cadastro_Status ');
          add('	( Codigo int primary key identity(1,1) NOT NULL, ');
          add('	Descricao varchar(50) NULL, ');
          add('	Data_Cadastro datetime NULL) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Status Servidor: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Cadastro_Status') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Cadastro_Status int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario Cadastro_Status: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Data_Previsao_Entrega') + ')');
          add('ALTER TABLE Pedido ADD Data_Previsao_Entrega datetime');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Data_Previsao_Entrega Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Data_Entrega') + ')');
          add('ALTER TABLE Pedido ADD Data_Entrega datetime');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Data_Entrega Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Kilometragem') + ')');
          add('ALTER TABLE Pedido ADD Kilometragem float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Kilometragem Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Data_Previsao_Entrega') + ')');
          add('ALTER TABLE Pedido ADD Data_Previsao_Entrega datetime');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Data_Previsao_Entrega Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Data_Entrega') + ')');
          add('ALTER TABLE Pedido ADD Data_Entrega datetime');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Data_Entrega Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Kilometragem') + ')');
          add('ALTER TABLE Pedido ADD Kilometragem float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Kilometragem Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Data_Previsao_Entrega') + ')');
          add('ALTER TABLE Pedido ADD Data_Previsao_Entrega datetime');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Data_Previsao_Entrega Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Data_Entrega') + ')');
          add('ALTER TABLE Pedido ADD Data_Entrega datetime');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Data_Entrega Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido') + ')and name = ' +
            QuotedStr('Kilometragem') + ')');
          add('ALTER TABLE Pedido ADD Kilometragem float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido Kilometragem Local: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_OS') + ')and name = ' +
            QuotedStr('Descricao_Servico') + ')');
          add('ALTER TABLE Itens_OS ADD Descricao_Servico varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_OS - Descricao_Servico Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_OS') + ')and name = ' + QuotedStr('ISS') + ')');
          add('ALTER TABLE Itens_OS ADD ISS varchar(10)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_OS - ISS Servidor: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_OS') + ')and name = ' + QuotedStr('Qtde') + ')');
          add('ALTER TABLE Itens_OS ADD Qtde int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_OS - Qtde Servidor: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_OS') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('ALTER TABLE Itens_OS ADD Codigo_Registro int primary key identity(1,1) not null');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_OS - Codigo_Registro Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Controla_N_Carta_Correcao') + '))');

          add(' CREATE TABLE Controla_N_Carta_Correcao ');
          add('	( Codigo int primary key NOT NULL, ');
          add('	  N_Nota_Fiscal varchar(50) ) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Controla_N_Carta_Correcao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Bloqueia_Cliente') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Bloqueia_Cliente varchar(3) not null default('
            + QuotedStr('SIM') + ')');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Bloqueia_Cliente Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_Usuario') + ')and name = ' +
            QuotedStr('Bloqueia_Cliente') + ')');
          add('ALTER TABLE Cadastro_Usuario DROP COLUMN Bloqueia_Cliente');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_Usuario - Deletar Bloqueia_Cliente: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Valor_Compra_Nota') + ')');
          add('ALTER TABLE Itens_Pedido ADD Valor_Compra_Nota float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Valor_Compra_Nota Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Valor_Compra_Nota') + ')');
          add('ALTER TABLE Itens_Pedido ADD Valor_Compra_Nota float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Valor_Compra_Nota Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Pedido') + ')and name = ' +
            QuotedStr('Valor_Compra_Nota') + ')');
          add('ALTER TABLE Itens_Pedido ADD Valor_Compra_Nota float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Pedido - Valor_Compra_Nota Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('and not exists (SELECT 1 FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = '
            + QuotedStr('PK_Itens_Tabela_Preco') + ')');
          add('ALTER TABLE Itens_Tabela_Preco add constraint PK_Itens_Tabela_Preco primary key(Codigo_Registro) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco - Setar Codigo_Registro como Primary Key Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco_Aux') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('and not exists (SELECT 1 FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = '
            + QuotedStr('PK_Itens_Tabela_Preco_Aux') + ')');
          add('ALTER TABLE Itens_Tabela_Preco_Aux add constraint PK_Itens_Tabela_Preco_Aux primary key(Codigo_Registro) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco_Aux - Setar Codigo_Registro como Primary Key Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      { try
        with qAux, sql do
        begin
        close;
        Connection:= dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Itens_Tabela_Preco')+')and name = '+QuotedStr('Codigo_Registro')+')');
        add('ALTER TABLE Itens_Tabela_Preco add constraint PK_Itens_Tabela_Preco primary key(Codigo_Registro)');
        ExecSQL;
        end;
        except on E:Exception do
        begin
        Application.MessageBox(PChar('Causa do erro em Itens_Tabela_Preco - Setar Codigo_Registro como Primary Key Servidor Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        abort;
        end;
        end;

        try
        with qAux, sql do
        begin
        close;
        Connection:= dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Itens_Tabela_Preco_Aux')+')and name = '+QuotedStr('Codigo_Registro')+')');
        add('ALTER TABLE Itens_Tabela_Preco_Aux add constraint PK_Itens_Tabela_Preco_Aux primary key(Codigo_Registro)');
        ExecSQL;
        end;
        except on E:Exception do
        begin
        Application.MessageBox(PChar('Causa do erro em Itens_Tabela_Preco_Aux - Setar Codigo_Registro como Primary Key Servidor Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        abort;
        end;
        end; }
    end
    else
    begin
      { try
        with qAux, sql do
        begin
        close;
        Connection:= dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Itens_Tabela_Preco')+')and name = '+QuotedStr('Codigo_Registro')+')');
        add('ALTER TABLE Itens_Tabela_Preco add constraint PK_Itens_Tabela_Preco primary key(Codigo_Registro)');
        ExecSQL;
        end;
        except on E:Exception do
        begin
        Application.MessageBox(PChar('Causa do erro em Itens_Tabela_Preco - Setar Codigo_Registro como Primary Key Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        abort;
        end;
        end;

        try
        with qAux, sql do
        begin
        close;
        Connection:= dm.ADOConnectionLocal;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Itens_Tabela_Preco_Aux')+')and name = '+QuotedStr('Codigo_Registro')+')');
        add('ALTER TABLE Itens_Tabela_Preco_Aux add constraint PK_Itens_Tabela_Preco_Aux primary key(Codigo_Registro)');
        ExecSQL;
        end;
        except on E:Exception do
        begin
        Application.MessageBox(PChar('Causa do erro em Itens_Tabela_Preco_Aux - Setar Codigo_Registro como Primary Key Local: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
        abort;
        end;
        end; }
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Grupo_Produto ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Alterar Descricao Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Grupo_Produto ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Alterar Descricao Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Grupo_Produto ALTER COLUMN Descricao varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto Alterar Descricao Local: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Pedido_Temporario') + ')and name = ' +
            QuotedStr('Cancelado') + ')');
          add('ALTER TABLE Pedido_Temporario ADD Cancelado varchar(3) not null default('
            + QuotedStr('N') + ')');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Pedido_Temporario - Cancelado Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_OS') + ')and name = ' +
            QuotedStr('Codigo_Mecanico') + ')');
          add('ALTER TABLE Itens_OS ADD Codigo_Mecanico int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_OS - Codigo_Mecanico Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_OS') + ')and name = ' +
            QuotedStr('Comissao') + ')');
          add('ALTER TABLE Itens_OS ADD Comissao float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_OS - Comissao Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Descricao_Produto') + ')');
          add('ALTER TABLE Itens_Entrada ALTER COLUMN Descricao_Produto varchar(300)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada Alterar Descricao_Produto Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    END;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Funcionario_Outros') + '))');

          add(' CREATE TABLE Funcionario_Outros ');
          add('	( Codigo int primary key NOT NULL, ');
          add('	Data_Admissao datetime NULL, ');
          add('	Data_Demissao datetime NULL, ');
          add('	CTPS_N varchar(50) NULL, ');
          add('	CTPS_Serie varchar(50) NULL, ');
          add('	Titulo_N varchar(50) NULL, ');
          add('	Titulo_Cidade varchar(100) NULL, ');
          add('	Titulo_Zona varchar(50) NULL, ');
          add('	Titulo_Secao varchar(50) NULL, ');
          add('	Certificado_Militar_N varchar(50) NULL, ');
          add('	Certificado_Militar_Serie varchar(50) NULL, ');
          add('	Certificado_Militar_Categoria varchar(50) NULL, ');
          add('	Nome_Pai varchar(100) NULL, ');
          add('	Nome_Mae varchar(100) NULL, ');
          add('	Nacionalidade varchar(100) NULL, ');
          add('	Naturalidade varchar(100) NULL, ');
          add('	Conjuge varchar(100) NULL, ');
          add('	Grau_Instrucao varchar(100) NULL, ');
          add('	CNH_N varchar(50) NULL, ');
          add('	CNH_Categoria varchar(10) NULL, ');
          add('	CNH_Cidade varchar(100) NULL, ');
          add('	PIS_N varchar(50) NULL, ');
          add('	PIS_Data_Cadastro datetime NULL, ');
          add('	PIS_Banco varchar(100) NULL, ');
          add('	PIS_Codigo_Banco varchar(50) NULL, ');
          add('	PIS_Codigo_Agencia varchar(50) NULL, ');
          add('	PIS_Endereco_Agencia varchar(300) NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Funcionario_Outros Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Funcionario_Alteracao_Salarial') + '))');

          add(' CREATE TABLE Funcionario_Alteracao_Salarial ');
          add('	( Codigo_Registro int identity(1,1) primary key NOT NULL, ');
          add('	Codigo int NULL, ');
          add('	Data datetime NULL, ');
          add('	Salario float NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Funcionario_Alteracao_Salarial Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Funcionario_Alteracao_Cargo') + '))');

          add(' CREATE TABLE Funcionario_Alteracao_Cargo ');
          add('	( Codigo_Registro int identity(1,1) primary key NOT NULL, ');
          add('	Codigo int NULL, ');
          add('	Data datetime NULL, ');
          add('	Codigo_Cargo int NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Funcionario_Alteracao_Cargo Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Funcionario_Ferias') + '))');

          add(' CREATE TABLE Funcionario_Ferias ');
          add('	( Codigo_Registro int identity(1,1) primary key NOT NULL, ');
          add('	Codigo int NULL, ');
          add('	Ferias_De datetime NULL, ');
          add('	Ferias_Ate datetime NULL,');
          add('	Periodo_De datetime NULL,');
          add('	Periodo_Ate datetime NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Funcionario_Ferias Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Tipo_Ocorrencia') + '))');

          add(' CREATE TABLE Tipo_Ocorrencia ');
          add('	( Codigo int identity(1,1) primary key NOT NULL, ');
          add('	Descricao varchar(50) NOT NULL, ');
          add('	Data_Cadastro datetime NOT NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Tipo_Ocorrencia Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Ocorrencia') + '))');

          add(' CREATE TABLE Ocorrencia ');
          add('	( Codigo int identity(1,1) primary key NOT NULL, ');
          add('	Codigo_Funcionario int NULL, ');
          add('	Codigo_Tipo_Ocorrencia int NULL, ');
          add('	Observacao varchar(500) NULL, ');
          add('	Data_Ocorrencia datetime NULL, ');
          add('	Data_Cadastro datetime NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Ocorrencia Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Funcionario_Contribuicao_Social') + '))');

          add(' CREATE TABLE Funcionario_Contribuicao_Social ');
          add('	( Codigo_Registro int identity(1,1) primary key NOT NULL, ');
          add('	Codigo int NULL, ');
          add('	N_Guia varchar(100) NULL, ');
          add('	Data datetime NULL, ');
          add('	Sindicato varchar(100) NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Funcionario_Contribuicao_Social Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Cadastro_Tipo_Ocorrencia') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Cadastro_Tipo_Ocorrencia int not null default(2)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario - Cadastro_Tipo_Ocorrencia Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Registro_Ocorrencia') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Registro_Ocorrencia int not null default(2)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario - Registro_Ocorrencia Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Consulta_Ocorrencia') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Consulta_Ocorrencia int not null default(2)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario - Consulta_Ocorrencia Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos') + ')and name = ' +
            QuotedStr('Codigo_Forma_Pagamento_Parcela') + ')');
          add('ALTER TABLE Parcelas_Lancamentos ADD Codigo_Forma_Pagamento_Parcela int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos - Codigo_Forma_Pagamento_Parcela: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Tipo_Impressao_Pedido') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Tipo_Impressao_Pedido int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuração do Sistema Tipo Impressao Pedido: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Caminho_PDF_Pedido') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Caminho_PDF_Pedido varchar(500)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuração do Sistema Caminho PDF Pedido: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Saldo_Estoque_Atual') + ')');
          add('ALTER TABLE Itens_Entrada ADD Saldo_Estoque_Atual float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada Saldo_Estoque_Atual: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Volume_Atual') + ')');
          add('ALTER TABLE Itens_Entrada ADD Volume_Atual float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada Volume_Atual: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Entrada') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('ALTER TABLE Itens_Entrada ADD Codigo_Registro int identity primary key');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Entrada Codigo_Registro: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Tipo_Bem_Patrimonial') + '))');

          add(' CREATE TABLE Tipo_Bem_Patrimonial ');
          add('	( Codigo int NOT NULL primary key identity(1,1), ');
          add('	Descricao varchar(50) NULL, ');
          add('	Data_Cadastro datetime null ) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Tipo_Bem_Patrimonial Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Patrimonio') + '))');

          add(' CREATE TABLE Patrimonio');
          add('	( Codigo int NOT NULL primary key identity(1,1), ');
          add('	N_Bem varchar(50) NULL, ');
          add('	N_Identificacao varchar(50) NULL, ');
          add('	Descricao varchar(300) NULL, ');
          add('	Codigo_Marca int NULL, ');
          add('	Modelo varchar(100) NULL, ');
          add('	Codigo_Tipo_Bem int NULL, ');
          add('	Codigo_Local_Bem int NULL, ');
          add('	Data_Aquisicao datetime NULL, ');
          add('	Data_Baixa datetime NULL, ');
          add('	Valor_Bem float NULL, ');
          add('	Codigo_Status int NULL, ');
          add('	Observacao varchar(500) NULL, ');
          add('	Data_Cadastro datetime null ) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Causa do erro em Patrimonio Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Cadastro_Tipo_Bem') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Cadastro_Tipo_Bem int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario Cadastro_Tipo_Bem: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Cadastro_Patrimonio') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Cadastro_Patrimonio int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario Cadastro_Patrimonio: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Consulta_Patrimonio') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Consulta_Patrimonio int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario Consulta_Patrimonio: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Perfil_Usuario') + ')and name = ' +
            QuotedStr('Consulta_Ficha_Cliente') + ')');
          add('ALTER TABLE Perfil_Usuario ADD Consulta_Ficha_Cliente int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Perfil_Usuario Consulta_Ficha_Cliente: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_CFOP') + ')and name = ' +
            QuotedStr('Mostrar_Imposto') + ')');
          add('ALTER TABLE Cadastro_CFOP ADD Mostrar_Imposto int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_CFOP - Mostrar_Imposto: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_CFOP') + ')and name = ' +
            QuotedStr('Gera_Financeiro') + ')');
          add('ALTER TABLE Cadastro_CFOP ADD Gera_Financeiro int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_CFOP - Gera_Financeiro: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_CFOP') + ')and name = ' +
            QuotedStr('Controla_Estoque') + ')');
          add('ALTER TABLE Cadastro_CFOP ADD Controla_Estoque int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_CFOP - Controla_Estoque: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_CFOP') + ')and name = ' +
            QuotedStr('Estoque') + ')');
          add('ALTER TABLE Cadastro_CFOP ADD Estoque int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_CFOP - Estoque: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Vista') + ')');
          add('ALTER TABLE Grupo_Produto ADD Percentual_Comissao_Vista float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto - Percentual_Comissao_Vista Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Prazo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Percentual_Comissao_Prazo float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto - Percentual_Comissao_Prazo Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Vista') + ')');
          add('ALTER TABLE Itens_Tabela_Preco ADD Percentual_Comissao_Vista float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco - Percentual_Comissao_Vista Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Prazo') + ')');
          add('ALTER TABLE Itens_Tabela_Preco ADD Percentual_Comissao_Prazo float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco - Percentual_Comissao_Prazo Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Vista') + ')');
          add('ALTER TABLE Grupo_Produto ADD Percentual_Comissao_Vista float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto - Percentual_Comissao_Vista Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Prazo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Percentual_Comissao_Prazo float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto - Percentual_Comissao_Prazo Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Vista') + ')');
          add('ALTER TABLE Itens_Tabela_Preco ADD Percentual_Comissao_Vista float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco - Percentual_Comissao_Vista Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Prazo') + ')');
          add('ALTER TABLE Itens_Tabela_Preco ADD Percentual_Comissao_Prazo float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco - Percentual_Comissao_Prazo Servidor Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Vista') + ')');
          add('ALTER TABLE Grupo_Produto ADD Percentual_Comissao_Vista float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto - Percentual_Comissao_Vista Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Grupo_Produto') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Prazo') + ')');
          add('ALTER TABLE Grupo_Produto ADD Percentual_Comissao_Prazo float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Grupo_Produto - Percentual_Comissao_Prazo Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Vista') + ')');
          add('ALTER TABLE Itens_Tabela_Preco ADD Percentual_Comissao_Vista float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco - Percentual_Comissao_Vista Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Itens_Tabela_Preco') + ')and name = ' +
            QuotedStr('Percentual_Comissao_Prazo') + ')');
          add('ALTER TABLE Itens_Tabela_Preco ADD Percentual_Comissao_Prazo float not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Itens_Tabela_Preco - Percentual_Comissao_Prazo Local: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Sistema') + ')and name = ' +
            QuotedStr('Usar_Comissao') + ')');
          add('ALTER TABLE Configuracao_Sistema ADD Usar_Comissao int not null default(1)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Configuracao_Sistema - Usar_Comissao: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cadastro_CFOP') + ')and name = ' +
            QuotedStr('Descricao') + ')');
          add('ALTER TABLE Cadastro_CFOP ALTER COLUMN Descricao varchar(500)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cadastro_CFOP Descricao: ' + E.Message),
            'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente_Outros') + '))');
          add(' CREATE TABLE Cliente_Outros ');
          add('	( Codigo int primary key NOT NULL, ');
          add('	Nome_Pai varchar(100) NULL, ');
          add('	Nome_Mae varchar(100) NULL, ');
          add('	Nacionalidade varchar(100) NULL, ');
          add('	Naturalidade varchar(100) NULL, ');
          add('	Conjuge varchar(100) NULL, ');
          add('	Grau_Instrucao varchar(100) NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Cliente_Outros Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if (select Count(CO.Codigo) from Cliente_Outros CO) = 0');
          add(' INSERT INTO Cliente_Outros(Codigo) select Cliente.Codigo from Cliente');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Cliente_Outros, inserir códigos de clientes: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos') + ')and name = ' +
            QuotedStr('Valor_Restante') + ')');
          add('ALTER TABLE Parcelas_Lancamentos ADD Valor_Restante float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos - Valor_Restante: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos') + ')and name = ' +
            QuotedStr('Desconto') + ')');
          add('ALTER TABLE Parcelas_Lancamentos ADD Desconto float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos - Desconto: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos') + ')and name = ' +
            QuotedStr('Acrescimo') + ')');
          add('ALTER TABLE Parcelas_Lancamentos ADD Acrescimo float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos - Acrescimo: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos') + ')and name = ' +
            QuotedStr('Valor_Pago') + ')');
          add('ALTER TABLE Parcelas_Lancamentos ADD Valor_Pago float');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos - Valor_Pago: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Configuracao_Relatorio') + '))');
          add(' CREATE TABLE Configuracao_Relatorio ');
          add('	( Codigo_Empresa int, ');
          add('	Codigo_Usuario int, ');
          add('	Nome_Campo varchar(300), ');
          add('	Nome_Apresentacao varchar(300), ');
          add('	Tipo_Relatorio varchar(300),');
          add('	Visivel int)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Configuracao_Relatorio Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos_Historico') + '))');
          add(' CREATE TABLE Parcelas_Lancamentos_Historico ');
          add('	( Codigo int NOT NULL, ');
          add('	N_Documento int NOT NULL, ');
          add('	Data_Pagamento datetime NOT NULL, ');
          add('	Codigo_Forma_Pagamento int NOT NULL, ');
          add('	Valor_Recebido float NOT NULL)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em criar tabela Parcelas_Lancamentos_Historico Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos_Historico') + ')and name = ' +
            QuotedStr('Codigo_Conta') + ')');
          add('ALTER TABLE Parcelas_Lancamentos_Historico ADD Codigo_Conta int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos_Historico - Codigo_Conta: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos_Historico') + ')and name = ' +
            QuotedStr('Codigo_Cheque') + ')');
          add('ALTER TABLE Parcelas_Lancamentos_Historico ADD Codigo_Cheque int not null default(0)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos_Historico - Codigo_Cheque: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Parcelas_Lancamentos_Historico') + ')and name = ' +
            QuotedStr('Codigo_Registro') + ')');
          add('ALTER TABLE Parcelas_Lancamentos_Historico ADD Codigo_Registro int identity primary key');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos_Historico - Código Registro: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('update Parcelas_Lancamentos set Valor_Pago = Valor_Pagar where (Valor_Pago is null) ');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Parcelas_Lancamentos Servidor - Atualizar Valores Pagos: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      if (eservidor = '0') then
      begin
        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('NCM') + ')and name = ' + QuotedStr('Ex') + ')');
            add('ALTER TABLE NCM ADD Ex varchar(10)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Causa do erro em NCM - Ex: ' + E.Message), 'Erro',
              MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('NCM') + ')and name = ' +
              QuotedStr('Aliquota_Nacional') + ')');
            add('ALTER TABLE NCM ADD Aliquota_Nacional float not null default(0)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Causa do erro em NCM - Aliquota_Nacional: ' + E.Message),
              'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('NCM') + ')and name = ' +
              QuotedStr('Aliquota_Importada') + ')');
            add('ALTER TABLE NCM ADD Aliquota_Importada float not null default(0)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Causa do erro em NCM - Aliquota_Importada: ' + E.Message),
              'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('NCM') + ')and name = ' + QuotedStr('Versao') + ')');
            add('ALTER TABLE NCM ADD Versao varchar(30)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox(PChar('Causa do erro em NCM - Versao: ' +
              E.Message), 'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('NCM') + ')and name = ' + QuotedStr('Tabela') + ')');
            add('ALTER TABLE NCM ADD Tabela int not null default(0)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox(PChar('Causa do erro em NCM - Tabela: ' +
              E.Message), 'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

      end;

      if (eservidor = '0') then
      begin

        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('Pedido') + ')and name = ' + QuotedStr('ECF') + ')');
            add('ALTER TABLE Pedido ADD ECF varchar(50)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Causa do erro em Pedido - ECF - Servidor: ' + E.Message),
              'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnectionLocal;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('Pedido') + ')and name = ' + QuotedStr('ECF') + ')');
            add('ALTER TABLE Pedido ADD ECF varchar(50)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Causa do erro em Pedido - ECF - Local: ' + E.Message),
              'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

      end
      else
      begin

        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnectionLocal;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('Pedido') + ')and name = ' + QuotedStr('ECF') + ')');
            add('ALTER TABLE Pedido ADD ECF varchar(50)');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Causa do erro em Pedido - ECF - Local: ' + E.Message),
              'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;
      end;

      if (eservidor = '0') then
      begin
        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('if not exists(select 1 from syscolumns where id = object_id(' +
              QuotedStr('Cliente_Autorizados') + '))');
            add(' CREATE TABLE Cliente_Autorizados ');
            add('	( Codigo int identity primary key, ');
            add('	Codigo_Cliente int, ');
            add('	Nome_Autorizado varchar(100), ');
            add('	CPF_Autorizado varchar(20))');
            ExecSQL;
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox
              (PChar('Causa do erro em criar tabela Cliente_Autorizados Servidor: '
              + E.Message), 'Erro', MB_OK + MB_ICONHAND);
            abort;
          end;
        end;

        if (eservidor = '0') then
        begin
          try
            with qAux, sql do
            begin
              close;
              Connection := dm.ADOConnection1;
              clear;
              add('if exists(select 1 from syscolumns where id = object_id(' +
                QuotedStr('Configuracao_Sistema') + ')and name = ' +
                QuotedStr('Finalidade') + ')');
              add('ALTER TABLE Configuracao_Sistema DROP COLUMN Finalidade');
              ExecSQL;
            end;
          except
            on E: Exception do
            begin
              Application.MessageBox
                (PChar('Causa do erro em Configuracao_Sistema - Ex: ' +
                E.Message), 'Erro', MB_OK + MB_ICONHAND);
              abort;
            end;
          end;
        end;
      end;

    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Observacoes') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Observacoes varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Alterar Observacoes Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Observacoes') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Observacoes varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Alterar Observacoes Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end
    else
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Cliente') + ')and name = ' +
            QuotedStr('Observacoes') + ')');
          add('ALTER TABLE Cliente ALTER COLUMN Observacoes varchar(800)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Cliente Alterar Observacoes Servidor: ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnection1;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Entrada_Produtos') + ')and name = ' +
            QuotedStr('Chave_NFe_Entrada') + ')');
          add('ALTER TABLE Entrada_Produtos ADD Chave_NFe_Entrada varchar(50)');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Entrada_Produtos Alterar Chave_NFe_Entrada Servidor: '
            + E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;
    end;

    if (eservidor = '0') then
    begin
      try
        with qAux, sql do
        begin
          close;
          Connection := dm.ADOConnectionLocal;
          clear;
          add('if not exists(select 1 from syscolumns where id = object_id(' +
            QuotedStr('Endereco_Cliente') + ')and name = ' +
            QuotedStr('Codigo_Cidade') + ')');
          add('ALTER TABLE Endereco_Cliente ADD Codigo_Cidade int');
          ExecSQL;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox
            (PChar('Causa do erro em Endereco_Cliente - Codigo_Cidade : ' +
            E.Message), 'Erro', MB_OK + MB_ICONHAND);
          abort;
        end;
      end;

    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TAtualizacoes.fAtualizaVersao;
var
  qAux: TADOQuery;
  ArqIni: TIniFile;
  Versao: AnsiString;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) +
      'Configura_Estacao.ini');
    ArqIni.WriteString('Configuracao', 'Versao_BD', IntToStr(versao_bd_atual));
  finally
    FreeAndNil(ArqIni);
  end;
  { qAux:= TADOQuery.Create(nil);
    try
    try
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('update Configuracao_Sistema set Versao_BD = :Versao');
    Parameters.ParamByName('Versao').Value:= versao_bd_atual;
    ExecSQL;
    end;
    except on E:Exception do
    Application.MessageBox(PChar('Causa do erro em Atualizar Versao no BD: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    end;
    finally
    FreeAndNil(qAux);
    end; }
end;

procedure TAtualizacoes.Verifica_Atualizacoes;
var
  i: integer;
begin
  { if (versao_bd_atual <> versao_bd_cliente) then
    begin
    for i := versao_bd_cliente to versao_bd_atual do
    begin
    Atualiza(i);
    end;
    end; }

  // Atualizacao1;

  atualizacao2;
  AtualizacaoRelacionamentos;
  //AtualizacaoEnderecos;
  //AtualizacaoLocal;
  //Atualizacao3;
  AtualizacaoEtiqueta;
  AtualizacaoMD5;
  AtualizacaoCriaTabelasHomologacao;

end;

end.
