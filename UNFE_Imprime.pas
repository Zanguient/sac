unit UNFE_Imprime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls, ToolWin, ImgList, ExtCtrls, ACBrNFe,
  pcnConversao, ACBrUtil, Data.DB, Vcl.Grids, Vcl.DBGrids, UGeral, Vcl.Mask,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TFrmNFE_Imprime = class(TForm)
    RGEscolha: TRadioGroup;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnConsulta: TToolButton;
    BBtnFechar: TToolButton;
    OpenDialog1: TOpenDialog;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1N_Nota_Fiscal: TIntegerField;
    ADOQuery1DataEvento: TDateTimeField;
    ADOQuery1Observacao: TStringField;
    ADOQuery1Codigo: TAutoIncField;
    ADOQuery1Chave_NFE: TStringField;
    ADOQuery1CNPJ: TStringField;
    ADOQuery1N_Carta_Correcao: TIntegerField;
    ADOQuery1Protocolo: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2N_Nota_Fiscal: TIntegerField;
    ADOQuery2Chave_NFe: TStringField;
    ADOQuery2Protocolo_NFe: TStringField;
    BBtnPesquisar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    Label1: TLabel;
    EdtLocal: TEdit;
    BBtnProcurar: TButton;
    BBtnLimpar: TToolButton;
    ADOQuery2Data_Venda: TDateTimeField;
    ADOQuery2Status: TStringField;
    ADOQuery2Chave_NFCe: TStringField;
    ADOQuery2Protocolo_NFCe: TStringField;
    ADOQuery2N_NFCe: TIntegerField;
    ADOQuery2Data_Emissao_NFCe: TDateTimeField;
    procedure BBtnConsultaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtN_Nota_FiscalKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BBtnProcurarClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
  private
    Chave, Protocolo, Justificativa : string;
    Util: TUtil;

    procedure Busca_Dados_CC;
    procedure Busca_Dados_NFe;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNFE_Imprime: TFrmNFE_Imprime;

implementation

uses UDeclaracao, UDM, UNFE_Adm, URel_Carta_Correcao, Util.Mensagens,
  Util.Configs;

{$R *.dfm}

{ TFrmNFE_Cancela }

procedure TFrmNFE_Imprime.BBtnConsultaClick(Sender: TObject);
var
  chave: AnsiString;
