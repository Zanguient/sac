unit UAcerto_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, UGeral, URegistro,
  DB, ADODB, Grids, DBGrids, DateUtils, ACBrECFClass, TLoggerUnit;

type
  TFrmAcerto_Caixa = class(TForm)
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
    qryaberturaValor: TFloatField;
    qryaberturaDescricao: TStringField;
    qryaberturaAcerto: TIntegerField;
    LblMarca: TLabel;
    EdtEntrada: TEdit;
    Label1: TLabel;
    EdtSaida: TEdit;
    Label2: TLabel;
    EdtSaldo: TEdit;
    Label3: TLabel;
    EdtAcerto: TEdit;
    Label4: TLabel;
    EdtFechamento: TEdit;
    BBtnImprimir: TToolButton;
    qryaberturaCodigo_Usuario: TIntegerField;
    qryaberturaNome: TStringField;
    qryfechamentoTipo: TStringField;
    CBFinalizar_Movimento: TCheckBox;
    BBtnNovo: TToolButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnFechar_CaixaClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtAcertoExit(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure EdtFechamentoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Util: UGeral.TUtil;
    Fechamento: URegistro.TFechamento_Caixa;
    Acerto: URegistro.TAcerto_Caixa;
    flagfiscal: integer;
    dataa: TDate;
    sArquivo: TextFile;
    caix: AnsiString;
    R02: TR02;
    R03: TR03;

    procedure Calcula_Total;
    procedure Escreve_Texto;
    procedure Finaliza_Movimento;
    procedure DAV_Emitidos;
    procedure Movimento_ECF;
    procedure Cria01(Data: TDate);
    procedure Cria02(Data: TDate);
    procedure Cria03(Data: TDate);
    procedure Cria04(Data: TDate);
    procedure Cria05(Data: TDate);
    procedure Cria06(Data: TDate);
    procedure Cria07(Data: TDate);
    procedure MovimentacaoECF(NomeArquivo: AnsiString; Data: TDate);
    procedure Imprime_Fechamento_Operador;
    function Verifica_Movimento_Ja_Gravado(N_Fabricacao: AnsiString; Data_Movimento: AnsiString): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcerto_Caixa: TFrmAcerto_Caixa;

implementation

uses UMenu_Geral, UDeclaracao, UDM, URel_Acerto_Caixa_Selecionado,
  Util.Mensagens, Modelo.Dominio.TContaCorrenteDominio,
  Modelo.Dominio.TLancamentoCaixaDominio;

{$R *.dfm}
procedure TFrmAcerto_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  if qryfechamentoTipo.AsString = '+' then
    DBGrid1.Canvas.Font.Color:= clGreen
  else
    DBGrid1.Canvas.Font.Color:= clRed;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmAcerto_Caixa.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmAcerto_Caixa.EdtAcertoExit(Sender: TObject);
begin
  if (EdtAcerto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtAcerto.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtAcerto, StrToFloat(EdtAcerto.Text));
end;

procedure TFrmAcerto_Caixa.EdtFechamentoEnter(Sender: TObject);
var
  Saldo, Acerto, Total: Double;
begin
  Saldo:= StrToFloat(EdtSaldo.Text);
  Acerto:= StrToFloat(EdtAcerto.Text);
  Total:= Saldo - Acerto;
  Util.FormataFloat(2, EdtFechamento, Total);
end;

procedure TFrmAcerto_Caixa.Escreve_Texto;
begin
  EdtEntrada.Text:= '0,00';
  EdtSaida.Text:= '0,00';
  EdtSaldo.Text:= '0,00';
  EdtAcerto.Text:= '0,00';
  EdtFechamento.Text:= '0,00';
end;

procedure TFrmAcerto_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAcerto_Caixa.Imprime_Fechamento_Operador;
var
  sAux: TADOQuery;
  Descricao, Tipo_Documento, Valor, Data: AnsiString;
  cindice, cdescricao: String;
  aux: Ansistring;
  RG       : TACBrECFRelatorioGerencial;
begin

  //iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
  //Analise_Impressora.Analisa_iRetorno;
  try
    try
      if (qryfechamento.IsEmpty = false) then
      begin
        cdescricao:= 'FECH. OPERADOR';
        dm.ACBrECF1.CarregaRelatoriosGerenciais;

        RG  :=  dm.ACBrECF1.AchaRGDescricao(cdescricao);

        if (RG = Nil) then
          dm.ACBrECF1.ProgramaRelatoriosGerenciais(cdescricao, '');

        cindice:= ECF.Acha_RG_Descricao(cdescricao);
        dm.ACBrECF1.AbreRelatorioGerencial(StrToInt(cindice));

        aux:= 'Meio de Pag.' + '   ' + 'Tipo' + '         ' + 'Valor' + '     ' + 'Data' + #13+#10+#13+#10;

        ECF.Imprime_Relatorio_Gerencial(aux);
        sAux:= TADOQuery.Create(self);

        qryfechamento.First;
        while not qryfechamento.Eof do
        begin
          Descricao:= qryfechamentoForma_Pagamento.AsString;
          Tipo_Documento:= qryfechamentoTipo_Documento.AsString;
          Valor:= FormatFloat('#0.0,0', qryfechamentoValor.AsFloat);
          Data:= qryfechamentoData.AsString;

          aux:= Descricao + StringOfChar(' ',15 - Length(Descricao)) +
                Tipo_Documento + StringOfChar(' ',13 - Length(Tipo_Documento)) +
                Valor + StringOfChar(' ',10 - Length(Valor)) + Data + #13+#10;

          dm.ACBrECF1.LinhaRelatorioGerencial(aux);
          //iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
          //Analise_Impressora.Analisa_iRetorno;
          qryfechamento.Next;
        end;

        aux:= '--------- SOMA TOTAL ---------' +#13+#10;

        dm.ACBrECF1.LinhaRelatorioGerencial(aux);

        with sAux, sql do
        begin
          close;
          clear;
          Connection:=  dm.ADOConnection1;
          add('select sum(FE.Valor) as Valor from Fechamento_Venda FE');
          add('where Data between :DI and :DF and FE.Status = :Status and (FE.Tipo_Documento = :Tipo1 or FE.Tipo_Documento = :Tipo2 or FE.Tipo_Documento = :Tipo3)');
          add('and FE.Acerto = :Acerto');
          //add('group by FE.Forma_Pagamento');
          Parameters.ParamByName('DI').Value:= StrToDateTime(dataf);
          Parameters.ParamByName('DF').Value:= StrToDateTime(dataf);
          Parameters.ParamByName('Status').Value:= 'PAGO';
          Parameters.ParamByName('Tipo1').Value:= 'CUPOM FISCAL';
          Parameters.ParamByName('Tipo2').Value:= 'SUPRIMENTO';
          Parameters.ParamByName('Tipo3').Value:= 'SANGRIA';
          Parameters.ParamByName('Acerto').Value:= 0;
          open;
        end;

        aux:= 'TOTAL TURNO: ' + ' = ' + FormatFloat('#0.0,0',sAux.FieldByName('Valor').AsFloat) + #13+#10;
        dm.ACBrECF1.LinhaRelatorioGerencial(aux);

        with sAux, sql do
        begin
          close;
          clear;
          Connection:=  dm.ADOConnection1;
          add('select sum(FE.Valor) as Valor from Fechamento_Venda FE');
          add('where Data between :DI and :DF and FE.Status = :Status and (FE.Tipo_Documento = :Tipo1 or FE.Tipo_Documento = :Tipo2 or FE.Tipo_Documento = :Tipo3)');
          //add('and FE.Acerto = :Acerto');
          //add('group by FE.Forma_Pagamento');
          Parameters.ParamByName('DI').Value:= StrToDateTime(dataf);
          Parameters.ParamByName('DF').Value:= StrToDateTime(dataf);
          Parameters.ParamByName('Status').Value:= 'PAGO';
          Parameters.ParamByName('Tipo1').Value:= 'CUPOM FISCAL';
          Parameters.ParamByName('Tipo2').Value:= 'SUPRIMENTO';
          Parameters.ParamByName('Tipo3').Value:= 'SANGRIA';
          //Parameters.ParamByName('Acerto').Value:= 0;
          open;
        end;

        aux:= 'TOTAL DIÁRIO: ' + ' = ' + FormatFloat('#0.0,0',sAux.FieldByName('Valor').AsFloat);
        dm.ACBrECF1.LinhaRelatorioGerencial(aux);

      end;
    Except
      abort;
    end;
  finally
    ECF.Fecha_Relatorio;
    FreeAndNil(sAux);
    Insere_Historico(usuario, 'GEROU RELATÓRIO DE MEIOS DE PAGAMENTO PELO ECF.', TimeToStr(time), consu, date);
  end;

end;

procedure TFrmAcerto_Caixa.BBtnFechar_CaixaClick(Sender: TObject);
var
  data, tempo: AnsiString;
  LancamentoCaixaDominio: TLancamentoCaixaDominio;
  MD5GeradoFechamento : AnsiString;
begin
  if Application.MessageBox('Deseja realizar o acerto do caixa agora?', 'Atenção', Mb_YesNo + Mb_IconQuestion) = idyes then
  begin
    if (CBFinalizar_Movimento.Checked) then
    begin
      Finaliza_Movimento;
    end;

    {if (tipo_local = '0101') then
    begin
      Imprime_Fechamento_Operador;
    end;}

    Atualiza_Abertura;
    Atualiza_Fechamento;
    Acerto.Inserir(Acerto);
    LancamentoCaixaDominio:= TLancamentoCaixaDominio.Create(dm.ADOConnection1);
    LancamentoCaixaDominio.AtualizaSaldoCaixa(codigo_usu, StrToFloat(EdtFechamento.Text));

    qryfechamento.First;
    while not qryfechamento.Eof do
    begin
      Fechamento.Inserir(Fechamento);
      qryfechamento.Next;
    end;

    UDeclaracao.Insere_Historico(usuario, 'REALIZOU ACERTO DE CAIXA.', TimeToStr(time), insercao, date);
    BBtnFechar_Caixa.Enabled:= false;
    BBtnImprimir.Enabled:= true;
    UDeclaracao.codigo_caixa:= 0;
    FrmMenu_Geral.StbStatus.Panels[5].Text := 'Caixa - NÃO IDENTIFICADO';
    Processo_Concluido;
  end;
end;

procedure TFrmAcerto_Caixa.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Acerto_Caixa_Selecionado:= TFrmRel_Acerto_Caixa_Selecionado.create(self);
  FrmRel_Acerto_Caixa_Selecionado.Release;
  FrmRel_Acerto_Caixa_Selecionado:= Nil;
end;

procedure TFrmAcerto_Caixa.BBtnNovoClick(Sender: TObject);
begin
  if (tipo_local = '0101') then
  begin
    Verifica_Erros_Ao_Gerar_Cupom;
    ECF.Pega_Data_Movimento;
    CBFinalizar_Movimento.Checked:= true;
  end
  else
  begin
    CBFinalizar_Movimento.Checked:= false;
  end;

  BBtnImprimir.Enabled:= false;
  Escreve_Texto;

  with qryfechamento, sql do
  begin
    close;
    clear;
    add('select FV.Forma_Pagamento, FV.Data, sum(FV.Valor - FV.Troco) as Valor, FV.Tipo_Documento, FV.Tipo');
    add('from Fechamento_Venda FV');
    add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Caixa = :Caixa and FV.Data = :Dat and FV.Status = :Pago');
    add('and FV.Acerto = :Acerto and FV.Codigo_Usuario = :Usuario and FV.Movimenta = :Movimenta');
    add('group by FV.Forma_Pagamento, FV.Data, FV.Tipo_Documento, FV.Tipo');
    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('Caixa').Value:= UDeclaracao.codigo_caixa;

    if (tipo_local = '0101') then
      Parameters.ParamByName('Dat').Value:= dataf
    else
      Parameters.ParamByName('Dat').Value:= date;

    Parameters.ParamByName('Pago').Value:= 'PAGO';
    Parameters.ParamByName('Acerto').Value:= 0;
    Parameters.ParamByName('Usuario').Value:= UDeclaracao.codigo_usu;
    Parameters.ParamByName('Movimenta').Value:= '0';
    open;
  end;

  with qryabertura, sql do
  begin
    close;
    clear;
    add('select AC.*, CP.Descricao, CU.Nome from Abertura_Caixa AC');
    add('left join Condicao_Pagamento CP on (AC.Codigo_Forma_Pagamento = CP.Codigo)');
    add('left join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
    //add('inner join Caixa C on (AC.Codigo_Caixa = C.Codigo)');

    add('where AC.Data_Abertura = :Dat and AC.Codigo_Caixa = :Caixa and AC.Acerto = :Acerto and AC.Codigo_Usuario = :Usuario');

    if (tipo_local = '0101') then
      Parameters.ParamByName('Dat').Value:= dataf
    else
      Parameters.ParamByName('Dat').Value:= date;

    Parameters.ParamByName('Caixa').Value:= UDeclaracao.codigo_caixa;
    Parameters.ParamByName('Acerto').Value:= 0;
    Parameters.ParamByName('Usuario').Value:= UDeclaracao.codigo_usu;
    open;
  end;

  BBtnFechar_Caixa.Enabled:= true;

  if (qryabertura.IsEmpty) or (qryfechamento.IsEmpty) then
  begin
    Mensagem_Fim_Pesquisa;
    abort;
  end;

  Calcula_Total;
end;

procedure TFrmAcerto_Caixa.Calcula_Total;
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
      add('select sum(Valor - Troco) as Credito from Fechamento_Venda FV');
      add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Caixa = :Caixa and FV.Data = :Dat and FV.Status = :Pago');
      add('and FV.Acerto = :Acerto and FV.Codigo_Usuario = :Usuario and FV.Tipo = :Tipo and FV.Movimenta = :Movimenta');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Caixa').Value:= UDeclaracao.codigo_caixa;

      if (tipo_local = '0101') then
        Parameters.ParamByName('Dat').Value:= dataf
      else
        Parameters.ParamByName('Dat').Value:= date;

      Parameters.ParamByName('Pago').Value:= 'PAGO';
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= UDeclaracao.codigo_usu;
      Parameters.ParamByName('Tipo').Value:= '+';
      Parameters.ParamByName('Movimenta').Value:= '0';
      open;
    end;

    EdtEntrada.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Credito').AsFloat);
    EdtEntrada.Text:= StringReplace(EdtEntrada.Text, ThousandSeparator, '', [rfReplaceAll]);

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select sum(Valor - Troco) as Debito from Fechamento_Venda FV');
      add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Caixa = :Caixa and FV.Data = :Dat and FV.Status = :Pago');
      add('and FV.Acerto = :Acerto and FV.Codigo_Usuario = :Usuario and FV.Tipo = :Tipo and FV.Movimenta = :Movimenta');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Caixa').Value:= UDeclaracao.codigo_caixa;

      if (tipo_local = '0101') then
        Parameters.ParamByName('Dat').Value:= dataf
      else
        Parameters.ParamByName('Dat').Value:= date;

      Parameters.ParamByName('Pago').Value:= 'PAGO';
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= UDeclaracao.codigo_usu;
      Parameters.ParamByName('Tipo').Value:= '-';
      Parameters.ParamByName('Movimenta').Value:= '0';
      open;
    end;

    EdtSaida.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Debito').AsFloat);
    EdtSaida.Text:= StringReplace(EdtSaida.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtSaldo.Text:= FloatToStr(StrToFloat(EdtEntrada.Text) - StrToFloat(EdtSaida.Text)); //+ qryaberturaValor.AsFloat);
    EdtSaldo.Text:= StringReplace(EdtSaldo.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtAcerto.Text:= FormatFloat('#0.0,0', StrToFloat(EdtAcerto.Text));
    EdtAcerto.Text:= StringReplace(EdtAcerto.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtFechamento.Text:= FloatToStr(StrToFloat(EdtSaldo.Text) - StrToFloat(EdtAcerto.Text));
    EdtFechamento.Text:= StringReplace(EdtFechamento.Text, ThousandSeparator, '', [rfReplaceAll]);



  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAcerto_Caixa.DAV_Emitidos;
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

    aux:= 'Número' + '       ' + 'Valor' + ' ' +#13+#10+#13+#10;
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
    Bematech_FI_FechaRelatorioGerencial;
    den_op:= 'RG';
    Coleta_Dados_R06;
    R06.Inserir_Outros(R06);
    //Processo_Concluido;
  end;
end;

procedure TFrmAcerto_Caixa.Finaliza_Movimento;
var
  data, tempo: AnsiString;
begin
  try
    if (gera_os = '0101') then
      //DAV_Emitidos;

    //Cancela_Pre_Venda;
    issqn := '';
    ECF.Pega_Contadores;
    Busca_Dados_SoftwareHouse;
    ECF.Pega_Data_Movimento;
    ECF.Pega_Venda_Bruta_Diaria;

    data:= DateToStr(date);
    tempo:= TimeToStr(time);

    ECF.Pega_Data_Hora_Reducao;
    ECF.Pega_Grande_Total;
    ECF.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
    ECF.Pega_COO_Inicial_Final;

    if (Verifica_Movimento_Ja_Gravado(nu_serie, dataf) = false) then
    begin
      TLogger.GetInstance.Debug('Não encontrou movimento na tabela R02 para o ECF '+n_serie+' e a na data '+dataf+' .'+DateTimeToStr(now) );
      if (R02.Inserir(R02)) then
      begin
        ECF.Pega_Totalizador_Parcial;
      end
      else
      begin
        Application.MessageBox('Não foi possível gravar os dados do movimento.', 'Impossível gravar dados', MB_OK+MB_ICONHAND);
        abort;
      end;
    end
    else
    begin
      TLogger.GetInstance.Debug('Encontrou movimento na tabela R02 para o ECF '+n_serie+' e a na data '+dataf+' .'+DateTimeToStr(now) );
    end;

    ECF.Efetua_Reducao_Z(now);
    GerarRegistroPafEcf(dataf, dataf, 'Geral');
    //Movimento_ECF;
    Habilitado:= false;
    Reducao := false;
    Houve_Reducao:= true;
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
  except
    on e: Exception do
    begin
      TLogger.GetInstance.Error(Self.ClassName + '. Finaliza movimento. '+e.Message);
      TMensagens.MensagemErro('Erro ao finalizar o movimento: '+e.Message);
      //Application.MessageBox('Não foi possível finalizar o movimento. Certifique-se de que já houve fechamento do caixa no dia ou se o ECF está conectado.', 'Impossível finalizar o movimento', MB_OK+MB_ICONHAND);
      abort;
    end;
  end;
end;

function TFrmAcerto_Caixa.Verifica_Movimento_Ja_Gravado(N_Fabricacao: AnsiString; Data_Movimento: AnsiString): boolean;
var
  qAux: TADOQuery;
begin
  try
    Result:= false;
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select R02.N_Fabricacao, R02.Data_Movimento from R02');
      Add('where R02.N_Fabricacao = :N_Fabricacao and R02.Data_Movimento = :Data_Movimento');
      Parameters.ParamByName('N_Fabricacao').Value:= N_Fabricacao;
      Parameters.ParamByName('Data_Movimento').Value:= Data_Movimento;
      open;
      if (IsEmpty = false) then
        Result:= True;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAcerto_Caixa.Movimento_ECF;
begin
  //Captura_Numero_Caixa;
  ECF.Pega_Numero_Caixa;
  Caix:= sequencia;
  sequencia:= Copy(sequencia,2,3);
  MovimentacaoECF(NomeArquivo, StrTodateTime(dataf));
end;

procedure TFrmAcerto_Caixa.MovimentacaoECF(NomeArquivo:AnsiString; Data: TDate);
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

procedure TFrmAcerto_Caixa.Cria01(Data: TDate);
var
  hora, fdata, data2: Ansistring;
  data3: TDAte;
begin
    //Versao_Impressora;
    ECF.Pega_Versao_Impressora;
    //showmessage(UDeclaracao.data_gra);
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
    //data2:= Copy(fdata, 1,10);
    //hora:= copy(fdata,12,8);
    //data3:= StrToDateTime(data2);

    data2:= FormatDateTime('YYYYMMDD', StrToDateTime(fdata));
    //hora:= FormatDateTime('HHMMSS', StrToTime(hora));
    hora:= '      ';

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

procedure TFrmAcerto_Caixa.Cria02(Data: TDate);
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

procedure TFrmAcerto_Caixa.Cria03(Data: TDate);
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

procedure TFrmAcerto_Caixa.Cria04(Data: TDate);
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

procedure TFrmAcerto_Caixa.Cria05(Data: TDate);
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

procedure TFrmAcerto_Caixa.Cria06(Data: TDate);
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

      //ver data final emissão
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

procedure TFrmAcerto_Caixa.Cria07(Data: TDate);
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

procedure TFrmAcerto_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAcerto_Caixa.Free;
  FrmAcerto_Caixa:= Nil;
end;

procedure TFrmAcerto_Caixa.FormCreate(Sender: TObject);
begin
  if (tipo_local = '0101') then
  begin
    CBFinalizar_Movimento.Checked:= true;
    CBFinalizar_Movimento.Enabled:= true;
  end
  else
  begin
    CBFinalizar_Movimento.Checked:= false;
    CBFinalizar_Movimento.Enabled:= false;
  end;
end;

procedure TFrmAcerto_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
//    if (tipo_local = '0101') then
//      //Captura_Data_Movimento;
//      ECF.Pega_Data_Movimento;
//
//    BBtnImprimir.Enabled:= false;
//    Escreve_Texto;
//
//    with qryfechamento, sql do
//    begin
//      close;
//      clear;
//      add('select FV.Forma_Pagamento, FV.Data, sum(FV.Valor - FV.Troco) as Valor, FV.Tipo_Documento, FV.Tipo');
//      add('from Fechamento_Venda FV');
//      add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Caixa = :Caixa and FV.Data = :Dat and FV.Status = :Pago');
//      add('and FV.Acerto = :Acerto and FV.Codigo_Usuario = :Usuario and FV.Movimenta = :Movimenta');
//      add('group by FV.Forma_Pagamento, FV.Data, FV.Tipo_Documento, FV.Tipo');
//      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
//      Parameters.ParamByName('Caixa').Value:= UDeclaracao.codigo_caixa;
//
//      if (tipo_local = '0101') then
//        Parameters.ParamByName('Dat').Value:= dataf
//      else
//        Parameters.ParamByName('Dat').Value:= date;
//
//      Parameters.ParamByName('Pago').Value:= 'PAGO';
//      Parameters.ParamByName('Acerto').Value:= 0;
//      Parameters.ParamByName('Usuario').Value:= UDeclaracao.codigo_usu;
//      Parameters.ParamByName('Movimenta').Value:= '0';
//      open;
//    end;
//
//    with qryabertura, sql do
//    begin
//      close;
//      clear;
//      add('select AC.*, CP.Descricao, CU.Nome from Abertura_Caixa AC');
//      add('left join Condicao_Pagamento CP on (AC.Codigo_Forma_Pagamento = CP.Codigo)');
//      add('left join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
//      //add('inner join Caixa C on (AC.Codigo_Caixa = C.Codigo)');
//
//      add('where AC.Data_Abertura = :Dat and AC.Codigo_Caixa = :Caixa and AC.Acerto = :Acerto and AC.Codigo_Usuario = :Usuario');
//
//      if (tipo_local = '0101') then
//        Parameters.ParamByName('Dat').Value:= dataf
//      else
//        Parameters.ParamByName('Dat').Value:= date;
//
//      Parameters.ParamByName('Caixa').Value:= UDeclaracao.codigo_caixa;
//      Parameters.ParamByName('Acerto').Value:= 0;
//      Parameters.ParamByName('Usuario').Value:= UDeclaracao.codigo_usu;
//      open;
//    end;
//
//    BBtnFechar_Caixa.Enabled:= true;
//    CBFinalizar_Movimento.Checked:= true;
//
//    if (qryabertura.IsEmpty) or (qryfechamento.IsEmpty) then
//    begin
//      Mensagem_Fim_Pesquisa;
//      abort;
//    end;
//
//    Calcula_Total;
  end;
end;

procedure TFrmAcerto_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
