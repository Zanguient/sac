unit UMapa_Resumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, RSPrint;

type
  TFrmMapa_Resumo = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    Label4: TLabel;
    EdtN_Serie: TEdit;
    rs: TRSPrinter;
    ADOQueryP: TADOQuery;
    ADOQueryPCaixa: TStringField;
    ADOQueryPCRZ: TStringField;
    ADOQueryPCOO: TStringField;
    ADOQuery2: TADOQuery;
    ADOQuery2Data_Movimento: TDateTimeField;
    ADOQuery2Totalizador_Parcial: TStringField;
    ADOQuery4: TADOQuery;
    ADOQuery4Desconto: TFloatField;
    ADOQuery3: TADOQuery;
    ADOQuery2valor_venda: TStringField;
    ADOQuery3Data_Movimento: TDateTimeField;
    ADOQuery3Totalizador_Parcial: TStringField;
    ADOQuery3valor_venda: TStringField;
    ADOQuery3iss: TStringField;
    ADOQuery3DT: TStringField;
    ADOQuery3DS: TStringField;
    ADOQuery3Cant: TStringField;
    ADOQuery3Cans: TStringField;
    ADOQuery3venda_bruta: TFloatField;
    ADOQueryPDatamov: TWideStringField;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    Util: TUtil;
    nome_arquivo, cod, ecf: string;
    arq1, arq2: string;
    aux2: AnsiString;
    procedure MapaResumo;
    procedure MapaResumo2;
  public
    ativo: boolean;
  end;

var
  FrmMapa_Resumo: TFrmMapa_Resumo;
implementation

uses UDM, UDeclaracao, URel_Mapa_Resumo;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmMapa_Resumo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMapa_Resumo.MapaResumo2;
var
  i, i2, aux: integer;
  titulo, empresa, cce, endemp, mun, uff, cnpjj,
  ecf, crz, coo, venda_bruta, candesc, totiss, venda_liquida, isento, subs, outros: string;
  valor_bruto, can, iss, valor_liquido: double;
  datam, d1, d2, d3: AnsiString;