begin
  if (RGEscolha.ItemIndex = 1) or (RGEscolha.ItemIndex = 2) then
  begin
    if (EdtLocal.Text = '') then
    begin
      TMensagens.MensagemErro('Informe o local onde estão armazenados os arquivos XML. Clique no botão Procurar e escolha o local.');
      EdtLocal.SetFocus;
      exit;
    end;

    if (DBGrid1.SelectedRows.CurrentRowSelected = false) then
    begin
      TMensagens.MensagemErro('Selecione pelo menos uma chave da NFe para imprimir');
      exit;
    end;

    dm.ACBrNFeDANFeRL1.MostrarPreview:= True;
    ADOQuery2.First;
    while not ADOQuery2.Eof do
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        dm.ACBrNFe1.NotasFiscais.Clear;
        if (RGEscolha.ItemIndex = 1) then
        begin
          dm.ACBrNFe1.NotasFiscais.LoadFromFile(EdtLocal.Text + ADOQuery2Chave_NFe.AsString+'-nfe.xml');
        end
        else if (RGEscolha.ItemIndex = 2) then
        begin
          dm.ACBrNFe1.NotasFiscais.LoadFromFile(EdtLocal.Text + ADOQuery2Chave_NFCe.AsString+'-nfe.xml');
        end;

        dm.ACBrNFe1.NotasFiscais.ImprimirPDF;
        dm.ACBrNFe1.NotasFiscais.Imprimir;
      end;
      ADOQuery2.Next;
    end;

    {OpenDialog1.Title := 'Selecione a NFE';
    OpenDialog1.DefaultExt := '*-nfe.XML';
    OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
    OpenDialog1.InitialDir := FrmNFE_Adm.ACBrNFe1.Configuracoes.Geral.PathSalvar;
    if OpenDialog1.Execute then
    begin
      FrmNFE_Adm.ACBrNFe1.NotasFiscais.Clear;
      FrmNFE_Adm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
      if FrmNFE_Adm.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
       begin
         FrmNFE_Adm.ACBrNFe1.WebServices.ConsultaDPEC.NFeChave := FrmNFE_Adm.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID;
         FrmNFE_Adm.ACBrNFe1.WebServices.ConsultaDPEC.Executar;
         FrmNFE_Adm.ACBrNFe1.DANFE.ProtocoloNFe := FrmNFE_Adm.ACBrNFe1.WebServices.ConsultaDPEC.nRegDPEC +' '+ DateTimeToStr(FrmNFe_Adm.ACBrNFe1.WebServices.ConsultaDPEC.dhRegDPEC);
       end;
      FrmNFE_Adm.ACBrNFe1.NotasFiscais.ImprimirPDF;
      FrmNFE_Adm.ACBrNFe1.NotasFiscais.Imprimir;
    end;

    close;}
  end
  else
  begin
    {if PrintDialog1.Execute then
    begin
      FrmNFE_Adm.ACBrNFeDANFEQR1.MostrarPreview := true;

      OpenDialog1.Execute;
      chave:= Trim(OnlyNumber(OpenDialog1.FileName));

      FrmNFE_Adm.ACBrNFe1.NotasFiscais.Clear;
      FrmNFE_Adm.ACBrNFe1.NotasFiscais.LoadFromString(chave);

      OpenDialog1.Execute;
      chave:= Trim(OnlyNumber(OpenDialog1.FileName));
      FrmNFE_Adm.ACBrNFe1.EventoNFe.Evento.Clear;
      FrmNFE_Adm.ACBrNFe1.EventoNFe.LerXMLFromString(chave);


      FrmNFE_Adm.ACBrNFe1.ImprimirEvento;
    end;}
    {if (EdtN_Nota_Fiscal.Text = '') then
    begin
      TMensagens.MensagemErro('Por favor, informe o nº da nota e em seguida a carta de correção desejada.');
      abort;
    end;}

    if (DBGrid3.SelectedRows.CurrentRowSelected = false) then
    begin
      TMensagens.MensagemErro('Por favor, selecione a carta de correção à imprimir.');
    end;

    FrmRel_Carta_Correcao:= TFrmRel_Carta_Correcao.create(self);
    FrmRel_Carta_Correcao.Release;
    FrmRel_Carta_Correcao:= Nil;

    //close;
  end;
end;

procedure TFrmNFE_Imprime.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmNFE_Imprime.BBtnLimparClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery2.Close;
  PageControl1.TabIndex:= 0;
end;

