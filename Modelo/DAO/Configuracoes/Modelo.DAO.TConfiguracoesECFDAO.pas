unit Modelo.DAO.TConfiguracoesECFDAO;

interface

uses
  Modelo.Entidade.TConfiguracoesECFEntidade, ADODB, System.Generics.Collections;
  type
    TConfiguracoesECFDAO = class
      private
        Conexao: TADOConnection;
      public
        function gravaConfiguracao(Conf: TConfiguracoesECFEntidade): boolean;
        function retornaConfiguracaoECF(CodigoEmpresa, CodigoConfig: integer): TObjectList< TConfiguracoesECFEntidade>; overload;
        function retornaConfiguracaoECF(N_Fabricacao: AnsiString): TList<String>; overload;
        function verificaECFConfigurado(N_Fabricacao: AnsiString): boolean;
        constructor Create(var Conexao: TADOConnection);
    end;

implementation

uses
  UDM, SysUtils, TLoggerUnit, Util.TLog, Util.Mensagens;

{ TConfiguracoesECFDAO }

constructor TConfiguracoesECFDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao := Conexao;
  //inherited;
end;

function TConfiguracoesECFDAO.gravaConfiguracao(
  Conf: TConfiguracoesECFEntidade): boolean;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection:= Conexao;
        Clear;
        add('INSERT INTO Configuracao_ECF ');
        add('     (Codigo_Empresa	,N_Fabricacao, GT, Porta, Marca, CIECF, MD5, Data_Ativacao, Modelo_ECF, N_Caixa)');
        add('     VALUES ');
        add('     ( :Codigo_Empresa, :N_Fabricacao, :GT, :Porta, :Marca, :CIECF, :MD5, :Data_Ativacao, :Modelo_ECF, :N_Caixa )');
        Parameters.ParamByName('Codigo_Empresa').Value:= Conf.CodigoEmpresa;
        Parameters.ParamByName('N_Fabricacao').Value:= Conf.NFabricacao;
        Parameters.ParamByName('GT').Value:= Conf.GT;
        Parameters.ParamByName('Porta').Value:= Conf.Porta;
        Parameters.ParamByName('Marca').Value:= Conf.Marca;
        Parameters.ParamByName('CIECF').Value:= Conf.CIECF;
        Parameters.ParamByName('MD5').Value:= Conf.MD5;
        Parameters.ParamByName('Data_Ativacao').Value:= Conf.DataAtivacao;
        Parameters.ParamByName('Modelo_ECF').Value:= Conf.ModeloECF;
        Parameters.ParamByName('N_Caixa').Value:= Conf.NCaixa;
        ExecSQL;
      end;
    finally
      FreeAndNil(qAux);
    end;
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao gravar configuração de ECF: '+e.Message);
    TLog.Error('Erro ao gravar configuração de ECF: '+e.Message );
  end;

  end;
end;

function TConfiguracoesECFDAO.retornaConfiguracaoECF(
  N_Fabricacao: AnsiString): TList<String>;
var
  qAux: TADOQuery;
  Config: TList<String>;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select * from Configuracao_ECF where N_Fabricacao = :N_Fabricacao');
      Parameters.ParamByName('N_Fabricacao').Value:= N_Fabricacao;
      open;
    end;

    Config.Add(qAux.FieldByName('Codigo').AsString);
    Config.Add(qAux.FieldByName('Codigo_Empresa').AsString);
    Config.Add(qAux.FieldByName('N_Fabricacao').AsString);
    Config.Add(qAux.FieldByName('GT').AsString);
    Config.Add(qAux.FieldByName('Porta').AsString);
    Config.Add(qAux.FieldByName('Marca').AsString);
    Config.Add(qAux.FieldByName('CIECF').AsString);
    Config.Add(qAux.FieldByName('MD5').AsString);
    Config.Add(qAux.FieldByName('Data_Ativacao').AsString);
    Config.Add(qAux.FieldByName('Modelo_ECF').AsString);
    Config.Add(qAux.FieldByName('N_Caixa').AsString);

    Result:= Config;

  except on E: Exception do
  begin
    TMensagens.MensagemErro('Erro ao Carregar Configurações de ECF: '+e.Message);
    TLog.Error('Erro ao Carregar Configurações de ECF: '+e.Message );
  end;
  end;
end;

function TConfiguracoesECFDAO.verificaECFConfigurado(
  N_Fabricacao: AnsiString): boolean;
var
  qAux: TADOQuery;
  Config: TList<String>;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select * from Configuracao_ECF where N_Fabricacao = :N_Fabricacao');
      Parameters.ParamByName('N_Fabricacao').Value:= N_Fabricacao;
      open;

    end;

    if (qAux.IsEmpty = false) then
      Result:= True
    else
      Result:= False;

  except on E: Exception do
  begin
    TMensagens.MensagemErro('Erro ao Verificar Configurações de ECF: '+e.Message );
    TLog.Error('Erro ao Verificar Configurações de ECF: '+e.Message );
  end;
  end;
end;

function TConfiguracoesECFDAO.retornaConfiguracaoECF(CodigoEmpresa,
  CodigoConfig: integer): TObjectList< TConfiguracoesECFEntidade>;
var
  qAux: TADOQuery;
  Config: TConfiguracoesECFEntidade;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select * from Configuracao_ECF where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Config.Codigo;
      open;
    end;

    Config:= TConfiguracoesECFEntidade.Create;
    if (qAux.IsEmpty = false) then
    begin
      Config.Codigo:= qAux.FieldByName('Codigo').AsInteger;
      Config.CodigoEmpresa:= qAux.FieldByName('Codigo_Empresa').AsInteger;
      Config.NFabricacao:= qAux.FieldByName('N_Fabricacao').AsString;
      Config.GT:= qAux.FieldByName('GT').AsFloat;
      Config.Porta:= qAux.FieldByName('Porta').AsString;
      Config.Marca:= qAux.FieldByName('Marca').AsString;
      Config.CIECF:= qAux.FieldByName('CIECF').AsString;
      Config.MD5:= qAux.FieldByName('MD5').AsString;
      Config.DataAtivacao:= qAux.FieldByName('Data_Ativacao').AsDateTime;
      Config.ModeloECF:= qAux.FieldByName('Modelo_ECF').AsString;
      Config.NCaixa:= qAux.FieldByName('N_Caixa').AsString;
      Result.Add(Config);
    end;

  except on E: Exception do
  begin
   TMensagens.MensagemErro('Erro ao Carregar Configurações de ECF: '+e.Message);
    TLog.Error('Erro ao Carregar Configurações de ECF: '+e.Message );
  end;
  end;
end;

end.
