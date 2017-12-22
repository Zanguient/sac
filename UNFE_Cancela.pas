unit UNFE_Cancela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls, ToolWin, ImgList, ExtCtrls, ACBrNFe,
  pcnConversao, Modelo.Dominio.NFE.INFEDominio, Data.DB;

type
  TFrmNFE_Cancela = class(TForm)
    RGEscolha: TRadioGroup;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnConsulta: TToolButton;
    BBtnFechar: TToolButton;
    OpenDialog1: TOpenDialog;
    qryitens_nf: TADOQuery;
    qryitens_nfCodigo_Produto: TIntegerField;
    qryitens_nfQtde: TFloatField;
    qryitens_nfEstoque: TFloatField;
    qryitens_nfVolume: TFloatField;
    qryitens_nfQtde_Estoque_Atual: TFloatField;
    qryitens_nfValor_Compra_Atual: TFloatField;
    procedure BBtnConsultaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FNFEDominio : INFEDominio;
    Chave, Protocolo, Justificativa : string;

    function removerTodasFichasEstoques: Boolean;
    procedure Cancela_Chave;
    procedure Cancela_XML;
    procedure Atualiza_Status;
    procedure Atualiza_Estoque_Atraves_Chave(ChaveNFe: AnsiString);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNFE_Cancela: TFrmNFE_Cancela;

implementation

uses UDeclaracao, UDM, UNFE_Adm, Modelo.Dominio.NFE.TNFEDominio,
  Modelo.Entidade.Estoque.TFichaEstoque, Util.TLog, ACBrUtil;

{$R *.dfm}

{ TFrmNFE_Cancela }

procedure TFrmNFE_Cancela.Atualiza_Status;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('update Pedido set Status = :Status');
      add('where Chave_NFe = :Chave_NFe');
      Parameters.ParamByName('Status').Value := 'CANCELADO';
      Parameters.ParamByName('Chave_NFe').Value := Chave;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE_Cancela.BBtnConsultaClick(Sender: TObject);
begin
  if (RGEscolha.ItemIndex = 0) then
  begin
    Cancela_XML;
    close;
  end
  else
  begin
    Cancela_XML;
    close;
  end;
end;

procedure TFrmNFE_Cancela.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmNFE_Cancela.Cancela_Chave;
begin
  if not(InputQuery('WebServices Cancelamento', 'Chave da NF-e', Chave)) then
     exit;
  if not(InputQuery('WebServices Cancelamento', 'Protocolo de Autorização', Protocolo)) then
     exit;
  if not(InputQuery('WebServices Cancelamento', 'Justificativa', Justificativa)) then
     exit;
//
//  FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.NFeChave      := Chave;
//  FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.Protocolo     := Protocolo;
//  FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.Justificativa := Justificativa;

  try
//    FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.Executar;
    Atualiza_Status;

//    FrmNFE_Adm.MemoResp.Lines.Text :=  UTF8Encode(FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.RetWS);
//    FrmNFE_Adm.memoRespWS.Lines.Text :=  UTF8Encode(FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.RetornoWS);
//    LoadXML(FrmNFE_Adm.MemoResp, FrmNFE_Adm.WBResposta);
  except
//    FrmNFE_Adm.MemoResp.Lines.Text :=  UTF8Encode(FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.RetWS);
//    FrmNFE_Adm.memoRespWS.Lines.Text :=  UTF8Encode(FrmNFe_Adm.ACBrNFe1.WebServices.Cancelamento.RetornoWS);
//    LoadXML(FrmNFE_Adm.MemoResp, FrmNFE_Adm.WBResposta);
  end;
end;

procedure TFrmNFE_Cancela.Atualiza_Estoque_Atraves_Chave(ChaveNFe: AnsiString);
var
  qtdeEstoque: double;
