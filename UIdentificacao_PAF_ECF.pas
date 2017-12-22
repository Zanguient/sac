unit UIdentificacao_PAF_ECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, ACBrPAFClass;

type
  TFrmIdentificacao_PAF_ECF = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    Util: TUtil;
    nome_arquivo, cod, ecf: string;
    arq1, arq2: string;
    aux2: AnsiString;
    procedure Captura_ECFS;
  public
    ativo: boolean;
  end;

var
  FrmIdentificacao_PAF_ECF: TFrmIdentificacao_PAF_ECF;
implementation

uses UDM, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmIdentificacao_PAF_ECF.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmIdentificacao_PAF_ECF.Captura_ECFS;
begin
  if ecf1 <> '' then
    aux2:= aux2 + ecf1 + #13+#10;
  if ecf2 <> '' then
    aux2:= aux2 + ecf2 + #13+#10;
  if ecf3 <> '' then
    aux2:= aux2 + ecf3 + #13+#10;
  if ecf4 <> '' then
    aux2:= aux2 + ecf4 + #13+#10;
  if ecf5 <> '' then
    aux2:= aux2 + ecf5 + #13+#10;
  if ecf6 <> '' then
    aux2:= aux2 + ecf6 + #13+#10;
  if ecf7 <> '' then
    aux2:= aux2 + ecf7 + #13+#10;
  if ecf8 <> '' then
    aux2:= aux2 + ecf8 + #13+#10;
  if ecf9 <> '' then
    aux2:= aux2 + ecf9 + #13+#10;
  if ecf10 <> '' then
    aux2:= aux2 + ecf10 + #13+#10;
  if ecf11 <> '' then
    aux2:= aux2 + ecf11 + #13+#10;
  if ecf12 <> '' then
    aux2:= aux2 + ecf12 + #13+#10;
  if ecf13 <> '' then
    aux2:= aux2 + ecf13 + #13+#10;
  if ecf14 <> '' then
    aux2:= aux2 + ecf14 + #13+#10;
  if ecf15 <> '' then
    aux2:= aux2 + ecf15 + #13+#10;
end;

procedure TFrmIdentificacao_PAF_ECF.BBtnSalvarClick(Sender: TObject);
var
   iPosicao, ACK, ST1, ST2, ST3, i, i2: integer;
   flag: string;
   cindice, cdescricao, aux, aux3, aux4, aux5, aux6: AnsiString;
   posicao, nome_arquivo, md5_arquivo, ecf: AnsiString;
   IdentPaf: TACBrECFIdentificacaoPAF;
   Arquivo, Arquivo2: TStringList;
