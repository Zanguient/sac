{*******************************************************}
{* 
{* uTEndereco.pas
{* Delphi Implementation of the Class TEndereco
{* Generated by Enterprise Architect
{* Created on:      16-dez-2014 14:29:30
{* Original author: PROGRAMACAO
{*  
{*******************************************************}

unit Modelo.Entidade.Endereco.TEndereco;

interface

uses
  Modelo.Entidade.Endereco.TCidade;

type
  TEndereco = class
  private
    FCodigo           : Integer;
    FClienteCodigo    : Integer;
    FLogradouro       : String;
    FNumero           : String;
    FTipoLogradouro   : String;
    FCEP              : String;
    FPontoReferencia  : String;
    FComplemento      : String;
    FSetor            : String;
    FEmail            : String;
    FSite             : String;
    FCidade           : TCidade;
    FPadrao           : String;

    procedure SetCEP(const Value: String);
    procedure SetCidade(const Value: TCidade);
    procedure SetClienteCodigo(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetComplemento(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetPadrao(const Value: String);
    procedure SetPontoReferencia(const Value: String);
    procedure SetSetor(const Value: String);
    procedure SetSite(const Value: String);
    procedure SetTipoLogradouro(const Value: String);

  public

    constructor Create; overload;
    destructor Destroy; override;
    property Codigo           : Integer read FCodigo write SetCodigo;
    property ClienteCodigo    : Integer read FClienteCodigo write SetClienteCodigo;
    property Logradouro       : String read FLogradouro write SetLogradouro;
    property Numero           : String read FNumero write SetNumero;
    property TipoLogradouro   : String read FTipoLogradouro write SetTipoLogradouro;
    property CEP              : String read FCEP write SetCEP;
    property PontoReferencia  : String read FPontoReferencia write SetPontoReferencia;
    property Complemento      : String read FComplemento write SetComplemento;
    property Setor            : String read FSetor write SetSetor;
    property Email            : String read FEmail write SetEmail;
    property Site             : String read FSite write SetSite;
    property Cidade           : TCidade read FCidade write SetCidade;
    property Padrao           : String read FPadrao write SetPadrao;

  end;

implementation

uses
  SysUtils;
{implementation of TEndereco}

constructor TEndereco.Create;
begin
  inherited Create;
  FCidade := TCidade.Create;
end;

destructor TEndereco.Destroy;
begin
  FreeAndNil(FCidade);
  inherited Destroy;
end;

procedure TEndereco.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TEndereco.SetCidade(const Value: TCidade);
begin
  FCidade := Value;
end;

procedure TEndereco.SetClienteCodigo(const Value: Integer);
begin
  FClienteCodigo := Value;
end;

procedure TEndereco.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEndereco.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TEndereco.SetPadrao(const Value: String);
begin
  FPadrao := Value;
end;

procedure TEndereco.SetPontoReferencia(const Value: String);
begin
  FPontoReferencia := Value;
end;

procedure TEndereco.SetSetor(const Value: String);
begin
  FSetor := Value;
end;

procedure TEndereco.SetSite(const Value: String);
begin
  FSite := Value;
end;

procedure TEndereco.SetTipoLogradouro(const Value: String);
begin
  FTipoLogradouro := Value;
end;

end.