begin
  ADOQueryP.Close;
  ADOQueryP.Parameters.ParamByName('D1').Value:= StrToDateTime(MEdtData_Inicial.Text);
  ADOQueryP.Parameters.ParamByName('D2').Value:= StrToDateTime(MEdtData_Final.Text);
  ADOQueryP.Parameters.ParamByName('N').Value:= EdtN_Serie.Text;
  ADOQueryP.Open;
  ADOQueryP.First;

  ecf:= 'ECF  ';
  crz:= 'CRZ  ';
  coo:= 'COO    ';
  venda_bruta:= 'Venda Bruta ';
  candesc:= 'Canc./Desc. ';
  totiss:= 'Total. de ISS ';
  venda_liquida:= 'Valor Contábil | ';
  isento:= 'Isen./Não Trib. ';
  subs:= 'Subst. Tribut. ';
  outros:= 'Outros Rec. | ';

  while not ADOQueryP.Eof do
  begin
    data:= ADOQueryPDatamov.AsString;
    data:= StringReplace(data, '-', '', [rfReplaceAll]);
    d1:= Copy(data, 1, 4);
    d2:= Copy(data, 5, 2);
    d3:= Copy(data, 7, 2);

    data:= d3 + '/' + d2 + '/' + d1;

    rs.BeginDoc;
    i:= 0;
    i2:= 136;
    titulo:= 'MAPA RESUMO DO ECF';

    empresa:= ' Empresa: ' + razao_social;
    cce:= 'CCE: ' + insc_estadual;
    endemp:= 'Endereço: ' + UDeclaracao.endereco;
    mun:= 'Município: ' + UDeclaracao.cidade;
    uff:= 'UF: ' + uDeclaracao.uf;
    cnpjj:= 'CNPJ: ' + UDeclaracao.cnpj;

    rs.WriteFont(1, Alinha_Centro(titulo, i2), titulo, [bold]);
    rs.Write(1, 100, 'Data: ' + data);

    for i := 0 to i2 do
      rs.Write(2, i, '-');

    rs.Write(3, 0, empresa);
    rs.Write(3, 56, cce);

    rs.Write(4, 0, endemp);
    rs.Write(4, 50, mun);
    rs.Write(4, 90, uff);
    rs.Write(4, 105, cnpjj);

    for i := 0 to i2 do
      rs.Write(5, i, '-');

    {for i := 0 to i2 do
      rs.WriteFont(5, i, IntToStr(i), [Bold]); }

    //aux:= 0;
    //aux2:= 1;
    rs.WriteFont(6, 0, ecf, [Bold]);
    rs.WriteFont(6, Length(ecf) , crz, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz), coo, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) , venda_bruta, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) , candesc, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) , totiss, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) , venda_liquida, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) , isento, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) + Length(isento) , subs, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) + Length(isento) + Length(subs) , outros, [Bold]);



    //pega as aliquotas Tributaveis e monta suas respectivas colunas
    ADOQuery2.Close;
    ADOQuery2.Parameters.ParamByName('D').Value:= data;
    ADOQuery2.Parameters.ParamByName('N').Value:= EdtN_Serie.Text;
    ADOQuery2.Open;
    ADOQuery2.First;
    aux:= 0;
    while not ADOQuery2.Eof do
    begin
      rs.WriteFont(6, Length(ecf) +
                      Length(crz) +
                      Length(coo) +
                      Length(venda_bruta) +
                      Length(candesc) +
                      Length(totiss) +
                      Length(venda_liquida) +
                      Length(isento) +
                      Length(subs) +
                      Length(outros) + aux, ADOQuery2Totalizador_Parcial.AsString, [Bold]);

      rs.Write(7, Alinha_Centro_Texto(FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat),
                      Length(ecf) +
                      Length(crz) +
                      Length(coo) +
                      Length(venda_bruta) +
                      Length(candesc) +
                      Length(totiss) +
                      Length(venda_liquida) +
                      Length(isento) +
                      Length(subs) +
                      Length(outros) + aux, Length(FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat));

      aux:= aux + 7;
      ADOQuery2.Next;
    end;

    //------- fim monta aliquotas tributaveis


    //pega os valores das aliquotas I, N ou F
    ADOQuery3.Close;
    ADOQuery3.Parameters.ParamByName('D1').Value:= data;
    ADOQuery3.Parameters.ParamByName('D2').Value:= data;
    ADOQuery3.Parameters.ParamByName('D3').Value:= data;
    ADOQuery3.Parameters.ParamByName('D4').Value:= data;
    ADOQuery3.Parameters.ParamByName('D5').Value:= data;
    ADOQuery3.Parameters.ParamByName('D6').Value:= data;
    ADOQuery3.Parameters.ParamByName('D7').Value:= data;
    ADOQuery3.Parameters.ParamByName('N1').Value:= EdtN_Serie.Text;
    ADOQuery3.Parameters.ParamByName('N2').Value:= EdtN_Serie.Text;
    ADOQuery3.Open;
    ADOQuery3.First;

    while not ADOQuery3.Eof do
    begin
      if (ADOQuery3iss.AsString <> '') then
      begin
        iss:= ADOQuery3iss.AsFloat;
        rs.Write(7, Alinha_Centro_Texto(totiss,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc), Length(FormatFloat('#0.0,0', ADOQuery3iss.AsFloat))) , FormatFloat('#0.0,0', ADOQuery3iss.AsFloat));
      end;

      if (ADOQuery3Totalizador_Parcial.AsString = 'I1') then
        rs.Write(7, Alinha_Centro_Texto(isento,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida), Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))) , FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      if (ADOQuery3Totalizador_Parcial.AsString = 'F1') then
        rs.Write(7, Alinha_Centro_Texto(subs,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida) +
                    Length(isento) , Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      if (ADOQuery3Totalizador_Parcial.AsString = 'N1') then
        rs.Write(7, Alinha_Centro_Texto(outros,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida) +
                    Length(isento) +
                    Length(subs) , Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      ADOQuery3.Next;
    end;

    //----- fim pega aliquotas I, N ou F


    //----- pega os dados principais-----

    valor_bruto:= ADOQuery3venda_bruta.AsFloat;
    can:= ADOQuery3DT.AsFloat + ADOQuery3DS.AsFloat + ADOQuery3Cant.AsFloat + ADOQuery3Cans.AsFloat;
    valor_liquido:= valor_bruto - can - iss;

    rs.Write(7, 0, ADOQueryPCaixa.AsString);
    rs.Write(7, Length(ecf) , ADOQueryPCRZ.AsString);
    rs.Write(7, Length(ecf) + Length(crz) , ADOQueryPCOO.AsString);

    rs.Write(7, Alinha_Centro_Texto(venda_bruta,
                Length(ecf) +
                Length(crz) +
                Length(coo) , Length(FormatFloat('#0.0,0', valor_bruto))), FormatFloat('#0.0,0', valor_bruto));

    rs.Write(7, Alinha_Centro_Texto(candesc,
                Length(ecf) +
                Length(crz) +
                Length(coo) +
                Length(venda_bruta) , Length(FormatFloat('#0.0,0', can))), FormatFloat('#0.0,0', can));

    rs.Write(7, Alinha_Centro_Texto(venda_liquida,
                Length(ecf) +
                Length(crz) +
                Length(coo) +
                Length(venda_bruta) +
                Length(candesc) +
                Length(totiss) , Length(FormatFloat('#0.0,0', valor_liquido))), FormatFloat('#0.0,0', valor_liquido));


    // ------- fim ////
    for i := 0 to i2 do
      rs.Write(8, i, '-');

    rs.Write(10, 0, 'Observações');
    rs.Write(10, 60, 'Responsável pelo Estabelecimento');

    for i := 0 to 40 do
      rs.Write(12, i, '-');

    rs.Write(12, 60, '  Nome: ');
    rs.Write(14, 60, 'Função: ');

    for i := 68 to 100 do
      rs.Write(12, i, '-');

    for i := 68 to 100 do
      rs.Write(14, i, '-');

    rs.Print;
    //rs.EndDoc;
    ADOQueryP.Next;
  end;
end;

procedure TFrmMapa_Resumo.MapaResumo;
var
  i, i2, aux: integer;
  titulo, empresa, cce, endemp, mun, uff, cnpjj,
  ecf, crz, coo, venda_bruta, candesc, totiss, venda_liquida, isento, subs, outros: string;
  valor_bruto, can, iss, valor_liquido: double;
begin
  ADOQueryP.Close;
  ADOQueryP.Parameters.ParamByName('D1').Value:= StrToDateTime(MEdtData_Inicial.Text);
  ADOQueryP.Parameters.ParamByName('D2').Value:= StrToDateTime(MEdtData_Final.Text);
  ADOQueryP.Parameters.ParamByName('N').Value:= EdtN_Serie.Text;
  ADOQueryP.Open;
  ADOQueryP.First;
  ecf:= 'ECF  ';
  crz:= 'CRZ  ';
  coo:= 'COO    ';
  venda_bruta:= 'Venda Bruta ';
  candesc:= 'Canc./Desc. ';
  totiss:= 'Total. de ISS ';
  venda_liquida:= 'Valor Contábil | ';
  isento:= 'Isen./Não Trib. ';
  subs:= 'Subst. Tribut. ';
  outros:= 'Outros Rec. | ';

  while not ADOQueryP.Eof do
  begin
    rs.BeginDoc;
    i:= 0;
    i2:= 136;
    titulo:= 'MAPA RESUMO DO ECF';

    empresa:= ' Empresa: ' + razao_social;
    cce:= 'CCE: ' + insc_estadual;
    endemp:= 'Endereço: ' + UDeclaracao.tipo_endereco + ' ' + UDeclaracao.endereco + ', ' + UDeclaracao.numero;
    mun:= 'Município: ' + UDeclaracao.cidade;
    uff:= 'UF: ' + uDeclaracao.uf;
    cnpjj:= 'CNPJ: ' + UDeclaracao.cnpj;

    rs.WriteFont(1, Alinha_Centro(titulo, i2), titulo, [bold]);
    rs.Write(1, 100, 'Data: ' + ADOQueryPDatamov.AsString);

    for i := 0 to i2 do
      rs.Write(2, i, '-');

    rs.Write(3, 0, empresa);
    rs.Write(3, 56, cce);

    rs.Write(4, 0, endemp);
    rs.Write(4, 50, mun);
    rs.Write(4, 90, uff);
    rs.Write(4, 105, cnpjj);

    for i := 0 to i2 do
      rs.Write(5, i, '-');

    {for i := 0 to i2 do
      rs.WriteFont(5, i, IntToStr(i), [Bold]); }

    //aux:= 0;
    //aux2:= 1;
    rs.WriteFont(6, 0, ecf, [Bold]);
    rs.WriteFont(6, Length(ecf) , crz, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz), coo, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) , venda_bruta, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) , candesc, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) , totiss, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) , venda_liquida, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) , isento, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) + Length(isento) , subs, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) + Length(isento) + Length(subs) , outros, [Bold]);



    //pega as aliquotas Tributaveis e monta suas respectivas colunas
    ADOQuery2.Close;
    ADOQuery2.Parameters.ParamByName('D').Value:= ADOQueryPDatamov.Value;
    ADOQuery2.Parameters.ParamByName('N').Value:= EdtN_Serie.Text;
    ADOQuery2.Open;
    ADOQuery2.First;
    aux:= 0;
    while not ADOQuery2.Eof do
    begin
      rs.WriteFont(6, Length(ecf) +
                      Length(crz) +
                      Length(coo) +
                      Length(venda_bruta) +
                      Length(candesc) +
                      Length(totiss) +
                      Length(venda_liquida) +
                      Length(isento) +
                      Length(subs) +
                      Length(outros) + aux, ADOQuery2Totalizador_Parcial.AsString, [Bold]);

      rs.Write(7, Alinha_Centro_Texto(FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat),
                      Length(ecf) +
                      Length(crz) +
                      Length(coo) +
                      Length(venda_bruta) +
                      Length(candesc) +
                      Length(totiss) +
                      Length(venda_liquida) +
                      Length(isento) +
                      Length(subs) +
                      Length(outros) + aux, Length(FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat));

      aux:= aux + 7;
      ADOQuery2.Next;
    end;

    //------- fim monta aliquotas tributaveis


    //pega os valores das aliquotas I, N ou F
    ADOQuery3.Close;
    ADOQuery3.Parameters.ParamByName('D1').Value:= ADOQueryPDatamov.Value;
    ADOQuery3.Parameters.ParamByName('D2').Value:= ADOQueryPDatamov.Value;
    ADOQuery3.Parameters.ParamByName('N').Value:= EdtN_Serie.Text;
    ADOQuery3.Open;
    ADOQuery3.First;

    while not ADOQuery3.Eof do
    begin
      //if (ADOQuery3iss.AsString <> '') then
      //begin
        iss:= ADOQuery3iss.AsFloat;
        rs.Write(7, Alinha_Centro_Texto(totiss,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc), Length(FormatFloat('#0.0,0', ADOQuery3iss.AsFloat))) , FormatFloat('#0.0,0', ADOQuery3iss.AsFloat));
      //end;

      if (ADOQuery3Totalizador_Parcial.AsString = 'I1') then
        rs.Write(7, Alinha_Centro_Texto(isento,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida), Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))) , FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      if (ADOQuery3Totalizador_Parcial.AsString = 'F1') then
        rs.Write(7, Alinha_Centro_Texto(subs,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida) +
                    Length(isento) , Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      if (ADOQuery3Totalizador_Parcial.AsString = 'N1') then
        rs.Write(7, Alinha_Centro_Texto(outros,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida) +
                    Length(isento) +
                    Length(subs) , Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      ADOQuery3.Next;
    end;

    //----- fim pega aliquotas I, N ou F


    //----- pega os dados principais-----

    ADOQuery4.Close;
    ADOQuery4.Parameters.ParamByName('D').Value:= ADOQueryPDatamov.Value;
    ADOQuery4.Open;

    //valor_bruto:= ADOQuery3venda_bruta.AsFloat;
    //can:= ADOQueryPDesconto.AsFloat + ADOQuery4Desconto.AsFloat;
    valor_liquido:= valor_bruto - can - iss;

    rs.Write(7, 0, ADOQueryPCaixa.AsString);
    rs.Write(7, Length(ecf) , ADOQueryPCRZ.AsString);
    rs.Write(7, Length(ecf) + Length(crz) , ADOQueryPCOO.AsString);

    rs.Write(7, Alinha_Centro_Texto(venda_bruta,
                Length(ecf) +
                Length(crz) +
                Length(coo) , Length(FormatFloat('#0.0,0', 0))), FormatFloat('#0.0,0', 0));

    rs.Write(7, Alinha_Centro_Texto(candesc,
                Length(ecf) +
                Length(crz) +
                Length(coo) +
                Length(venda_bruta) , Length(FormatFloat('#0.0,0', can))), FormatFloat('#0.0,0', can));

    rs.Write(7, Alinha_Centro_Texto(venda_liquida,
                Length(ecf) +
                Length(crz) +
                Length(coo) +
                Length(venda_bruta) +
                Length(candesc) +
                Length(totiss) , Length(FormatFloat('#0.0,0', valor_liquido))), FormatFloat('#0.0,0', valor_liquido));


    // ------- fim ////
    for i := 0 to i2 do
      rs.Write(8, i, '-');

    rs.Write(10, 0, 'Observações');
    rs.Write(10, 60, 'Responsável pelo Estabelecimento');

    for i := 0 to 40 do
      rs.Write(12, i, '-');

    rs.Write(12, 60, '  Nome: ');
    rs.Write(14, 60, 'Função: ');

    for i := 68 to 100 do
      rs.Write(12, i, '-');

    for i := 68 to 100 do
      rs.Write(14, i, '-');

    ADOQueryP.Next;
    rs.Print;
  end;
end;


procedure TFrmMapa_Resumo.BBtnSalvarClick(Sender: TObject);
var
   iPosicao, ACK, ST1, ST2, ST3: integer;
   flag: string;
   cindice, cdescricao, aux, aux3, aux4, aux5, aux6: AnsiString;
   posicao: AnsiString;
begin
  if (MEdtData_Inicial.Text = '  /  /    ') or (MEdtData_Final.Text = '  /  /    ') then
  begin
    MEdtData_Inicial.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (EdtN_Serie.Text = '') then
  begin
    EdtN_Serie.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  MapaResumo2;
  {FrmRel_Mapa_Resumo:= TFrmRel_Mapa_Resumo.Create(self);
  FrmRel_Mapa_Resumo.Release;
  FrmRel_Mapa_Resumo:= Nil; }
{  UDeclaracao.Bematech_FI_MapaResumoMFD;
  Arquivo_Gerado(Local_Arquivo(14) + 'Retorno.txt');
  UDeclaracao.Insere_Historico(usuario, 'GEROU RELATÓRIO DE MAPA RESUMO DO PAF-ECF.', TimeToStr(time), consu, date);
  Util.Desabilita_Campos(FrmMapa_Resumo);    }
end;

procedure TFrmMapa_Resumo.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmMapa_Resumo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMapa_Resumo.Free;
  FrmMapa_Resumo:= Nil;
end;

procedure TFrmMapa_Resumo.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmMapa_Resumo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
    Util.Inicia_Data(MEdtData_Final, MEdtData_Inicial);
    EdtN_Serie.Text:= nu_serie_inteiro;
  end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmMapa_Resumo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
