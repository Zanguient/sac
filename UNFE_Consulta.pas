unit UNFE_Consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls, ToolWin, ImgList, ExtCtrls, ACBrNFe, ACBrUtil, UGeral;

type
  TFrmNFE_Consulta = class(TForm)
    RGEscolha: TRadioGroup;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnConsulta: TToolButton;
    BBtnFechar: TToolButton;
    OpenDialog1: TOpenDialog;
    procedure BBtnConsultaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Util: TUtil;

    procedure Consulta_Chave;
    procedure Consulta_XML;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNFE_Consulta: TFrmNFE_Consulta;

implementation

uses UDeclaracao, UDM, UNFE_Adm, Util.TLog;

{$R *.dfm}

{ TFrmNFE_Cancela }

procedure TFrmNFE_Consulta.BBtnConsultaClick(Sender: TObject);
begin
  if (RGEscolha.ItemIndex = 0) then
  begin
    Consulta_XML;
    close;
  end
  else
  begin
    Consulta_XML;
    close;
  end;
end;

procedure TFrmNFE_Consulta.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmNFE_Consulta.Consulta_Chave;
var
 vChave : String;
begin
  if not(InputQuery('WebServices Consultar', 'Chave da NF-e', vChave)) then
    exit;

  {FrmNFe_Adm.ACBrNFe1.WebServices.Consulta.NFeChave := vChave;
  FrmNFe_Adm.ACBrNFe1.WebServices.Consulta.Executar;

  FrmNFE_Adm.MemoResp.Lines.Text :=  UTF8Encode(FrmNFe_Adm.ACBrNFe1.WebServices.Consulta.RetWS);
  FrmNFE_Adm.memoRespWS.Lines.Text :=  UTF8Encode(FrmNFe_Adm.ACBrNFe1.WebServices.Consulta.RetornoWS);
  LoadXML(FrmNFE_Adm.MemoResp, FrmNFE_Adm.WBResposta);}
end;

procedure TFrmNFE_Consulta.Consulta_XML;
var
  numero_pedido, chave, nProt: string;
  n_nota_fiscal, codigo_pedido: Integer;
begin
  TLog.Debug('--- CONSULTAR NFE ---');
  TLog.Debug('   ');

  codigo_pedido:= 0;
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
    dm.ACBrNFe1.Consultar;
    TLog.Debug('Consultou NFe e colocou o XML no componente ACBr');

    chave:= '';
    chave:= Trim(OnlyNumber(OpenDialog1.FileName));
    chave:= Copy(chave, 7, 60);
    TLog.Debug('Chave de acesso: '+chave);
    n_nota_fiscal:= dm.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;
    TLog.Debug('Nº da nota fiscal: '+IntToStr(n_nota_fiscal));
    nProt:= dm.ACBrNFe1.WebServices.Consulta.protNFe.nProt;
    TLog.Debug('Nº do protocolo: '+nProt);
    TLog.Debug('Status da NFe: '+IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat));
    TLog.Debug('Motivo da NFe: '+dm.ACBrNFe1.WebServices.Consulta.xMotivo);

    Application.MessageBox(PChar('Processo concluido com sucesso.'+ #10+#13 + #10+#13 +
                                   'Código Status: '+IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat) + #10+#13 +
                                   'Motivo: ' +dm.ACBrNFe1.WebServices.Consulta.xMotivo + #10+#13 +
                                   //'Mensagem: '+ dm.ACBrNFe1.WebServices.Consulta.xMsg + #10+#13 +
                                   'Protocolo: '+ dm.ACBrNFe1.WebServices.Consulta.Protocolo), 'Mensagem da NFe', MB_OK+MB_ICONQUESTION);

    if (dm.ACBrNFe1.WebServices.Consulta.cStat = 100) then
    begin
      if (Application.MessageBox(PChar('A NFe nº '+IntToStr(n_nota_fiscal)+' está autorizada. Deseja atualizar a chave de acesso e o protocolo de recebimento no pedido? Se SIM, na próxima janela, digite o número do pedido que originou a NFe.'), 'NFe autorizada', MB_YESNO+MB_ICONEXCLAMATION)=IDYES) then
      begin
        TLog.Debug('O usuário clicou em SIM para atualizar os dados da NFe depois de consultar.');
        if not(InputQuery('Número do pedido', 'Nº Pedido', numero_pedido)) then
        begin
           TLog.Debug('Ao digitar o número do pedido, o usuário clicou em Não.');
           exit;
        end;

        numero_pedido:= Util.Retorna_Pedido_13_Caracteres(numero_pedido);
        TLog.Debug('Número do pedido: '+numero_pedido);

        if (Application.MessageBox(PChar('Confirma a atualização de dados do pedido '+numero_pedido+'? '), 'Confirmação', MB_YESNO+MB_ICONEXCLAMATION) = IDYES) then
        begin
          TLog.Debug('O usuário clicou em SIM confirmando a atualização dos dados do pedido.');
          codigo_pedido:= Retorna_Codigo_Pedido_Pelo_N_Pedido(numero_pedido);
          TLog.Debug('Código do pedido: '+IntToStr(codigo_pedido));
          Atualiza_NFe_Banco(chave, nProt, IntToStr(n_nota_fiscal), 'NFE', 'PAGO', codigo_pedido, date, dm.ADOConnection1);
          TLog.Debug('Pedido atualizado!');
          Application.MessageBox('NFe atualizada!', 'NFe atualizada', MB_OK+MB_ICONQUESTION);
        end
        else
        begin
          TLog.Debug('O usuário clicou em NÃO para não confirmar a atualização dos dados do pedido.');
        end;
      end
      else
      begin
        TLog.Debug('O usuário clicou em NÃO para atualizar os dados da NFe depois de consultar.');
      end;
    end;
    TLog.Debug('--- FIM DO MÉTODO DE CONSULTAR NFE ---');
  end;
end;

procedure TFrmNFE_Consulta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmNFE_Consulta:= nil;
end;

procedure TFrmNFE_Consulta.FormCreate(Sender: TObject);
begin
  Pega_Certificado_Digital(dm.ACBrNFe1);
  dm.ACBrNFe1.Configuracoes.WebServices.UF:= uf;
end;

end.
