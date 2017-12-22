unit UEpson;

interface

uses UImpressora_Fiscal, Dialogs, Forms, Windows, SysUtils;

type
  TEpson = class(TInterfacedObject)
    procedure Abrir_Cupom;
    procedure Abrir_Cupom_Nominal(CPF, Nome, Endereco: AnsiString);
    procedure Vende_Item(Codigo, Descricao, Aliquota, Valor, Qtde, Acrescimo, Desconto, Indice, Unidade: AnsiString);
    procedure Cancela_Item(Item: Integer);
    procedure Cancela_Item_Anterior;
    procedure Cancela_Cupom;

    //inicia fechamento
    procedure Inicia_Fechamento_Cupom(); overload;
    procedure Inicia_Fechamento_Cupom(P1: AnsiString); overload;
    procedure Inicia_Fechamento_Cupom(P1, P2: AnsiString); overload;
    procedure Inicia_Fechamento_Cupom(cAcreDesc, cTipoAcreDesc, cValorAcreDesc: AnsiString); overload;
    procedure Inicia_Fechamento_Cupom(P1, P2, P3, P4: AnsiString); overload;
    procedure Inicia_Fechamento_Cupom(P1, P2, P3, P4, P5: AnsiString); overload;

    //
    procedure Fecha_Cupom(); overload;
    procedure Fecha_Cupom(cFormaPgto, cvalor: AnsiString); overload;
    procedure Fecha_Cupom(P1, P2, P3: AnsiString); overload;
    procedure Fecha_Cupom(P1, P2, P3, P4: AnsiString); overload;
    procedure Fecha_Cupom(P1, P2, P3, P4, P5: AnsiString); overload;

    //termina fechamento cupom
    procedure Termina_Fechamento_Cupom(P: AnsiString); overload;

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
    procedure Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
    procedure Pega_Versao_Impressora;
    procedure Pega_Dados_Principais_ECF;

    //pega
    function Verifica_Impressora_Ligada_Sem_Mensagem: boolean;
    function Verifica_Impressora_Ligada: boolean;
    procedure Verifica_Cupom_Aberto;
    function Verifica_Fim_Papel_Sem_Mensagem: boolean;
    procedure Verifica_Fim_Papel;
    procedure Verifica_Pouco_Papel;

    function Reducao_Z_Pendente: boolean;

    procedure Abre_Movimento; overload;
    procedure Abre_Movimento(P1: AnsiString); overload;
    procedure Abre_Movimento(P1, P2: AnsiString); overload;

    procedure Efetua_Reducao_Z(P1: AnsiString); overload;
    procedure Efetua_Reducao_Z(P1, P2: AnsiString); overload;
    procedure Efetua_Reducao_Z(P1, P2, P3: AnsiString); overload;

    procedure LeituraX;
    procedure Abre_Porta;
  end;
implementation

uses UDeclaracao, UMenu_Geral;

{ TEpson }

procedure TEpson.Abre_Movimento(P1, P2: AnsiString);
begin
  iRetorno:= Bematech_FI_AberturaDoDia(PAnsiChar(P1), PAnsiChar(P2));
  Analisa_iRetorno;
end;

procedure TEpson.Abre_Porta;
begin
  {if (EPSON_Serial_Abrir_PortaEX) = 'FUNC_SUCESSO' then
    iRetorno:= 1
  else
    iRetorno:= 0; }
end;

procedure TEpson.Abre_Movimento;
begin

end;

procedure TEpson.Abre_Movimento(P1: AnsiString);
begin

end;

procedure TEpson.Abrir_Cupom;
begin
  //iRetorno:= EPSON_Serial_Abrir_PortaEX;
  iRetorno:= EPSON_Fiscal_Abrir_Cupom('', '', '', '', '2');

  if (iRetorno = 0) then
    iRetorno:= 1
  else if (iRetorno = 1) then
    iRetorno:= 0;

  //EPSON_Fiscal_Abrir_Cupom('', '', '', '', '2');
end;

procedure TEpson.Abrir_Cupom_Nominal(CPF, Nome, Endereco: AnsiString);
begin
  iRetorno:= EPSON_Fiscal_Abrir_Cupom(CPF, Nome, Endereco, '', '2');

  if (iRetorno = 0) then
    iRetorno:= 1
  else if (iRetorno = 1) then
    iRetorno:= 0;

  //EPSON_Fiscal_Abrir_Cupom(CPF, Nome, Endereco, '', '2');
