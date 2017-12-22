unit UMovimento_ECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, Mask, ComCtrls, ToolWin, ImgList;

type
  TFrmMovimento_ECF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    SaveDialog1: TSaveDialog;
    EdtInicio: TMaskEdit;
    EdtFim: TMaskEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label3: TLabel;
    EdtECF: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Inicializa_Variaveis;
    procedure Cria01(DataIni, DataFim: TDateTime);
    procedure Cria02(DataIni, DataFim: TDateTime);
    procedure Cria03(DataIni, DataFim: TDateTime);
    procedure Cria04(DataIni, DataFim: TDateTime);
    procedure Cria05(DataIni, DataFim: TDateTime);
    procedure Cria06(DataIni, DataFim: TDateTime);
    procedure Cria07(DataIni, DataFim: TDateTime);
    procedure MovimentacaoECF(fNomeArquivo: AnsiString; fDatai,fDataf: TDateTime);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
  private
    sArquivo: TextFile;
    Caix: AnsiString;
    function Valida: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimento_ECF: TFrmMovimento_ECF;

implementation

uses UDeclaracao, UMenu_Geral, UDM, UGeral;

{$R *.dfm}

procedure TFrmMovimento_ECF.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMovimento_ECF.BBtnSalvarClick(Sender: TObject);
begin
  Caix:= StringOfChar('0', 4-Length(EdtECF.Text)) + EdtECF.Text;
  sequencia:= Copy(sequencia,2,3);
  //Inicializa_Variaveis;
  MovimentacaoECF(NomeArquivo, StrToDateTime(EdtInicio.Text), StrToDateTime(EdtFim.Text));
  Processo_Concluido;
end;

procedure TFrmMovimento_ECF.Cria01;
var
  hora, data, data2: Ansistring;
  data3: TDAte;
begin

    Busca_Dados_SoftwareHouse;

    cnpj_usu:= StringReplace(cnpj, '.', '', [rfReplaceAll]);
    cnpj_usu:= StringReplace(cnpj, '/', '', [rfReplaceAll]);
    cnpj_usu:= StringReplace(cnpj, '-', '', [rfReplaceAll]);
    insc_est_usu:= StringReplace(insc_estadual, '-', '', [rfReplaceAll]);

    data:= data_gra;
    data2:= Copy(data, 1,10);
    hora:= copy(data,12,8);
    data3:= StrToDateTime(data2);
    data2:= FormatDateTime('YYYYMMDD', data3);
    hora:= FormatDateTime('HHMMSS', StrToTime(hora));

    d_ini:= FormatDateTime('YYYYMMDD', StrToDateTime(EdtInicio.Text));
    d_fim:= FormatDateTime('YYYYMMDD', StrToDateTime(EdtFim.Text));

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

