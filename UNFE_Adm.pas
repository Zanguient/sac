unit UNFE_Adm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls, ToolWin, ImgList, OleCtrls, SHDocVw,
  ACBrNFe, ACBrUtil, pcnConversao, ACBrNFeDANFEClass,
  Modelo.Dominio.NFE.INFEDominio, Modelo.Entidade.NFE.TCartaCorrecaoEntidade,
  Modelo.Dominio.NFE.TCartaCorrecaoDominio, ACBrBase, ACBrDFe,
  ACBrNFeDANFeRLClass, ACBrMail, Vcl.ExtCtrls;

type
  TFrmNFE_Adm = class(TForm)
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    MemoResp: TMemo;
    Dados: TTabSheet;
    MemoDados: TMemo;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnImprimir_DANFE: TToolButton;
    BBtnCancelar_NFe: TToolButton;
    BBtnStatus_Servico: TToolButton;
    BBtnConsulta: TToolButton;
    BBtnEmail: TToolButton;
    BBtnFechar: TToolButton;
    BBtnInutilizar: TToolButton;
    BBtnGera_PDF: TToolButton;
    OpenDialog1: TOpenDialog;
    BBtnCarta_Correcao: TToolButton;
    MMOCorrecao: TMemo;
    Label2: TLabel;
    Label1: TLabel;
    ToolButton1: TToolButton;
    ACBrMail1: TACBrMail;
    Memo1: TMemo;
    RGTipo: TRadioGroup;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure BBtnFecharClick(Sender: TObject);

    procedure BBtnStatus_ServicoClick(Sender: TObject);

    procedure BBtnCancelar_NFeClick(Sender: TObject);

    procedure BBtnInutilizarClick(Sender: TObject);

    procedure BBtnGera_PDFClick(Sender: TObject);

    procedure BBtnConsultaClick(Sender: TObject);

    procedure BBtnImprimir_DANFEClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);

    procedure BBtnEmailClick(Sender: TObject);

    procedure BBtnCarta_CorrecaoClick(Sender: TObject);

    procedure BBtnImprimir_CartaClick(Sender: TObject);
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);

  private

    n_carta: integer;
    CCEntidade: TCartaCorrecaoEntidade;
    CCDominio: TCartaCorrecaoDominio;

    procedure Grava_Carta;
    procedure Gera_N_NFe;
    { Private declarations }
  public
    { Public declarations }
    n_nota_fiscal_carta_correcao: Integer;
  end;

var
  FrmNFE_Adm: TFrmNFE_Adm;

implementation

uses UDeclaracao, UDM, UNFE_Cancela, UNFE_Consulta, UNFE_Imprime,
  Modelo.Dominio.NFE.TNFEDominio, UStatus_NFE, Util.Mensagens, Util.TLog,
  pcnConversaoNFe;

{$R *.dfm}

procedure TFrmNFE_Adm.ACBrNFe1StatusChange(Sender: TObject);
begin
  case dm.ACBrNFe1.Status of
    stIdle :
    begin
      if ( frmStatus <> nil ) then
        frmStatus.Hide;
    end;
    stNFeStatusServico :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeRetRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Recebendo dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeConsulta :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeCancelamento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeInutilizacao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecibo :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCadastro :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEmail :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Email...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCCe :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Carta de Correção...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEvento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Evento...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TFrmNFE_Adm.BBtnCancelar_NFeClick(Sender: TObject);
begin
  Application.CreateForm(TFrmNFE_Cancela, FrmNFE_Cancela);
  FrmNFE_Cancela.ShowModal;
  FrmNFE_Cancela.Free;
end;

procedure TFrmNFE_Adm.BBtnCarta_CorrecaoClick(Sender: TObject);
var
  chave, nSeqEvento: AnsiString;
  idLote, iUltimo: integer;
  dataEvento: TDateTime;