end;

procedure TEpson.Cancela_Cupom;
begin
  iRetorno:= Bematech_FI_CancelaCupom;
end;

procedure TEpson.Cancela_Item(Item: AnsiString);
begin
  iRetorno:= Bematech_FI_CancelaItemGenerico(PAnsiChar(Item));
  Analisa_iRetorno;
end;

procedure TEpson.Cancela_Item_Anterior;
begin
  iRetorno:= Bematech_FI_CancelaItemAnterior;
  Analisa_iRetorno;
end;

procedure TEpson.Efetua_Reducao_Z(P1: AnsiString);
begin

end;

procedure TEpson.Efetua_Reducao_Z(P1, P2: AnsiString);
begin
  iRetorno:= Bematech_FI_ReducaoZ(PAnsiChar(P1), PAnsiChar(P2));
  Analisa_iRetorno;
end;

procedure TEpson.Efetua_Reducao_Z(P1, P2, P3: AnsiString);
begin

end;

procedure TEpson.Fecha_Cupom(cFormaPgto, cvalor: AnsiString);
begin
  iRetorno:= Bematech_FI_EfetuaFormaPagamento(cFormaPgto, cvalor);
end;

procedure TEpson.Fecha_Cupom;
begin

end;

procedure TEpson.Fecha_Cupom(P1, P2, P3: AnsiString);
begin

end;

procedure TEpson.Fecha_Cupom(P1, P2, P3, P4, P5: AnsiString);
begin

end;

procedure TEpson.Fecha_Cupom(P1, P2, P3, P4: AnsiString);
begin

end;

procedure TEpson.Inicia_Fechamento_Cupom(P1, P2: AnsiString);
begin

end;

procedure TEpson.Inicia_Fechamento_Cupom(P1: AnsiString);
begin

end;

procedure TEpson.Inicia_Fechamento_Cupom(P1, P2, P3, P4, P5: AnsiString);
begin

end;

procedure TEpson.LeituraX;
begin
  iRetorno:= EPSON_Serial_Abrir_PortaEX;
  iRetorno:= EPSON_RelatorioFiscal_LeituraX;

  if (iRetorno = 0) then
    iRetorno:= 1
  else if (iRetorno = 1) then
    iRetorno:= 0;
end;

procedure TEpson.Inicia_Fechamento_Cupom;
begin

end;

procedure TEpson.Inicia_Fechamento_Cupom(P1, P2, P3, P4: AnsiString);
begin

end;

procedure TEpson.Inicia_Fechamento_Cupom(cAcreDesc, cTipoAcreDesc, cValorAcreDesc: AnsiString);
begin
  iRetorno:= Bematech_FI_IniciaFechamentoCupom(PAnsiChar(cAcreDesc), PAnsiChar(cTipoAcreDesc), PAnsiChar(cValorAcreDesc));
end;

procedure TEpson.Pega_Contadores;
var
  aContador: AnsiString;
  i: Integer;
begin
  // CDC
  aContador := '';
  for i := 1 to 4 do
    aContador := aContador + ' ';
  iRetorno := Bematech_FI_ContadorComprovantesCreditoMFD(aContador);
  if iRetorno <> 1 then
    showmessage('Erro ao comunicar com o ECF, ao capturar o CDC!!!')
  else
    cdc := (aContador);
  // COO
  aContador := '';
  for i := 1 to 6 do
    aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroCupom(aContador);
  if iRetorno <> 1 then
    showmessage('Erro ao comunicar com o ECF, ao capturar o COO!!!')
  else
    COO := (aContador);
  // GNF
  aContador := '';
  for i := 1 to 6 do
    aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroOperacoesNaoFiscais(aContador);
  if iRetorno <> 1 then
    showmessage('Erro ao comunicar com o ECF, ao capturar o GNF!!!')
  else
    gnf := (aContador);
  // GRG
  aContador := '';
  for i := 1 to 6 do
    aContador := aContador + ' ';
  iRetorno := Bematech_FI_ContadorRelatoriosGerenciaisMFD(aContador);
  if iRetorno <> 1 then
    showmessage('Erro ao comunicar com o ECF, ao capturar o GRG!!!')
  else
    grg := (aContador);
  // CCF
  aContador := '';
  for i := 1 to 6 do
    aContador := aContador + ' ';
  iRetorno := Bematech_FI_ContadorCupomFiscalMFD(aContador);
  if iRetorno <> 1 then
    showmessage('Erro ao comunicar com o ECF, ao capturar o CCF!!!')
  else
    ccf := (aContador);
  // CRZ
  aContador := '';
  for i := 1 to 4 do
    aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroReducoes(aContador);
  if iRetorno <> 1 then
    showmessage('Erro ao comunicar com o ECF, ao capturar o CCF!!!')
  else
    crz := (aContador);
  // CRO
  aContador := '';
  for i := 1 to 4 do
    aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroIntervencoes(aContador);
  if iRetorno <> 1 then
    showmessage('Erro ao comunicar com o ECF, ao capturar o CCF!!!')
  else
    cro := (aContador);