begin
  Busca_Dados_SoftwareHouse;
  Busca_ECFS;
  CarregaMD5_Principal;
  Busca_Arquivos_PAF;
  Captura_ECFS;
  cindice:= '03';
  cdescricao:= 'IDENT. PAF-ECF';
  //iRetorno:= Bematech_FI_NomeiaRelatorioGerencialMFD(PAnsiChar(cindice), PAnsiChar(cdescricao));
  //Analisa_iRetorno;

  //iRetorno:= Bematech_FI_AbreRelatorioGerencialMFD(PAnsiChar(cIndice));
  //Analisa_iRetorno;

  IdentPaf:= TACBrECFIdentificacaoPAF.Create;
  Arquivo := TStringList.Create;
  Arquivo2 := TStringList.Create;
  Arquivo.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'ArqMD5.txt');
  Arquivo2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Config.txt');

  try
    IdentPaf.NumeroLaudo:= n_laudo;
    //IdentPaf.VersaoER:=

    IdentPaf.Empresa.RazaoSocial:= deno_des;
    IdentPaf.Empresa.CNPJ:= cnpj_des;
    IdentPaf.Empresa.Endereco:= end_des;
    IdentPaf.Empresa.Cidade:= 'JATAÍ';
    IdentPaf.Empresa.Uf:= 'GO';
    IdentPaf.Empresa.Cep:= '75800-089';
    IdentPaf.Empresa.Telefone:= tel_des;
    IdentPaf.Empresa.Contato:= cont_des;
    IdentPaf.Empresa.Email:= 'contato.favsistemas@gmail.com';

    IdentPaf.Paf.Nome:= nome_paf;
    IdentPaf.Paf.Versao:= versao_paf;
    IdentPaf.Paf.PrincipalExe.Nome:= nome_exe;
    IdentPaf.Paf.PrincipalExe.MD5:= pMD5_Arquivos;
    IdentPaf.VersaoER:= versao_er_paf;

    IdentPaf.ArquivoListaAutenticados.Nome:= ExtractFilePath(Application.ExeName) + 'ArqMD5.txt';
    IdentPaf.ArquivoListaAutenticados.MD5:= pMD5_Arquivos;

    //pega os arquivos e os md5 de cada um
    for i := 0 to Arquivo.count - 1 do
    begin
      aux:= Arquivo[i];
      for i2 := 0 to Length(aux) do
      begin
        if (aux[i2] = '-') then
        begin
          md5_arquivo:= Copy(aux, i2+1, 33);
          break;
        end
        else
          nome_arquivo:= nome_arquivo + aux[i2];
      end;

      with IdentPaf.OutrosArquivos.New do
      begin
        Nome:= nome_arquivo;
        MD5:= md5_arquivo;
      end;

      md5_arquivo:= '';
      nome_arquivo:= '';
    end;

    //pega os ecf's autorizados

    IdentPaf.ECFsAutorizados.clear;
    for i := 0 to Arquivo2.count - 1 do
    begin
      aux:= Arquivo2[i];
      for i2 := 0 to Length(aux) do
      begin
        aux2:= copy(aux, 1, 3);
        if (aux2 = 'ECF') then
        begin
          ecf:= Copy(aux, 8, 21);
          ecf:= Criptografa(ecf, 15);

          with IdentPaf.ECFsAutorizados.New do
          begin
            NumeroSerie:= ecf;
          end;
          ecf:= '';
          break;
        end
        else
          break;
      end;

    end;

    DM.ACBrECF1.PafMF_RelIdentificacaoPafECF(IdentPaf, 0);
  finally
    IdentPaf.Free;
    Arquivo.Free;
    Arquivo2.Free;
  end;

  {aux:= PAnsiChar(posicao) + #13+#10 +
  'Laudo: ' + PAnsiChar(n_laudo) + #13+#10 + #13+#10 +
  'Identificação da Empresa Desenvolvedora' + #13+#10 + #13+#10 +
  'CNPJ: ' + PAnsiChar(cnpj_des) + #13+#10 +
  'Razão Social: ' + PAnsiChar(deno_des) + #13+#10 +
  'Endereço: ' + PAnsiChar(end_des) + #13+#10 +
  'Telefone: ' + PAnsiChar(tel_des) + #13+#10 +
  'Contato: ' + PAnsiChar(cont_des) + #13+#10 + #13+#10 +
  'Identificação do PAF-ECF' + #13+#10 + #13+#10 +
  'Nome Comercial: ' + PAnsiChar(nome_paf) + #13+#10 +
  'Versão: ' + PAnsiChar(versao_paf) + #13+#10;

  aux3:= 'Principal Arquivo Executável: ' + PAnsiChar(nome_exe) + #13+#10 +
  'Código de Autenticação MD5: ' + PAnsiChar(pMD5_Arquivos) +#13+#10 +#13+#10;

  aux4:= 'Arquivos PAF-ECF: ' + #13+#10 + PAnsiChar(arquivos_paf_aux1);

  aux5:= PAnsiChar(arquivos_paf_aux2);

  aux6:= PAnsiChar(arquivos_paf_aux3) + #13+#10;

  aux2:= 'ECFs Autorizados: ' + #13+#10 +#13+#10 + PAnsiChar(aux2);



  iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
  Analisa_iRetorno;

  iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux3);
  Analisa_iRetorno;

  iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux4);
  Analisa_iRetorno;

  iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux5);
  Analisa_iRetorno;

  iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux6);
  Analisa_iRetorno;

  iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux2);
  Analisa_iRetorno;

  iRetorno:= Bematech_FI_FechaRelatorioGerencial;
  Analisa_iRetorno;}
  BBtnSalvar.Enabled:= false;
  //if (sem_rede = false) then
  //begin
    den_op:= 'RG';
    Registra_R06;
  //end;
  Processo_Concluido;
  UDeclaracao.Insere_Historico(usuario, 'GEROU RELATÓRIO DE IDENTIFICAÇÃO DO PAF-ECF.', TimeToStr(time), consu, date);
  Util.Desabilita_Campos(FrmIdentificacao_PAF_ECF);
end;

procedure TFrmIdentificacao_PAF_ECF.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmIdentificacao_PAF_ECF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmIdentificacao_PAF_ECF.Free;
  FrmIdentificacao_PAF_ECF:= Nil;
end;

procedure TFrmIdentificacao_PAF_ECF.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmIdentificacao_PAF_ECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    BBtnSalvar.Enabled:= true;

  if (key = vk_escape) then
    close;
end;

procedure TFrmIdentificacao_PAF_ECF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