procedure TFrmNFE_Imprime.Busca_Dados_CC;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    Add('select NFCC.* from NFCarta_Correcao NFCC');
    Add('where NFCC.DataEvento between :DI and :DF order by NFCC.DataEvento');
    //Parameters.ParamByName('Nota').Value:= StrToInt(EdtN_Nota_Fiscal.Text);
    Parameters.ParamByName('DI').Value:= StrToDateTime(MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(MEdtData_Final.Text + ' 23:59:59');
    open;

    if (IsEmpty) then
    begin
      Mensagem_Fim_Pesquisa;
    end;
  end;
end;

procedure TFrmNFE_Imprime.Busca_Dados_NFe;
begin
  with ADOQuery2, sql do
  begin
    close;
    clear;
    Add('select P.N_Nota_Fiscal, P.Chave_NFe, P.Data_Venda, P.Protocolo_NFe, P.Status,');
    add('P.Chave_NFCe, P.Protocolo_NFCe, P.N_NFCe, P.Data_Emissao_NFCe ');
    Add('from Pedido P ');

    if (RGEscolha.ItemIndex = 1) then
    begin
      Add(' where (P.Status = '+QuotedStr('PAGO')+' or P.Status = '+QuotedStr('CANCELADO')+' ) and ( P.Tipo = '+QuotedStr('NFE')+' or ');
      Add('P.Tipo = '+QuotedStr('NFE/NFCE')+' or P.Tipo = '+QuotedStr('NFCE/NFE')+' ) and ');
      Add('P.Data_Venda between :DI and :DF order by P.N_Nota_Fiscal');
    end
    else if (RGEscolha.ItemIndex = 2) then
    begin
      Add(' where (P.Status = '+QuotedStr('PAGO')+' or P.Status = '+QuotedStr('CANCELADO')+' ) and ( P.Tipo = '+QuotedStr('NFCE')+' or ');
      Add('P.Tipo = '+QuotedStr('NFE/NFCE')+' or P.Tipo = '+QuotedStr('NFCE/NFE')+' ) and ');
      Add('P.Data_Venda between :DI and :DF order by P.N_Nota_Fiscal');
    end;
    Parameters.ParamByName('DI').Value:= StrToDateTime(MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(MEdtData_Final.Text);
    open;
    if (IsEmpty) then
    begin
      Mensagem_Fim_Pesquisa;
    end;
  end;
end;

procedure TFrmNFE_Imprime.DBGrid1CellClick(Column: TColumn);
begin
  {if (Column.Field = ADOQuery2Imprime) then
  begin
    ADOQuery2.Edit;
    ADOQuery2Imprime.Value:= not ADOQuery2Imprime.AsBoolean;
    ADOQuery2.Post;
  end; }
end;

procedure TFrmNFE_Imprime.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

  const
  IS_CHECK : Array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  Check: Integer;
  R: TRect;
begin
  {with DBGrid1 do
  begin
    if Column.FieldName = 'Imprime' then
    begin
      Canvas.FillRect(Rect);
      Check := IS_CHECK[Column.Field.AsBoolean];
      R := Rect;
      //if ADOQuery2Imprime.AsString = 'X' then
      //  Check := DFCS_CHECKED
      //else
      //  Check := 0;

      InflateRect(R,-2,-2); //Diminue o tamanho do CheckBox
      DrawFrameControl(Canvas.Handle,rect,DFC_BUTTON,Check);
    end;
  end; }
end;

procedure TFrmNFE_Imprime.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(ADOQuery2, Column);
end;

procedure TFrmNFE_Imprime.DBGrid3TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(ADOQuery1, Column);
end;

procedure TFrmNFE_Imprime.EdtN_Nota_FiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmNFE_Imprime.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dm.ACBrNFeDANFeRL1.MostrarPreview:= True;
  FrmNFE_Imprime:= nil;
end;

procedure TFrmNFE_Imprime.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  if (FrmNFE_Adm.RGTipo.ItemIndex = 0) then
  begin
    RGEscolha.ItemIndex:= 1;
    RGEscolha.Controls[1].Enabled:= true;
    RGEscolha.Controls[2].Enabled:= false;
  end
  else if (FrmNFE_Adm.RGTipo.ItemIndex = 1) then
  begin
    RGEscolha.ItemIndex:= 2;
    RGEscolha.Controls[1].Enabled:= false;
    RGEscolha.Controls[2].Enabled:= true;
  end;

  Util.Inicia_Data(MEdtData_Final, MEdtData_Inicial);
  PageControl1.TabIndex:= 0;
end;

procedure TFrmNFE_Imprime.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmNFE_Imprime.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

procedure TFrmNFE_Imprime.BBtnPesquisarClick(Sender: TObject);
begin
  if (RGEscolha.ItemIndex = 0) then
  begin
    PageControl1.TabIndex:= 0;
    if (MEdtData_Inicial.Text = '  /  /    ') then
    begin
      TMensagens.MensagemErro(MensagemCampoNulo);
      MEdtData_Inicial.SetFocus;
      exit;
    end;

    if (MEdtData_Final.Text = '  /  /    ') then
    begin
      TMensagens.MensagemErro(MensagemCampoNulo);
      MEdtData_Final.SetFocus;
      exit;
    end;

    Busca_Dados_CC;
  end
  else
  begin
    PageControl1.TabIndex:= 1;
    if (MEdtData_Inicial.Text = '  /  /    ') then
    begin
      TMensagens.MensagemErro(MensagemCampoNulo);
      MEdtData_Inicial.SetFocus;
      exit;
    end;

    if (MEdtData_Final.Text = '  /  /    ') then
    begin
      TMensagens.MensagemErro(MensagemCampoNulo);
      MEdtData_Final.SetFocus;
      exit;
    end;

    Busca_Dados_NFe;
  end;
end;

procedure TFrmNFE_Imprime.BBtnProcurarClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    EdtLocal.Text := ExtractFilePath(OpenDialog1.FileName);
  end;
end;

end.
