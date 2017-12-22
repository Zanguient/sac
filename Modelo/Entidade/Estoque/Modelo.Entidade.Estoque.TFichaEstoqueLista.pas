unit Modelo.Entidade.Estoque.TFichaEstoqueLista;

interface
  uses
    System.Generics.Collections, Modelo.Entidade.Estoque.TFichaEstoque;
  type
    TFichaEstoqueLista = class
      private
        FFichasEstoques : TObjectList<TFichaEstoque>;
      public
        constructor Create;

        destructor Destroy;override;

        procedure addFichaEstoque(fichaEstoque : TFichaEstoque);

        function FichasEstoques: TObjectList<TFichaEstoque>;

        function remover(index : Integer):Boolean;overload;

        function remover(fichaEstoque : TFichaEstoque):Boolean;overload;

    end;

implementation

{ TFichaEstoqueLista }

uses
 System.SysUtils, Util.TLog, Util.Mensagens;


constructor TFichaEstoqueLista.Create;
begin
  FFichasEstoques := TObjectList<TFichaEstoque>.Create;
end;

destructor TFichaEstoqueLista.Destroy;
begin
  FreeAndNil(FFichasEstoques);
  inherited;
end;

procedure TFichaEstoqueLista.addFichaEstoque(fichaEstoque: TFichaEstoque);
begin
  FFichasEstoques.Add(fichaEstoque);
end;

function TFichaEstoqueLista.FichasEstoques: TObjectList<TFichaEstoque>;
begin
  Result := FFichasEstoques;
end;

function TFichaEstoqueLista.remover(fichaEstoque: TFichaEstoque): Boolean;
begin
  try
    Result := False;
    if Assigned(fichaEstoque) then begin
      Result := (FFichasEstoques.Remove(fichaEstoque) > 0);
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - remover - '+E.Message);
      TLog.Error(Self.ClassName+' - remover - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueLista.remover(index: Integer): Boolean;
begin
  try
    Result := False;
    FFichasEstoques.Delete(index);
    Result := True;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - remover - '+E.Message);
      TLog.Error(Self.ClassName+' - remover - '+E.Message);
    end;
  end;
end;

end.