end;

procedure TEpson.Pega_COO_Inicial_Final;
var
  iConta: Integer;
begin
  for iConta := 1 to 6 do
  begin
    COOInicial := COOInicial + ' ';
    COOFinal := COOFinal + ' ';
  end;
  iRetorno := Bematech_FI_InicioFimCOOsMFD(COOInicial, COOFinal);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Dados_Principais_ECF;
var
  iConta: Integer;
begin
  for iConta := 1 to 20 do
    nu_serie := nu_serie + ' ';
  for iConta := 1 to 20 do
    nu_serie_inteiro := nu_serie_inteiro + ' ';
  for iConta := 1 to 15 do
    Marca := Marca + ' ';
  for iConta := 1 to 20 do
    Modelo := Modelo + ' ';
  for iConta := 1 to 7 do
    Tipo := Tipo + ' ';
  for iConta := 1 to 4 do
    n_usuario := n_usuario + ' ';
  mf := ' ';

  iRetorno := Bematech_FI_NumeroSerieMFD(nu_serie);
  Analisa_iRetorno;

  iRetorno := Bematech_FI_NumeroSerieMFD(nu_serie_inteiro);
  Analisa_iRetorno;

  iRetorno := Bematech_FI_MarcaModeloTipoImpressoraMFD(Marca, Modelo, Tipo);
  Analisa_iRetorno;
  iRetorno := Bematech_FI_NumeroSubstituicoesProprietario(n_usuario);
  if (iRetorno = 1) then
    n_usuario := copy(n_usuario, 3, 2);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Data_Hora_Documento;
var
  iConta: Integer;
  Data: AnsiString;
begin
  for iConta := 1 to 12 do
    Data := Data + ' ';

  iRetorno := Bematech_FI_DataHoraUltimoDocumentoMFD(Data);
  Analisa_iRetorno;

  data_final_emissao := copy(Data, 1, 6);
  hora_final_emissao := copy(Data, 7, 6);
  // data_final_emissao:= FormatDateTime('YYYYMMDD', StrToDateTime(data_final_emissao));
end;

procedure TEpson.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
begin
  SetLength(data_usu, 20);
  SetLength(data_gra, 20);
  mf := ' ';
  iRetorno := Bematech_FI_DataHoraGravacaoUsuarioSWBasicoMFAdicional(data_usu,
    data_gra, mf);
end;

procedure TEpson.Pega_Data_Hora_Reducao;
var
  iConta: Integer;
begin
  for iConta := 1 to 6 do
    data_reducao := data_reducao + ' ';
  for iConta := 1 to 6 do
    hora_reducao := hora_reducao + ' ';

  iRetorno := Bematech_FI_DataHoraReducao(data_reducao, hora_reducao);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Data_Inicio_Documento;
var
  iConta: Integer;
begin
  for iConta := 1 to 6 do
    d_ab := d_ab + ' ';
  for iConta := 1 to 6 do
    h_ab := h_ab + ' ';

  iRetorno := Bematech_FI_DataHoraImpressora(d_ab, h_ab);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Data_Movimento;
var
  d, m, a: String;
  iConta: Integer;
