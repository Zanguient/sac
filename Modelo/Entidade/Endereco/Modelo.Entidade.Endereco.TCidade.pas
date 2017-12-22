unit Modelo.Entidade.Endereco.TCidade;

interface

uses
   Modelo.Entidade.Endereco.TUF;
  type

    TCidade = class
      private
        FUF : TUF;
      public
        constructor Create;
        destructor Destroy;override;

    end;

implementation

uses
 SysUtils;

{ TCidade }

constructor TCidade.Create;
begin
  FUF := TUF.Create;
end;

destructor TCidade.Destroy;
begin
  FreeAndNil(FUF);
  inherited;
end;

end.
