unit Modelo.DAO.NaturezaOperacao.TNaturezaOperacaoDAO;

interface
uses
  ADODB, Modelo.Entidade.NaturezaOperacao.TNaturezaOperacao;
  type
    TNaturezaOperacaoDAO = class
        private
          FADOConnection : TADOConnection;
          function salvar(NaturezaOperacao : TNaturezaOperacao): Boolean;
          function editar(NaturezaOperacao : TNaturezaOperacao): Boolean;
        public

          constructor Create(connection : TADOConnection); overload;

          destructor Destroy; override;

          function gravar(NaturezaOperacao : TNaturezaOperacao): Boolean;
    end;

implementation

{ TNaturezaOperacaoDAO }

uses
  SysUtils, Util.TLog, Util.Mensagens;

constructor TNaturezaOperacaoDAO.Create(connection: TADOConnection);
begin

end;

destructor TNaturezaOperacaoDAO.Destroy;
begin

  inherited;
end;
function TNaturezaOperacaoDAO.editar(NaturezaOperacao: TNaturezaOperacao): Boolean;
begin
  try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - editar - '+E.Message);
      TLog.Error(Self.ClassName+' - editar - '+E.Message);
    end;

  end;
end;

function TNaturezaOperacaoDAO.gravar(NaturezaOperacao: TNaturezaOperacao): Boolean;
begin
 try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - gravar - '+E.Message);
      TLog.Error(Self.ClassName+' - gravar - '+E.Message);
    end;

  end;
end;

function TNaturezaOperacaoDAO.salvar(NaturezaOperacao: TNaturezaOperacao): Boolean;
begin
 try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - salvar - '+E.Message);
      TLog.Error(Self.ClassName+' - salvar - '+E.Message);
    end;

  end;
end;


end.
