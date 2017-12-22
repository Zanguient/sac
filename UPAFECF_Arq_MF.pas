unit UPAFECF_Arq_MF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,  Mask, ComCtrls, ToolWin, ImgList;

type
  TFrmPAFECF_Arq_MF = class(TForm)
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
    dlgDialogoSalvar: TSaveDialog;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure RGOpcaoClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
  private
    cDataInicial   : Ansistring;
    cDataFinal     : Ansistring;
    cTipo          : Ansistring;
    cUsuario       : Ansistring;
    iTipoGeracao   : integer;
    iUnicoArquivo  : integer;

    function  ValidaIntervalo: Boolean;
    procedure GeraEspelhoMDF;
    procedure GeraArquivoMDF;

    { Private declarations }
  public
      cArquivoOrigem : string;
    { Public declarations }
  end;

var
  FrmPAFECF_Arq_MF: TFrmPAFECF_Arq_MF;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmPAFECF_Arq_MF.BBtnFecharClick(
  Sender: TObject);
begin
  close;
end;

procedure TFrmPAFECF_Arq_MF.BBtnSalvarClick(
  Sender: TObject);
begin

  //if not ValidaIntervalo then
    //Exit;

  {if (RGTipo.ItemIndex = 0) then
  begin
    if Application.MessageBox('Deseja Realiza Espelho da MFD?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
      begin
        GeraEspelhoMDF;
        //Espelho_MFD;
      end;
  end
  else
  begin}
     if Application.MessageBox('Realiza Arquivo da MF?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
     begin
       GeraArquivoMDF;
       //Arquivo_MFD;
     end;
  //end;
end;

procedure TFrmPAFECF_Arq_MF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmPAFECF_Arq_MF.Free;
  FrmPAFECF_Arq_MF:= Nil;
end;

procedure TFrmPAFECF_Arq_MF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmPAFECF_Arq_MF.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmPAFECF_Arq_MF.GeraArquivoMDF;
var
  aux: string;
  cArquivoOrigem, EAD: AnsiString;
begin
  try
    SetLength(EAD, 256);
    aux := FormatDateTime('DDMMYYYY', Date) + FormatDateTime('HHMMSS', time);
    // cArquivoOrigem:= ExtractFilePath(Application.ExeName) + 'MF' + aux+'.txt';

    dlgDialogoSalvar.DefaultExt := '.txt';
    dlgDialogoSalvar.Filter := 'Arquivos text|*.txt';

    if dlgDialogoSalvar.Execute then
    begin
      cArquivoOrigem := dlgDialogoSalvar.FileName;
      cArquivoOrigem := cArquivoOrigem + 'MF' + aux + '.txt';



      // ShowMessage(Format('Arquivo gerado com sucesso em:'#13#10' "%s"', [cArquivoOrigem]));

      if (RGOpcao.ItemIndex = 0) then
      begin
        cTipo := 'D';
        cDataInicial := MEdtData_Inicial.Text;
        cDataFinal := MEdtData_Final.Text;
        dm.ACBrECF1.PafMF_MFD_Cotepe1704(StrToDateTime(cDataInicial),
          StrToDateTime(cDataFinal), cArquivoOrigem);
      end
      else
      begin
        cTipo := 'C';
        cDataInicial := EdtInicio.Text;
        cDataFinal := EdtFim.Text;
        dm.ACBrECF1.PafMF_MFD_Cotepe1704(StrToInt(EdtInicio.Text),
          StrToInt(EdtFim.Text), cArquivoOrigem);
      end;
      // dm.ACBrECF1.ArquivoMF_DLL(cArquivoOrigem);

      // cUsuario:= '1';
      // iTipoGeracao:= 1;
      // iUnicoArquivo:= 1;
      { iRetorno:= Bematech_FI_ArquivoMFD((''), (cDataInicial), (cDataFinal),
        (cTipo), (cUsuario), iTipoGeracao, (cChavePublica),
        (cChavePrivada), iUnicoArquivo);
        Analisa_iRetorno; }
      generateEAD(cArquivoOrigem, cChavePublica, cChavePrivada, EAD, 1);
      Arquivo_Gerado(cArquivoOrigem);
      UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DA MFD.',
        TimeToStr(time), consu, Date);
    end;

  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message + ' Unidade: ' + Self.Name +
        ' Rotina: GeraArquivoMDF');
  end;
end;

procedure TFrmPAFECF_Arq_MF.GeraEspelhoMDF;
begin
  try
    cArquivoOrigem:= ExtractFilePath(Application.ExeName) + 'EspelhoMFD.txt';
    if (RGOpcao.ItemIndex = 0) then
      begin
        cTipo:= 'D';
        cDataInicial:= MEdtData_Inicial.Text;
        cDataFinal:= MEdtData_Final.Text;
      end
      else
      begin
        cTipo:= 'C';
        cDataInicial:= EdtInicio.Text;
        cDataFinal:= EdtFim.Text;
      end;

    cUsuario:= '1';
    iRetorno:= Bematech_FI_EspelhoMFD(cArquivoOrigem, (cDataInicial), (cDataFinal), cTipo, cUsuario, cChavePublica, cChavePrivada);
    Analisa_iRetorno;
    Arquivo_Gerado(cArquivoOrigem);
  except
    on E: Exception do
       ShowMessage('Error: ' + E.Message + ' ' + Self.Name + ' GeraEspelhoMDF' ) ;
  end;
end;

procedure TFrmPAFECF_Arq_MF.RGOpcaoClick(Sender: TObject);
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

function TFrmPAFECF_Arq_MF.ValidaIntervalo: Boolean;
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