begin
  if (MMOCorrecao.Text = '') then
  begin
    TMensagens.MensagemErro('O campo destino ao texto da carta de correção está vazio.');
    MMOCorrecao.SetFocus;
    abort;
  end;

  if (Length(MMOCorrecao.Text) < 15) then
  begin
    TMensagens.MensagemErro('O campo destino ao texto da carta de correção está com menos de 15 caracteres.');
    MMOCorrecao.SetFocus;
    abort;
  end;
  dm.ACBrNFe1.EventoNFe.Evento.Clear;
  dm.ACBrNFe1.NotasFiscais.Clear;

  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

    chave:= Trim(OnlyNumber(OpenDialog1.FileName));
    if(Length(chave) = 50) then
    begin
      chave:= Copy(chave, 7, 60);
    end;

    TLog.Debug('Valor da chave: '+ chave);
    TLog.Debug('Tamanho da chave: '+ IntToStr(Length(chave)));

    if (Length(chave)<> 44) then
    begin
      TMensagens.MensagemErro('A chave de acesso deve ter 44 números. Ela está com '+IntToStr(Length(chave))+' números.');
      abort;
    end;

    idLote := StrToInt(FormatDateTime('yymmddhhmm', NOW));
    dm.ACBrNFe1.EventoNFe.Evento.Clear;
    Gera_N_NFe;

    with dm.ACBrNFe1.EventoNFe.Evento.Add do
     begin
       infEvento.chNFe := chave;
       infEvento.CNPJ   := cnpj;
       //infEvento.cOrgao := 52;
       dataEvento:= now;
       infEvento.dhEvento := dataEvento;
       infEvento.tpEvento := teCCe;
       infEvento.nSeqEvento := n_carta;
       infEvento.detEvento.xCorrecao := MMOCorrecao.Text;
     end;

     try
       dm.ACBrNFe1.EnviarEvento(idLote);
       if (dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135) or
          (dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 136) then
       begin
         Grava_Carta;

         CCEntidade:= TCartaCorrecaoEntidade.Create;
         CCDominio:= TCartaCorrecaoDominio.Create(dm.ADOConnection1);
         CCEntidade.Chave_NFE:= chave;
         CCEntidade.N_Nota_Fiscal:= dm.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;
         n_nota_fiscal_carta_correcao:= dm.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;
         CCEntidade.CNPJ:= cnpj;
         CCEntidade.DataEvento:= dataEvento;
         CCEntidade.N_Carta_Correcao:= n_carta;
         CCEntidade.Observacao:= MMOCorrecao.Text;
         CCEntidade.Protocolo:= dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
         CCDominio.gravaCartaCorrecao(CCEntidade);

         TMensagens.MensagemInformacao('Carta de correção emitida com sucesso. Por favor, clique no botão Imprimir nessa mesma janela. Em seguida, marque a opção Carta de Correção.');
       end
       else
       begin
         Application.MessageBox(PChar('Houve um erro no envio da carta de correção.'+ #10+#13 + #10+#13 +
                                     'Código Status: '+IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat) + #10+#13 +
                                     'Motivo: ' +dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo + #10+#13 +
                                     'Mensagem: '+ dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xEvento + #10+#13 +
                                     'Protocolo: '+ dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt), 'Mensagem da Carta de Correção', MB_OK+MB_ICONHAND);
       end;

       MemoResp.Lines.Text := UTF8Encode(dm.ACBrNFe1.WebServices.EnvEvento.RetWS);
     except on E:Exception do
     begin
       TLog.Error('Erro ao gerar Carta de Correção: '+e.Message);
       TMensagens.MensagemErro('Erro ao gerar Carta de Correção: '+e.Message);
       //MemoResp.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetWS);
       //LoadXML(MemoResp, WBResposta);
       {Application.MessageBox(PChar('Houve um erro no envio da carta de correção.'+ #10+#13 + #10+#13 +
                                     'Código Status: '+IntToStr(ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat) + #10+#13 +
                                     'Motivo: ' +ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo + #10+#13 +
                                     'Mensagem: '+ ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xEvento + #10+#13 +
                                     'Protocolo: '+ ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt), 'Mensagem da Carta de Correção', MB_OK+MB_ICONHAND);}

     end;
     end;
  end;

end;

procedure TFrmNFE_Adm.Gera_N_NFe;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Controla_N_Carta_Correcao');
      open;
    end;
    n_carta := qAux.FieldByName('Codigo').AsInteger + 1;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE_Adm.Grava_Carta;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Insert into Controla_N_Carta_Correcao (Codigo) values (:Codigo)');
      Parameters.ParamByName('Codigo').Value := n_carta;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE_Adm.RGTipoClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 0) then
  begin
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFe;
    dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= false;
    dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFeRL1;
  end
  else
  begin
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFCe;
    dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= true;
    dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFCeFortes1;
  end;
end;

procedure TFrmNFE_Adm.ToolButton1Click(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*.XML';
  OpenDialog1.Filter := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
  end;

  OpenDialog1.Title := 'Selecione o Evento';
  OpenDialog1.DefaultExt := '*.XML';
  OpenDialog1.Filter := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    dm.ACBrNFe1.EventoNFe.Evento.Clear;
    dm.ACBrNFe1.EventoNFe.LerXML(OpenDialog1.FileName) ;
    dm.ACBrNFe1.ImprimirEvento;
  end;
end;

procedure TFrmNFE_Adm.BBtnConsultaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmNFE_Consulta, FrmNFE_Consulta);
  FrmNFE_Consulta.ShowModal;
  FrmNFE_Consulta.Free;