begin
  for iConta := 1 to 6 do
    data_movimento := data_movimento + ' ';

  iRetorno := Bematech_FI_DataMovimento(data_movimento);
  Analisa_iRetorno;
  d := copy(data_movimento, 1, 2);
  m := copy(data_movimento, 3, 2);
  a := copy(data_movimento, 5, 2);
  Data := d + '/' + m + '/' + a;

  if (Data = '00/00/00') then
    DataF := '00/00/0000'
  else
    DataF := FormatDateTime('DD/MM/YYYY', StrToDate(Data));
end;

procedure TEpson.Pega_Grande_Total;
var
  iConta: Integer;
begin
  for iConta := 1 to 18 do
    GrandeTotal := GrandeTotal + ' ';
  iRetorno := Bematech_FI_GrandeTotal(GrandeTotal);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Numero_Caixa;
var
  iConta: Integer;
begin
  for iConta := 1 to 4 do
    UDeclaracao.sequencia := UDeclaracao.sequencia + ' ';

  iRetorno := Bematech_FI_NumeroCaixa(UDeclaracao.sequencia);
  Analisa_iRetorno;
  UDeclaracao.sequencia := copy(UDeclaracao.sequencia, 1, 4);
end;

procedure TEpson.Pega_Numero_Cupom;
var
  iConta: integer;
begin
  for iConta := 1 to 6 do n_cupom := n_cupom + ' ';

  iRetorno:= Bematech_FI_NumeroCupom(n_cupom);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Sub_Total;
begin
  SetLength(SubTotal, 14);

  iRetorno := Bematech_FI_SubTotal(SubTotal);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Totalizador_Parcial;
var
  i: Integer;
begin
  for i := 1 to 1278 do
    dados_reducao := dados_reducao + ' ';
  iRetorno := Bematech_FI_DadosUltimaReducaoMFD(dados_reducao);

  iRelatorio := 0;
  iIndex := 1208;
  iInTotalizador := 335;
  iConta := 0;
  iTotal := 0;
  While (iRelatorio = 0) do
  begin
    cAliquota := copy(dados_reducao, iIndex, 4);
    If (cAliquota <> '0000') then
    begin
      cTotalizador := '';
      cBuffer := '';
      cTotalizador := copy(dados_reducao, iInTotalizador, 14);
      if (cAliquota = issqnn) then
        cBuffer := cBuffer + FormatFloat('00', iConta + 1) + 'S' + cAliquota
      else
        cBuffer := cBuffer + FormatFloat('00', iConta + 1) + 'T' + cAliquota;
      iInTotalizador := iInTotalizador + 14;
      R03.Inserir(R03);
      R03.Inserir_Aux(R03);
    end
    Else
    begin
      iInTotalizador := 560;
      If (iInTotalizador = 560) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'I1';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 575) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'N1';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 590) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'F1';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 605) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'IS1';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 620) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'NS1';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 635) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'FS1';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 650) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'DT';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 665) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'DS';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 680) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'AT';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 695) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'AS';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 710) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'Can-T';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 725) then
      begin
        cTotalizador := '';
        cBuffer := '';
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        cBuffer := cBuffer + 'Can-S';
        iInTotalizador := iInTotalizador + 15;
        iRelatorio := 1;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
      If (iInTotalizador = 740) then
      begin
        While (iInTotalizador < 1132) do
        begin
          cTotalizador := '';
          cBuffer := '';
          cTotalizador := copy(dados_reducao, iInTotalizador, 14);
          iTotal := iTotal + StrToInt(cTotalizador);
          iInTotalizador := iInTotalizador + 14;
          iRelatorio := 1;
        end;
        iInTotalizador := iInTotalizador + 1;
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        iTotal := iTotal + StrToInt(cTotalizador);
        iInTotalizador := iInTotalizador + 15;
        cTotalizador := copy(dados_reducao, iInTotalizador, 14);
        iTotal := iTotal + StrToInt(cTotalizador);
        cBuffer := cBuffer + 'OPNF';
        // cBuffer := cBuffer + FormatFloat('0000000000000',iTotal);
        iInTotalizador := iInTotalizador + 15;
        R03.Inserir(R03);
        R03.Inserir_Aux(R03);
      end;
    end;
    iConta := iConta + 1;
    iIndex := iIndex + 4;
  end;
end;

procedure TEpson.Pega_Ultimo_Item;
var
  iConta: Integer;
