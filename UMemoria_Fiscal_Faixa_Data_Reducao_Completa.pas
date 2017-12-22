unit UMemoria_Fiscal_Faixa_Data_Reducao_Completa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList, ADODB;

type
  TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    EdtInicio: TEdit;
    EdtFim: TEdit;
    RGOpcao: TRadioGroup;
    RGTipo: TRadioGroup;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure RGOpcaoClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
  private
    qAux_Ini, qAux_Fim: TADOQuery;
    crz1, crz2: AnsiString;
    function  ValidaIntervalo: Boolean;
    procedure Assina_Arquivo;
    procedure Gera_Arquivo_AC;
    procedure Pega_Data_Reducao;
    procedure Cria_Pasta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMemoria_Fiscal_Faixa_Data_Reducao_Completa: TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.Assina_Arquivo;
var
  arquivo: TStringList;
  caminho, registroEAD: AnsiString;
begin
  //GeraChave;
  setlength( registroEAD, 256 );
  caminho:= Local_Arquivo(14) + 'Retorno.txt';
  //arquivo:= TStringList.Create;
  //arquivo.LoadFromFile(caminho);
  generateEAD(caminho, cChavePublica, cChavePrivada, registroEAD, 1);
  //arquivo.SaveToFile(caminho);
  //arquivo.Add('EAD'+registroEAD);
  //arquivo.Free;
  Arquivo_Gerado(caminho);
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.BBtnFecharClick(
  Sender: TObject);
begin
  close;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.BBtnSalvarClick(
  Sender: TObject);
var
  cparametro, cDataInicial, cDataFinal, cTipo, aux, cArquivoOrigem: AnsiString;
