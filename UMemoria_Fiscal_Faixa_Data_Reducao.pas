unit UMemoria_Fiscal_Faixa_Data_Reducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList;

type
  TFrmMemoria_Fiscal_Faixa_Data_Reducao = class(TForm)
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
    RGModo: TRadioGroup;
    RGTipo: TRadioGroup;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure RGOpcaoClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
  private
    function  ValidaIntervalo: Boolean;
    procedure Assina_Arquivo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMemoria_Fiscal_Faixa_Data_Reducao: TFrmMemoria_Fiscal_Faixa_Data_Reducao;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao.Assina_Arquivo;
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

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao.BBtnFecharClick(
  Sender: TObject);
begin
  close;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao.BBtnSalvarClick(
  Sender: TObject);
var
  cparametro, cDataInicial, cDataFinal, cTipo, aux, cArquivoOrigem: AnsiString;
begin
  if (RGTipo.ItemIndex = 1) then
  begin
    if (ValidaIntervalo) then
    begin
      aux := FormatDateTime('DDMMYYYY',Date)+FormatDateTime('HHMMSS',time)+'LMFS';
      cArquivoOrigem:= ExtractFilePath(Application.ExeName) + aux+'.txt';
      if (RGModo.ItemIndex = 0) then
      begin
        if (RGOpcao.ItemIndex = 0) then
        begin
           if Application.MessageBox('Realiza a leitura da memória fiscal simples por faixa de data?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
           begin
             cDataInicial:= MEdtData_Inicial.Text;
             cDataFinal:= MEdtData_Final.Text;
             cTipo:= 's';

             //iRetorno:= Bematech_FI_LeituraMemoriaFiscalDataMFD(PAnsiChar(cDataInicial), PAnsiChar(cDataFinal), PAnsiChar(cTipo));
             //Analisa_iRetorno;
             dm.ACBrECF1.PafMF_LMFS_Impressao(StrToDateTime(cDataInicial), StrToDateTime(cDataFinal));
             Processo_Concluido;
           end;
        end
        else
        begin
           if Application.MessageBox('Realiza a leitura da memória fiscal simples por faixa de redução?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
           begin
             cDataInicial:= EdtInicio.Text;
             cDataFinal:= EdtFim.Text;
             cTipo:= 's';
             //iRetorno:= Bematech_FI_LeituraMemoriaFiscalReducaoMFD(PAnsiChar(cDataInicial), PAnsiChar(cDataFinal), PAnsiChar(cTipo));
             //Analisa_iRetorno;
             dm.ACBrECF1.PafMF_LMFS_Impressao(StrToInt(cDataInicial), StrToInt(cDataFinal));
             Processo_Concluido;
           end;
        end;
      end
      else
      begin
        if (RGOpcao.ItemIndex = 0) then
        begin
           if Application.MessageBox('Realiza a leitura da memória fiscal simples por faixa de data?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
           begin
             cDataInicial:= MEdtData_Inicial.Text;
             cDataFinal:= MEdtData_Final.Text;
             cTipo:= 's';

             //iRetorno:= Bematech_FI_LeituraMemoriaFiscalSerialDataMFD((cDataInicial), (cDataFinal), (cTipo));
             //Analisa_iRetorno;
             dm.ACBrECF1.PafMF_LMFS_Espelho( StrToDateTime(cDataInicial), StrToDateTime(cDataFinal), cArquivoOrigem );
             Assina_Arquivo;
             Processo_Concluido;
           end;
        end
        else
        begin
           if Application.MessageBox('Realiza a leitura da memória fiscal simples por faixa de redução?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
           begin
             cDataInicial:= EdtInicio.Text;
             cDataFinal:= EdtFim.Text;
             cTipo:= 's';

             //iRetorno:= Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD(PAnsiChar(cDataInicial), PAnsiChar(cDataFinal), PAnsiChar(cTipo));
             //Analisa_iRetorno;
             dm.ACBrECF1.PafMF_LMFS_Espelho(StrToInt(cDataInicial), StrToInt(cDataFinal), cArquivoOrigem);
             Assina_Arquivo;
             Processo_Concluido;
           end;
        end;
      end;
      UDeclaracao.Insere_Historico(usuario, 'GEROU RELATÓRIO/ARQUIVO ELETRÔNICO DA MEMÓRIA FISCAL - SIMPLES.', TimeToStr(time), consu, date);
    end;
  end
  else
  begin
    if (ValidaIntervalo) then
    begin
      aux := FormatDateTime('DDMMYYYY',Date)+FormatDateTime('HHMMSS',time)+'LMFC';
      cArquivoOrigem:= ExtractFilePath(Application.ExeName) + aux+'.txt';
      if (RGModo.ItemIndex = 0) then
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
      else if (RGModo.ItemIndex = 1) then
      begin
        if (RGOpcao.ItemIndex = 0) then
        begin
           if Application.MessageBox('Realiza a leitura da memória fiscal completa por faixa de data?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
           begin
             cDataInicial:= MEdtData_Inicial.Text;
             cDataFinal:= MEdtData_Final.Text;
             cTipo:= 'c';

             //iRetorno:= Bematech_FI_LeituraMemoriaFiscalSerialDataMFD((cDataInicial), (cDataFinal), (cTipo));
             //Analisa_iRetorno;
             dm.ACBrECF1.PafMF_LMFC_Espelho(StrToDateTime(cDataInicial), StrToDateTime(cDataFinal), cArquivoOrigem);
             Assina_Arquivo;
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

             //iRetorno:= Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD((cDataInicial), (cDataFinal), (cTipo));
             //Analisa_iRetorno;
             dm.ACBrECF1.PafMF_LMFC_Espelho(StrToInt(cDataInicial), StrToInt(cDataFinal), cArquivoOrigem);
             Assina_Arquivo;
             Processo_Concluido;
           end;
        end;
      end
      else if (RGModo.ItemIndex = 2) then
      begin
       // Gera_Arquivo_AC;
      end;
      UDeclaracao.Insere_Historico(usuario, 'GEROU RELATÓRIO/ARQUIVO ELETRÔNICO DA MEMÓRIA FISCAL.', TimeToStr(time), consu, date);
    end;
  end;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMemoria_Fiscal_Faixa_Data_Reducao.Free;
  FrmMemoria_Fiscal_Faixa_Data_Reducao:= Nil;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmMemoria_Fiscal_Faixa_Data_Reducao.RGOpcaoClick(Sender: TObject);
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

function TFrmMemoria_Fiscal_Faixa_Data_Reducao.ValidaIntervalo: Boolean;
begin
  Result:= False;

  if (RGOpcao.ItemIndex = 0) then
    begin
      if (MEdtData_Inicial.Text = '  /  /    ') or (MEdtData_Final.Text = '  /  /    ') then
        begin
          ShowMessage('Digite um valor valido');
          MEdtData_Inicial.SetFocus;
          Exit;
        end;
    end;

  if (RGOpcao.ItemIndex = 1) then
    begin
      if (EdtInicio.Text = '') or (EdtFim.Text = '') then
        begin
          ShowMessage('Digite um valor valido');
          EdtInicio.SetFocus;
          exit
        end;
    end;

 Result:= true;
end;

end.
