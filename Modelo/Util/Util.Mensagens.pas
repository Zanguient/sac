unit Util.Mensagens;

interface

  type
    TMensagens = class
      public
        class procedure MensagemInformacao(Mensagem: String);
        class procedure MensagemWarning(Mensagem: String);
        class procedure MensagemErro(Mensagem: String);
        class procedure MensagemDescontoProduto(Desconto: Double);
        class procedure MensagemDescontoFuncionario(Desconto: Double);
    end;

implementation

uses
  Forms, Windows, System.SysUtils;

{ TMensagens }

class procedure TMensagens.MensagemDescontoFuncionario(Desconto: Double);
begin
  Application.MessageBox(PChar('O desconto de '+ FloatToStr(Desconto) +'% est� acima do limite para este vendedor. '+#10+#13+'Para corrigir, acesse o menu Cadastro > Funcion�rios e altere o percentual de desconto do funcion�rio. Ap�s este procedimento, reinicie o sistema para que seja carregado o novo desconto do funcion�rio.'), 'Desconto n�o permitido', MB_OK+MB_ICONHAND);
end;

class procedure TMensagens.MensagemDescontoProduto(Desconto: Double);
begin
  Application.MessageBox(PChar('O desconto de '+ FloatToStr(Desconto) +'% est� acima do limite para este produto. '+#10+#13+'Para corrigir, acesse o menu Cadastro > Tabela de Pre�o e altere o percentual de desconto do produto.'+#10+#13+'Ap�s isso, escolha o produto novamente atrav�s do pressionamento da tecla F3 para que o sistema leia novamente o novo percentual de desconto.'), 'Desconto n�o permitido', MB_OK+MB_ICONHAND);
end;

class procedure TMensagens.MensagemErro(Mensagem: String);
begin
  Application.MessageBox(PWideChar(Mensagem), 'Aviso. Por favor, leia!', MB_OK+MB_ICONHAND);
end;

class procedure TMensagens.MensagemInformacao(Mensagem: String);
begin
  Application.MessageBox(PWideChar(Mensagem), 'Aviso. Por favor, leia!', MB_OK+MB_ICONQUESTION);
end;

class procedure TMensagens.MensagemWarning(Mensagem: String);
begin
  Application.MessageBox(PWideChar(Mensagem), 'Aviso. Por favor, leia!', MB_OK+MB_ICONEXCLAMATION);
end;

end.