procedure TFrmMovimento_ECF.Cria02(DataIni, DataFim: TDateTime);
var
  qAux, qAux2: TADOQuery;
  data: TDate;
  data_red1, data_red2, data_red3: AnsiString;
  i: integer;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R02 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
      Parameters.ParamByName('DI').Value:= DataIni;
      Parameters.ParamByName('DF').Value:= DataFim;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;

    qAux.First;
    while not qAux.Eof do
    begin

    with qAux2, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R02_Aux where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
      open;
    end;

      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      smodelo:= StringReplace(smodelo, '-','',[rfReplaceAll]);

      if (qAux2.FieldByName('N_Fabricacao').AsString <> qAux.FieldByName('N_Fabricacao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('CRZ').AsString <> qAux.FieldByName('CRZ').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('COO').AsString <> qAux.FieldByName('COO').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('CRO').AsString <> qAux.FieldByName('CRO').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Data_Movimento').AsString <> qAux.FieldByName('Data_Movimento').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Data_Emissao').AsString <> qAux.FieldByName('Data_Emissao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Hora_Emissao').AsString <> qAux.FieldByName('Hora_Emissao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Venda_Bruta_Diaria').AsString <> qAux.FieldByName('Venda_Bruta_Diaria').AsString) then
        modeloecf:= '????????????????????';

      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;

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

procedure TFrmMovimento_ECF.Cria03(DataIni, DataFim: TDateTime);
var
  qAux, qAux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R03 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
      Parameters.ParamByName('DI').Value:= DataIni;
      Parameters.ParamByName('DF').Value:= DataFim;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;

    qAux.First;
    while not qAux.Eof do
    begin

      with qAux2, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select * from R03_Aux where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
        open;
      end;

      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      smodelo:= StringReplace(smodelo, '-','',[rfReplaceAll]);

      if (qAux2.FieldByName('N_Fabricacao').AsString <> qAux.FieldByName('N_Fabricacao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('CRZ').AsString <> qAux.FieldByName('CRZ').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Totalizador_Parcial').AsString <> qAux.FieldByName('Totalizador_Parcial').AsString) then
        modeloecf:= '????????????????????';


      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
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

procedure TFrmMovimento_ECF.Cria04(DataIni, DataFim: TDateTime);
var
  qAux, qAux2: TADOQuery;
  data_red1, data_red2, data_red3: AnsiString;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R04 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
      Parameters.ParamByName('DI').Value:= DataIni;
      Parameters.ParamByName('DF').Value:= DataFim;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;

    while not qAux.Eof do
    begin

      with qAux2, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select * from R04_Aux where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
        open;
      end;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      smodelo:= StringReplace(smodelo, '-','',[rfReplaceAll]);

      if (qAux2.FieldByName('N_Fabricacao').AsString <> qAux.FieldByName('N_Fabricacao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('CCF').AsString <> qAux.FieldByName('CCF').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('COO').AsString <> qAux.FieldByName('COO').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Sub_Total_Documento').AsString <> qAux.FieldByName('Sub_Total_Documento').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Cancelamento').AsString <> qAux.FieldByName('Cancelamento').AsString) then
        modeloecf:= '????????????????????';

      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
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
      indicador_tipo_desc:= qAux.FieldByName('Tipo_Desconto').AsString;
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

procedure TFrmMovimento_ECF.Cria05(DataIni, DataFim: TDateTime);
var
  qAux, qAux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R05 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
      Parameters.ParamByName('DI').Value:= DataIni;
      Parameters.ParamByName('DF').Value:= DataFim;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;

    qAux.First;
    while not qAux.Eof do
    begin

      with qAux2, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select * from R05_Aux where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
        open;
      end;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      smodelo:= StringReplace(smodelo, '-','',[rfReplaceAll]);

      if (qAux2.FieldByName('N_Fabricacao').AsString <> qAux.FieldByName('N_Fabricacao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('COO').AsString <> qAux.FieldByName('COO').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('CCF').AsString <> qAux.FieldByName('CCF').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Codigo_Produto').AsString <> qAux.FieldByName('Codigo_Produto').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Quantidade').AsString <> qAux.FieldByName('Quantidade').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Valor_Unitario').AsString <> qAux.FieldByName('Valor_Unitario').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Valor_Total').AsString <> qAux.FieldByName('Valor_Total').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Totalizador_Parcial').AsString <> qAux.FieldByName('Totalizador_Parcial').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Cancelamento').AsString <> qAux.FieldByName('Cancelamento').AsString) then
        modeloecf:= '????????????????????';

      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
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

procedure TFrmMovimento_ECF.Cria06(DataIni, DataFim: TDateTime);
var
  qAux, qAux2: TADOQuery;
  aux1, aux2, aux3, aux4: AnsiString;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R06 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
      Parameters.ParamByName('DI').Value:= DataIni;
      Parameters.ParamByName('DF').Value:= DataFim;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin

      with qAux2, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select * from R06_Aux where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
        open;
      end;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      smodelo:= StringReplace(smodelo, '-','',[rfReplaceAll]);

      if (qAux2.FieldByName('N_Fabricacao').AsString <> qAux.FieldByName('N_Fabricacao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('COO').AsString <> qAux.FieldByName('COO').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('GNF').AsString <> qAux.FieldByName('GNF').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('CDC').AsString <> qAux.FieldByName('CDC').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Denominacao').AsString <> qAux.FieldByName('Denominacao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Data_Final_Emissao').AsString <> qAux.FieldByName('Data_Final_Emissao').AsString) then
        modeloecf:= '????????????????????';

      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
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

procedure TFrmMovimento_ECF.Cria07(DataIni, DataFim: TDateTime);
var
  qAux, qAux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R07 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
      Parameters.ParamByName('DI').Value:= DataIni;
      Parameters.ParamByName('DF').Value:= DataFim;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin

      with qAux2, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select * from R07_Aux where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
        open;
      end;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      modeloecf:= StringReplace(modeloecf, '-','',[rfReplaceAll]);
      smodelo:= StringReplace(smodelo, '-','',[rfReplaceAll]);

      if (qAux2.FieldByName('N_Fabricacao').AsString <> qAux.FieldByName('N_Fabricacao').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('COO').AsString <> qAux.FieldByName('COO').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('CCF').AsString <> qAux.FieldByName('CCF').AsString) then
        modeloecf:= '????????????????????';



      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
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

procedure TFrmMovimento_ECF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMovimento_ECF.Free;
  FrmMovimento_ECF:= Nil;
end;

procedure TFrmMovimento_ECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    EdtInicio.ReadOnly:= false;
    EdtFim.ReadOnly:= false;
    BBtnSalvar.Enabled:= true;
    EdtInicio.Text:= DateToStr(date);
    EdtFim.Text:= DateToStr(date);
  end;

end;

procedure TFrmMovimento_ECF.Inicializa_Variaveis;
var
  iIni: integer;
begin
  setlength( registroEAD, 256 );
  SetLength( dados_reducao,631);
  for iIni := 1 to 4 do versao_sb := versao_sb + ' ';
  for iIni := 1 to 18 do cnpj_usu := cnpj_usu + ' ';
  for iIni := 1 to 15 do insc_est_usu := insc_est_usu + ' ';
  for iIni := 1 to 1278 do dados_reducao := dados_reducao + ' ';
  for iIni := 1 to 6 do data_reducao := data_reducao + ' ';
  for iIni := 1 to 6 do hora_reducao := hora_reducao + ' ';
  for iIni := 1 to 18 do venda_bruta_diaria := venda_bruta_diaria + ' ';
end;

procedure TFrmMovimento_ECF.MovimentacaoECF(fNomeArquivo: AnsiString; fDatai,fDataf: TDateTime);
var
  arq: AnsiString;
  serie, data: AnsiString;
begin
  if (Valida) then
  begin
    setlength( registroEAD, 256 );
    serie:= Copy(nu_serie,7,14);
    data:= FormatDateTime('DDMMYYYY', date);
    fNomeArquivo := Local_Arquivo(14) + CIECF + serie + data + '.txt';
    AssignFile(sArquivo, fNomeArquivo);
    Rewrite(sArquivo);
    Cria01(fDatai, fDataf);
    Cria02(fDatai, fDataf);
    Cria03(fDatai, fDataf);
    Cria04(fDatai, fDataf);
    Cria05(fDatai, fDataf);
    Cria06(fDatai, fDataf);
    Cria07(fDatai, fDataf);
    CloseFile(sArquivo);
    Sleep(2000);
    generateEAD(fNomeArquivo, cChavePublica, cChavePrivada, registroEAD, 1);
    Arquivo_Gerado(fNomeArquivo);
    UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DE MOVIMENTO POR ECF.', TimeToStr(time), consu, date);
  end;
end;

function TFrmMovimento_ECF.Valida: boolean;
begin
  Result:= false;
  if (EdtInicio.Text = '  /  /    ') or (EdtFim.Text = '  /  /    ') or (EdtECF.Text = '') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;
  Result:= true;
end;

procedure TFrmMovimento_ECF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