end;

procedure TFrmNFE_Adm.BBtnEmailClick(Sender: TObject);
var
 Para, Assunto : String;
 CC: Tstrings;
begin
  if not(InputQuery('Enviar Email', 'Email de destino', Para)) then
    exit;

  if not(InputQuery('Enviar Email', 'Assunto do Email', Assunto)) then
    exit;

  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter :=
    'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    try
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
      CC := TstringList.create;
      // CC.Add('andrefmoraes@gmail.com'); //especifique um email vÃ¡lido
      // CC.Add('anfm@zipmail.com.br');    //especifique um email vÃ¡lido

      ACBrMail1.Host := smtp;
      ACBrMail1.Port := portasmtp;
      ACBrMail1.Username := email;
      ACBrMail1.Password := senhaemail;
      ACBrMail1.From := email;
      ACBrMail1.SetSSL := true; // SSL - ConexÃ£o Segura
      ACBrMail1.SetTLS := false; // Auto TLS
      ACBrMail1.ReadingConfirmation := false;
      // Pede confirmaÃ§Ã£o de leitura do email
      ACBrMail1.UseThread := false; // Aguarda Envio do Email(nÃ£o usa thread)
      ACBrMail1.FromName := email;

      dm.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(Para, Assunto,
        Memo1.Lines, true // Enviar PDF junto
        , CC // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
        , nil); // Lista de anexos - TStrings
      // ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(smtp // edtSmtpHost.Text
      // , portasmtp // edtSmtpPort.Text
      // , email // edtSmtpUser.Text
      // , senhaemail // edtSmtpPass.Text
      // , email // edtSmtpUser.Text
      // , EdtEmail.Text, Assunto // edtEmailAssunto.Text
      // , Memo1.Lines
      // // MemoDados.Lines //'Segue em anexo o XML solicitado'//mmEmailMsg.Lines
      // , true // cbEmailSSL.Checked // SSL - Conexão Segura
      // , true // Enviar PDF junto
      // , CC // Lista com emails que serão enviado cópias - TStrings
      // , nil // Lista de anexos - TStrings
      // , false // Pede confirmação de leitura do email
      // , false // Aguarda Envio do Email(não usa thread)
      // , nome_fantasia // Nome do Rementente
      // , true); // cbEmailSSL.Checked ); // Auto TLS
      CC.Free;
      TMensagens.MensagemInformacao('Email enviado com sucesso');
    except
      on E: Exception do
      begin
        TLog.Error(Self.ClassName + ' - BBtnEmailClick - ' + E.Message);
        TMensagens.MensagemErro('Email NÃO enviado.');
      end;
    end;
  end;
end;

procedure TFrmNFE_Adm.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmNFE_Adm.BBtnGera_PDFClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;

  dm.ACBrNFe1.NotasFiscais.Clear;
  if OpenDialog1.Execute then
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

  dm.ACBrNFe1.NotasFiscais.ImprimirPDF;
end;

procedure TFrmNFE_Adm.BBtnImprimir_DANFEClick(Sender: TObject);
begin
  Application.CreateForm(TFrmNFE_Imprime, FrmNFE_Imprime);
  FrmNFE_Imprime.ShowModal;
  FrmNFE_Imprime.Free;
end;

procedure TFrmNFE_Adm.BBtnInutilizarClick(Sender: TObject);
var
 Modelo, Serie, Ano, NumeroInicial, NumeroFinal, Justificativa : String;
begin
 if not(InputQuery('WebServices Inutilização ', 'Ano',    Ano)) then
    exit;
 if not(InputQuery('WebServices Inutilização ', 'Modelo', Modelo)) then
    exit;
 if not(InputQuery('WebServices Inutilização ', 'Serie',  Serie)) then
    exit;
 if not(InputQuery('WebServices Inutilização ', 'Número Inicial', NumeroInicial)) then
    exit;
 if not(InputQuery('WebServices Inutilização ', 'Número Inicial', NumeroFinal)) then
    exit;
 if not(InputQuery('WebServices Inutilização ', 'Justificativa', Justificativa)) then
    exit;
  dm.ACBrNFe1.WebServices.Inutiliza(cnpj, Justificativa, StrToInt(Ano), StrToInt(Modelo), StrToInt(Serie), StrToInt(NumeroInicial), StrToInt(NumeroFinal));
  MemoResp.Lines.Text :=  UTF8Encode(dm.ACBrNFe1.WebServices.Inutilizacao.RetWS);
  //memoRespWS.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.Inutilizacao.RetornoWS);
  //LoadXML(MemoResp, WBResposta);
