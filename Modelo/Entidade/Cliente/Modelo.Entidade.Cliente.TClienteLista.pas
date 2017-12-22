unit Modelo.Entidade.Cliente.TClienteLista;

interface

uses
  System.Generics.Collections, Modelo.Entidade.Cliente.TCliente;
  type
    TClienteLista = class
      private
        FClientes : TObjectList<TClienteEntidade>;
      public

        constructor Create;

        destructor Destroy;override;

        procedure addCliente(cliente : TClienteEntidade);

        function Clientes: TObjectList<TClienteEntidade>;

        function remover(index : Integer):Boolean;overload;

        function remover(cliente : TClienteEntidade):Boolean;overload;


    end;

implementation

{ TClienteLista }

uses
  SysUtils, Util.TLog, Util.Mensagens;

constructor TClienteLista.Create;
begin
  FClientes := TObjectList<TClienteEntidade>.Create;
end;

destructor TClienteLista.Destroy;
begin
  FreeAndNil(FClientes);
  inherited;
end;

function TClienteLista.remover(cliente: TClienteEntidade): Boolean;
begin
  try
    Result := False;
    if Assigned(cliente) then begin
      Result := FClientes.Remove(cliente) > 0;
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - remover - '+E.Message);
      TLog.Error(Self.ClassName+' - remover - '+E.Message);
    end;
  end;
end;

function TClienteLista.remover(index: Integer): Boolean;
begin
  try
    Result := False;
    FClientes.Delete(index);
    Result := True;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - remover - '+E.Message);
      TLog.Error(Self.ClassName+' - remover - '+E.Message);
    end;
  end;
end;

procedure TClienteLista.addCliente(cliente: TClienteEntidade);
begin
  FClientes.Add(cliente);
end;

function TClienteLista.Clientes: TObjectList<TClienteEntidade>;
begin
  Result := FClientes;
end;

end.
