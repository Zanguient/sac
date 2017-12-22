unit UBematech;

interface

uses UImpressora_Fiscal, Dialogs, Forms, Windows, SysUtils, ACBrECF, ACBrDevice, IniFiles,
      Classes, URegistro, ACBrECFClass, UDeclaracao, TLoggerUnit;

type
  TBematech = class(TInterfacedObject, IImpressora_Fiscal)
    function Abrir_Cupom: boolean;
    function Abrir_Cupom_Nominal(CPF, Nome, Endereco: AnsiString): boolean;
    function Vende_Item(Codigo, Descricao, Aliquota, Qtde, Valor, Desc_Acr,
      Tipo_Desc_Acr, Unidade, dOUa: AnsiString): boolean;
    procedure Cancela_Item(Item: Integer);
    procedure Cancela_Cupom;

    // inicia fechamento
    function Inicia_Fechamento_Cupom(): boolean; overload;
    function Inicia_Fechamento_Cupom(P1: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(P1, P2: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(cAcreDesc, cTipoAcreDesc, cValorAcreDesc: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(P1, P2, P3, P4: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(P1, P2, P3, P4, P5: AnsiString): boolean; overload;

    //
    function Fecha_Cupom(cFormaPgto, cvalor: AnsiString; permite_tef: boolean): boolean; overload;

    // termina fechamento cupom
    function Termina_Fechamento_Cupom(Obs, MD5, DAV, DAVOS,
      PreVenda: AnsiString): boolean; overload;

    procedure Pega_Contadores;
    procedure Pega_Numero_Cupom;
    procedure Pega_Data_Movimento;
    procedure Pega_Data_Hora_Documento;
    procedure Pega_Ultimo_Item;
    procedure Pega_Numero_Caixa;
    procedure Pega_Venda_Bruta_Diaria;
    procedure Pega_Sub_Total;
    procedure Pega_Data_Hora_Reducao;
    procedure Pega_Data_Inicio_Documento;
    procedure Pega_Grande_Total;
    procedure Pega_COO_Inicial_Final;
    procedure Pega_Totalizador_Parcial;
    procedure Pega_Data_Hora_GravacaoSWBasicoMFAdicional;   //faltou
    procedure Pega_Versao_Impressora;
    procedure Pega_Dados_Principais_ECF;

    // pega
    function Verifica_Impressora_Ligada_Sem_Mensagem: boolean;
    procedure Verifica_Impressora_Ligada;
    procedure Verifica_Cupom_Aberto;
    function Verifica_Fim_Papel_Sem_Mensagem: boolean;
    procedure Verifica_Fim_Papel;
    function Verifica_Pouco_Papel: boolean;

    function Reducao_Z_Pendente: boolean;
    function Verifica_Requer_X: boolean;
    function Verifica_ECF_Bloqueado: Boolean;
    function Verifica_ECF_Livre: Boolean;

    procedure Abre_Movimento; overload;
    procedure Abre_Movimento(P1: AnsiString); overload;
    procedure Abre_Movimento(P1, P2: AnsiString); overload;

    procedure Efetua_Reducao_Z(P1: TDateTime); overload;
    procedure Efetua_Reducao_Z(P1, P2: AnsiString); overload;
    procedure Efetua_Reducao_Z(P1, P2, P3: AnsiString); overload;

    procedure LeituraX;
    procedure Abre_Porta;
    procedure Ativa_ACBr;

    procedure Programa_Forma_PG(Descricao: String; TEF: boolean);
    procedure Suprimento(P1, P2: AnsiString);
    procedure Sangria(P1, P2: AnsiString);

    function Abre_Comprovante_Vinculado(COO, FormaPG, Valor: AnsiString): boolean;
    function Imprime_Comprovante_Vinculado(P1: AnsiString): boolean;
    function Corta_Papel: boolean;
    function Fecha_Relatorio: boolean;
    function Imprime_Relatorio_Gerencial(P1: AnsiString): boolean; overload;
    function Imprime_Relatorio_Gerencial(var P1: TStringList): boolean; overload;
    function Acha_RG_Descricao(Descricao: AnsiString): AnsiString;
    procedure Horario_Verao;

    private
      R05 : URegistro.TR05;
      Itens_Pedido: URegistro.TItens_Pedido;
      R04: URegistro.TR04;
      R06: URegistro.TR06;
      R07: URegistro.TR07;
      Pedido: URegistro.TPedido;
      Fechamento_Venda: URegistro.TFechamento_Venda;

  end;


implementation

uses UMenu_Geral, UDM, Util.TLog;

{ TBematech }

function TBematech.Abre_Comprovante_Vinculado(COO, FormaPG, Valor: AnsiString): boolean;
begin
  try
    dm.ACBrECF1.AbreCupomVinculado(COO, FormaPG, StrToFloat(Valor));
    TLogger.GetInstance.Debug('Abriu comprovante vinculado. '+COO+'. '+FormaPG+'. '+Valor+'. '+DateTimeToStr(now));
    result:= true;
  except on E:Exception do
  begin
    BlockInput(false);
    TLogger.GetInstance.Error('Desbloqueou teclado/mouse pois houve erro em Abre_Comprovante_Vinculado.');
    result:= false;
    TLogger.GetInstance.Error('Não abriu comprovante vinculado. '+COO+'. '+FormaPG+'. '+Valor+'. Erro: '+e.Message+'. '+DateTimeToStr(now));
    ShowMessage(E.Message);
  end;
  end;
end;

procedure TBematech.Abre_Movimento(P1, P2: AnsiString);
begin
  //iRetorno := Bematech_FI_AberturaDoDia(PAnsiChar(P1), PAnsiChar(P2));
  //Analisa_iRetorno;

  if (teste_ecf = 0) then
  begin
    try
      DM.ACBrECF1.LeituraX;
      dm.ACBrECF1.Suprimento(StrToFloat(P1), '', 'SUPRIMENTO', P2, 0);
      TLogger.GetInstance.Debug('Abriu movimento. '+DateTimeToStr(now) );
    except on e:Exception do
    begin
      TLogger.GetInstance.Error('Não abriu movimento. Error: '+e.Message+'. '+DateTimeToStr(now) );
    end;
    end;
  end;
end;

procedure TBematech.Abre_Porta;
begin
  try
    DM.ACBrECF1.Porta:= porta_ecf;
    TLogger.GetInstance.Debug('Abriu porta de comunicação. Porta '+porta_ecf+'. '+DateTimeToStr(now) );
  except on E:Exception do
  begin
    TLogger.GetInstance.Error('Não abriu porta de comunicação. Porta '+porta_ecf+'. '+e.Message+'. '+DateTimeToStr(now) );
    Application.MessageBox(PChar(E.Message), 'Erro', MB_OK+MB_ICONHAND);
  end;
  end;
end;

procedure TBematech.Abre_Movimento;
begin

end;

procedure TBematech.Abre_Movimento(P1: AnsiString);
begin
end;

function TBematech.Abrir_Cupom: boolean;
begin
  if (teste_ecf = 0) then
  begin
    try
      dm.ACBrECF1.AbreCupom('', '', '', false);
      result:= true;
    except
      on E: Exception do
      begin
        result:= false;
        Application.MessageBox(PChar(E.Message), '', MB_OK+MB_ICONHAND);
      end;
    end;
  end
  else
  begin
    Result:= true;
  end;

end;

function TBematech.Abrir_Cupom_Nominal(CPF, Nome, Endereco: AnsiString): boolean;
begin
  if (teste_ecf = 0) then
  begin
    try
      dm.ACBrECF1.AbreCupom(CPF, Nome, Endereco);
      result:= true;
    except
      result:= false;
    end;
  end
  else
  begin
    Result:= true;
  end;
end;

function TBematech.Acha_RG_Descricao(Descricao: AnsiString): AnsiString;
var
  rg: TACBrECFRelatorioGerencial;
begin
  dm.ACBrECF1.CarregaRelatoriosGerenciais;
  rg:= dm.ACBrECF1.AchaRGDescricao(Descricao);

  if (rg <> nil) then
  begin
    Result:= rg.Indice;
  end
  else
  begin
    Result:= '';
  end;
end;

procedure TBematech.Ativa_ACBr;
begin
  try
    dm.ACBrECF1.Ativar;
    TLogger.GetInstance.Debug('Ativou componente ACBr. '+DateTimeToStr(now) );
  except on E:Exception do
  begin
    TLogger.GetInstance.Error('Não ativou componente ACBr. '+e.Message+'. '+DateTimeToStr(now) );
    Application.MessageBox(PChar(E.Message), 'Erro', MB_OK+MB_ICONHAND);
  end;
  end;
end;

procedure TBematech.Cancela_Cupom;
begin
  // iRetorno:= Bematech_FI_CancelaCupom;

  if (teste_ecf = 0) then
  begin
    try
      dm.ACBrECF1.CancelaCupom;
      TLog.Debug('Cancelou cupom fiscal.');
    except on E:Exception do
    begin
      TLog.Error('Não cancelou cupom fiscal. Erro: '+e.Message);
    end;

    end;
  end;

end;

procedure TBematech.Cancela_Item(Item: Integer);
begin
  // iRetorno:= Bematech_FI_CancelaItemGenerico(PAnsiChar(Item));
  // Analisa_iRetorno;
  if (teste_ecf = 0) then
  begin
    dm.ACBrECF1.CancelaItemVendido(Item);
  end;
end;

function TBematech.Corta_Papel: boolean;
begin
  try
    dm.ACBrECF1.CortaPapel(true);
    Sleep(500);
    TLogger.GetInstance.Debug('Cortou papel. '+DateTimeToStr(now) );
    result:= true;
  except on e:Exception do
  begin
    BlockInput(false);
    TLogger.GetInstance.Error('Desbloqueou teclado/mouse pois houve erro em Corta_Papel.');
    TLogger.GetInstance.Error('Não cortou papel. '+e.Message+'. '+DateTimeToStr(now) );
    result:= false;
  end;
  end;
end;

{ procedure TBematech.Cancela_Item_Anterior;
  begin
  iRetorno:= Bematech_FI_CancelaItemAnterior;
  Analisa_iRetorno;
  end; }

procedure TBematech.Efetua_Reducao_Z(P1: TDateTime);
begin
  try
    DM.ACBrECF1.ReducaoZ(P1);
    TLogger.GetInstance.Debug('Efetuou Redução Z. '+DateTimeToStr(now) );
  except
    on E:Exception do
    begin
      TLogger.GetInstance.Error('Não efetuou Redução Z. '+e.Message+'. '+DateTimeToStr(now) );
      //Application.MessageBox(PChar(E.Message), 'Erro', MB_OK+MB_ICONHAND);
      //abort;
    end;
  end;
end;

procedure TBematech.Efetua_Reducao_Z(P1, P2: AnsiString);
begin
  //iRetorno := Bematech_FI_ReducaoZ(PAnsiChar(P1), PAnsiChar(P2));
  //Analisa_iRetorno;
end;

procedure TBematech.Efetua_Reducao_Z(P1, P2, P3: AnsiString);
begin

end;

function TBematech.Fecha_Cupom(cFormaPgto, cvalor: AnsiString; permite_tef: boolean): boolean;
begin
  if (teste_ecf = 0) then
  begin
    try
      dm.ACBrECF1.EfetuaPagamento(cFormaPgto, StrToFloat(cvalor), '', permite_tef);
      TLogger.GetInstance.Debug('Efetuou pagamento. Método Fecha_Cupom. '+cFormaPgto+'. '+cvalor+'. '+BoolToStr(permite_tef, true)+'. '+DateTimeToStr(now) );
      result:= true;
    except on E: Exception do
    begin
      BlockInput(false);
      TLog.Error('Desbloqueou teclado/mouse pois houve falha no método Fecha_Cupom.');
      result:= false;
      TLogger.GetInstance.Error('Não efetuou pagamento. Método Fecha_Cupom. '+cFormaPgto+'. '+cvalor+'. '+BoolToStr(permite_tef, true)+'. Error: '+e.Message+'. '+DateTimeToStr(now) );
      Application.MessageBox(PChar(E.Message), 'Erro', MB_OK+MB_ICONHAND);
    end;
    end;
  end
  else
  begin
    Result:= true;
  end;
end;

function TBematech.Fecha_Relatorio: boolean;
begin
  try
    dm.ACBrECF1.FechaRelatorio;
    TLogger.GetInstance.Debug('Fechou relatório gerencial. '+DateTimeToStr(now) );
    result:= true;
  except on e:Exception do
  begin
    BlockInput(false);
    TLogger.GetInstance.Error('Desbloqueou teclado/mouse pois houve erro em Fecha_Relatorio.');
    TLogger.GetInstance.Error('Não fechou relatório gerencial. '+e.Message+'. '+DateTimeToStr(now) );
    result:= false;
  end;
  end;
end;

procedure TBematech.Horario_Verao;
begin
  dm.ACBrECF1.MudaHorarioVerao;
end;

function TBematech.Inicia_Fechamento_Cupom(P1, P2: AnsiString): boolean;
begin
  if (teste_ecf = 0) then
  begin
    try
      dm.ACBrECF1.SubtotalizaCupom(StrToFloat(P1), P2);
      TLogger.GetInstance.Debug('Iniciou fechamento do cupom. Método Inicia_Fechamento_Cupom. '+P1+'. '+P2+'. '+DateTimeToStr(now) );
      result:= true;
    except on E: Exception do
    begin
      TLogger.GetInstance.Error('Não iniciou fechamento do cupom. Método Inicia_Fechamento_Cupom. '+P1+'. '+P2+'. '+e.Message+'. '+DateTimeToStr(now) );
      result:= false;
      //Application.MessageBox(PChar(E.Message), 'Erro', MB_OK+MB_ICONHAND);
    end;
    end;
  end
  else
  begin
    Result:= true;
  end;
end;

function TBematech.Inicia_Fechamento_Cupom(P1: AnsiString): boolean;
begin

end;

function TBematech.Imprime_Comprovante_Vinculado(P1: AnsiString): boolean;
begin
  try
    dm.ACBrECF1.LinhaCupomVinculado(P1);
    TLogger.GetInstance.Debug('Imprimiu linha do comprovante vinculado.'+DateTimeToStr(now) );
    result:= true;
  except on e:Exception do
  begin
    BlockInput(false);
    TLogger.GetInstance.Error('Desbloqueou teclado/mouse pois houve erro em Imprime_Comprovante_Vinculado.');
    TLogger.GetInstance.Error('Não imprimiu linha do comprovante vinculado. '+e.Message+'. '+DateTimeToStr(now) );
    result:= false;
  end;
  end;
end;

function TBematech.Imprime_Relatorio_Gerencial(var P1: TStringList): boolean;
begin
  try
    dm.ACBrNFeDANFeESCPOS1.ImprimirRelatorio(P1, 2,True,false);
    TLogger.GetInstance.Debug('Imprimiu linha do comprovante vinculado no relatório gerencial. '+DateTimeToStr(now) );
    result:= true;
  except on e:Exception do
  begin
    BlockInput(false);
    TLogger.GetInstance.Error('Desbloqueou teclado/mouse pois houve erro em Imprime_Relatorio_Gerencial.');
    TLogger.GetInstance.Error('Não imprimiu linha do comprovante vinculado no relatório gerencial. '+e.Message+'. '+DateTimeToStr(now) );
    result:= false;
  end;
  end;

end;

function TBematech.Imprime_Relatorio_Gerencial(P1: AnsiString): boolean;
begin
  try
    dm.ACBrECF1.LinhaRelatorioGerencial(P1, 0);
    TLogger.GetInstance.Debug('Imprimiu linha do comprovante vinculado no relatório gerencial. '+DateTimeToStr(now) );
    result:= true;
  except on e:Exception do
  begin
    BlockInput(false);
    TLogger.GetInstance.Error('Desbloqueou teclado/mouse pois houve erro em Imprime_Relatorio_Gerencial.');
    TLogger.GetInstance.Error('Não imprimiu linha do comprovante vinculado no relatório gerencial. '+e.Message+'. '+DateTimeToStr(now) );
    result:= false;
  end;
  end;
end;

function TBematech.Inicia_Fechamento_Cupom(P1, P2, P3, P4, P5: AnsiString): boolean;
begin

end;

procedure TBematech.LeituraX;
begin
  try
    DM.ACBrECF1.LeituraX;
    TLogger.GetInstance.Debug('Emitiu Leitura X. '+DateTimeToStr(now) );
  except on e:Exception do
  begin
    TLogger.GetInstance.Error('Não emitiu Leitura X. '+e.Message+'. '+DateTimeToStr(now) );
  end;

  end;
end;

function TBematech.Inicia_Fechamento_Cupom: boolean;
begin

end;

function TBematech.Inicia_Fechamento_Cupom(P1, P2, P3, P4: AnsiString): boolean;
begin

end;

function TBematech.Inicia_Fechamento_Cupom(cAcreDesc, cTipoAcreDesc,
  cValorAcreDesc: AnsiString): boolean;
begin
  // iRetorno:= Bematech_FI_IniciaFechamentoCupom(PAnsiChar(cAcreDesc), PAnsiChar(cTipoAcreDesc), PAnsiChar(cValorAcreDesc));
  //dm.ACBrECF1.SubtotalizaCupom(StrToFloat(cAcreDesc), '');
end;

procedure TBematech.Pega_Contadores;
var
  aContador: AnsiString;
  i: Integer;
begin
  if (teste_ecf = 0) then
  begin
    uDeclaracao.cdc := DM.ACBrECF1.NumCDC;
    uDeclaracao.COO := dm.ACBrECF1.NumCOO;
    uDeclaracao.gnf := dm.ACBrECF1.NumGNF;
    uDeclaracao.grg := dm.ACBrECF1.NumGRG;
    uDeclaracao.ccf := dm.ACBrECF1.NumCCF;
    uDeclaracao.crz := dm.ACBrECF1.NumCRZ;
    uDeclaracao.cro := DM.ACBrECF1.NumCRO;
  end;

end;

procedure TBematech.Pega_COO_Inicial_Final;
var
  iConta: Integer;
begin
  COOInicial := dm.ACBrECF1.NumCOOInicial;
  COOFinal := dm.ACBrECF1.NumCOO;
  TLogger.GetInstance.Debug('COO Inicial: '+COOInicial+'. COO Final: '+COOFinal+'. '+DateTimeToStr(now));
end;

procedure TBematech.Pega_Dados_Principais_ECF;
var
  iConta: Integer;
begin
  nu_serie:= dm.ACBrECF1.NumSerie;
  TLogger.GetInstance.Debug('Número série do ECF: '+nu_serie+'. '+DateTimeToStr(now));
  nu_serie_inteiro:= dm.ACBrECF1.NumSerie;
  TLogger.GetInstance.Debug('Número série inteiro do ECF: '+nu_serie_inteiro+'. '+DateTimeToStr(now));
  Marca:= DM.ACBrECF1.ModeloStr;
  TLogger.GetInstance.Debug('Marca do ECF: '+Marca+'. '+DateTimeToStr(now));
  sModelo:= DM.ACBrECF1.SubModeloECF;
  TLogger.GetInstance.Debug('Modelo do ECF: '+sModelo+'. '+DateTimeToStr(now));
  Tipo:= 'ECF-IF';
  n_usuario:= DM.ACBrECF1.UsuarioAtual;
  TLogger.GetInstance.Debug('Número do usuário do ECF: '+n_usuario+'. '+DateTimeToStr(now));
  mf:= DM.ACBrECF1.MFAdicional;
end;

procedure TBematech.Pega_Data_Hora_Documento;
var
  iConta: Integer;
  Data: AnsiString;
begin
  data_final_emissao := FormatDateTime('DDMMYY',date);
  hora_final_emissao := FormatDateTime('HHMMSS',time);
end;

procedure TBematech.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
begin
  if (teste_ecf = 0) then
  begin
    TLog.Debug('Pegando Data/Hora gravação SB');
    data_gra := DateToStr(dm.ACBrECF1.DataHoraSB);
    mf:= '';
  end;
end;

procedure TBematech.Pega_Data_Hora_Reducao;
var
  iConta: Integer;
begin
  data_reducao := FormatDateTime('DDMMYY', date);
  hora_reducao := FormatDateTime('HHMMSS', time);
end;

procedure TBematech.Pega_Data_Inicio_Documento;
var
  iConta: Integer;
begin
  d_ab := FormatDateTime('DDMMYY', date);
  h_ab := FormatDateTime('HHMMSS', time);
end;

procedure TBematech.Pega_Data_Movimento;
var
  d, m, a: String;
  iConta: Integer;
begin
  if (teste_ecf = 0) then
  begin
    DataF := FormatDateTime('DD/MM/YYYY', dm.ACBrECF1.DataMovimento);
  end
  else
  begin
    DataF:= DateToStr(date);
  end;
  TLogger.GetInstance.Debug('Data do movimento: '+dataf+'. '+DateTimeToStr(now));
end;

procedure TBematech.Pega_Grande_Total;
var
  iConta: Integer;
begin
  { for iConta := 1 to 18 do
    GrandeTotal := GrandeTotal + ' ';
    iRetorno := Bematech_FI_GrandeTotal(GrandeTotal);
    Analisa_iRetorno; }
  if (teste_ecf = 0) then
  begin
    try
      UDeclaracao.GrandeTotal := FloatToStr(dm.ACBrECF1.GrandeTotal);
      TLog.Debug('Pegou Grande Total.');
    except on E:Exception do
    begin
      TLog.Error('NÃO pegou Grande Total. Erro: '+e.Message);
    end;

    end;
  end;
end;

procedure TBematech.Pega_Numero_Caixa;
var
  iConta: Integer;
begin
  { for iConta := 1 to 4 do
    UDeclaracao.sequencia := UDeclaracao.sequencia + ' ';

    iRetorno := Bematech_FI_NumeroCaixa(UDeclaracao.sequencia);
    Analisa_iRetorno;
    UDeclaracao.sequencia := copy(UDeclaracao.sequencia, 1, 4); }
  if (teste_ecf = 0) then
  begin
    sequencia := dm.ACBrECF1.NumECF;
  end;
end;

procedure TBematech.Pega_Numero_Cupom;
var
  iConta: Integer;
begin
  { for iConta := 1 to 6 do n_cupom := n_cupom + ' ';

    iRetorno:= Bematech_FI_NumeroCupom(n_cupom);
    Analisa_iRetorno; }
  if (teste_ecf = 0) then
  begin
    n_cupom := dm.ACBrECF1.NumCupom;
  end;
end;

procedure TBematech.Pega_Sub_Total;
begin
  { SetLength(SubTotal, 14);

    iRetorno := Bematech_FI_SubTotal(SubTotal);
    Analisa_iRetorno; }

  if (teste_ecf = 0) then
  begin
    UDeclaracao.SubTotal := FloatToStr(dm.ACBrECF1.SubTotal);
  end;
end;

procedure TBematech.Pega_Totalizador_Parcial;
var
  AIni : TIniFile ;
  Resp , ali : String ;
  I1, N1, F1, IS1, NS1, FS1, DT, DS, AT, ASS, CanT, CanS, OPNF: double;
  i: Integer;
begin
  //for i := 1 to 1278 do
    //dados_reducao := dados_reducao + ' ';
  //iRetorno := Bematech_FI_DadosUltimaReducaoMFD(dados_reducao);
  dm.ACBrECF1.DadosReducaoZ;
  //sl:= TStringList.Create;
  try
    with DM.ACBrECF1.DadosReducaoZClass do
    begin
      for i := 0 to ICMS.Count - 1 do
      begin
        ali:= FloatToStr(ICMS[i].Aliquota);

        if Length(ali) = 1 then
        begin
          ali:= '0' + ali + '00'
        end
        else if Length(ali) = 2 then
        begin
          ali:= ali + '00'
        end
        else if Length(ali) = 3 then
        begin
          ali:= StringReplace(ali, ',', '', [rfReplaceAll]);
          ali:= '0' + ali + '0'
        end
        else if Length(ali) = 4 then
        begin
          ali:= StringReplace(ali, ',', '', [rfReplaceAll]);
          ali:= ali + '0'
        end;


        cBuffer:= ICMS[i].Indice + ICMS[i].Tipo + ali;
        cTotalizador:= FloatToSTr(ICMS[i].Total);
        R03.Inserir(R03);
        //R03.Inserir_Aux(R03);
      end;

      cBuffer:= 'I1';
      cTotalizador:= FloatToStr(IsentoICMS);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'N1';
      cTotalizador:= FloatToStr(NaoTributadoICMS);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'F1';
      cTotalizador:= FloatToStr(SubstituicaoTributariaICMS);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'IS1';
      cTotalizador:= FloatToStr(IsentoISSQN);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'NS1';
      cTotalizador:= FloatToStr(NaoTributadoISSQN);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'FS1';
      cTotalizador:= FloatToStr(SubstituicaoTributariaISSQN);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'DT';
      cTotalizador:= FloatToStr(DescontoICMS);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'DS';
      cTotalizador:= FloatToStr(DescontoISSQN);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'AT';
      cTotalizador:= FloatToStr(AcrescimoICMS);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'AS';
      cTotalizador:= FloatToStr(AcrescimoISSQN);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'Can-T';
      cTotalizador:= FloatToStr(CancelamentoICMS);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'Can-S';
      cTotalizador:= FloatToStr(CancelamentoISSQN);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

      cBuffer:= 'OPNF';
      cTotalizador:= FloatToStr(OPNF);
      R03.Inserir(R03);
      //R03.Inserir_Aux(R03);

    end;
  finally
    AIni.Free;
  end;
end;

procedure TBematech.Pega_Ultimo_Item;
var
  iConta: Integer;
begin
  if (teste_ecf = 0) then
  begin
    n_item := IntToStr(dm.ACBrECF1.NumUltItem);
  end
  else
  begin
    n_item:= IntToStr(dm.qryitens_venda.RecordCount + 1);
  end;
end;

procedure TBematech.Pega_Venda_Bruta_Diaria;
var
  iConta: Integer;
begin
  { for iConta := 1 to 18 do
    venda_bruta_diaria := venda_bruta_diaria + ' ';

    iRetorno := Bematech_FI_VendaBruta(venda_bruta_diaria);
    Analisa_iRetorno; }

  venda_bruta_diaria := FloatToStr(dm.ACBrECF1.VendaBruta);
end;

procedure TBematech.Pega_Versao_Impressora;
var
  iConta: Integer;
begin
  {for iConta := 1 to 4 do
    versao_sb := versao_sb + ' ';
  iRetorno := Bematech_FI_VersaoFirmware(versao_sb);
  Analisa_iRetorno;}
  TLog.Debug('Pegando versão da impressora.');
  versao_sb:= DM.ACBrECF1.NumVersao;
end;

procedure TBematech.Programa_Forma_PG(Descricao: String; TEF: boolean);
begin
  dm.ACBrECF1.ProgramaFormaPagamento(Descricao, TEF, '');
end;

function TBematech.Reducao_Z_Pendente: boolean;
var
  data_movimento, data_atual: AnsiString;
  d, m, a: AnsiString;
  iConta: Integer;
begin
  Result := false;
  if dm.ACBrECF1.Estado = estRequerZ then
  begin
    TLog.Debug('ECF com redução Z pendente.');
    Habilitado:= false;
    FrmMenu_Geral.acLancamento_Manual.Visible := true;
    Result := true;
  end
  else
  begin
    Habilitado := true;
    FrmMenu_Geral.acLancamento_Manual.Visible := false;
  end;

end;

procedure TBematech.Sangria(P1, P2: AnsiString);
begin
  if (teste_ecf = 0) then
  begin
    dm.ACBrECF1.Sangria(StrToFloat(P1), '', 'SANGRIA', P2, 0);
  end;
end;

procedure TBematech.Suprimento(P1, P2: AnsiString);
begin
  if (teste_ecf = 0) then
  begin
    dm.ACBrECF1.Suprimento(StrToFloat(P1), '', 'SUPRIMENTO', P2, 0);
  end;
end;

function TBematech.Termina_Fechamento_Cupom(Obs, MD5, DAV, DAVOS,
  PreVenda: AnsiString): boolean;
begin
  if (teste_ecf = 0) then
  begin
    try
      dm.ACBrECF1.InfoRodapeCupom.MD5 := MD5;

      //if (DAV <> '') then
         //dm.ACBrECF1.InfoRodapeCupom.DAV := DAV;

      //if (DAVOS <> '') then
        //dm.ACBrECF1.InfoRodapeCupom.DAVOS := DAVOS;

      //if (PreVenda <> '') then
        //dm.ACBrECF1.InfoRodapeCupom.PreVenda := PreVenda;

      dm.ACBrECF1.FechaCupom(Obs, 0);
      TLogger.GetInstance.Debug('Terminou o fechamento do cupom fiscal pelo método Termina_Fechamento_Cupom. '+DateTimeToStr(now) );
      result:= true;
    except
      on E: Exception do
      begin
        BlockInput(false);
        TLog.Error('Desbloqueou teclado/mouse pois houve falha no método Termina_Fechamento_Cupom.');
        result:= false;
        TLogger.GetInstance.Error('Não terminou o fechamento do cupom fiscal pelo método Termina_Fechamento_Cupom. '+e.Message+'. '+DateTimeToStr(now) );
        Application.MessageBox(PChar(E.Message), 'Erro', MB_OK+MB_ICONHAND);
      end;
    end;
  end
  else
  begin
    Result:= true;
  end;
end;

function TBematech.Vende_Item(Codigo, Descricao, Aliquota, Qtde, Valor,
  Desc_Acr, Tipo_Desc_Acr, Unidade, dOUa: AnsiString): boolean;
begin
  if (teste_ecf = 0) then
  begin
    try
      dm.ACBrECF1.VendeItem(Codigo, Descricao, Aliquota, StrToFloat(Qtde),
        StrToFloat(Valor), StrToFloat(Desc_Acr), Unidade, Tipo_Desc_Acr, dOUa);
      TLogger.GetInstance.Debug('Efetuou o método Vende_Item. '+DateTimeToStr(now) );
      result:= true;
    except
      on E: Exception do
      begin
        TLogger.GetInstance.Error('Não efetuou o método Vende_Item. '+e.Message+'. '+DateTimeToStr(now) );
        result:= false;
        Application.MessageBox(PChar(E.Message), 'Erro', MB_OK+MB_ICONHAND);
      end;
    end;
  end
  else
  begin
    result:= true;
  end;
end;

procedure TBematech.Verifica_Cupom_Aberto;
var
  iACK, iST1, iST2, iST3: Integer;
begin
  {iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_FlagsFiscais(flagf);
  IF (flagf = 1) or (flagf = 33) or (flagf = 35) or (flagf = 37) Then
  begin
    // iST1 := iST1 - 2;
    Application.MessageBox(
      'Foi detectado que um cupom fiscal está em aberto. Será cancelado automaticamente o cupom.', 'Cupom Aberto', MB_OK + MB_ICONHAND);
    iRetorno := Bematech_FI_CancelaCupom;
    Analisa_iRetorno;
    AlteraGT;
    DeleteFile(Local_Arquivo(1));
    DeleteFile(Local_Arquivo(2));
    DeleteFile(Local_Arquivo(3));
    DeleteFile(Local_Arquivo(4));
    DeleteFile(Local_Arquivo(5));
    DeleteFile(Local_Arquivo(6));
    DeleteFile(Local_Arquivo(7));
    DeleteFile(Local_Arquivo(8));
    DeleteFile(Local_Arquivo(9));
    DeleteFile(Local_Arquivo(12));
    DeleteFile(Local_Arquivo(13));
    DeleteFile(Local_Arquivo(15));
    DeleteFile(Local_Arquivo(16));
    DeleteFile(Local_Arquivo(17));
    DeleteFile(Local_Arquivo(18));
    DeleteFile(Local_Arquivo(19));
  end;}
  try
    if (dm.ACBrECF1.Estado = estVenda) or (dm.ACBrECF1.Estado = estPagamento) then
    begin
      TLog.Error('Detectado cupom fiscal aberto.');
      Application.MessageBox('Foi detectado que um cupom fiscal está em aberto. Será cancelado automaticamente o cupom.', 'Cupom Aberto', MB_OK + MB_ICONHAND);
      //iRetorno := Bematech_FI_CancelaCupom;
      //Analisa_iRetorno;
      ECF.Cancela_Cupom;
      ECF.Pega_Grande_Total;
      AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);

      //R04.Excluir(R04);
      //R05.ExcluirLocal(R05);
      //R06.Excluir(R06);
      //R07.Excluir(R07);
      Pedido.ExcluirLocal(Pedido);
      Itens_Pedido.ExcluirLocal(Itens_Pedido);
      Fechamento_Venda.ExcluirLocal(Fechamento_Venda);

      Inicializa_Dados_Principais_Movimentacao(5, dm.qryvenda);
      Inicializa_Dados_Principais_Movimentacao(6, dm.qryitens_venda);
      Inicializa_Dados_Principais_Movimentacao(7, dm.qryr05);
      Inicializa_Dados_Principais_Movimentacao(9, dm.qrycontrola_codigo); // 9 ou 17
      Inicializa_Dados_Principais_Movimentacao(11, dm.qryr04);
      Inicializa_Dados_Principais_Movimentacao(12, dm.qryr07);
      Inicializa_Dados_Principais_Movimentacao(13, dm.qryR06);
      Inicializa_Dados_Principais_Movimentacao(14, dm.qryfechamento_venda_aux);
    end;
  except on E:Exception do
  begin
    TLog.Error('Erro ao verificar estado da impressora em Venda ou em Pagamento: '+e.Message);
    //TLog.Error('Estado do ECF: ' + (dm.ACBrECF1.Estado as AnsiString) );
  end;

  end;
end;

function TBematech.Verifica_ECF_Bloqueado: Boolean;
var
  iConta: Integer;
begin
  Result := false;
  if (dm.ACBrECF1.Estado = estBloqueada) then
  begin
    TLog.Debug('ECF bloqueado.');
    Result := true;
    Habilitado := false;
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
    DataF := '00/00/0000';
  end
  else
  begin
    Habilitado := true;
    FrmMenu_Geral.acLancamento_Manual.Visible:= false;
  end;

end;

function TBematech.Verifica_ECF_Livre: Boolean;
var
  iConta: Integer;
begin
  Result := false;
  if (dm.ACBrECF1.Estado = estLivre) then
  begin
    TLog.Debug('ECF em estado livre.');
    Result := true;
    Habilitado := true;
  end
  else
  begin
    Habilitado := false;
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
  end;

end;

procedure TBematech.Verifica_Fim_Papel;
var
  iACK, iST1, iST2, iST3: Integer;
begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  IF iST1 >= 128 Then
  begin
    inc(ifim_papel);
    if (ifim_papel = 10) then
    begin
      Habilitado := false;
      iST1 := iST1 - 128;
      Application.MessageBox(
        'Fim do Papel. Por favor, coloque uma nova bobina para continuar.',
        'Fim do Papel', MB_OK + MB_ICONHAND);
      ifim_papel := 0;
    end
    else
      Habilitado := false;
  end
  else
  begin
    Habilitado := true;
    ifim_papel := 0;
  end;
end;

function TBematech.Verifica_Fim_Papel_Sem_Mensagem: boolean;
var
  iACK, iST1, iST2, iST3: Integer;
begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  IF iST1 >= 128 Then
  begin
    iST1 := iST1 - 128;
    Result := true;
  end
  else
    Result := false;
end;

procedure TBematech.Verifica_Impressora_Ligada;
var
  imp: boolean;
begin
  {if (teste_ecf = 0) then
  begin
    try
      DM.ACBrECF1.Ativar;
      imp:= true;
    except
      imp:= false;
    end;

    if (imp = false) then
    begin
      inc(iimpressora_ligada);
      if (iimpressora_ligada = 10) then
      begin
        Habilitado := false;
        Mensagem_Erro_Entrada('a impressora está desligada OU desconectada OU inativa.');
        iimpressora_ligada := 0;
      end
      else
        Habilitado := false;
    end
    else
    begin
      iimpressora_ligada := 0;
      Habilitado := true;
    end;
  end;}

  {iRetorno := Bematech_FI_VerificaImpressoraLigada;
  if (iRetorno <> 1) then
  begin
    inc(iimpressora_ligada);
    if (iimpressora_ligada = 10) then
    begin
      Habilitado := false;
      Mensagem_Erro_Entrada(
        'arquivo de configuração da impressora não foi encontrado OU a impressora está desligada OU desconectada.');
      iimpressora_ligada := 0;
    end
    else
      Habilitado := false;
  end
  else
  begin
    iimpressora_ligada := 0;
    Habilitado := true;
  end;}
end;

function TBematech.Verifica_Impressora_Ligada_Sem_Mensagem: boolean;
var
  imp: boolean;
begin
  try
    DM.ACBrECF1.Ativar;
    Result:= true;
  except
    Result:= false;
  end;

  {iRetorno := Bematech_FI_VerificaImpressoraLigada;
  if (iRetorno <> 1) then
    Result := false
  else
    Result := true;}
end;

function TBematech.Verifica_Pouco_Papel: boolean;
var
  iACK, iST1, iST2, iST3: Integer;
begin
  {iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  IF iST1 >= 64 Then
  begin
    inc(ipouco_papel);
    if (ipouco_papel = 30) then
    begin
      iST1 := iST1 - 64;
      Application.MessageBox('Pouco Papel.', 'Atenção', MB_OK + MB_ICONHAND);
      ipouco_papel := 0;
    end;
  end
  else
    ipouco_papel := 0;}

  TLog.Debug('Verificando pouco papel');
  if (teste_ecf = 0) then
  begin
    if (dm.ACBrECF1.PoucoPapel) then
    begin
      TLog.Debug('Pouco papel detectado.');
      Result := True;
      {inc(ipouco_papel);
      if (ipouco_papel = 30) then
      begin
        iST1 := iST1 - 64;
        Application.MessageBox('Pouco Papel.', 'Atenção', MB_OK + MB_ICONHAND);
        ipouco_papel := 0;
      end;}
    end
    else
    begin
      TLog.Debug('Pouco papel NÃO detectado.');
      Result := false;
    end;
      //ipouco_papel := 0;
  end;
end;

function TBematech.Verifica_Requer_X: boolean;
var
  iConta: Integer;
begin
  Result := false;
  if (dm.ACBrECF1.Estado = estRequerX) then
  begin
    TLog.Debug('ECF requer X.');
    Result := true;
    Habilitado := false;
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
    DataF := '00/00/0000';
  end
  else
  begin
    Habilitado := true;
    FrmMenu_Geral.acLancamento_Manual.Visible:= false;
  end;

end;

end.