end;

procedure TFrmNFE_Adm.BBtnStatus_ServicoClick(Sender: TObject);
begin
   dm.ACBrNFe1.WebServices.StatusServico.Executar;

   MemoResp.Lines.Text := UTF8Encode(dm.ACBrNFe1.WebServices.StatusServico.RetWS);
   //memoRespWS.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.StatusServico.RetornoWS);
   //LoadXML(MemoResp, WBResposta);

   //PageControl2.ActivePageIndex := 1;

   MemoDados.Lines.Add('');
   MemoDados.Lines.Add('Status Serviço');
   MemoDados.Lines.Add('tpAmb: '    +TpAmbToStr(dm.ACBrNFe1.WebServices.StatusServico.tpAmb));
   MemoDados.Lines.Add('verAplic: ' +dm.ACBrNFe1.WebServices.StatusServico.verAplic);
   MemoDados.Lines.Add('cStat: '    +IntToStr(dm.ACBrNFe1.WebServices.StatusServico.cStat));
   MemoDados.Lines.Add('xMotivo: '  +dm.ACBrNFe1.WebServices.StatusServico.xMotivo);
   MemoDados.Lines.Add('cUF: '      +IntToStr(dm.ACBrNFe1.WebServices.StatusServico.cUF));
   MemoDados.Lines.Add('dhRecbto: ' +DateTimeToStr(dm.ACBrNFe1.WebServices.StatusServico.dhRecbto));
   MemoDados.Lines.Add('tMed: '     +IntToStr(dm.ACBrNFe1.WebServices.StatusServico.TMed));
   MemoDados.Lines.Add('dhRetorno: '+DateTimeToStr(dm.ACBrNFe1.WebServices.StatusServico.dhRetorno));
   MemoDados.Lines.Add('xObs: '     +dm.ACBrNFe1.WebServices.StatusServico.xObs);
end;

procedure TFrmNFE_Adm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmNFE_Adm.Free;
  FrmNFE_Adm:= nil;
end;

procedure TFrmNFE_Adm.FormCreate(Sender: TObject);
begin
  Pega_Certificado_Digital(dm.ACBrNFe1);
  dm.ACBrNFe1.Configuracoes.Geral.IdCSC:= idcsc;
  dm.ACBrNFe1.Configuracoes.Geral.CSC:= numerocsc;
  dm.ACBrNFe1.Configuracoes.Geral.VersaoDF := ve310;
  dm.ACBrNFe1.Configuracoes.Geral.ModeloDF := moNFe;
  dm.ACBrNFe1.Configuracoes.WebServices.UF:= uf;
  dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= false;

  dm.ACBrNFeDANFCeFortes1.TipoDANFE := tiNFCe;
  dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFeRL1;
  dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar := salva_xml;
  dm.ACBrNFeDANFeRL1.PathPDF:= salva_xml;
  dm.ACBrNFe1.Configuracoes.Arquivos.PathNFe:= salva_xml+'Transmitidos';
  dm.ACBrNFe1.Configuracoes.Arquivos.PathEvento:= salva_xml+'Cancelados';
  dm.ACBrNFe1.Configuracoes.Arquivos.PathSchemas:= caminho_schema;

  if (ambiente = 'PRODUÇÃO') then
    dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao
  else if (ambiente = 'HOMOLOGAÇÃO') then
    dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;

  if (logomarca <> '') then
  begin
    dm.ACBrNFeDANFeRL1.Logo:= logomarca;
    dm.ACBrNFeDANFCeFortes1.Logo:= logomarca;
  end;
end;

procedure TFrmNFE_Adm.BBtnImprimir_CartaClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*.XML';
  OpenDialog1.Filter := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromString(OpenDialog1.FileName);
  end;

    OpenDialog1.Title := 'Selecione o Evento';
    OpenDialog1.DefaultExt := '*.XML';
    OpenDialog1.Filter := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
    OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
    if OpenDialog1.Execute then
    begin
      dm.ACBrNFe1.EventoNFe.Evento.Clear;
      dm.ACBrNFe1.EventoNFe.LerXML(OpenDialog1.FileName) ;
      dm.ACBrNFe1.ImprimirEvento;
    end;
end;

end.