begin
  UDeclaracao.n_item := '';
  for iConta := 1 to 4 do
    UDeclaracao.n_item := UDeclaracao.n_item + ' ';

  iRetorno := Bematech_FI_UltimoItemVendido(UDeclaracao.n_item);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Venda_Bruta_Diaria;
var
  iConta: Integer;
begin
  for iConta := 1 to 18 do
    venda_bruta_diaria := venda_bruta_diaria + ' ';

  iRetorno := Bematech_FI_VendaBruta(venda_bruta_diaria);
  Analisa_iRetorno;
end;

procedure TEpson.Pega_Versao_Impressora;
var
  iConta: Integer;
begin
  for iConta := 1 to 4 do
    versao_sb := versao_sb + ' ';
  iRetorno := Bematech_FI_VersaoFirmware(versao_sb);
  Analisa_iRetorno;
end;

function TEpson.Reducao_Z_Pendente: boolean;
var
  data_movimento, data_atual: AnsiString;
  d, m, a: AnsiString;
  iConta: integer;
begin
  Result := false;
  for iConta := 1 to 6 do
    data_movimento := data_movimento + ' ';
  iRetorno := Bematech_FI_DataMovimento(data_movimento);

  d := copy(data_movimento, 1, 2);
  m := copy(data_movimento, 3, 2);
  a := copy(data_movimento, 5, 2);
  data_movimento := d + '/' + m + '/' + a;

  data_movimento := FormatDateTime('DD/MM/YYYY', StrToDateTime(data_movimento));
  data_atual := FormatDateTime('DD/MM/YYYY', date);

  if (StrToDateTime(data_movimento) < StrToDateTime(data_atual)) then
  begin
    Habilitado := false;
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
    Result := true;
  end
  else if (StrToDateTime(data_movimento) > StrToDateTime(data_atual)) then
  begin
    Habilitado := false;
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
    Result := true;
  end
  else
  begin
    Habilitado:= true;
    FrmMenu_Geral.acLancamento_Manual.Visible:= false;
  end;
end;

procedure TEpson.Termina_Fechamento_Cupom(P: AnsiString);
begin
  iRetorno:= Bematech_FI_TerminaFechamentoCupom(P);
end;

procedure TEpson.Vende_Item(Codigo, Descricao, Aliquota, Valor, Qtde, Acrescimo, Desconto, Indice, Unidade: AnsiString);
begin
  iRetorno:= Bematech_FI_VendeItemDepartamento(PAnsiChar(Codigo), PAnsiChar(Descricao), PAnsiChar(Aliquota), PAnsiChar(Valor), PAnsiChar(Qtde), PAnsiChar(Acrescimo), PAnsiChar(Desconto), PAnsiChar(Indice), PAnsiChar(Unidade));
  Analisa_iRetorno;
end;

procedure TEpson.Verifica_Cupom_Aberto;
var
  iACK, iST1, iST2, iST3: Integer;
begin
  iACK := 0;
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
  end;
end;

procedure TEpson.Verifica_Fim_Papel;
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

function TEpson.Verifica_Fim_Papel_Sem_Mensagem: boolean;
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

function TEpson.Verifica_Impressora_Ligada: boolean;
var
  szEstadoImpressora: array[0..17] of PAnsiChar;
  szEstadoFiscal: array[0..17] of PAnsiChar;
  szRetornoComando: array[0..5] of PAnsiChar;
  szMsgErro: array[0..101] of PAnsiChar;
  i: integer;
begin
  for i := 0 to 17 do
  begin
    szEstadoImpressora[i]:= '';
    szEstadoFiscal[i]:= '';
  end;

  for i := 0 to 5 do
  begin
    szRetornoComando[i]:= '';
  end;

  for i := 0 to 101 do
  begin
    szMsgErro[i]:= '';
  end;

  iRetorno:= EPSON_Obter_Estado_ImpressoraEX ( szEstadoImpressora, szEstadoFiscal, szRetornoComando, szMsgErro );
end;

function TEpson.Verifica_Impressora_Ligada_Sem_Mensagem: boolean;
begin
  iRetorno := Bematech_FI_VerificaImpressoraLigada;
  if (iRetorno <> 1) then
    Result := false
  else
    Result := true;
end;

procedure TEpson.Verifica_Pouco_Papel;
var
  iACK, iST1, iST2, iST3: Integer;
begin
  iACK := 0;
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
    ipouco_papel := 0;
end;

end.
