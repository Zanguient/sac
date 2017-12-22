{*******************************************************}
{* 
{* uTDocumento.pas
{* Delphi Implementation of the Class TDocumento
{* Generated by Enterprise Architect
{* Created on:      16-dez-2014 14:29:25
{* Original author: PROGRAMACAO
{*  
{*******************************************************}

unit Modelo.Entidade.Documento.TDocumento;

interface

type

  TDocumento = class
  private
    FCodigo               : Integer;
    FCPF                  : String;
    FCNPJ                 : String;
    FInscricaoEstadual    : String;
    FRG                   : String;
    FOrgaoExpedidor       : String;
    FDataExpedicao        : TDate;
    FInscricaoMunicipal   : String;
    FClienteCodigo        : Integer;
    FCodigoSuframa        : String;

    procedure SetClienteCodigo(const Value: Integer);
    procedure SetCNPJ(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoSuframa(const Value: String);
    procedure SetCPF(const Value: String);
    procedure SetDataExpedicao(const Value: TDate);
    procedure SetInscricaoEstadual(const Value: String);
    procedure SetInscricaoMunicipal(const Value: String);
    procedure SetOrgaoExpedidor(const Value: String);
    procedure SetRG(const Value: String);

  public

    constructor Create; overload;
    destructor Destroy; override;

    property Codigo               : Integer read FCodigo write SetCodigo;
    property CPF                  : String read FCPF write SetCPF;
    property CNPJ                 : String read FCNPJ write SetCNPJ;
    property InscricaoEstadual    : String read FInscricaoEstadual write SetInscricaoEstadual;
    property RG                   : String read FRG write SetRG;
    property OrgaoExpedidor       : String read FOrgaoExpedidor write SetOrgaoExpedidor;
    property DataExpedicao        : TDate read FDataExpedicao write SetDataExpedicao;
    property InscricaoMunicipal   : String read FInscricaoMunicipal write SetInscricaoMunicipal;
    property ClienteCodigo        : Integer read FClienteCodigo write SetClienteCodigo;
    property CodigoSuframa        : String read FCodigoSuframa write SetCodigoSuframa;

  end;

implementation

{implementation of TDocumento}

constructor TDocumento.Create;
begin
  inherited Create;
end;

destructor TDocumento.Destroy;
begin
  inherited Destroy;
end;

procedure TDocumento.SetClienteCodigo(const Value: Integer);
begin
  FClienteCodigo := Value;
end;

procedure TDocumento.SetCNPJ(const Value: String);
begin
  FCNPJ := Value;
end;

procedure TDocumento.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TDocumento.SetCodigoSuframa(const Value: String);
begin
  FCodigoSuframa := Value;
end;

procedure TDocumento.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TDocumento.SetDataExpedicao(const Value: TDate);
begin
  FDataExpedicao := Value;
end;

procedure TDocumento.SetInscricaoEstadual(const Value: String);
begin
  FInscricaoEstadual := Value;
end;

procedure TDocumento.SetInscricaoMunicipal(const Value: String);
begin
  FInscricaoMunicipal := Value;
end;

procedure TDocumento.SetOrgaoExpedidor(const Value: String);
begin
  FOrgaoExpedidor := Value;
end;

procedure TDocumento.SetRG(const Value: String);
begin
  FRG := Value;
end;

end.