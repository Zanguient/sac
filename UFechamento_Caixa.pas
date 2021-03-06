unit UFechamento_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, UGeral, URegistro,
  DB, ADODB, Grids, DBGrids, DateUtils;

type
  TFrmFechamento_Caixa = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnFechar_Caixa: TToolButton;
    BBtnFechar: TToolButton;
    DBGrid1: TDBGrid;
    qryfechamento: TADOQuery;
    DataSource1: TDataSource;
    qryfechamentoForma_Pagamento: TStringField;
    qryfechamentoData: TDateTimeField;
    qryfechamentoValor: TFloatField;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    qryabertura: TADOQuery;
    DataSource2: TDataSource;
    SaveDialog1: TSaveDialog;
    qryfechamentoTipo_Documento: TStringField;
    qryaberturaData_Abertura: TDateTimeField;
    qryaberturaCodigo_Forma_Pagamento: TIntegerField;
    qryaberturaCodigo_Caixa: TIntegerField;
    qryaberturaValor: TFloatField;
    qryaberturaAcerto: TIntegerField;
    qryaberturaDescricao: TStringField;
    qryaberturaCaixa: TStringField;
    qryaberturaCodigo_Usuario: TIntegerField;
    qryaberturaNome: TStringField;
    BBtnImprimir: TToolButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnFechar_CaixaClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnImprimirClick(Sender: TObject);
  private
    Util: UGeral.TUtil;
    Fechamento: URegistro.TFechamento_Caixa;
    flagfiscal: integer;
    dataa: TDate;
    sArquivo: TextFile;
    caix: AnsiString;
    R07: TR07;
    R02: TR02;
    R03: TR03;
    procedure DAV_Emitidos;
    procedure Cancela_Pre_Venda;
    procedure Data_Pre_Venda_Cancelada(Dias: integer);
    procedure Movimento_ECF;
    procedure MovimentacaoECF(NomeArquivo:AnsiString; Data: TDate);
    procedure Cria01(Data: TDate);
    procedure Cria02(Data: TDate);
    procedure Cria03(Data: TDate);
    procedure Cria04(Data: TDate);
    procedure Cria05(Data: TDate);
    procedure Cria06(Data: TDate);
    procedure Cria07(Data: TDate);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechamento_Caixa: TFrmFechamento_Caixa;

implementation

uses UMenu_Geral, UDeclaracao, UDM, URel_Fechamento_Caixa_Selecionado;

{$R *.dfm}
procedure TFrmFechamento_Caixa.DAV_Emitidos;
var
  qAux: TADOQuery;
  aux, cIndice, cDescricao: AnsiString;
begin
  qAux:= TADOQuery.Create(self);
  //Captura_Data_Movimento;
  ECF.Pega_Data_Movimento;
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select P.N_Pedido, P.Data_Venda, P.Tipo, P.Total_Pedido, P.COO, P.COO_Vin, P.DAVC from Pedido P');
    add('where P.Data_Venda = :DI and P.Tipo = :Tipo and P.DAVC = :DAVC');
    Parameters.ParamByName('DI').Value:= dataf;
    Parameters.ParamByName('Tipo').Value:= 'DAV-OS';
    Parameters.ParamByName('DAVC').Value:= 'SIM';
    open;
  end;

  if (qAux.IsEmpty = false) then
  begin
    cIndice:= '4';
    cDescricao:= 'DAV-OS Emitidos';
    iRetorno:= Bematech_FI_NomeiaRelatorioGerencialMFD(PAnsiChar(cIndice), PAnsiChar(cDescricao));
    Analisa_iRetorno;

    iRetorno:= Bematech_FI_AbreRelatorioGerencialMFD(PAnsiChar(cIndice));
    Analisa_iRetorno;

    aux:= 'N�mero' + '       ' + 'Valor' + ' ' +#13+#10+#13+#10;
    iRetorno:= Bematech_FI_RelatorioGerencial(aux);
    Analisa_iRetorno;

    while not qAux.Eof do
    begin
      aux:= qAux.FieldByName('N_Pedido').AsString + ' ' + qAux.FieldByName('Total_Pedido').AsString + ' ' + #13+#10;
      iRetorno:= Bematech_FI_RelatorioGerencial(aux);
      Analisa_iRetorno;
      qAux.Next;
    end;

    {while not qAux.Eof do
    begin
      aux:= qAux.FieldByName('N_Pedido').AsString + ' ' + qAux.FieldByName('Data_Venda').AsString + ' ' +
            qAux.FieldByName('Tipo').AsString + ' ' + qAux.FieldByName('Total_Pedido').AsString + ' ' +
            qAux.FieldByName('COO').AsString + #13+#10;
      iRetorno:= Bematech_FI_RelatorioGerencial(aux);
      Analisa_iRetorno;
      qAux.Next;
    end;}
    //Bematech_FI_FechaRelatorioGerencial;
    //den_op:= 'RG';
    //Coleta_Dados_R06;
    //R06.Inserir_Outros(R06);
    //Processo_Concluido;
  end;