begin
  if (ValidaIntervalo) then
  begin
    aux := FormatDateTime('DDMMYYYY',Date)+FormatDateTime('HHMMSS',time)+'LMFC';
    cArquivoOrigem:= ExtractFilePath(Application.ExeName) + aux+'.txt';

    if (RGTipo.ItemIndex = 0) then
    begin
      if (RGOpcao.ItemIndex = 0) then
      begin
         if Application.MessageBox('Realiza a leitura da memória fiscal completa por faixa de data?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
         begin
          cDataInicial:= MEdtData_Inicial.Text;
          cDataFinal:= MEdtData_Final.Text;
          cTipo:= 'c';

           //iRetorno:= Bematech_FI_LeituraMemoriaFiscalDataMFD(PAnsiChar(cDataInicial), PAnsiChar(cDataFinal), PAnsiChar(cTipo));
           //Analisa_iRetorno;
           dm.ACBrECF1.PafMF_LMFC_Impressao(StrToDateTime(cDataInicial), StrToDateTime(cDataFinal));
           Processo_Concluido;
         end;
      end
      else
      begin
         if Application.MessageBox('Realiza a leitura da memória fiscal completa por faixa de redução?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
         begin
           cDataInicial:= EdtInicio.Text;
           cDataFinal:= EdtFim.Text;
           cTipo:= 'c';
           //iRetorno:= Bematech_FI_LeituraMemoriaFiscalReducaoMFD(PAnsiChar(cDataInicial), PAnsiChar(cDataFinal), PAnsiChar(cTipo));
           //Analisa_iRetorno;
           DM.ACBrECF1.PafMF_LMFC_Impressao(StrToInt(cDataInicial), StrToInt(cDataFinal));
           Processo_Concluido;
         end;
      end;
    end
    else if (RGTipo.ItemIndex = 1) then
    begin
      if (RGOpcao.ItemIndex = 0) then
      begin
         if Application.MessageBox('Realiza a leitura da memória fiscal simples por faixa de data?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
         begin
           cDataInicial:= MEdtData_Inicial.Text;
           cDataFinal:= MEdtData_Final.Text;
           cTipo:= 'c';

           //iRetorno:= Bematech_FI_LeituraMemoriaFiscalSerialDataMFD((cDataInicial), (cDataFinal), (cTipo));
           //Analisa_iRetorno;
           dm.ACBrECF1.PafMF_LMFS_Impressao(StrToDateTime(cDataInicial), StrToDateTime(cDataFinal));
           //Assina_Arquivo;
           Processo_Concluido;
         end;
      end
      else
      begin
         if Application.MessageBox('Realiza a leitura da memória fiscal simples por faixa de redução?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
         begin
           cDataInicial:= EdtInicio.Text;
           cDataFinal:= EdtFim.Text;
           cTipo:= 'c';

           //iRetorno:= Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD((cDataInicial), (cDataFinal), (cTipo));
           //Analisa_iRetorno;
           dm.ACBrECF1.PafMF_LMFS_Impressao(StrToInt(cDataInicial), StrToInt(cDataFinal));
           //Assina_Arquivo;
           Processo_Concluido;
         end;
      end;
    end;

      //Gera_Arquivo_AC;
    UDeclaracao.Insere_Historico(usuario, 'GEROU RELATÓRIO/ARQUIVO ELETRÔNICO DA MEMÓRIA FISCAL - COMPLETA.', TimeToStr(time), consu, date);
  end;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.Cria_Pasta;
begin
  if not (DirectoryExists(ExtractFilePath(Application.ExeName) + 'Arquivos TXT Espelho')) then
    ForceDirectories(ExtractFilePath(Application.ExeName) + 'Arquivos TXT Espelho');
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.Free;
  FrmMemoria_Fiscal_Faixa_Data_Reducao_Completa:= Nil;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.Gera_Arquivo_AC;
var
  aux, cArquivoOrigem, cTipo, cDataInicial, cDataFinal, cUsuario, dhoje, hhoje, nomearquivo: string;
  iTipoGeracao, iUnicoArquivo: integer;
begin
  //Cria_Pasta;
  aux := FormatDateTime('DDMMYYYY',Date)+FormatDateTime('HHMMSS',time);
  cArquivoOrigem:= ExtractFilePath(Application.ExeName) + 'MFD' + aux+'.txt';
  if (RGOpcao.ItemIndex = 0) then
  begin
    cTipo:= 'D';
    cDataInicial:= MEdtData_Inicial.Text;
    cDataFinal:= MEdtData_Final.Text;
  end
  else
  begin
    crz1:= StringOfChar('0', 4-Length(EdtInicio.Text)) + EdtInicio.Text;
    crz2:= StringOfChar('0', 4-Length(EdtFim.Text)) + EdtFim.Text;
    Pega_Data_Reducao;
    if (qAux_Ini.FieldByName('Data_Movimento').AsString = '') or (qAux_Fim.FieldByName('Data_Movimento').AsString = '') then
    begin
      Application.MessageBox('CRZ não encontrada', 'CRZ', MB_OK+MB_ICONHAND);
      EdtFim.SetFocus;
      abort;
    end;

      cTipo:= 'D';
      cDataInicial:= qAux_Ini.FieldByName('Data_Movimento').AsString;
      cDataFinal:= qAux_Fim.FieldByName('Data_Movimento').AsString;
    end;

  cUsuario:= '1';
  iTipoGeracao:= 0;
  iUnicoArquivo:= 1;
  {iRetorno:= Bematech_FI_ArquivoMFD((''), (cDataInicial), (cDataFinal),
                                (cTipo), (cUsuario), iTipoGeracao, (cChavePublica),
                                (cChavePrivada), iUnicoArquivo);
  Analisa_iRetorno;}
  dm.ACBrECF1.PafMF_LMFC_Cotepe1704(StrToDateTime(cDataInicial), StrToDateTime(cDataFinal), cArquivoOrigem);

  Arquivo_Gerado(Local_Arquivo(14));
  UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DA LEITURA DA MEMÓRIA FISCAL AC 17/04', TimeToStr(time), consu, date);

  {cDataInicial:= FormatDateTime('DDMMYYYY', StrToDateTime(cDataInicial));
  cDataFinal:= FormatDateTime('DDMMYYYY', StrToDateTime(cDataFinal));
  dhoje:= FormatDateTime('YYYYMMDD', date);
  hhoje:= FormatDateTime('YYYYMMDD', date);}

  //nomearquivo:= Local_Arquivo(14) + nu_serie_inteiro + '_' + cDataInicial + '_' + cDataFinal;
  //ShowMessage(nomearquivo);
  //RenameFile(nomearquivo, 'EMF'+n_serie + '_' + dhoje + '_' + hhoje + '.txt');
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.Pega_Data_Reducao;
begin
  qAux_Ini:= TADOQuery.Create(self);
  qAux_Fim:= TADOQuery.Create(self);
  try
    with qAux_Ini, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Data_Movimento, CRZ from R02');
      add('where CRZ = :1');
      Parameters.ParamByName('1').Value:= crz1;
      open;
    end;

    with qAux_Fim, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Data_Movimento, CRZ from R02');
      add('where CRZ = :1');
      Parameters.ParamByName('1').Value:= crz2;
      open;
    end;
  finally

  end;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.RGOpcaoClick(Sender: TObject);
begin
  if (RGOpcao.ItemIndex = 0) then
  begin
    EdtInicio.Enabled:= false;
    EdtFim.Enabled:= false;
    MEdtData_Final.Enabled:= true;
    MEdtData_Inicial.Enabled:= true;
  end
  else
  begin
    EdtInicio.Enabled:= true;
    EdtFim.Enabled:= true;
    MEdtData_Final.Enabled:= false;
    MEdtData_Inicial.Enabled:= false;
  end;
end;

function TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.ValidaIntervalo: Boolean;
begin
  Result:= False;

  if (RGOpcao.ItemIndex = 0) then
    begin
      if (MEdtData_Inicial.Text = '  /  /    ') or (MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem_Falta_Dados;
          MEdtData_Inicial.SetFocus;
          Exit;
        end;
    end;

  if (RGOpcao.ItemIndex = 1) then
    begin
      if (EdtInicio.Text = '') or (EdtFim.Text = '') then
        begin
          Mensagem_Falta_Dados;
          EdtInicio.SetFocus;
          exit
        end;
    end;

 Result:= true;
end;

end.
