unit Util.Configs;

interface

uses
  StdCtrls;
  type
    TConfigs = class
      class function FormataCPF(CPF: AnsiString): AnsiString;
      class function FormataCNPJ(CNPJ: AnsiString): AnsiString;
      class function Calcula_Valor(Valor: AnsiString): double;
      class function VerificaSeTextoESomenteNumero(Texto: AnsiString): Boolean;
      class function VerificaSeExisteCaracter(TextoParaEncontrar, Caracter: AnsiString): Boolean;
      class procedure VerificaCampoEmBranco(Edit: TEdit);
      class function RetornaPercentual(TotalPedido, TotalProduto: double): double;
    end;

const
MensagemCampoNulo = 'Este campo não pode estar em branco. Observe o campo em que o cursor estará piscando.';

implementation

uses
  SysUtils, Util.Mensagens;

{ TConfigs }

class function TConfigs.Calcula_Valor(Valor: AnsiString): double;
var
  i: Integer;
  val, val2: AnsiString;
begin
  for i := 1 to Length(Valor) do
  begin
    val := val + Valor[i];

    if (val <> '-') then
      Result:= StrToFloat(val);
    if (Valor[i] = ',') or (Valor[i] = '') then
    begin
      val2 := val + Valor[i + 1];
      val2 := val2 + Valor[i + 2];
      //Result := StrToFloat(val2);
      //val2 := FormatFloat('#0.0,00', StrToFloat(val2));
      //val2 := StringReplace(val2, ThousandSeparator, '', [rfReplaceAll]);
      Result := StrToFloat(val2);
      break;
    end;
  end;
end;

class function TConfigs.FormataCNPJ(CNPJ: AnsiString): AnsiString;
var
  Aux1, Aux2, Aux3, Aux4, Aux5: AnsiString;
begin
  Aux1:= Copy(CNPJ, 1, 2);
  Aux2:= Copy(CNPJ, 3, 3);
  Aux3:= Copy(CNPJ, 6, 3);
  Aux4:= Copy(CNPJ, 9, 4);
  Aux5:= Copy(CNPJ, 13, 2);

  Result:= Aux1 + '.' + Aux2 + '.' + Aux3 + '/' + Aux4 + '-' + Aux5;
end;

class function TConfigs.FormataCPF(CPF: AnsiString): AnsiString;
var
  Aux1, Aux2, Aux3, Aux4: AnsiString;
begin
  Aux1:= Copy(CPF, 1, 3);
  Aux2:= Copy(CPF, 4, 3);
  Aux3:= Copy(CPF, 7, 3);
  Aux4:= Copy(CPF, 10, 2);

  Result:= Aux1 + '.' + Aux2 + '.' + Aux3 + '-' + Aux4;
end;

class function TConfigs.RetornaPercentual(TotalPedido,
  TotalProduto: double): double;
var
  DesPAux, DesP: double;
begin
  DesPAux:= TotalPedido - TotalProduto;
  DesP:= ( DesPAux / TotalPedido );
  DesP:= DesP * 100;
  DesP:= Calcula_Valor(FloatToStr(DesP));

  if (DesP > 0) then
    DesP:= DesP * -1
  else
    DesP:= Abs(DesP);

  Result:= DesP;
end;

class procedure TConfigs.VerificaCampoEmBranco(Edit: TEdit);
begin
  if (Edit.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    Edit.SetFocus;
    abort;
  end;
end;

class function TConfigs.VerificaSeExisteCaracter(TextoParaEncontrar, Caracter: AnsiString): Boolean;
var
  i :integer;
begin
  for i := 1 to length(trim(TextoParaEncontrar)) do
  begin
    if (TextoParaEncontrar[i] = Caracter) then
    begin
      Result := true;
      break;
    end
    else
    begin
      Result := false;
    end;
  end;
end;

class function TConfigs.VerificaSeTextoESomenteNumero(Texto: AnsiString): Boolean;
var
  i :integer;
  somenteNumero : Boolean;
begin
  somenteNumero := false;
  for i := 1 to length(trim(Texto)) do
  begin
    if (Texto[i] in ['0'..'9']) then
    begin
      somenteNumero := true;
    end
    else
    begin
      somenteNumero := false;
      break;
    end;
  end;
  Result:= somenteNumero;
end;

end.