end;

procedure TFrmFechamento_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui � definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui � definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmFechamento_Caixa.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui � definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui � definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmFechamento_Caixa.Data_Pre_Venda_Cancelada(Dias: integer);
begin
  //Captura_Data_Movimento;
  ECF.Pega_Data_Movimento;
  dataa:= IncDay(StrToDateTime(dataf),dias);
end;

procedure TFrmFechamento_Caixa.Cancela_Pre_Venda;
var
  qAux, qAux2, qAux3, qAux4: TADOQuery;
  sCodigo, sDescricao, saliquota, sTipoQtde, sQtde, sValor, sTipo, sDesconto, tipo_desc, valor_desc, unid_med,
  sAcrecimo, cAcreDesc, cTipoAcreDesc, cValorAcreDesc: AnsiString;
  iConta: integer;
  estoque: double;
begin
  try
    Data_Pre_Venda_Cancelada(-1);
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    qAux3:= TADOQuery.Create(self);
    qAux4:= TADOQuery.Create(self);

    with qAux3, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.Codigo, Ped.N_Pre_Venda, Ped.Data_Venda from Pedido Ped');
      add('where Ped.Data_Venda = :Data and Ped.Tipo = :Pre and Ped.Status = :Status');
      Parameters.ParamByName('Data').Value:= dataa;
      Parameters.ParamByName('Pre').Value:= 'PR�-VENDA';
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      open;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Estoque, P.Tipo,');
      add('P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN, P.Volume, P.Tipo_Tributacao from Produto P');
      open;
    end;

    if (qAux3.IsEmpty = false) then
    begin
      qAux3.First;
      while not qAux3.Eof do
      begin
        with qAux2, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo,');
          add('P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN from Itens_Pedido IP');
          add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
          add('where IP.Codigo = :Codigo ');//and IP.Cancelado = :N');
          Parameters.ParamByName('Codigo').Value:= qAux3.FieldByName('Codigo').AsString;
          //Parameters.ParamByName('N').Value:= 'N';
          open;
        end;

        iRetorno:= Bematech_FI_AbreCupom('');
        Analisa_iRetorno;

        while not qAux2.Eof do
        begin
          qAux.Locate('Codigo', qAux2.FieldByName('Codigo_Produto').AsInteger, []);

          //Pega_ICMS_NC(qAux.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
          //Pega_ISS(qAux.FieldByName('Codigo_Grupo_Tributacao_ISSQN').AsInteger);

          sCodigo    := qAux.FieldByName('Codigo_Venda').AsString;
          sDescricao := Copy(qAux.FieldByName('Descricao').AsString,1,29);

          if (qAux2.FieldByName('ICMS').AsString = 'I') then
            sAliquota:= 'I1'
          else if (qAux2.FieldByName('ICMS').AsString = 'N') then
            sAliquota:= 'N1'
          else if (qAux2.FieldByName('ICMS').AsString = 'F') then
            sAliquota:= 'F1'
          else
            sAliquota:= qAux2.FieldByName('ICMS').AsString;

          sTipoQtde  := 'I';
          sQtde      := FormatFloat('#0.0,00', qAux2.FieldByName('Qtde').AsFloat);
          sValor     := FormatFloat('#0.0,00', qAux2.FieldByName('Valor_Unitario').AsFloat);

          //if (qAux2.FieldByName('Tipo_Desconto').AsString = '%') then
            //sTipo:= '%'
          //else
            sTipo:= '$';

          //sDesconto  := FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat);
          //sAcrecimo  := FormatFloat('#0.0,0', qAux2.FieldByName('Acrecimo').AsFloat);
          sDesconto  := '0';
          sAcrecimo  := '0';
          unid_med:= qAux2.FieldByName('UN').AsString;

          iRetorno:= Bematech_FI_VendeItemDepartamento(PAnsiChar(scodigo), PAnsiChar(sdescricao),
                                                       PAnsiChar(saliquota), PAnsiChar(svalor),
                                                       PAnsiChar(sqtde), PAnsiChar(sAcrecimo),
                                                       PAnsiChar(sdesconto), PAnsiChar('00'), PAnsiChar(unid_med));
          Analisa_iRetorno;

          if (iRetorno = 1) then
          begin
            if (qAux2.FieldByName('Cancelado').AsString = 'S') then
            begin
              iRetorno:= Bematech_FI_CancelaItemAnterior;
              Analisa_iRetorno;
            end;
          end;

          qAux2.Next;
        end;

        cTipoAcreDesc:= '$';
        cAcreDesc:= 'D';
        cValorAcreDesc:= '0,00';
        iRetorno:= Bematech_FI_IniciaFechamentoCupom(PAnsiChar(cAcreDesc), PAnsiChar(cTipoAcreDesc), PAnsiChar(cValorAcreDesc));
        Analisa_iRetorno;

        iRetorno:= Bematech_FI_TerminaFechamentoCupom(#13+#10 + 'MD5 - ' + pMD5_Arquivos +
                                                      #13+#10 + 'PV' + qAux3.FieldByName('N_Pre_Venda').AsString);
        if (iRetorno = 1) then
        begin
          den_op:= 'RV';
          Coleta_Dados_R06;
          R06.Inserir_Outros(R06);
          R06.Inserir_Outros_Aux(R06);
        end;

        //iRetorno:= Bematech_FI_CancelaCupom;

        //AlteraGT;

        with qAux4, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Pedido set Status = :Status');
          add('where N_Pre_Venda = :N_Pre_Venda');
          Parameters.ParamByName('Status').Value:= 'CANCELADO';
          Parameters.ParamByName('N_Pre_Venda').Value:= qAux3.FieldByName('N_Pre_Venda').AsString;
          ExecSQL;
        end;

        qAux3.Next;
      end;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
    FreeAndNil(qAux3);
    FreeAndNil(qAux4);
  end;
end;

procedure TFrmFechamento_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmFechamento_Caixa.BBtnFechar_CaixaClick(Sender: TObject);
var
  data, tempo: AnsiString;
begin
  if Application.MessageBox('Deseja realizar o fechamento do caixa agora?', 'Aten��o', Mb_YesNo + Mb_IconQuestion) = idyes then
  begin
    if (gera_os = '0101') then
      DAV_Emitidos;

    Cancela_Pre_Venda;
    issqn := '';
    //CapturaContadoresECF;
    ECF.Pega_Contadores;
    Busca_Dados_SoftwareHouse;
    //Captura_Data_Movimento;
    ECF.Pega_Data_Movimento;
    //Captura_Venda_Bruta;
    ECF.Pega_Venda_Bruta_Diaria;
    data:= DateToStr(date);
    tempo:= TimeToStr(time);

    ECF.Efetua_Reducao_Z(data, tempo);
    //iRetorno:= Bematech_FI_ReducaoZ(PAnsiChar(data), PAnsiChar(tempo));
    //Analisa_iRetorno;
    // -------------------------------------R02 - RELA��O RED. Z--------------------------------------

    //Captura_Data_Hora_Reducao;
    ECF.Pega_Data_Hora_Reducao;
    //Grande_Total;
    ECF.Pega_Grande_Total;
    //Data_Hora_GravacaoSWBasicoMFAdicional;
    ECF.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
    //COO_INI_FIN;
    ECF.Pega_COO_Inicial_Final;
    //CapturaContadoresECF;
    ECF.Pega_Contadores;
    R02.Inserir(R02);
    R02.Inserir_Aux(R02);

    // -------------------------------------R03 - DETALHES RED. Z--------------------------------------
    //UDeclaracao.Totalizador_Parcial;
    ECF.Pega_Totalizador_Parcial;
    //R03.Inserir(R03);


    Movimento_ECF;
    iRetorno:= Bematech_FI_MapaResumoMFD;

    Habilitado:= false;
    Reducao := false;
    UDeclaracao.Insere_Historico(usuario, 'REALIZOU FECHAMENTO DE CAIXA.', TimeToStr(time), insercao, date);
    BBtnImprimir.Enabled:= false;
    BBtnFechar_Caixa.Enabled:= false;
    Houve_Reducao:= true;
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
    Processo_Concluido;
  end;
end;

procedure TFrmFechamento_Caixa.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Fechamento_Caixa_Selecionado:= TFrmRel_Fechamento_Caixa_Selecionado.create(self);
  FrmRel_Fechamento_Caixa_Selecionado.Release;
  FrmRel_Fechamento_Caixa_Selecionado:= Nil;
end;

procedure TFrmFechamento_Caixa.Movimento_ECF;
begin
  //Captura_Numero_Caixa;
  ECF.Pega_Numero_Caixa;
  Caix:= sequencia;
  sequencia:= Copy(sequencia,2,3);
  MovimentacaoECF(NomeArquivo, StrTodateTime(dataf));
end;

procedure TFrmFechamento_Caixa.MovimentacaoECF(NomeArquivo:AnsiString; Data: TDate);
var
  arq: AnsiString;
  serie, dataformatada: AnsiString;
begin
  setlength( registroEAD, 256 );
  serie:= Copy(nu_serie,7,14);
  dataformatada:= FormatDateTime('DDMMYYYY', StrToDateTime(dataf));
  NomeArquivo := Local_Arquivo(14) + CIECF + serie + dataformatada + '.txt';
  AssignFile(sArquivo, NomeArquivo);
  Rewrite(sArquivo);
  Cria01(Data);
  Cria02(Data);
  Cria03(Data);
  Cria04(Data);
  Cria05(Data);
  Cria06(Data);
  Cria07(Data);
  CloseFile(sArquivo);
  Sleep(2000);
  generateEAD(NomeArquivo, cChavePublica, cChavePrivada, registroEAD, 1);
  Arquivo_Gerado(NomeArquivo);
end;

procedure TFrmFechamento_Caixa.Cria01(Data: TDate);
var
  hora, fdata, data2: Ansistring;
  data3: TDAte;
begin
    //Versao_Impressora;
    ECF.Pega_Versao_Impressora;
    Busca_Dados_SoftwareHouse;

    cnpj_usu:= StringReplace(cnpj, '.', '', [rfReplaceAll]);
    cnpj_usu:= StringReplace(cnpj, '/', '', [rfReplaceAll]);
    cnpj_usu:= StringReplace(cnpj, '-', '', [rfReplaceAll]);
    insc_est_usu:= StringReplace(insc_estadual, '-', '', [rfReplaceAll]);
    insc_est_usu:= StringReplace(insc_estadual, '.', '', [rfReplaceAll]);

    cnpj_des:= StringReplace(cnpj_des, '.', '', [rfReplaceAll]);
    cnpj_des:= StringReplace(cnpj_des, '\', '', [rfReplaceAll]);
    cnpj_des:= StringReplace(cnpj_des, '/', '', [rfReplaceAll]);
    cnpj_des:= StringReplace(cnpj_des, '-', '', [rfReplaceAll]);
    insc_est_des:= StringReplace(insc_est_des, '-', '', [rfReplaceAll]);
    insc_est_des:= StringReplace(insc_est_des, '.', '', [rfReplaceAll]);
    insc_mun_des:= StringReplace(insc_mun_des, '-', '', [rfReplaceAll]);
    insc_mun_des:= StringReplace(insc_mun_des, '.', '', [rfReplaceAll]);

    versao_paf:= StringReplace(versao_paf, '.', '', [rfReplaceAll]);
    versao_er_paf:= StringReplace(versao_er_paf, '.', '', [rfReplaceAll]);

    fdata:= data_gra;
    data2:= Copy(fdata, 1,10);
    hora:= copy(fdata,12,8);
    data3:= StrToDateTime(data2);
    data2:= FormatDateTime('YYYYMMDD', data3);
    hora:= FormatDateTime('HHMMSS', StrToTime(hora));

    d_ini:= FormatDateTime('YYYYMMDD', Data);
    d_fim:= FormatDateTime('YYYYMMDD', Data);

    tipo:= StringReplace(tipo, '-', '',[rfReplaceAll]);
    smodelo:= StringReplace(smodelo, '-','',[rfReplaceAll]);

    writeln(sArquivo, 'R01' + nu_serie + StringOfChar(' ', 20-Length(nu_serie)) +
                              mf + StringOfChar(' ', 1-Length(mf)) +
                              tipo + StringOfChar(' ', 7-Length(tipo)) +
                              marca + StringOfChar(' ', 20-Length(marca)) +
                              smodelo + StringOfChar(' ', 20-Length(smodelo)) +
                              versao_sb + StringOfChar(' ', 10-Length(versao_sb)) +
                              data2 + StringOfChar(' ', 8-Length(data2)) +
                              hora + StringOfChar(' ', 6-Length(hora)) +
                              StringOfChar('0', 3-Length(sequencia)) + sequencia +
                              StringOfChar('0', 14-Length(cnpj_usu)) + cnpj_usu +
                              insc_est_usu + StringOfChar(' ', 14-Length(insc_est_usu)) +
                              StringOfChar('0', 14-Length(cnpj_des)) + cnpj_des +
                              StringOfChar('0', 14-Length(insc_est_des)) + insc_est_des +
                              StringOfChar('0', 14-Length(insc_mun_des)) + insc_mun_des +
                              deno_des + StringOfChar(' ', 40-Length(deno_des)) +
                              nome_paf + StringOfChar(' ', 40-Length(nome_paf)) +
                              versao_paf + StringOfChar(' ', 10-Length(versao_paf)) +
                              pMD5 + StringOfChar(' ', 32-Length(pMD5)) +
                              d_ini + StringOfChar(' ', 8-Length(d_ini)) +
                              d_fim + StringOfChar(' ', 8-Length(d_fim)) +
                              versao_er_paf + StringOfChar(' ', 4-Length(versao_er_paf)));
end;

procedure TFrmFechamento_Caixa.Cria02(Data: TDate);
var
  qAux: TADOQuery;
  fdata: TDate;
  data_red1, data_red2, data_red3, data_movimento: AnsiString;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R02 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      crz:= qAux.FieldByName('CRZ').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      cro:= qAux.FieldByName('CRO').AsString;

      data_movimento:= FormatDateTime('YYYYMMDD', qAux.FieldByName('Data_Movimento').AsDateTime);
      data_red1:= copy(qAux.FieldByName('Data_Emissao').Value, 1,2);
      data_red1:= data_red1 + '/';
      data_red2:= copy(qAux.FieldByName('Data_Emissao').Value, 3,2);
      data_red2:= data_red1 + data_red2 + '/';
      data_red3:= copy(qAux.FieldByName('Data_Emissao').Value, 5,2);
      data_red3:= data_red2 + data_red3;

      data_reducao:= FormatDateTime('YYYYMMDD', StrToDate(data_red3));
      hora_reducao:= qAux.FieldByName('Hora_Emissao').Value;
      venda_bruta_diaria:= qAux.FieldByName('Venda_Bruta_Diaria').AsString;
      venda_bruta_diaria:= copy(venda_bruta_diaria,5,14);
      issqn:= qAux.FieldByName('Parametro_ECF').AsString;

      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);

      writeln(sArquivo, 'R02' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(crz)) + crz +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(cro)) + cro +
                                data_movimento + StringOfChar(' ', 8-Length(data_movimento)) +
                                data_reducao + StringOfChar(' ', 8-Length(data_reducao)) +
                                hora_reducao + StringOfChar(' ', 6-Length(hora_reducao)) +
                                StringOfChar('0', 14-Length(venda_bruta_diaria)) + venda_bruta_diaria +
                                issqn + StringOfChar('S', 1-Length(issqn)));
        qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Caixa.Cria03(Data: TDate);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R03 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      crz:= qAux.FieldByName('CRZ').AsString;
      cBuffer:= qAux.FieldByName('Totalizador_Parcial').AsString;
      cTotalizador:= qAux.FieldByName('Valor_Acumulado').AsString;
      cTotalizador:= Copy(cTotalizador,2,13);
      writeln(sArquivo, 'R03' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(crz)) + crz +
                                cBuffer + StringOfChar(' ', 7-Length(cBuffer)) +
                                StringOfChar('0', 13-Length(cTotalizador)) + cTotalizador);
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Caixa.Cria04(Data: TDate);
var
  qAux: TADOQuery;
  data_red1, data_red2, data_red3: AnsiString;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R04 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;

    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      ccf:= qAux.FieldByName('CCF').AsString;
      coo:= qAux.FieldByName('COO').AsString;

      if (qAux.FieldByName('Data_Inicio_Emissao').Value = '') then
        data_emissao:= ''
      else
      begin
        data_red1:= copy(qAux.FieldByName('Data_Inicio_Emissao').Value, 1,2);
        data_red1:= data_red1 + '/';
        data_red2:= copy(qAux.FieldByName('Data_Inicio_Emissao').Value, 3,2);
        data_red2:= data_red1 + data_red2 + '/';
        data_red3:= copy(qAux.FieldByName('Data_Inicio_Emissao').Value, 5,2);
        data_red3:= data_red2 + data_red3;
        data_emissao:= FormatDateTime('YYYYMMDD', StrToDate(data_red3));
      end;

      subtotal:= StringReplace(qAux.FieldByName('Sub_Total_Documento').AsString, ',', '', [rfReplaceAll]);
      desconto_subtotal:= StringReplace(qAux.FieldByName('Desconto').AsString, ',', '', [rfReplaceAll]);
      indicador_tipo_desc:= '$';
      acreci:= StringReplace(qAux.FieldByName('Acrecimo').AsString, ',', '', [rfReplaceAll]);
      indicador_tipo_acreci:= qAux.FieldByName('Tipo_Acrecimo').AsString;
      valor_total:= StringReplace(qAux.FieldByName('Valor_Total').AsString, ',','',[rfReplaceAll]);
      valor_total:= StringReplace(valor_total, '.','',[rfReplaceAll]);
      indicador_cancelamento:= qAux.FieldByName('Cancelamento').AsString;
      valor_can_acre:= StringReplace(qAux.FieldByName('Valor_Cancelamento_Acrecimo').AsString, ',','',[rfReplaceAll]);
      valor_can_acre:= StringReplace(valor_can_acre, '.','',[rfReplaceAll]);
      indicador_desc_acre:= qAux.FieldByName('Indicador_Acre_Desc').AsString;
      adquirente:= qAux.FieldByName('Adquirente').AsString;
      cnpj_adquirente:= qAux.FieldByName('CPF_CNPJ').AsString;

      writeln(sArquivo, 'R04' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(ccf)) + ccf +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                data_emissao + StringOfChar(' ', 8-Length(data_emissao)) +
                                StringOfChar('0', 14-Length(subtotal)) + subtotal +
                                StringOfChar('0', 13-Length(desconto_subtotal)) + desconto_subtotal +
                                indicador_tipo_desc + StringOfChar(' ', 1-Length(indicador_tipo_desc)) +
                                StringOfChar('0', 13-Length(acreci)) + acreci +
                                indicador_tipo_acreci + StringOfChar(' ', 1-Length(indicador_tipo_acreci)) +
                                StringOfChar('0', 14-Length(valor_total)) + valor_total +
                                indicador_cancelamento + StringOfChar(' ', 1-Length(indicador_cancelamento)) +
                                StringOfChar('0', 13-Length(valor_can_acre)) + valor_can_acre +
                                indicador_desc_acre + StringOfChar(' ', 1-Length(indicador_desc_acre)) +
                                adquirente + StringOfChar(' ', 40-Length(adquirente)) +
                                StringOfChar('0', 14-Length(cnpj_adquirente)) + cnpj_adquirente);
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Caixa.Cria05(Data: TDate);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R05 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      ccf:= qAux.FieldByName('CCF').AsString;
      n_item:= qAux.FieldByName('N_Item').AsString;
      n_item:= Copy(n_item,2,3);
      cod_prod:= qAux.FieldByName('Codigo_Produto').AsString;
      descricao:= qAux.FieldByName('Descricao').AsString;
      qtde:= StringReplace(qAux.FieldByName('Quantidade').AsString, ',','',[rfReplaceAll]);
      unid:= qAux.FieldByName('Unidade').AsString;
      valor_un:= StringReplace(qAux.FieldByName('Valor_Unitario').AsString, ',','',[rfReplaceAll]);
      desc_item:= StringReplace(qAux.FieldByName('Desconto').AsString, ',','',[rfReplaceAll]);
      acre_item:= StringReplace(qAux.FieldByName('Acrecimo').AsString, ',','',[rfReplaceAll]);
      valor_total_item:= StringReplace(qAux.FieldByName('Valor_Total').AsString, ',','',[rfReplaceAll]);
      tot_par:= qAux.FieldByName('Totalizador_Parcial').AsString;
      indicador_cancelamento_item:= qAux.FieldByName('Cancelamento').AsString;
      qtde_cancelada:= StringReplace(qAux.FieldByName('Quantidade_Cancelada').AsString, ',','',[rfReplaceAll]);
      valor_cancelado:= StringReplace(qAux.FieldByName('Valor_Cancelado').AsString, ',','',[rfReplaceAll]);
      can_acre:= StringReplace(qAux.FieldByName('Valor_Cancelamento_Acrecimo').AsString, ',','',[rfReplaceAll]);
      IAT:= qAux.FieldByName('IAT').AsString;
      IPPT:= qAux.FieldByName('IPPT').AsString;
      casa_decimal_qtde:= qAux.FieldByName('Casas_Decimais_Qtde').AsString;
      casa_decimal_val_un:= qAux.FieldByName('Casas_Decimais_Valor_Unitario').AsString;

      writeln(sArquivo, 'R05' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(ccf)) + ccf +
                                StringOfChar('0', 3-Length(n_item)) + n_item +
                                cod_prod + StringOfChar(' ', 14-Length(cod_prod)) +
                                descricao + StringOfChar(' ', 100-Length(descricao)) +
                                StringOfChar('0', 7-Length(qtde)) + qtde +
                                unid + StringOfChar(' ', 3-Length(unid)) +
                                StringOfChar('0', 8-Length(valor_un)) + valor_un +
                                StringOfChar('0', 8-Length(desc_item)) + desc_item +
                                StringOfChar('0', 8-Length(acre_item)) + acre_item +
                                StringOfChar('0', 14-Length(valor_total_item)) + valor_total_item +
                                tot_par + StringOfChar(' ', 7-Length(tot_par)) +
                                indicador_cancelamento_item + StringOfChar(' ', 1-Length(indicador_cancelamento_item)) +
                                StringOfChar('0', 7-Length(qtde_cancelada)) + qtde_cancelada +
                                StringOfChar('0', 13-Length(valor_cancelado)) + valor_cancelado +
                                StringOfChar('0', 13-Length(can_acre)) + can_acre +
                                IAT + StringOfChar(' ', 1-Length(IAT)) +
                                IPPT + StringOfChar(' ', 1-Length(IPPT)) +
                                StringOfChar('0', 1-Length(casa_decimal_qtde)) + casa_decimal_qtde +
                                StringOfChar('0', 1-Length(casa_decimal_val_un)) + casa_decimal_val_un);
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Caixa.Cria06(Data: TDate);
var
  qAux: TADOQuery;
  aux1, aux2, aux3, aux4: AnsiString;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R06 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      gnf:= qAux.FieldByName('GNF').AsString;
      grg:= qAux.FieldByName('GRG').AsString;
      cdc:= qAux.FieldByName('CDC').AsString;
      denominacao:= qAux.FieldByName('Denominacao').AsString;

      //ver data final emiss�o
      aux1:= Copy(qAux.FieldByName('Data_Final_Emissao').AsString, 1,2);
      aux2:= Copy(qAux.FieldByName('Data_Final_Emissao').AsString, 3,2);
      aux3:= Copy(qAux.FieldByName('Data_Final_Emissao').AsString, 5,2);
      aux4:= aux1 + '/' + aux2 + '/' + aux3;

      data_final_emissao:= FormatDateTime('YYYYMMDD', StrToDateTime(aux4));
      hora_final_emissao:= qAux.FieldByName('Hora_Final_Emissao').AsString;

      writeln(sArquivo, 'R06' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(gnf)) + gnf +
                                StringOfChar('0', 6-Length(grg)) + grg +
                                StringOfChar('0', 4-Length(cdc)) + cdc +
                                denominacao + StringOfChar(' ', 2-Length(denominacao)) +
                                data_final_emissao + StringOfChar(' ', 8-Length(data_final_emissao)) +
                                hora_final_emissao + StringOfChar(' ', 6-Length(hora_final_emissao)));
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Caixa.Cria07(Data: TDate);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R07 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin

      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      ccf:= qAux.FieldByName('CCF').AsString;
      gnf:= qAux.FieldByName('GNF').AsString;
      meio_pagamento:= qAux.FieldByName('Meio_Pagamento').AsString;
      valor_pago:= StringReplace(qAux.FieldByName('Valor_Pago').AsString, ',','',[rfReplaceAll]);
      estorno:= qAux.FieldByName('Estorno').AsString;
      valor_estornado:= StringReplace(qAux.FieldByName('Valor_Estorno').AsString, ',','',[rfReplaceAll]);

      writeln(sArquivo, 'R07' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(ccf)) + ccf +
                                StringOfChar('0', 6-Length(gnf)) + gnf +
                                meio_pagamento + StringOfChar(' ', 15-Length(meio_pagamento)) +
                                StringOfChar('0', 13-Length(valor_pago)) + valor_pago +
                                estorno + StringOfChar(' ', 1-Length(estorno)) +
                                StringOfChar('0', 13-Length(valor_estornado)) + valor_estornado);
      qAux.Next;
    end;
    write(sArquivo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmFechamento_Caixa.Free;
  FrmFechamento_Caixa:= Nil;
end;

procedure TFrmFechamento_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    //Captura_Data_Movimento;
    ECF.Pega_Data_Movimento;
    with qryfechamento, sql do
    begin
      close;
      clear;
      add('select FV.Forma_Pagamento, FV.Data, sum(FV.Valor - FV.Troco) as Valor, FV.Tipo_Documento');
      add('from Fechamento_Venda FV');
      add('where FV.Codigo_Empresa = :Empresa and FV.Data = :Dat and FV.Status = :Pago');
      add('group by FV.Forma_Pagamento, FV.Data, FV.Tipo_Documento');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Dat').Value:= dataf;
      Parameters.ParamByName('Pago').Value:= 'PAGO';
      open;
    end;

    with qryabertura, sql do
    begin
      close;
      clear;
      add('select AC.*, CP.Descricao, CU.Nome, C.Caixa from Abertura_Caixa AC');
      add('inner join Condicao_Pagamento CP on (AC.Codigo_Forma_Pagamento = CP.Codigo)');
      add('inner join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
      add('inner join Caixa C on (AC.Codigo_Caixa = C.Codigo)');

      add('where AC.Data_Abertura = :Dat');
      Parameters.ParamByName('Dat').Value:= dataf;
      open;
    end;
    BBtnFechar_Caixa.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmFechamento_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