begin
  try
    with qryitens_nf, sql do
    begin
      close;
      clear;
      add('select IP.Codigo_Produto, IP.Qtde, IP.Qtde_Estoque_Atual, Pro.Estoque, Pro.Volume, Pro.Valor_Compra as Valor_Compra_Atual from Itens_Pedido IP');
      Add('left join Pedido P on (IP.Codigo = P.Codigo)');
      Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
      add('where P.Chave_NFe = :Chave_NFe');
      Parameters.ParamByName('Chave_NFe').Value := ChaveNFe;
      Open;

      if (IsEmpty = false) then
      begin
        qryitens_nf.First;
        while not qryitens_nf.Eof do
        begin

          qtdeEstoque:= qryitens_nfEstoque.AsFloat + qryitens_nfQtde.AsFloat;

          Atualiza_Saldo_Estoque(dm.ADOConnection1, qryitens_nfCodigo_Produto.AsInteger, qryitens_nfValor_Compra_Atual.AsFloat * qtdeEstoque);
          Atualiza_Estoque(dm.ADOConnection1, qtdeEstoque, qryitens_nfCodigo_Produto.AsInteger);
          Atualiza_Volume(dm.ADOConnection1, qtdeEstoque * qryitens_nfVolume.AsFloat, qryitens_nfCodigo_Produto.AsInteger);

          qryitens_nf.Edit;
          qryitens_nfQtde_Estoque_Atual.AsFloat:= qryitens_nfEstoque.AsFloat;
          qryitens_nf.Post;

          qryitens_nf.next;
        end;

        Cria_Arquivo_Atualiza_Dados('AProd');
        Atualiza_Produto(4, '');
      end;
    end;
  finally
  end;
end;

procedure TFrmNFE_Cancela.Cancela_XML;
var
  vAux, nProt : String;
begin
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

    chave:= '';
    chave:= Trim(OnlyNumber(OpenDialog1.FileName));
    chave:= Copy(chave, 7, 60);

    nProt:= dm.ACBrNFe1.WebServices.Consulta.protNFe.nProt;

    if not(InputQuery('WebServices Cancelamento', 'Justificativa', vAux)) then
       exit;

      dm.ACBrNFe1.EventoNFe.Evento.Clear;
      dm.ACBrNFe1.EventoNFe.idLote := (1) ;
      with dm.ACBrNFe1.EventoNFe.Evento.Add do
      begin
        //infEvento.chNFe:= chave;
        //infEvento.CNPJ   := cnpj;
        infEvento.dhEvento := now;
        infEvento.tpEvento := teCancelamento;
        //InfEvento.cOrgao:= 52;
        infEvento.detEvento.xJust := vAux;
        //InfEvento.detEvento.nProt:= nProt;
      end;
      dm.ACBrNFe1.EnviarEvento(1);
      //removerTodasFichasEstoques;

      if (dm.ACBrNFe1.WebServices.EnvEvento.cStat = 128) then
      begin
        Atualiza_Status;
        Atualiza_Estoque_Atraves_Chave(chave);

        Application.MessageBox(PChar('Processo concluido com sucesso.'+ #10+#13 + #10+#13 +
                                       'Código Status: '+IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.cStat) + #10+#13 +
                                       'Motivo: ' +dm.ACBrNFe1.WebServices.EnvEvento.xMotivo), 'Mensagem da NFe', MB_OK+MB_ICONQUESTION);
                                       //'Mensagem: '+ FrmNFe_ADM.ACBrNFe1.WebServices.EnvEvento.xMsg + #10+#13 +
                                       //'Protocolo: '+ FrmNFe_ADM.ACBrNFe1.WebServices.EnvEvento.Protocolo), 'Mensagem da NFe', MB_OK+MB_ICONQUESTION);
      end
      else
      begin
        Application.MessageBox(PChar('Mensagem da NFe.'+ #10+#13 + #10+#13 +
                                       'Código Status: '+IntToStr(dm.ACBrNFe1.WebServices.EnvEvento.cStat) + #10+#13 +
                                       'Motivo: ' +dm.ACBrNFe1.WebServices.EnvEvento.xMotivo), 'Mensagem da NFe', MB_OK+MB_ICONEXCLAMATION);
                                       //'Mensagem: '+ FrmNFe_ADM.ACBrNFe1.WebServices.EnvEvento.xMsg + #10+#13 +
                                       //'Protocolo: '+ FrmNFe_ADM.ACBrNFe1.WebServices.EnvEvento.Protocolo), 'Mensagem da NFe', MB_OK+MB_ICONQUESTION);
      end;


  end;
end;

function TFrmNFE_Cancela.removerTodasFichasEstoques: Boolean;
begin
  try
    Result := False;
    Result := FNFEDominio.removerFichaEstoque(dm.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - removerTodasFichasEstoques - '+E.Message);
  end;
end;

procedure TFrmNFE_Cancela.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmNFE_Cancela:= nil;
end;

procedure TFrmNFE_Cancela.FormCreate(Sender: TObject);
begin
  Pega_Certificado_Digital(dm.ACBrNFe1);
  dm.ACBrNFe1.Configuracoes.WebServices.UF:= uf;
  FNFEDominio := TNFEDominio.Create(dm.ADOConnection1);
end;

procedure TFrmNFE_Cancela.FormDestroy(Sender: TObject);
begin
  FNFEDominio := nil;
end;

end.

