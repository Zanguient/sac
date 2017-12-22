unit Controle.DadosConexaoControle;

interface

uses
  Conexao.TDadosConexao;
type
  TDadosConexaoControle = class
    private
      FDadosConexao : TDadosConexao;

    public
      function retornaDadosConexao: TDadosConexao;
      procedure novoDadoConexao;

  end;
implementation

uses
  IniFiles, SysUtils, Forms, Util.TLog;

{ TDadosConexaoControle }

procedure TDadosConexaoControle.novoDadoConexao;
begin
  try
    if Assigned(FDadosConexao) then
      FreeAndNil(FDadosConexao);
    FDadosConexao := TDadosConexao.Create;

  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - NovoDadoConexao - '+E.Message);

  end;
end;

function TDadosConexaoControle.retornaDadosConexao: TDadosConexao;
var
  ArqIni: TIniFile;
begin
  novoDadoConexao;
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)
      + 'Conexao.ini');
  FDadosConexao.Usuario := ArqIni.ReadString('conecta', 'usuario', '');
  FDadosConexao.Banco := ArqIni.ReadString('conecta', 'base', '');
  FDadosConexao.Servidor := ArqIni.ReadString('conecta', 'servidor', '');
  FDadosConexao.CaminhoServidor := ArqIni.ReadString('conecta', 'caminho', '');
  result := FDadosConexao;
end;

end.
