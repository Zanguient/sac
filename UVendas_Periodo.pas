unit UVendas_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ADODB, DB, Grids, DBGrids, ComCtrls,
  ToolWin, ImgList, DBClient, Provider, ACBrSintegra, ACBrSpedFiscal, Util.TLog,
  ACBrEFDBlocos, ACBrConsts, ACBrUtil, UGeral, System.Generics.Collections;

type
  TFrmVendas_Periodo = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    CdsRegistros: TClientDataSet;
    CdsRegistrosRegistro: TStringField;
    CdsRegistrosTotal: TIntegerField;
    ControleLinhaBloco: TClientDataSet;
    ControleLinhaBlocoBLOCO: TStringField;
    ControleLinhaBlocoQUANT: TIntegerField;
    CdsClienteAux: TClientDataSet;
    CdsClienteAuxID: TStringField;
    CdsClienteAuxDESCRICAO: TStringField;
    CdsClienteAuxCNPJCPF: TStringField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Valor: TFloatField;
    ClientDataSet1Aliquota: TFloatField;
    ClientDataSet1CFOP: TStringField;
    ClientDataSet1Registro: TIntegerField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2Aliquota: TFloatField;
    ClientDataSet2CFOP: TStringField;
    ClientDataSet2ST: TStringField;
    ClientDataSet2Valor_Operacao: TFloatField;
    ClientDataSet2BC_ICMS: TFloatField;
    ClientDataSet2Valor_ICMS: TFloatField;
    ClientDataSet2BC_ICMS_ST: TFloatField;
    ClientDataSet2Valor_ICMS_ST: TFloatField;
    ClientDataSet2Valor_Red_BC: TFloatField;
    ClientDataSet2Valor_IPI: TFloatField;
    CBConvenio: TCheckBox;
    CBAto_Cotepe: TCheckBox;
    ClientDataSet3: TClientDataSet;
    ClientDataSet3Aliquota: TStringField;
    ClientDataSet3CFOP: TStringField;
    ClientDataSet3ST: TStringField;
    ClientDataSet3Valor_Operacao: TFloatField;
    ClientDataSet3BC_ICMS: TFloatField;
    ClientDataSet3Valor_ICMS: TFloatField;
    ACBrSintegra: TACBrSintegra;
    LblMarca: TLabel;
    EdtECF: TEdit;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
  private
    sArquivo: TextFile;
    NomeArquivo: AnsiString;
    pDatai, pdataf: TDate;
    sTotalReg, sLBloco: Integer;
    sLRegistro, sLArquivo, qtde_itens, qtde_registros, qtde_itens_20, qtde_registros_05,
    qtde_registros_400, qtde_registros_490, qtde_registros_001, qtde_registros_100, qtde_registros_140,
    qtde_registros_141, qtde_registros_170, qtde_registros_190, qtde_registros_350, qtde_registros_370,
    qtde_registros_390: integer;
    sControleReg, CFOPP, produto: AnsiString;
    q75, qAux_Contador, qAux_Cliente, qAux_Item, qAux_NCM : TADOQuery;
    valor_icms, valor_bc, valor_total_item, aliquota_icms: double;

    qry0150, qry0190, qryC100,qryc170, qryDadosContador, qryc190, qryProdutoInventario,
    qry0200, qryC400, qryc405, qryc420, qryc460, qryc470, qryc490: TADOQuery;

    Utili: TUtil;

    function Valida: boolean;
    procedure InsereTotalReg(pRegistro: String; pTotal: Integer);
    procedure GravaLinhaArquivo(fConteudo:String);
    function Le_Linha_Arquivo(fTexto, fCaracter: string; fPosicao: Integer): string;
    procedure RetornaNumOrdem(var PriNum, UltNum: String;pDatai,pdataf:TDatetime);
    procedure ProcessaRegistro10(pDatai,pdataf:TDatetime;pEstrutura,pNatureza,pFinalidade:String);
    procedure ProcessaRegistro11;
    procedure ProcessaRegistro50(pDatai, pdataf: TDatetime);
    procedure ProcessaRegistro51(pDatai, pdataf: TDatetime);
    procedure ProcessaRegistro54(pDatai, pdataf: TDatetime);

    procedure ProcessaRegistro60m(pDatai,pdataf:TDatetime;p60d,p60i,p60r:Boolean);
    procedure ProcessaRegistro61(pDatai, pdataf: TDatetime);
    function ProcessaRegistro61r(pDatai, pdataf: TDatetime): boolean;
    procedure ProcessaRegistro7561r(pDatai, pdataf: TDatetime);
    procedure ProcessaRegistro70;
    procedure ProcessaRegistro75(pDatai, pdataf: TDatetime);
    procedure ProcessaRegistro90;

    procedure GeraBloco0(pArquivo:String;pDatai,pDataf:TDateTime);
    procedure GeraBlocoC(pArquivo:String;pDatai,pDataf:TDateTime);
    procedure GeraBlocoD();
    procedure GeraBlocoE(pArquivo:String;pDatai,pDataf:TDateTime);
    procedure GeraBlocoG();
    procedure GeraBlocoH(pArquivo:String;pDatai,pDataf:TDateTime);
    procedure GeraBloco1();
    procedure GeraBloco9(pArquivo:String;pDatai,pDataf:TDateTime);

    procedure GravaArquivoBlocoC(fConteudo:String);
    procedure GravaQtdeBlocoC001;
    procedure GravaQtdeBlocoC6070;
    procedure GravaQtdeBlocoC0520;
    procedure GravaQtdeBlocoC400;
    procedure GravaQtdeBlocoC490;
    procedure GravaQtdeBlocoC100;
    procedure GravaQtdeBlocoC140;
    procedure GravaQtdeBlocoC141;
    procedure GravaQtdeBlocoC170;
    procedure GravaQtdeBlocoC190;

    procedure GravaQtdeBlocoC350;
    procedure GravaQtdeBlocoC370;
    procedure GravaQtdeBlocoC390;
    procedure Captura_Contador;
    procedure Captura_Cliente;
    procedure Captura_Itens_Produto_Servico;
    procedure GeraBloco0ACBr(pArquivo:String;pDatai,pDataf:TDateTime);
    procedure Pega_NCM(Aliquota: string);
    procedure Grava_Aliquota(Registro: integer);
    procedure Grava_170(Aliquota, Valor_Operacao, BC_ICMS, Valor_ICMS, BC_ICMS_ST, Valor_ICMS_ST, Valor_Red_BC, Valor_IPI: double; CFOP, ST: AnsiString);
    procedure Grava_370(CST, Ali_ICMS, CFOP: AnsiString; Valor_Operacao, Base_ICMS, Valor_ICMS: double);



    //Sintegra ACBr
    procedure GeraRegistro10(pDatai,pdataf:TDatetime;pEstrutura,pNatureza,pFinalidade:String);
    procedure GeraRegistro11;
    procedure GeraRegistro60M;

    //SPED
    procedure Consulta0150;
    procedure Consulta0190;
    procedure Consulta0190H;
    procedure Consulta0200;
    procedure ConsultaC100;
    procedure ConsultaC170;
    //procedure ConsultaC176();
    procedure ConsultaC190;

    procedure ConsultaC400;
    procedure ConsultaC405;
    procedure ConsultaC420;
    procedure ConsultaC460;
    procedure ConsultaC470;
    procedure ConsultaC490;

    procedure ConsultaProdutosInventario;
    procedure ConsultaDadosContador;
    procedure GeraSped;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendas_Periodo: TFrmVendas_Periodo;

implementation

uses UDeclaracao, UMenu_Geral, UDM;

{$R *.dfm}

procedure TFrmVendas_Periodo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmVendas_Periodo.BBtnSalvarClick(Sender: TObject);
var
  EAD, hora, data: AnsiString;
begin
  if (valida) then
  begin
    try
      if (CBConvenio.Checked = true) then
      begin
        hora := FormatDateTime('hhmmss',Time);
        data := FormatDateTime('ddmmyyyy',date);
        pDatai:= StrToDateTime(MEdtData_Inicial.Text);
        pdataf:= StrToDateTime(MEdtData_Final.Text);
        //Captura_Numero_Caixa;
        SetLength(EAD, 256);
        // gera arquivo de sintegra
        //NomeArquivo := Local_Arquivo(14) + 'Sintegra.txt';
        NomeArquivo := Local_Arquivo(14) + n_laudo+data+hora+'.txt';
        // zera contadores de registros
        if not (CdsRegistros.Active) then
          CdsRegistros.CreateDataSet;
        CdsRegistros.EmptyDataSet;
        sTotalReg := 0;
        // verifica se existe arquivo
        if FileExists(NomeArquivo) then
           DeleteFile(NomeArquivo);
        AssignFile(sArquivo, NomeArquivo);
        Rewrite(sArquivo);
        // monta registros no arquivo
        //ProcessaRegistro60m(pDatai,pdataf,true,true,true); só para testar
        ProcessaRegistro10(pDatai,pdataf,'3','3','1');
        ProcessaRegistro11;
        //ProcessaRegistro50(pDatai,pdataf);
        //ProcessaRegistro51(pDatai,pdataf);    //tirei de Entrada de Nota
        //ProcessaRegistro54(pDatai,pdataf);
        ProcessaRegistro60m(pDatai,pdataf,true,true,true);
        //ProcessaRegistro61(pDatai,pdataf);     //Movimentação manual
        {if ProcessaRegistro61r(pDatai,pdataf) then
        begin
          ProcessaRegistro75(pDatai,pdataf);
          ProcessaRegistro7561r(pDatai,pdataf);
        end
        else
          ProcessaRegistro75(pDatai,pdataf);}

        //ProcessaRegistro61r(pDatai,pdataf);   //Itens da movimentação
        ProcessaRegistro75(pDatai,pdataf);
        ProcessaRegistro90;
        // fecha o arquivo
        CloseFile(sArquivo);
        // assina arquio
        generateEAD(NomeArquivo, cChavePublica, cChavePrivada, EAD, 1);
        Arquivo_Gerado(NomeArquivo);
        UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DO SINTEGRA.', TimeToStr(time), consu, date);
      end;

      if (CBAto_Cotepe.Checked = true) then
      begin
        GeraSped();
        // gera arquivo de SPED
        //NomeArquivo := Local_Arquivo(14) + 'SPED.txt';
        //Sleep(1000);
        {SetLength(EAD, 256);
        pDatai:= StrToDateTime(MEdtData_Inicial.Text);
        pdataf:= StrToDateTime(MEdtData_Final.Text);
        hora := FormatDateTime('hhmmss',Time);
        data := FormatDateTime('ddmmyyyy',date);
        NomeArquivo := Local_Arquivo(14) + n_laudo+data+hora+'.txt';
        // verifica se existe arquivo
        if FileExists(NomeArquivo) then
           DeleteFile(NomeArquivo);
        AssignFile(sArquivo,NomeArquivo);
        Rewrite(sArquivo);

        // gera os blocos solicitados
        GeraBloco0(NomeArquivo,pDatai,pdataf);
        GeraBlocoC(NomeArquivo,pDatai,pdataf);
        GeraBlocoD;
        GeraBlocoE(NomeArquivo,pDatai,pdataf);
        GeraBlocoG;
        GeraBlocoH(NomeArquivo,pDatai,pdataf);
        GeraBloco1;
        GeraBloco9(NomeArquivo,pDatai,pdataf);
        // fecha o arquivo
        CloseFile(sArquivo);
        // assina arquio
        generateEAD(NomeArquivo, cChavePublica, cChavePrivada, EAD, 1);
        Arquivo_Gerado(NomeArquivo);
        UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DO SPED.', TimeToStr(time), consu, date);
        }
      end;
    finally
      Processo_Concluido;
    end;
  end;
end;

procedure TFrmVendas_Periodo.Captura_Cliente;
begin
  {try
    qAux_Cliente:= TADOQuery.Create(self);
    with qAux_Cliente, sql do
    begin
      Close;
      Connection:= dm.ADOConnection1;
      Clear;
      Add('select Ped.Codigo_Cliente, Cli.Nome_Nome_Fantasia, Cli.CPF, Cli.CNPJ,');
      Add('Cli.Insc_Estadual, Cli.Numero, Cli.Complemento, Cid.Codigo_Municipio, Cli.Suframa,');
      Add('P.Codigo_Pais, Log.Descricao as Endereco, Se.Descricao as Setor from Pedido Ped');
      add('inner join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
      add('inner join Cidade Cid on (Cid.Codigo = Cli.Codigo_Cidade)');
      add('inner join Logradouro Log on (Log.Codigo = Cli.Codigo_Logradouro)');
      add('inner join Setor Se on (Se.Codigo = Cli.Codigo_Setor)');
      add('inner join Pais P on (Cli.Codigo_Pais = P.Codigo)');
      Add('where Ped.Data_Venda between :pDatai and :pDataf');
      Add('and Ped.Codigo_Empresa = :pIDEmp');
      Add('and Ped.COO > 0');
      Add('and Ped.Status = :Baixado');
      Add('and Ped.Tipo = :Pedido or Ped.Tipo = :PDV');
      Add('group by Ped.Codigo_Cliente, Cli.Nome_Nome_Fantasia, Cli.CPF, Cli.CNPJ,');
      Add('Cli.Insc_Estadual, Cli.Numero, Cli.Complemento, Cid.Codigo_Municipio, Cli.Suframa,');
      Add('P.Codigo_Pais, Log.Descricao, Se.Descricao');
      Parameters.ParamByName('pDatai').Value := pDatai;
      Parameters.ParamByName('pDataf').Value := pDataf;
      Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
      Parameters.ParamByName('Baixado').Value := 'PAGO';
      Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
      Parameters.ParamByName('PDV').Value := 'PDV';
      Open
    end;
  finally

  end; }
end;

procedure TFrmVendas_Periodo.Captura_Contador;
begin
  {try
   qAux_Contador:= TADOQuery.Create(self);
    with qAux_Contador, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Cont.*, Cid.Codigo_Municipio, Log.Descricao as Endereco, Log.CEP, Se.Descricao as Setor');
      add('from Contabilista Cont');
      add('inner join Cidade Cid on (Cont.Codigo_Cidade = Cid.Codigo)');
      add('inner join Logradouro Log on (Cont.Codigo_Endereco = Log.Codigo)');
      add('inner join Setor Se on (Cont.Codigo_Setor = Se.Codigo)');
      add('where Codigo_Empresa = :Codigo');
      Parameters.ParamByName('Codigo').Value:= UDeclaracao.codigo_empresa;
      open;
    end;
  finally

  end; }
end;

procedure TFrmVendas_Periodo.Captura_Itens_Produto_Servico;
begin
  {try
    qAux_Item:= TADOQuery.Create(self);
    with qAux_Item, sql do
    begin
      Close;
      Connection:= dm.ADOConnection1;
      Clear;
      Add('select IP.Codigo_Produto, Pro.Descricao, Pro.Codigo_Venda,');
      Add('UM.Sigla as Unidade, Pro.Codigo_Grupo_Tributacao, Pro.Codigo_Grupo_Tributacao_IPI from Pedido Ped');
      Add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
      Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
      Add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      Add('where Ped.Data_Venda between :pDatai and :pDataf');
      Add('and Ped.Codigo_Empresa = :pIDEmp');
      Add('and Ped.COO > 0');
      Add('and Ped.Status = :Baixado');
      Add('and Ped.Tipo = :Pedido or Ped.Tipo = :PDV');
      Add('and Pro.Codigo_Unidade_Medida is not null');
      Add('group by IP.Codigo_Produto, Pro.Descricao, Pro.Codigo_Venda,');
      Add('UM.Sigla, Pro.Codigo_Grupo_Tributacao,');
      Add('Pro.Codigo_Grupo_Tributacao_IPI');
      ParamByName('pDatai').Value := pDatai;
      ParamByName('pDataf').Value := pDataf;
      ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
      ParamByName('Baixado').Value := 'PAGO';
      ParamByName('Pedido').Value := 'PRÉ-VENDA';
      ParamByName('PDV').Value := 'PDV';
      Open
    end;
  finally

  end;}
end;

procedure TFrmVendas_Periodo.Pega_NCM(Aliquota: string);
begin
  qAux_NCM:= TADOQuery.Create(self);
  with qAux_NCM, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select NCM.Codigo_NCM, NCM.Descricao from NCM');
    add('left join Regra_IPI RI on (NCM.Codigo = RI.Codigo_NCM)');
    add('where RI.Aliquota = :Aliquota');
    Parameters.ParamByName('Aliquota').Value:= Aliquota;
    open;
  end;
end;

procedure TFrmVendas_Periodo.ProcessaRegistro10(pDatai,pdataf:TDatetime;pEstrutura,pNatureza,pFinalidade:String);
var Linha : String;
begin
  Linha := '10';
  Linha := Linha + ZeroEsquerda(cnpj,14);
  Linha := Linha + AlinhaTXT(insc_estadual,1,14);
  Linha := Linha + AlinhaTXT((Copy(razao_social,1,35)),1,35);
  Linha := Linha + AlinhaTXT(cidade,1,30);
  Linha := Linha + AlinhaTXT(uf,1,2);
  telefone:= StringReplace(telefone, '-', '', [rfReplaceAll]);
  telefone:= StringReplace(telefone, '(', '', [rfReplaceAll]);
  telefone:= StringReplace(telefone, ')', '', [rfReplaceAll]);
  Linha := Linha + ZeroEsquerda(telefone,10);
  Linha := Linha + FormatDateTime('YYYYMMDD',pDatai);
  Linha := Linha + FormatDateTime('YYYYMMDD',pDataf);
  Linha := Linha + pEstrutura;
  Linha := Linha + pNatureza;
  Linha := Linha + pFinalidade;
  writeLn(sArquivo,Linha);

end;

procedure TFrmVendas_Periodo.ProcessaRegistro11;
var Linha : String;
begin
  cep:= StringReplace(cep, '-', '', [rfReplaceAll]);
  telefone_contato:= StringReplace(telefone_contato, '(', '', [rfReplaceAll]);
  telefone_contato:= StringReplace(telefone_contato, ')', '', [rfReplaceAll]);
  telefone_contato:= StringReplace(telefone_contato, '-', '', [rfReplaceAll]);
  Linha := '11';
  Linha := Linha + AlinhaTXT(Copy(endereco,1,34),1,34);
  Linha := Linha + ZeroEsquerda(numero,5);
  Linha := Linha + AlinhaTXT(complemento,1,22);
  Linha := Linha + AlinhaTXT(Copy(setor,1,15),1,15);
  Linha := Linha + ZeroEsquerda(cep,8);
  Linha := Linha + AlinhaTXT(Copy(contato,1,28),1,28);
  Linha := Linha + ZeroEsquerda(telefone_contato,12);
  writeLn(sArquivo,Linha);
end;

procedure TFrmVendas_Periodo.ProcessaRegistro50(pDatai, pdataf: TDatetime);
var Linha, aux, AnoMes : String;
    Q, qAux, q50 : TADOQuery;
    cfop: AnsiString;
    atotal: integer;
begin
  q50 := TADOQuery.Create(nil);
  atotal := 0;

  with q50, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select EP.*, CFOP.CFOP, Forn.Nome_Fantasia, Forn.CNPJ, Forn.Insc_Estadual_Municipal, Cid.UF,');
    add('IE.* from Entrada_Produtos EP');
    add('left join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
    add('left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');
    add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo)');
    add('where EP.Data_Entrada between :DI and :DF');
    Parameters.ParamByName('DI').Value:= pDatai;
    Parameters.ParamByName('DF').Value:= pDataf;
    open;
  end;
  //Q.SQLConnection := ConexaoDados;
  //
  q50.First;
  while not q50.Eof do
  begin
    cfop:= StringReplace(q50.FieldByName('CFOP').AsString, '.', '',[rfReplaceAll]);

    Linha := '50';         //1
    Linha := Linha + ZeroEsquerda(q50.FieldByName('CNPJ').AsString,14); //2
    if (q50.FieldByName('Insc_Estadual_Municipal').AsString = '') then
      Linha := Linha + AlinhaTXT('ISENTO',1,14)
    else
      Linha := Linha + AlinhaTXT(q50.FieldByName('Insc_Estadual_Municipal').AsString,1,14);
    Linha := Linha + FormatDateTime('YYYYMMDD',q50.FieldByName('Data_Emissao').AsDateTime); //4
    Linha := Linha + AlinhaTXT(q50.FieldByName('UF').AsString,1,2); //5
    Linha := Linha + ZeroEsquerda(q50.FieldByName('Modelo').AsString,2); //6
    Linha := Linha + AlinhaTXT(q50.FieldByName('Serie').AsString,1,3); //7
    Linha := Linha + ZeroEsquerda(q50.FieldByName('N_Nota_Fiscal').AsString,6); //8
    Linha := Linha + ZeroEsquerda(cfop,4); //9
    Linha := Linha + 'P'; //emitente da nota (p-próprio/T-terceiro) //10

    //valor total da nota
    aux := FormatFloat('0.00',q50.FieldByName('Total_Nota').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13); //11

    //base calculo icms
    aux := FormatFloat('0.00',q50.FieldByName('Base_ICMS').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13); //12

    //valor icms
    aux := FormatFloat('0.00',q50.FieldByName('Valor_ICMS').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13); //13

    //isenta ou não tributadas
    aux := FormatFloat('0.00',q50.FieldByName('Isento_ICMS').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13); //14

    //outras
    aux := FormatFloat('0.00',q50.FieldByName('Outros_ICMS').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13); //15

    //aliquota icms
    aux := FormatFloat('0.00',q50.FieldByName('Aliquota').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,4); //16

    //situacao da nf
    Linha := Linha + 'N'; //17

    writeLn(sArquivo,Linha);
    Inc(atotal);
    q50.Next;
  end;

  if atotal > 0 then
     InsereTotalReg('50',atotal);
end;

procedure TFrmVendas_Periodo.ProcessaRegistro51(pDatai, pdataf: TDatetime);
var Linha, aux, AnoMes : String;
    Q, qAux, q51 : TADOQuery;
    cfop: AnsiString;
    atotal: integer;
begin
  q51 := TADOQuery.Create(nil);
  atotal := 0;

  with q51, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select EP.*, Forn.Nome_Fantasia, Forn.CNPJ, Forn.Insc_Estadual_Municipal, Cid.UF,');
    add('IE.*, IT.CFOP from Entrada_Produtos EP');
    add('left join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
    add('left join Itens_Entrada IT on (EP.Codigo = IT.Codigo)');
    add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo)');
    add('where EP.Data_Entrada between :DI and :DF and (IE.Total_IPI > 0 or IE.Isento_IPI > 0 or IE.Outros_IPI > 0)');
    Parameters.ParamByName('DI').Value:= pDatai;
    Parameters.ParamByName('DF').Value:= pDataf;
    open;
  end;
  //Q.SQLConnection := ConexaoDados;
  //
  q51.First;
  while not q51.Eof do
  begin
    cfop:= StringReplace(q51.FieldByName('CFOP').AsString, '.', '',[rfReplaceAll]);

    Linha := '51';
    Linha := Linha + ZeroEsquerda(q51.FieldByName('CNPJ').AsString,14);
    if (q51.FieldByName('Insc_Estadual_Municipal').AsString = '') then
      Linha := Linha + AlinhaTXT('ISENTO',1,14)
    else
      Linha := Linha + AlinhaTXT(q51.FieldByName('Insc_Estadual_Municipal').AsString,1,14);

    Linha := Linha + FormatDateTime('YYYYMMDD',q51.FieldByName('Data_Emissao').AsDateTime);
    Linha := Linha + AlinhaTXT(q51.FieldByName('UF').AsString,1,2);
    Linha := Linha + AlinhaTXT(q51.FieldByName('Serie').AsString,1,3);
    Linha := Linha + ZeroEsquerda(q51.FieldByName('N_Nota_Fiscal').AsString,6);
    Linha := Linha + ZeroEsquerda(cfop,4);

    //valor total da nota
    aux := FormatFloat('0.00',q51.FieldByName('Total_Nota').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13);

    //valor do ipi
    aux := FormatFloat('0.00',q51.FieldByName('Total_IPI').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13);

    //isenta ou não tributadas
    aux := FormatFloat('0.00',q51.FieldByName('Isento_IPI').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13);

    //outras ipi
    aux := FormatFloat('0.00',q51.FieldByName('Outros_IPI').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13);

    //brancos
    Linha := Linha + AlinhaTXT('',1,20);

    //situacao da nf
    Linha := Linha + 'N';

    writeLn(sArquivo,Linha);
    Inc(atotal);
    q51.Next;
  end;
  if atotal > 0 then
     InsereTotalReg('51',atotal);
end;

procedure TFrmVendas_Periodo.ProcessaRegistro54(pDatai, pdataf: TDatetime);
var Linha, aux, AnoMes : String;
    Q, qAux, q54 : TADOQuery;
    cfop: AnsiString;
    atotal: integer;
begin
  q54 := TADOQuery.Create(nil);
  atotal := 0;

  with q54, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select EP.*, Forn.CNPJ, P.Codigo_Venda,');
    add('IT.*, IE.Aliquota from Entrada_Produtos EP');
    add('left join Itens_Entrada IT on (EP.Codigo = IT.Codigo)');
    add('left join Impostos_Entrada IE on (EP.Codigo = IT.Codigo)');
    add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Produto P on (IT.Codigo_Produto = P.Codigo)');
    add('where EP.Data_Entrada between :DI and :DF and IE.N_Nota_Fiscal = EP.N_Nota_Fiscal');
    Parameters.ParamByName('DI').Value:= pDatai;
    Parameters.ParamByName('DF').Value:= pDataf;
    open;
  end;
  //Q.SQLConnection := ConexaoDados;
  //
  q54.First;
  while not q54.Eof do
  begin
    cfop:= StringReplace(q54.FieldByName('CFOP').AsString, '.', '',[rfReplaceAll]);

    Linha := '54';
    Linha := Linha + ZeroEsquerda(q54.FieldByName('CNPJ').AsString,14);
    Linha := Linha + ZeroEsquerda(q54.FieldByName('Modelo').AsString,2); //3
    Linha := Linha + AlinhaTXT(q54.FieldByName('Serie').AsString,1,3);
    Linha := Linha + ZeroEsquerda(q54.FieldByName('N_Nota_Fiscal').AsString,6);
    Linha := Linha + ZeroEsquerda(cfop,4);
    Linha := Linha + '0'+q54.FieldByName('ST').AsString;
    Linha := Linha + ZeroEsquerda(q54.FieldByName('N_Item').AsString,3);
    Linha := Linha + AlinhaTXT(q54.FieldByName('Codigo_Venda').AsString,1,14);

    //quantidade
    aux := FormatFloat('0.000',q54.FieldByName('Quantidade').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,11);

    //valor bruto (unit * qtde)
    aux := FormatFloat('0.00',q54.FieldByName('Valor_Total').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,12);

    //valor desconto
    aux := FormatFloat('0.00',0);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,12);

    //base calculo icms
    aux := FormatFloat('0.00',q54.FieldByName('Valor_Total').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,12);

    //base calculo icms st
    aux := FormatFloat('0.00',0);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,12);

    //valor ipi
    aux := FormatFloat('0.00',q54.FieldByName('Valor_IPI').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,12);

    //aliquota icms
    aux := FormatFloat('0.00',q54.FieldByName('Aliquota').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,4);

    writeLn(sArquivo,Linha);
    Inc(atotal);
    q54.Next;
  end;
  if atotal > 0 then
     InsereTotalReg('54',atotal);
end;

procedure TFrmVendas_Periodo.ProcessaRegistro60m(pDatai,pdataf:TDatetime;p60d,p60i,p60r:Boolean);
var Linha, aux, AnoMes : String;
    atotal : Integer;
    aValor : Double;
    Q, qAux, q60m : TADOQuery;
    Dia, Mes, Ano : Word;
    data2: TDate;
    d1, d2, d3, da, data, caixa, venda_bruta, grande_total, tot_par, valor_acu, valor_acu_aux, item: ansistring;
    vai: boolean;
    ali: double;
begin
  atotal := 0;
  Q := TADOQuery.Create(nil);
  qAux := TADOQuery.Create(nil);
  q60m := TADOQuery.Create(nil);

  with q60m, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select * from R02 where Data_Movimento between :DI and :DF and N_Fabricacao = :ECF');
    Parameters.ParamByName('DI').Value:= pDatai;
    Parameters.ParamByName('DF').Value:= pDataf;
    Parameters.ParamByName('ECF').Value:= EdtECF.Text;
    open;
  end;
  //Q.SQLConnection := ConexaoDados;
  //
  q60m.First;
  while not q60m.Eof do
  begin
    d1:= Copy(q60m.FieldByname('Data_Emissao').AsString, 1, 2);
    d2:= Copy(q60m.FieldByname('Data_Emissao').AsString, 3, 2);
    d3:= Copy(q60m.FieldByname('Data_Emissao').AsString, 5, 2);
    da:= d1 + '/' + d2 + '/' + d3;
    //data:= FormatDateTime('DD/MM/YYYY', StrToDateTime(da));
    data:= q60m.FieldByName('Data_Movimento').AsString;
    data:= StringReplace(data, '-', '', [rfReplaceAll]);

    d1:= Copy(data, 1, 4);
    d2:= Copy(data, 5, 2);
    d3:= Copy(data, 7, 2);

    data:= d3 + '/' + d2 + '/' + d1;

    if (q60m.FieldByName('Venda_Bruta_Diaria').AsString = '0') then//or (StrToDateTime(data) = date) then
    begin
      q60m.Next;
    end
    else
    begin
      Linha := '60M';
      Linha := Linha + FormatDateTime('YYYYMMDD',StrToDate(data));
      //Linha := Linha + FormatDateTime('YYYYMMDD',StrToDateTime(da));
      Linha := Linha + AlinhaTXT(q60m.FieldByName('N_Fabricacao').AsString,1,20);
      caixa:= Copy(q60m.FieldByName('Caixa').AsString, 2,3);
      Linha := Linha + AlinhaTXT(caixa,1,3);
      Linha := Linha + '2D';
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('COO_Inicial').AsInteger),6);
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('COO_Final').AsInteger),6);
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('CRZ').AsInteger),6);
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('CRO').AsInteger),3);

      //venda_bruta:= Remove_Virgula(q60m.FieldByName('Venda_Bruta_Diaria').AsString);
      //venda_bruta:= Copy(q60m.FieldByName('Venda_Bruta_Diaria').AsString, 3,16);
      //aux := FormatFloat('0.00',StrToFloat(venda_bruta));
      //aux := FiltraNumero(aux);
      venda_bruta:= FormatFloat('#0.0,0', q60m.FieldByName('Venda_Bruta_Diaria').AsFloat);
      venda_bruta:= StringReplace(venda_bruta, ThousandSeparator, '', [rfReplaceAll]);
      venda_bruta:= Remove_Virgula(venda_bruta);
      Linha := Linha + ZeroEsquerda(venda_bruta,16);                                                  ///////////////

      //grande_total:= Remove_Virgula(q60m.FieldByName('Grande_Total').AsString);

      grande_total:= FormatFloat('#0.0,0', q60m.FieldByName('Grande_Total').AsFloat);
      grande_total:= StringReplace(grande_total, ThousandSeparator, '', [rfReplaceAll]);
      grande_total:= Remove_Virgula(grande_total);
      //grande_total:= copy(q60m.FieldByName('Grande_Total').AsString, 3,16);
      //aux := FormatFloat('0.00',StrToFloat(grande_total));
      //aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(grande_total,16);

      Linha := Linha + AlinhaTXT('',1,37);
      writeLn(sArquivo,Linha);
      Inc(atotal);

      // processa registro 60a
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select * from R03 where Data_Movimento = :DI and N_Fabricacao = :ECF');
        Parameters.ParamByName('DI').Value:= data;
        Parameters.ParamByName('ECF').Value:= EdtECF.Text;
        open;
      end;

      qAux.First;
      while not qAux.Eof do
      begin
        Linha := '60A';
        Linha := Linha + FormatDateTime('YYYYMMDD',qAux.FieldByname('Data_Movimento').AsDateTime);
        Linha := Linha + AlinhaTXT(qAux.FieldByName('N_Fabricacao').AsString,1,20);

        tot_par:= copy(qAux.FieldByName('Totalizador_Parcial').AsString, 3,1);
        vai:= false;

        if (tot_par = 'T') then
        begin
          tot_par:= copy(qAux.FieldByName('Totalizador_Parcial').AsString, 4,4);
          Linha := Linha + AlinhaTXT(tot_par,1,4);
          vai:= true;
        end
        else
        begin
          tot_par:= copy(qAux.FieldByName('Totalizador_Parcial').AsString, 1,5);
          if (tot_par = 'I1') then
          begin
            tot_par:= 'I';
            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'N1') then
          begin
            tot_par:= 'N';
            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'F1') then
          begin
            tot_par:= 'F';
            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'DT') then
          begin
            tot_par:= 'DESC';

            valor_acu_aux:= qAux.FieldByName('Valor_Acumulado').AsString;
            //valor_acu_aux:= Copy(qAux.FieldByName('Valor_Acumulado').AsString,3,12);
            valor_acu_aux:= FormatFloat('#0.0,0', StrToFloat(valor_acu_aux));
            valor_acu_aux:= StringReplace(valor_acu_aux, ThousandSeparator, '', [rfReplaceAll]);
            //valor_acu_aux:= FiltraNumero(valor_acu_aux);

            qAux.Next;

            valor_acu:= qAux.FieldByName('Valor_Acumulado').AsString;
            //valor_acu:= Copy(qAux.FieldByName('Valor_Acumulado').AsString,3,12);
            valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
            valor_acu:= StringReplace(valor_acu, ThousandSeparator, '', [rfReplaceAll]);
            //valor_acu:= FiltraNumero(valor_acu);

            if (valor_acu_aux <> '0') or (valor_acu <> '0') then
            begin
              valor_acu:= FloatToStr(StrToFloat(valor_acu) + StrToFloat(valor_acu_aux));
              valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
              valor_acu:= StringReplace(valor_acu, ThousandSeparator, '', [rfReplaceAll]);
              //valor_acu:= FiltraNumero(valor_acu);
              valor_acu:= StringOfChar('0', 12-Length(valor_acu)) + valor_acu;
            end;

            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'Can-T') then
          begin
            tot_par:= 'CANC';

            valor_acu_aux:= qAux.FieldByName('Valor_Acumulado').AsString;
            valor_acu_aux:= FormatFloat('#0.0,0', StrToFloat(valor_acu_aux));
            valor_acu_aux:= StringReplace(valor_acu_aux, ThousandSeparator, '', [rfReplaceAll]);
            //valor_acu_aux:= FiltraNumero(valor_acu_aux);

            qAux.Next;

            valor_acu:= qAux.FieldByName('Valor_Acumulado').AsString;
            valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
            valor_acu:= StringReplace(valor_acu, ThousandSeparator, '', [rfReplaceAll]);
            //valor_acu:= FiltraNumero(valor_acu);

            if (valor_acu_aux <> '0') or (valor_acu <> '0') then
            begin
              valor_acu:= FloatToStr(StrToFloat(valor_acu) + StrToFloat(valor_acu_aux));
              valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
              valor_acu:= StringReplace(valor_acu, ThousandSeparator, '', [rfReplaceAll]);
              //valor_acu:= FiltraNumero(valor_acu);
              valor_acu:= StringOfChar('0', 12-Length(valor_acu)) + valor_acu;
            end;

            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end;
        end;

        if (tot_par <> 'DESC') and (tot_par <> 'CANC') then
        begin
          valor_acu:= qAux.FieldByName('Valor_Acumulado').AsString;
          valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
          valor_acu:= StringReplace(valor_acu, ThousandSeparator, '', [rfReplaceAll]);
          //valor_acu:= FiltraNumero(valor_acu);
        end;

        //aux := FormatFloat('0.00',StrToFloat(valor_acu));
        //aux := FiltraNumero(aux);

        valor_acu:= StringOfChar('0', 12-Length(valor_acu)) + valor_acu;
        if (valor_acu = '0') then
          vai:= false;

        Linha := Linha + ZeroEsquerda(Remove_Virgula(valor_acu),12);
        Linha := Linha + AlinhaTXT('',1,79);

        if (vai) then
        begin
          writeLn(sArquivo,Linha);
          Inc(atotal);
          qAux.Next;
        end
        else
          qAux.Next;
      end;

      // registro 60D
      if p60d then
      begin
        Q.Close;
        Q.Connection:= dm.ADOConnection1;
        Q.SQL.Clear;
        Q.SQL.Add('select Pro.Codigo_Venda, Ped.Data_Venda,');
        Q.SQL.Add('CST.Codigo_Situacao as CST, RI.Aliquota as ICMS, sum(IP.Qtde) as quantidade,');
        Q.SQL.Add('sum(IP.Qtde * IP.Valor_Unitario) as valor, sum( convert(float, replace(IP.BC, '+QuotedStr(',')+','+QuotedStr('.')+')) ) as BC, sum( convert(float, replace(IP.Valor_ICMS, '+QuotedStr(',')+','+QuotedStr('.')+')) ) as Valor_ICMS');
        Q.SQL.Add('from Itens_Pedido IP');

        Q.SQL.Add('left join Pedido Ped on (Ped.Codigo = IP.Codigo)');
        Q.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');

        Q.SQL.add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        Q.SQL.add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        Q.SQL.add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
        Q.SQL.add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');

        Q.SQL.Add('where Ped.Data_Venda = :pData');
        Q.SQL.Add('and Ped.Status = :Baixado');
        Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV) ');
        Q.SQL.Add('and IP.Cancelado = :N');
        Q.SQL.Add('and Ped.ECF = :ECF');
        Q.SQL.Add('group by Pro.Codigo_Venda, Ped.Data_Venda, CST.Codigo_Situacao, RI.Aliquota, IP.Valor_ICMS order by Pro.Codigo_Venda');
        Q.Parameters.ParamByName('GO1').Value := uf;
        Q.Parameters.ParamByName('GO2').Value := uf;

        Q.Parameters.ParamByName('pData').Value := data;
        Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
        Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
        Q.Parameters.ParamByName('PDV').Value := 'PDV';
        Q.Parameters.ParamByName('ECF').Value:= EdtECF.Text;
        //Q.Parameters.ParamByName('DAV').Value := 'DAV-OS';

        {if (dataf = '00/00/0000') or (dataf = '') then
          Q.Parameters.ParamByName('Data').Value := '01/01/1950'
        else
          Q.Parameters.ParamByName('Data').Value := StrToDateTime(dataf);}
        Q.Parameters.ParamByName('N').Value := 'N';
        Q.Open;


        while not Q.Eof do
        begin
          //Pega_ICMS_NC(Q.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
          Linha := '60D';
          Linha := Linha + FormatDateTime('YYYYMMDD',Q.fieldByname('Data_Venda').AsDateTime);
          Linha := Linha + AlinhaTXT(Trim(qAux.FieldByName('N_Fabricacao').AsString),1,20);
          Linha := Linha + AlinhaTXT(ZeroEsquerda(Q.FieldByName('Codigo_Venda').AsString, 14),1,14);

          aux := FormatFloat('0.000',Q.FieldByName('quantidade').AsFloat);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,13);

          aux := FormatFloat('0.00',Q.FieldByName('Valor').AsFloat);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,16);

          aux := FormatFloat('0.00',Q.FieldByName('Valor').AsFloat);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,16);
          // tributação

          if (Q.FieldByName('CST').AsString = '40') then
            aux := 'I'
          else if (Q.FieldByName('CST').AsString = '60') or (Q.FieldByName('CST').AsString = '10') then
            aux := 'F'
          else if (Q.FieldByName('CST').AsString = '41') then
            aux := 'N'
          else
            aux := Q.FieldByName('ICMS').AsString;

          if (Q.FieldByName('CST').AsString = '40') or (Q.FieldByName('CST').AsString = '41') or (Q.FieldByName('CST').AsString = '60') or (Q.FieldByName('CST').AsString = '10') then
            Linha := Linha + AlinhaTXT(aux,1,4)
          else
          begin
            if Length(Q.FieldByName('ICMS').AsString) = 1 then
              aux  := '0' + Q.FieldByName('ICMS').AsString + '00' //0700
            else if Length(Q.FieldByName('ICMS').AsString) = 2 then
              aux  := Q.FieldByName('ICMS').AsString + '00'       //1200
            else if Length(Q.FieldByName('ICMS').AsString) = 3 then
              aux  := '0'+Q.FieldByName('ICMS').AsString + '0'       //0840
            else
              aux := Q.FieldByName('ICMS').AsString;

            aux:= Remove_Virgula(aux);

            Linha := Linha + aux;
          end;

          aux := FormatFloat('#0.0,0',Q.FieldByName('Valor_ICMS').AsFloat);
          aux := FiltraNumero(aux);
          aux := ZeroEsquerda(aux,13);
          Linha := Linha + aux;

          Linha := Linha + AlinhaTXT('',1,19);
          writeLn(sArquivo,Linha);
          Inc(atotal);
          Q.Next;
        end;
        Q.Close;
      end;

      // registro 60I
      if p60i then
      begin
        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('select Ped.Data_Venda, Ped.COO, Ped.Status,');
        Q.SQL.Add('Pro.Codigo_Venda, IP.Cancelado, IP.N_Item, IP.Qtde, IP.Valor_Unitario, ');
        Q.SQL.Add('IP.Desc_Acr, CST.Codigo_Situacao as CST, RI.Aliquota as ICMS, IP.BC, IP.Valor_ICMS, IP.Sub_Total from Itens_Pedido IP');

        Q.SQL.Add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
        Q.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');

        Q.SQL.add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        Q.SQL.add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        Q.SQL.add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
        Q.SQL.add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');

        Q.SQL.Add('where Ped.Data_Venda = :pData');
        Q.SQL.Add('and Ped.Status = :Baixado');
        Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV)');
        Q.SQL.Add('and IP.Cancelado = :N');
        Q.SQL.Add('and Ped.ECF = :ECF');
        Q.SQL.Add('group by Pro.Codigo_Venda, Ped.Data_Venda, Ped.COO, Ped.Status, IP.Cancelado, IP.N_Item, ');
        Q.SQL.Add('IP.Qtde, IP.Valor_Unitario, IP.Desc_Acr, CST.Codigo_Situacao, RI.Aliquota, IP.BC, IP.Valor_ICMS, IP.Sub_Total order by Pro.Codigo_Venda');

        Q.Parameters.ParamByName('GO1').Value := uf;
        Q.Parameters.ParamByName('GO2').Value := uf;

        Q.Parameters.ParamByName('pData').Value := data;
        Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
        Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
        Q.Parameters.ParamByName('PDV').Value := 'PDV';
        Q.Parameters.ParamByName('ECF').Value:= EdtECF.Text;
        //Q.Parameters.ParamByName('DAV').Value := 'DAV-OS';
        {if (dataf = '00/00/0000') or (dataf = '') then
          Q.Parameters.ParamByName('Data').Value := '01/01/1950'
        else
          Q.Parameters.ParamByName('Data').Value := StrToDateTime(dataf); }
        Q.Parameters.ParamByName('N').Value := 'N';
        Q.Open;

        while not Q.Eof do
        begin
          //Pega_ICMS_NC(Q.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
          item:= Q.FieldByName('N_Item').AsString;
          Linha := '60I';
          Linha := Linha + FormatDateTime('YYYYMMDD',Q.fieldByname('Data_Venda').AsDateTime);
          Linha := Linha + AlinhaTXT(Trim(qAux.FieldByName('N_Fabricacao').AsString),1,20);
          Linha := Linha + '2D';

          if (Q.FieldByName('COO').AsString = '') then
            Linha := Linha + ZeroEsquerda(IntToStr(0),6)
          else
            Linha := Linha + ZeroEsquerda(IntToStr(Q.FieldByName('COO').AsInteger),6);

          Linha := Linha + ZeroEsquerda(item,3);
          Linha := Linha + AlinhaTXT(ZeroEsquerda(Q.FieldByName('Codigo_Venda').AsString,14),1,14);

          aux := FormatFloat('0.000',Q.FieldByName('Qtde').AsFloat);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,13);

          //aValor := (Q.FieldByName('Valor_Unitario').AsFloat * Q.FieldByName('Qtde').AsFloat) - Q.FieldByName('Desconto').AsFloat;
          aValor := Q.FieldByName('Sub_Total').AsFloat;
          aux := FormatFloat('0.00',aValor);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,13);

          aValor := Q.FieldByName('BC').AsFloat;
          aux := FormatFloat('0.00', aValor);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,12);
          // tributação

          if (Q.FieldByName('Status').AsString = 'Cancelado') then
          begin
            aux:= 'CANC';
            Linha := Linha + AlinhaTXT(aux,1,4)
          end
          else if (Q.FieldByName('Cancelado').AsString = 'S') then
          begin
            aux:= 'CANC';
            Linha := Linha + AlinhaTXT(aux,1,4)
          end
          else
          begin
            aux := Q.FieldByName('ICMS').AsString;

          if (Q.FieldByName('CST').AsString = '40') then
            aux := 'I'
          else if (Q.FieldByName('CST').AsString = '60') or (Q.FieldByName('CST').AsString = '10') then
            aux := 'F'
          else if (Q.FieldByName('CST').AsString = '41') then
            aux := 'N'
          else if (Q.FieldByName('CST').AsString = '00') then
            aux := Q.FieldByName('ICMS').AsString;

            if (Q.FieldByName('CST').AsString = '40') or (Q.FieldByName('CST').AsString = '41') or (Q.FieldByName('CST').AsString = '60') or (Q.FieldByName('CST').AsString = '10') then
              Linha := Linha + AlinhaTXT(aux,1,4)
            else
            begin
              if Length(Q.FieldByName('ICMS').AsString) = 1 then
                aux  := '0' + Q.FieldByName('ICMS').AsString + '00' //0700
              else if Length(Q.FieldByName('ICMS').AsString) = 2 then
                aux  := Q.FieldByName('ICMS').AsString + '00'       //1200
              else if Length(Q.FieldByName('ICMS').AsString) = 3 then
                aux  := '0'+Q.FieldByName('ICMS').AsString + '0'       //0840
              else
                aux := Q.FieldByName('ICMS').AsString;

              aux:= Remove_Virgula(aux);

              Linha := Linha + aux;
            end;
          end;

          aux := FormatFloat('0.00',Q.FieldByName('Valor_ICMS').AsFloat);
          aux := FiltraNumero(aux);
          aux:= ZeroEsquerda(aux,12);
          Linha := Linha + aux;

          Linha := Linha + AlinhaTXT('',1,16);
          writeLn(sArquivo,Linha);
          Inc(atotal);
          Q.Next;
        end;
        Q.Close;
      end;

      // registro 60R
      if p60r then
      begin
        DecodeDate(pDatai,Ano,Mes,Dia);
        AnoMes := ZeroEsquerda(IntToStr(Mes),2)+IntToStr(Ano);
        Q.Close;
        Q.SQL.Clear;
        Q.SQL.Add('select Pro.Codigo_Venda, CST.Codigo_Situacao as CST, RI.Aliquota as ICMS, ');
        Q.SQL.Add('sum( convert(float, replace(IP.BC, '+QuotedStr(',')+','+QuotedStr('.')+')) ) as BC,');
        Q.SQL.Add('sum(IP.Qtde) as quantidade,');
        Q.SQL.Add('sum(IP.Qtde * IP.Valor_Unitario) as valor');
        Q.SQL.Add('from Itens_Pedido IP');

        Q.SQL.Add('left join Pedido Ped on (Ped.Codigo = IP.Codigo)');
        Q.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');

        Q.SQL.add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        Q.SQL.add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        Q.SQL.add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
        Q.SQL.add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');

        Q.SQL.Add('where Ped.Data_Venda = :pData');
        Q.SQL.Add('and Ped.Status = :Baixado');
        Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV)');
        Q.SQL.Add('and IP.Cancelado = :N');
        Q.SQL.Add('and Ped.ECF = :ECF');
        Q.SQL.Add('group by Pro.Codigo_Venda, CST.Codigo_Situacao, RI.Aliquota order by Pro.Codigo_Venda');

        Q.Parameters.ParamByName('GO1').Value := uf;
        Q.Parameters.ParamByName('GO2').Value := uf;

        Q.Parameters.ParamByName('pData').Value := data;
        Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
        Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
        Q.Parameters.ParamByName('PDV').Value := 'PDV';
        Q.Parameters.ParamByName('N').Value := 'N';
        Q.Parameters.ParamByName('ECF').Value:= EdtECF.Text;
        Q.Open;

        while not Q.Eof do
        begin
          //Pega_ICMS_NC(Q.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
          Linha := '60R';
          Linha := Linha + AnoMes;
          Linha := Linha + AlinhaTXT(ZeroEsquerda(Q.FieldByName('Codigo_Venda').AsString, 14),1,14);
          aux := FormatFloat('0.000',Q.FieldByName('quantidade').AsFloat);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,13);

          aux := FormatFloat('0.00',Q.FieldByName('valor').AsFloat);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,16);

          aux := FormatFloat('0.00',Q.FieldByName('BC').AsFloat);
          aux := FiltraNumero(aux);
          Linha := Linha + ZeroEsquerda(aux,16);
          // tributação

          if (Q.FieldByName('CST').AsString = '40') then
            aux := 'I'
          else if (Q.FieldByName('CST').AsString = '60') or (Q.FieldByName('CST').AsString = '10') then
            aux := 'F'
          else if (Q.FieldByName('CST').AsString = '41') then
            aux := 'N'
          else
            aux := Q.FieldByName('ICMS').AsString;

          if (Q.FieldByName('CST').AsString = '40') or (Q.FieldByName('CST').AsString = '41') or (Q.FieldByName('CST').AsString = '60') or (Q.FieldByName('CST').AsString = '10') then
            Linha := Linha + AlinhaTXT(aux,1,4)
          else
          BEGIN
            if Length(Q.FieldByName('ICMS').AsString) = 1 then
              aux  := '0' + Q.FieldByName('ICMS').AsString + '00' //0700
            else if Length(Q.FieldByName('ICMS').AsString) = 2 then
              aux  := Q.FieldByName('ICMS').AsString + '00'       //1200
            else if Length(Q.FieldByName('ICMS').AsString) = 3 then
              aux  := '0'+Q.FieldByName('ICMS').AsString + '0'       //0840
            else
              aux := Q.FieldByName('ICMS').AsString;

            aux:= Remove_Virgula(aux);
            Linha := Linha + aux;
          END;

          Linha := Linha + AlinhaTXT('',1,54);
          writeLn(sArquivo,Linha);
          Inc(atotal);
          Q.Next;
        end;
        Q.Close;
      end;

      // proximo registro
      q60m.Next;
    end;

  end;
  if atotal > 0 then
     InsereTotalReg('60',atotal);
  // libera variavel da memoria
  Q.Free;

end;

procedure TFrmVendas_Periodo.InsereTotalReg(pRegistro: String; pTotal: Integer);
begin
  if not CdsRegistros.Locate('Registro',pRegistro,[]) then
     CdsRegistros.Append
  else
     CdsRegistros.Edit;
  CdsRegistrosRegistro.AsString := pRegistro;
  CdsRegistrosTotal.AsInteger   := CdsRegistrosTotal.AsInteger + pTotal;
  CdsRegistros.Post;
  // Incrementa o total geral de registros
  sTotalReg := sTotalReg + pTotal;

end;

procedure TFrmVendas_Periodo.RetornaNumOrdem(var PriNum, UltNum: String;pDatai,pdataf:TDatetime);
var Q : TADOQuery;
begin
  Q := TADOQuery.Create(nil);
  Q.Connection := dm.ADOConnection1;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('select MM.N_Ordem from Movimentacao_Manual MM');
  Q.SQL.Add('where MM.Data_Emissao between :pDatai and :pDataf');
  Q.SQL.Add('and MM.Caixa = :Caixa');
  Q.SQL.Add('order by convert(decimal(18,2), MM.N_Ordem)');
  Q.Parameters.ParamByName('pDatai').Value := pDatai;
  Q.Parameters.ParamByName('pDataf').Value := pDataf;
  Q.Parameters.ParamByName('Caixa').Value := UDeclaracao.sequencia;
  Q.Open;
  Q.First;
  PriNum := Q.FieldByName('N_Ordem').AsString;
  while not Q.Eof do
  begin
    UltNum := Q.FieldByName('N_Ordem').AsString;
    Q.Next;
  end;
  Q.Close;
  Q.Free;

end;

procedure TFrmVendas_Periodo.ProcessaRegistro61(pDatai, pdataf: TDatetime);
var Linha, aux, aPriNum, aUltNum : String;
    atotal : Integer;
    Q : TADOQuery;
begin
  //Captura_Data_Movimento;
  atotal := 0;
  Q := TADOQuery.Create(nil);
  Q.Connection := DM.ADOConnection1;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('select MM.Data_Emissao, MM.Modelo, MM.N_Serie, IMM.Sub_Total,');
  Q.SQL.Add('MM.N_Ordem, IMM.ICMS, IMM.CST, IMM.BC, IMM.Valor_ICMS from Movimentacao_Manual MM');
  Q.SQL.Add('left join Itens_Movimentacao_Manual IMM on (MM.Codigo = IMM.Codigo)');
  Q.SQL.Add('left join Produto Pro on (IMM.Codigo_Produto = Pro.Codigo)');
  Q.SQL.Add('where MM.Data_Emissao between :pDatai and :pDataf');
  Q.SQL.Add('and MM.Caixa = :Caixa and MM.Data_Emissao <> :Data');
  Q.SQL.Add('group by MM.Data_Emissao, MM.Modelo, MM.N_Serie, IMM.Sub_Total,');
  Q.SQL.Add('MM.N_Ordem, IMM.ICMS, IMM.CST, IMM.BC, IMM.Valor_ICMS');
  Q.SQL.Add('order by MM.N_Ordem');
  Q.Parameters.ParamByName('pDatai').Value := pDatai;
  Q.Parameters.ParamByName('pDataf').Value := pDataf;
  Q.Parameters.ParamByName('Caixa').Value := UDeclaracao.sequencia;

  if (dataf = '00/00/0000') or (dataf = '') then
    Q.Parameters.ParamByName('Data').Value := '01/01/1950'
  else
    Q.Parameters.ParamByName('Data').Value := StrToDate(dataf);
  Q.Open;

  while not Q.Eof do
  begin
    //Pega_ICMS_NC(Q.FieldByName('Codigo_Grupo_Tributacao').AsInteger);

    RetornaNumOrdem(aPriNum,aUltNum,pDatai,pdataf);
    Linha := '61';
    Linha := Linha + AlinhaTXT('',1,14);
    Linha := Linha + AlinhaTXT('',1,14);
    Linha := Linha + FormatDateTime('YYYYMMDD', Q.FieldByname('Data_Emissao').AsDateTime);
    Linha := Linha + AlinhaTXT(Q.FieldByname('Modelo').AsString,1,2);
    Linha := Linha + AlinhaTXT(Q.FieldByname('N_Serie').AsString,1,3);
    Linha := Linha + AlinhaTXT(' ',1,2);
    Linha := Linha + ZeroEsquerda(aPriNum,6);
    Linha := Linha + ZeroEsquerda(aUltNum,6);

    if (Q.FieldByName('CST').AsString = '40') or
       (Q.FieldByName('CST').AsString = '41') then
    begin
      aux := FormatFloat('0.00',Q.FieldByName('Sub_Total').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',Q.FieldByName('BC').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',Q.FieldByName('Valor_ICMS').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,12);

      aux := FormatFloat('0.00',Q.FieldByName('Sub_Total').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',0);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);
    end
    else if (Q.FieldByName('CST').AsString = '60') then
    begin
      aux := FormatFloat('0.00',Q.FieldByName('Sub_Total').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',0);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',0);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,12);

      aux := FormatFloat('0.00',0);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',Q.FieldByName('Sub_Total').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);
    end
    else
    begin
      aux := FormatFloat('0.00',Q.FieldByName('Sub_Total').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',Q.FieldByName('BC').AsFloat);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',(Q.FieldByName('Valor_ICMS').AsFloat));
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,12);

      aux := FormatFloat('0.00',0);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);

      aux := FormatFloat('0.00',0);
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,13);
    end;

    {if (Q.FieldByName('CST').AsString = '40') then
      aux := 'I'
    else if (Q.FieldByName('CST').AsString = '60') then
      aux := 'F'
    else if (Q.FieldByName('CST').AsString = '41') then
      aux := 'N'
    else if (Q.FieldByName('CST').AsString = '00') then
    begin
      aux := FormatFloat('0.00',Q.FieldByName('Ali_Trib').AsFloat/100);
      aux := FiltraNumero(aux);
    end;}

    if (Q.FieldByName('CST').AsString = '40') then
      aux := '0'
    else if (Q.FieldByName('CST').AsString = '60') then
      aux := '0'
    else if (Q.FieldByName('CST').AsString = '41') then
      aux := '0'
    else if (Q.FieldByName('CST').AsString = '00') then
      aux := Q.FieldByName('ICMS').AsString;

    Linha := Linha + ZeroEsquerda(aux,4);

    Linha := Linha + AlinhaTXT('',1,1);
    writeLn(sArquivo,Linha);
    Inc(atotal);
    Q.Next;
  end;
  if atotal > 0 then
     InsereTotalReg('61',atotal);
  Q.Close;
  Q.Free;

end;

function TFrmVendas_Periodo.ProcessaRegistro61r(pDatai, pdataf: TDatetime): boolean;
var Linha, aux, AnoMes : String;
    atotal : Integer;
    Q : TADOQuery;
    Dia, Mes, Ano : Word;
begin
  Result:= false;
  DecodeDate(pDatai,Ano,Mes,Dia);
  AnoMes := ZeroEsquerda(IntToStr(Mes),2)+IntToStr(Ano);
  atotal := 0;
  Q := TADOQuery.Create(nil);
  Q.Connection := dm.ADOConnection1;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('select Pro.Codigo_Venda, Pro.Descricao, IMM.Quantidade,');
  Q.SQL.Add('IMM.Sub_Total, IMM.ICMS, IMM.CST, IMM.BC from Movimentacao_Manual MM');
  Q.SQL.Add('left join Itens_Movimentacao_Manual IMM on (MM.Codigo = IMM.Codigo)');
  Q.SQL.Add('left join Produto Pro on (IMM.Codigo_Produto = Pro.Codigo)');
  Q.SQL.Add('where MM.Caixa = :Caixa and MM.Data_Emissao between :pDatai and :pDataf');
  Q.SQL.Add('and MM.Data_Emissao <> :Data');
  Q.SQL.Add('order by MM.N_Ordem');
  Q.Parameters.ParamByName('pDatai').Value := pDatai;
  Q.Parameters.ParamByName('pDataf').Value := pDataf;
  Q.Parameters.ParamByName('Caixa').Value := UDeclaracao.sequencia;

  if (dataf = '00/00/0000') or (dataf = '') then
    Q.Parameters.ParamByName('Data').Value := '01/01/1950'
  else
    Q.Parameters.ParamByName('Data').Value := StrToDate(dataf);
  Q.Open;

  Q.First;
  while not Q.Eof do
  begin
    Result:= true;
    //Pega_ICMS_NC(Q.FieldByName('Codigo_Grupo_Tributacao').AsInteger);

    Linha := '61R';
    Linha := Linha + AnoMes;
    Linha := Linha + AlinhaTXT(Q.FieldByName('Codigo_Venda').AsString,1,14);
    aux := FormatFloat('0.000',Q.FieldByName('Quantidade').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13);

    aux := FormatFloat('0.00',Q.FieldByName('Sub_Total').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,16);

    aux := FormatFloat('0.00',Q.FieldByName('BC').AsFloat);
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,16);

    {if (Q.FieldByName('CST').AsString = '40') then
      aux := 'I'
    else if (Q.FieldByName('CST').AsString = '60') then
      aux := 'F'
    else if (Q.FieldByName('CST').AsString = '41') then
      aux := 'N'
    else if (Q.FieldByName('CST').AsString = '00') then
    begin
      aux := FormatFloat('0.00',Q.FieldByName('Ali_Trib').AsFloat/100);
      aux := FiltraNumero(aux);
    end;}

    if (Q.FieldByName('CST').AsString = '40') then
      aux := '0'
    else if (Q.FieldByName('CST').AsString = '60') then
      aux := '0'
    else if (Q.FieldByName('CST').AsString = '41') then
      aux := '0'
    else if (Q.FieldByName('CST').AsString = '00') then
      aux := Q.FieldByName('ICMS').AsString;

    Linha := Linha + ZeroEsquerda(aux,4);
    Linha := Linha + AlinhaTXT('',1,54);

    writeLn(sArquivo,Linha);
    Inc(atotal);
    Q.Next;
  end;
  if atotal > 0 then
     InsereTotalReg('61',atotal);
  Q.Close;
  Q.Free;

end;

procedure TFrmVendas_Periodo.ProcessaRegistro70;
begin
  writeLn(sArquivo,'Registro 70');
end;

procedure TFrmVendas_Periodo.ProcessaRegistro75(pDatai, pdataf: TDatetime);
var Linha, aux, ncm, descricao: String;
    atotal : Integer;
    aValor : Double;
    Q, Q2: TADOQuery;
begin
  //Captura_Data_Movimento;
  atotal := 0;
  q75 := TADOQuery.Create(nil);
  Q := TADOQuery.Create(nil);
  Q2 := TADOQuery.Create(nil);

  q75.Connection := dm.ADOConnection1;

  //vendas
  q75.Close;
  q75.SQL.Clear;
  q75.SQL.Add('select ');
  q75.SQL.Add('Pro.Codigo_Venda, ');
  q75.SQL.Add('Pro.Descricao, ');

  q75.SQL.Add('IP.UN, RI.Aliquota as ICMS, RIPI.Aliquota as IPI, IP.Base_Reduzida, Pro.NCM');

  q75.SQL.Add('from Itens_Pedido IP');

  q75.SQL.Add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
  q75.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');

  q75.SQL.add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
  q75.SQL.add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
  q75.SQL.add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');

  q75.SQL.add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
  q75.SQL.add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

  if (enquadramento_empresa = 'EN') then
    q75.SQL.add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
  else if (enquadramento_empresa = 'EPP') then
    q75.SQL.add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
  else if (enquadramento_empresa = 'ME') then
    q75.SQL.add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

  q75.SQL.Add('where Ped.Data_Venda between :pDatai and :pDataf');
  q75.SQL.Add('and Ped.Status = :Baixado');
  q75.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV)');
  q75.SQL.Add('and IP.Cancelado = :N');
  q75.SQL.Add('and Ped.ECF = :ECF');
  q75.SQL.Add('and Ped.COO <> '+QuotedStr('')+'');

  q75.SQL.Add('group by Pro.Codigo_Venda, Pro.Descricao, ');
  q75.SQL.Add('IP.UN, RI.Aliquota, RIPI.Aliquota, IP.Base_Reduzida, Pro.NCM');
  q75.SQL.Add('order by Pro.Codigo_Venda');

  q75.Parameters.ParamByName('GO1').Value := uf;
  q75.Parameters.ParamByName('GO2').Value := uf;
  q75.Parameters.ParamByName('pDatai').Value := pDatai;
  q75.Parameters.ParamByName('pDataf').Value := pDataf;
  q75.Parameters.ParamByName('Baixado').Value := 'PAGO';
  q75.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
  q75.Parameters.ParamByName('PDV').Value := 'PDV';
  //q75.Parameters.ParamByName('DAV').Value := 'DAV-OS';
  q75.Parameters.ParamByName('N').Value := 'N';
  q75.Parameters.ParamByName('ECF').Value:= EdtECF.Text;
  //q75.Parameters.ParamByName('COO').Value:= NULL;

  {if (dataf = '00/00/0000') or (dataf = '') then
    q75.Parameters.ParamByName('Data').Value := '01/01/1950'
  else
    q75.Parameters.ParamByName('Data').Value := StrToDateTime(dataf); }
  q75.Open;

  q75.First;
  while not q75.Eof do
  begin
    Linha := '75';
    Linha := Linha + FormatDateTime('YYYYMMDD',pDatai);
    Linha := Linha + FormatDateTime('YYYYMMDD',pDataf);
    Linha := Linha + AlinhaTXT(ZeroEsquerda(q75.FieldByName('Codigo_Venda').AsString, 14),1,14);

    if (q75.FieldByName('IPI').AsString = '') then
    begin
      Linha := Linha + AlinhaTXT(' ',1,8);
      //Linha := Linha + AlinhaTXT(' ',1,53);
    end
    else
    begin
      //Pega_NCM(q75.FieldByName('IPI').AsString);
      ncm:= Copy(q75.FieldByName('NCM').AsString, 1,8);
      Linha := Linha + AlinhaTXT(ncm,1,8);
    end;

    descricao:= copy(q75.FieldByName('Descricao').AsString, 1,53);
    Linha := Linha + AlinhaTXT(descricao,1,53);
    Linha := Linha + AlinhaTXT(q75.FieldByName('UN').AsString,1,6);

    if (q75.FieldByName('IPI').AsString = 'I') or (q75.FieldByName('IPI').AsString = 'N') or
        (q75.FieldByName('IPI').AsString = 'F') or (q75.FieldByName('IPI').AsString = '') then
    begin
      aux := '0';
    end
    else
    begin
      aux := FormatFloat('0.00',q75.FieldByName('IPI').AsFloat);
    end;

    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,5);

    if (q75.FieldByName('ICMS').AsString = 'I1') or (q75.FieldByName('ICMS').AsString = 'F1') or
        (q75.FieldByName('ICMS').AsString = 'N1') or (q75.FieldByName('ICMS').AsString = 'I') or (q75.FieldByName('ICMS').AsString = 'F') or
        (q75.FieldByName('ICMS').AsString = 'N') then
    begin
      aux:= '0,00';
      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,4);
    end
    else
    begin
      //aux := q75.FieldByName('ICMS').AsString;

      if Length(q75.FieldByName('ICMS').AsString) = 1 then
        aux  := '0' + q75.FieldByName('ICMS').AsString + '00' //0700
      else if Length(q75.FieldByName('ICMS').AsString) = 2 then
        aux  := q75.FieldByName('ICMS').AsString + '00'       //1200
      else if Length(q75.FieldByName('ICMS').AsString) = 3 then
        aux  := '0'+q75.FieldByName('ICMS').AsString + '0'       //0840
      else
        aux := q75.FieldByName('ICMS').AsString;

      Linha := Linha + aux;
    end;

    if (q75.FieldByName('Base_Reduzida').AsString = '') then
      aux:= '0,00'
    else
      aux := FormatFloat('0.00',q75.FieldByName('Base_Reduzida').AsFloat);

    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,5);

    aux:= '0';
    Linha := Linha + ZeroEsquerda(aux,13);

    {aux := FormatFloat('0.00',0); //colocar a base calculada....                    <<<<<------
    aux := FiltraNumero(aux);
    Linha := Linha + ZeroEsquerda(aux,13);  }

    writeLn(sArquivo,Linha);
    Inc(atotal);
    //produto:= q75.FieldByName('Codigo_Venda').AsString;
    q75.Next;
  end;




  //movimentação manual
  {Q.Connection := dm.ADOConnection1;

  Q.Close;
  Q.SQL.Clear;

  Q.SQL.Add('select Pro.Codigo_Venda, ');
  Q.SQL.Add('Pro.Descricao, ');

  Q.SQL.Add('IMM.UN, IMM.IPI, IMM.ICMS, IMM.Base_Reduzida');

  Q.SQL.Add('from Produto Pro');

  Q.SQL.Add('left join Itens_Movimentacao_Manual IMM on (Pro.Codigo = IMM.Codigo_Produto)');
  Q.SQL.Add('left join Movimentacao_Manual MM on (IMM.Codigo = MM.Codigo)');

  Q.SQL.Add('where MM.Data_Emissao between :pDatai and :pDataf');
  Q.SQL.Add('and MM.Data_Emissao <> :Data');
  Q.SQL.Add('group by Pro.Codigo_Venda, Pro.Descricao, ');
  Q.SQL.Add('IMM.UN, IMM.IPI, IMM.ICMS, IMM.Base_Reduzida');
  Q.SQL.Add('order by Pro.Codigo_Venda');
  Q.Parameters.ParamByName('pDatai').Value := pDatai;
  Q.Parameters.ParamByName('pDataf').Value := pDataf;

  if (dataf = '00/00/0000') or (dataf = '') then
    Q.Parameters.ParamByName('Data').Value := '01/01/1950'
  else
    Q.Parameters.ParamByName('Data').Value := StrToDateTime(dataf);
  Q.Open;

  Q.First;
  while not Q.Eof do
  begin
    if (q75.Locate('Codigo_Venda;Descricao', VarArrayOf([Q.FieldByName('Codigo_Venda').AsString, Q.FieldByName('Descricao').AsString]), [])) then
    begin
      Q.Next
    end
    else
    begin
      Linha := '75';
      Linha := Linha + FormatDateTime('YYYYMMDD',pDatai);
      Linha := Linha + FormatDateTime('YYYYMMDD',pDataf);
      Linha := Linha + AlinhaTXT(Q.FieldByName('Codigo_Venda').AsString,1,14);

      if (Q.FieldByName('IPI').AsString = 'I') or (Q.FieldByName('IPI').AsString = 'N') or
          (Q.FieldByName('IPI').AsString = 'F') or (Q.FieldByName('IPI').AsString = '') then
      begin
        Linha := Linha + AlinhaTXT(' ',1,8);
        //Linha := Linha + AlinhaTXT(' ',1,53);
      end
      else
      begin
        Pega_NCM(Q.FieldByName('IPI').AsString);
        Linha := Linha + AlinhaTXT(qAux_NCM.FieldByName('Codigo_NCM').AsString,1,8);
        //Linha := Linha + AlinhaTXT(qAux_IPI.FieldByName('Descricao_NCM').AsString,1,53);
      end;

      Linha := Linha + AlinhaTXT(Q.FieldByName('Descricao').AsString,1,53);
      Linha := Linha + AlinhaTXT(Q.FieldByName('UN').AsString,1,6);

      if (Q.FieldByName('IPI').AsString = 'I') or (Q.FieldByName('IPI').AsString = 'N') or
          (Q.FieldByName('IPI').AsString = 'F') or (Q.FieldByName('IPI').AsString = '') then
      begin
        aux := '0';
      end
      else
      begin
        aux := FormatFloat('0.00',Q.FieldByName('IPI').AsFloat);
      end;

      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,5);

      if (Q.FieldByName('ICMS').AsString = 'I1') or (Q.FieldByName('ICMS').AsString = 'F1') or
          (Q.FieldByName('ICMS').AsString = 'N1') then
      begin
        aux:= '0,00';
        aux := FiltraNumero(aux);
        Linha := Linha + ZeroEsquerda(aux,4);
      end
      else
      begin
        aux := Q.FieldByName('ICMS').AsString;
        Linha := Linha + aux;
      end;

      if (Q.FieldByName('Base_Reduzida').AsString = '') then
        aux:= '0,00'
      else
        aux := FormatFloat('0.00',Q.FieldByName('Base_Reduzida').AsFloat);

      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,5);

      aux:= '0';
      Linha := Linha + ZeroEsquerda(aux,13);

      writeLn(sArquivo,Linha);
      Inc(atotal);
      produto:= Q.FieldByName('Codigo_Venda').AsString;
      Q.Next;
    end;
  end;}




  //entrada de produtos
  {Q2.Connection := dm.ADOConnection1;

  Q2.Close;
  Q2.SQL.Clear;

  Q2.SQL.Add('select Pro.Codigo_Venda, ');
  Q2.SQL.Add('Pro.Descricao, ');

  Q2.SQL.Add('IE.Unidade, IE.Aliquota_IPI, IE.Aliquota_ICMS, IE.NCM');

  Q2.SQL.Add('from Produto Pro');

  Q2.SQL.Add('left join Itens_Entrada IE on (Pro.Codigo = IE.Codigo_Produto)');
  Q2.SQL.Add('left join Entrada_Produtos EP on (IE.Codigo = EP.Codigo)');

  Q2.SQL.Add('where EP.Data_Entrada between :pDatai and :pDataf');
  Q2.SQL.Add('and EP.Data_Entrada <> :Data');
  Q2.SQL.Add('group by Pro.Codigo_Venda, Pro.Descricao, ');
  Q2.SQL.Add('IE.Unidade, IE.Aliquota_IPI, IE.Aliquota_ICMS, IE.NCM');
  Q2.SQL.Add('order by Pro.Codigo_Venda');
  Q2.Parameters.ParamByName('pDatai').Value := pDatai;
  Q2.Parameters.ParamByName('pDataf').Value := pDataf;

  if (dataf = '00/00/0000') or (dataf = '') then
    Q2.Parameters.ParamByName('Data').Value := '01/01/1950'
  else
    Q2.Parameters.ParamByName('Data').Value := StrToDateTime(dataf);
  Q2.Open;

  Q2.First;
  while not Q2.Eof do
  begin
    if (Q.IsEmpty = false) and (Q.Locate('Codigo_Venda;Descricao', VarArrayOf([Q2.FieldByName('Codigo_Venda').AsString, Q2.FieldByName('Descricao').AsString]), [])) then
    begin
      Q2.Next
    end
    else if (q75.Locate('Codigo_Venda;Descricao', VarArrayOf([Q2.FieldByName('Codigo_Venda').AsString, Q2.FieldByName('Descricao').AsString]), [])) then
    begin
      Q2.Next
    end
    else
    begin
      Linha := '75';
      Linha := Linha + FormatDateTime('YYYYMMDD',pDatai);
      Linha := Linha + FormatDateTime('YYYYMMDD',pDataf);
      Linha := Linha + AlinhaTXT(Q2.FieldByName('Codigo_Venda').AsString,1,14);

      if (Q2.FieldByName('Aliquota_IPI').AsString = 'I') or (Q2.FieldByName('Aliquota_IPI').AsString = 'N') or
          (Q2.FieldByName('Aliquota_IPI').AsString = 'F') or (Q2.FieldByName('Aliquota_IPI').AsString = '') then
      begin
        Linha := Linha + AlinhaTXT(' ',1,8);
      end
      else
      begin
        //Pega_NCM(Q2.FieldByName('Aliquota_IPI').AsString);
        Linha := Linha + AlinhaTXT(Q2.FieldByName('NCM').AsString,1,8);
      end;

      Linha := Linha + AlinhaTXT(Q2.FieldByName('Descricao').AsString,1,53);
      Linha := Linha + AlinhaTXT(Q2.FieldByName('Unidade').AsString,1,6);

      if (Q2.FieldByName('Aliquota_IPI').AsString = 'I') or (Q2.FieldByName('Aliquota_IPI').AsString = 'N') or
          (Q2.FieldByName('Aliquota_IPI').AsString = 'F') or (Q2.FieldByName('Aliquota_IPI').AsString = '') then
      begin
        aux := '0';
      end
      else
      begin
        aux := FormatFloat('0.00',Q2.FieldByName('Aliquota_IPI').AsFloat);
      end;

      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,5);

      if (Q2.FieldByName('Aliquota_ICMS').AsString = 'I') or (Q2.FieldByName('Aliquota_ICMS').AsString = 'F') or
          (Q2.FieldByName('Aliquota_ICMS').AsString = 'N') then
      begin
        aux:= '0,00';
        aux := FiltraNumero(aux);
        Linha := Linha + ZeroEsquerda(aux,4);
      end
      else
      begin
        aux := Q2.FieldByName('Aliquota_ICMS').AsString;
        Linha := Linha + aux;
      end;

      //if (Q2.FieldByName('Base_Reduzida').AsString = '') then
        aux:= '0,00';
      //else
        //aux := FormatFloat('0.00',Q2.FieldByName('Base_Reduzida').AsFloat);

      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,5);

      aux:= '0';
      Linha := Linha + ZeroEsquerda(aux,13);

      writeLn(sArquivo,Linha);
      Inc(atotal);
      produto:= Q2.FieldByName('Codigo_Venda').AsString;
      Q2.Next;
    end;
  end; }

  if atotal > 0 then
     InsereTotalReg('75',atotal);
  //Q.Close;
  //Q.Free;

end;

procedure TFrmVendas_Periodo.ProcessaRegistro7561r(pDatai, pdataf: TDatetime);
var Linha, aux: String;
    atotal : Integer;
    Q : TADOQuery;
    aValor : Double;
begin
  atotal := 0;
  //Captura_Data_Movimento;
  Q := TADOQuery.Create(nil);
  Q.Connection := dm.ADOConnection1;

  Q.Close;
  Q.SQL.Clear;

  Q.SQL.Add('select Pro.Codigo_Venda, ');
  Q.SQL.Add('Pro.Descricao, ');

  Q.SQL.Add('IMM.UN, IMM.IPI, IMM.ICMS, IMM.Base_Reduzida');

  Q.SQL.Add('from Produto Pro');

  Q.SQL.Add('left join Itens_Movimentacao_Manual IMM on (Pro.Codigo = IMM.Codigo_Produto)');
  Q.SQL.Add('left join Movimentacao_Manual MM on (IMM.Codigo = MM.Codigo)');

  Q.SQL.Add('where MM.Data_Emissao between :pDatai and :pDataf');
  Q.SQL.Add('and MM.Data_Emissao <> :Data');
  Q.SQL.Add('group by Pro.Codigo_Venda, Pro.Descricao, ');
  Q.SQL.Add('IMM.UN, IMM.IPI, IMM.ICMS, IMM.Base_Reduzida');
  Q.SQL.Add('order by Pro.Codigo_Venda');
  Q.Parameters.ParamByName('pDatai').Value := pDatai;
  Q.Parameters.ParamByName('pDataf').Value := pDataf;

  if (dataf = '00/00/0000') or (dataf = '') then
    Q.Parameters.ParamByName('Data').Value := '01/01/1950'
  else
    Q.Parameters.ParamByName('Data').Value := StrToDate(dataf);
  Q.Open;

  Q.First;
  while not Q.Eof do
  begin
    if (q75.Locate('Codigo_Venda;Descricao', VarArrayOf([Q.FieldByName('Codigo_Venda').AsString, Q.FieldByName('Descricao').AsString]), [])) then
    begin
      Q.Next
    end
    else
    begin
      Linha := '75';
      Linha := Linha + FormatDateTime('YYYYMMDD',pDatai);
      Linha := Linha + FormatDateTime('YYYYMMDD',pDataf);
      Linha := Linha + AlinhaTXT(Q.FieldByName('Codigo_Venda').AsString,1,14);

      if (Q.FieldByName('IPI').AsString = 'I') or (Q.FieldByName('IPI').AsString = 'N') or
          (Q.FieldByName('IPI').AsString = 'F') or (Q.FieldByName('IPI').AsString = '') then
      begin
        Linha := Linha + AlinhaTXT(' ',1,8);
        //Linha := Linha + AlinhaTXT(' ',1,53);
      end
      else
      begin
        Pega_NCM(Q.FieldByName('IPI').AsString);
        Linha := Linha + AlinhaTXT(qAux_NCM.FieldByName('Codigo_NCM').AsString,1,8);
        //Linha := Linha + AlinhaTXT(qAux_IPI.FieldByName('Descricao_NCM').AsString,1,53);
      end;

      Linha := Linha + AlinhaTXT(Q.FieldByName('Descricao').AsString,1,53);
      Linha := Linha + AlinhaTXT(Q.FieldByName('UN').AsString,1,6);

      if (Q.FieldByName('IPI').AsString = 'I') or (Q.FieldByName('IPI').AsString = 'N') or
          (Q.FieldByName('IPI').AsString = 'F') or (Q.FieldByName('IPI').AsString = '') then
      begin
        aux := '0';
      end
      else
      begin
        aux := FormatFloat('0.00',Q.FieldByName('IPI').AsFloat);
      end;

      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,5);

      if (Q.FieldByName('ICMS').AsString = 'I1') or (Q.FieldByName('ICMS').AsString = 'F1') or
          (Q.FieldByName('ICMS').AsString = 'N1') then
      begin
        aux:= '0,00';
        aux := FiltraNumero(aux);
        Linha := Linha + ZeroEsquerda(aux,4);
      end
      else
      begin
        aux := Q.FieldByName('ICMS').AsString;
        Linha := Linha + aux;
      end;

      if (Q.FieldByName('Base_Reduzida').AsString = '') then
        aux:= '0,00'
      else
        aux := FormatFloat('0.00',Q.FieldByName('Base_Reduzida').AsFloat);

      aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(aux,5);

      aux:= '0';
      Linha := Linha + ZeroEsquerda(aux,13);

      writeLn(sArquivo,Linha);
      Inc(atotal);
      produto:= Q.FieldByName('Codigo_Venda').AsString;
      Q.Next;
    end;
  end;
  if atotal > 0 then
     InsereTotalReg('75',atotal);
  Q.Close;
  Q.Free;
end;

procedure TFrmVendas_Periodo.ProcessaRegistro90;
var Linha : String;
    aTotal, aTotal2, aTotalGeral : Integer;
begin
  // Conta o Total de Registros 90
  aTotal      := 0;
  aTotal2     := 0;
  aTotalGeral := 3;
  CdsRegistros.First;
  while not CdsRegistros.Eof do
  begin
    Inc(aTotal);
    Inc(aTotal2);
    aTotalGeral := aTotalGeral + CdsRegistrosTotal.AsInteger;
    CdsRegistros.Next;
  end;
  // Grava Registros no arquivo
  aTotal:= aTotal + 1;
  CdsRegistros.First;
  while not CdsRegistros.Eof do
  begin
    Linha := '90';
    Linha := Linha + ZeroEsquerda(cnpj,14);
    Linha := Linha + AlinhaTXT(insc_estadual,1,14);
    Linha := Linha + CdsRegistrosRegistro.AsString;
    Linha := Linha + ZeroEsquerda(IntToStr(CdsRegistrosTotal.AsInteger),8);
    Linha := Linha + AlinhaTXT('',1,85);
    Linha := Linha + IntToStr(aTotal);
    writeLn(sArquivo,Linha);
    Inc(sTotalReg);
    aTotalGeral:= aTotalGeral + 1;

    if CdsRegistros.RecNo = aTotal2 then
    begin
      Linha := '90';
      Linha := Linha + ZeroEsquerda(cnpj,14);
      Linha := Linha + AlinhaTXT(insc_estadual,1,14);

      Linha := Linha + '99';
      Linha := Linha + ZeroEsquerda(IntToStr(aTotalGeral),8);
      Linha := Linha + AlinhaTXT('',1,85);
      Linha := Linha + IntToStr(aTotal);
      writeLn(sArquivo,Linha);
      Inc(sTotalReg);
    end;
    CdsRegistros.Next;
  end;

end;

procedure TFrmVendas_Periodo.GeraBloco0(pArquivo:String;pDatai,pDataf:TDateTime);
var aIDCliente, aConteudo : String;
    Q, Q2, qAux : TADOQuery;
    aCont : Integer;
begin
  sLBloco := 1;
  Q := TADOQuery.Create(nil);
  Q2 := TADOQuery.Create(nil);
  qAux := TADOQuery.Create(nil);
  try
    Q.Connection := dm.ADOConnection1;                                               //1
    // grava registro 0000 - Abertura do Arquivo
    aConteudo := '|0000'; // registro fixo - Abertura do Arquivo
    aConteudo := aConteudo + '|'+ZeroEsquerda(versao_efd,3);
    aConteudo := aConteudo + '|'+'1';
    aConteudo := aConteudo + '|'+FormatDateTime('DDMMYYYY',pDatai);
    aConteudo := aConteudo + '|'+FormatDateTime('DDMMYYYY',pDataf);
    aConteudo := aConteudo + '|'+Trim(razao_social);
    if Length(cnpj) > 11 then
    begin
      aConteudo := aConteudo + '|'+ZeroEsquerda(cnpj,14);
      aConteudo := aConteudo + '|'+'';
    end
    else
    begin
      aConteudo := aConteudo + '|'+'';
      aConteudo := aConteudo + '|'+ZeroEsquerda(cnpj,11)
    end;
    aConteudo := aConteudo + '|'+Trim(uf);
    aConteudo := aConteudo + '|'+Trim(insc_estadual);
    aConteudo := aConteudo + '|'+ZeroEsquerda(cod_municipio,7);  //filtra dados
    aConteudo := aConteudo + '|'+Trim(insc_municipal);
    aConteudo := aConteudo + '|'+ZeroEsquerda(suframa,9); //filtra dados
    aConteudo := aConteudo + '|'+Trim(perfil_arquivo);
    aConteudo := aConteudo + '|'+Trim(tipo_atividade);
    GravaLinhaArquivo(aConteudo);
    // grava registro 0001 - Abertura do Bloco
    aConteudo := '|0001';
    aConteudo := aConteudo + '|'+'0';
    GravaLinhaArquivo(aConteudo);
    // grava registro 0005 - Dados complementares da identidade
    aConteudo := '|0005';
    aConteudo := aConteudo + '|'+Trim(razao_social);
    cep:= StringReplace(cep, '-', '', [rfReplaceAll]);
    aConteudo := aConteudo + '|'+ZeroEsquerda(cep,8);
    aConteudo := aConteudo + '|'+Trim(endereco);
    aConteudo := aConteudo + '|'+Trim(numero);
    aConteudo := aConteudo + '|'+'';
    aConteudo := aConteudo + '|'+Trim(setor);
    telefone:= StringReplace(telefone, '-', '', [rfReplaceAll]);
    telefone:= StringReplace(telefone, '(', '', [rfReplaceAll]);
    telefone:= StringReplace(telefone, ')', '', [rfReplaceAll]);
    aConteudo := aConteudo + '|'+ZeroEsquerda(telefone,10);  // filtra dados
    aConteudo := aConteudo + '|'+ZeroEsquerda(telefone,10);  // filtra dados
    aConteudo := aConteudo + '|'+Trim(email);
    GravaLinhaArquivo(aConteudo);
    // grava registro 0015 - Dados do contribuinte substituto
    aConteudo := '|0015';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // grava registro 0100 - Dados do Contabilista
    aConteudo := '|0100';
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Cont.*, Cid.Codigo_Municipio, Log.Descricao as Endereco, Log.CEP, Se.Descricao as Setor');
      add('from Contabilista Cont');
      add('inner join Cidade Cid on (Cont.Codigo_Cidade = Cid.Codigo)');
      add('inner join Logradouro Log on (Cont.Codigo_Endereco = Log.Codigo)');
      add('inner join Setor Se on (Cont.Codigo_Setor = Se.Codigo)');
      add('where Codigo_Empresa = :Codigo');
      Parameters.ParamByName('Codigo').Value:= UDeclaracao.codigo_empresa;
      open;
    end;

    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('Nome_Contador').AsString);
    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('CPF').AsString);
    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('CRC').AsString);
    aConteudo := aConteudo + '|'+Trim(FiltraNumero(qAux.FieldByName('CNPJ').AsString));
    aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(qAux.FieldByName('CEP').AsString),8);
    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('Endereco').AsString);
    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('Numero').AsString);
    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('Complemento').AsString);
    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('Setor').AsString);
    aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(qAux.FieldByName('Telefone').AsString),10);
    aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(qAux.FieldByName('Telefone').AsString),10);
    aConteudo := aConteudo + '|'+Trim(qAux.FieldByName('Email').AsString);
    aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(qAux.FieldByName('Codigo_Municipio').AsString),7);
    GravaLinhaArquivo(aConteudo);
    // grava registro 0150 - Tabela de Cadastro do Participante
    {Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('select Cli.Codigo as Codigo_Cliente, Cli.Nome_Nome_Fantasia, Cli.CPF, Cli.CNPJ,');
    Q.SQL.Add('Cli.Insc_Estadual, Cli.Numero, Cli.Complemento, Cid.Codigo_Municipio, Cli.Suframa,');
    Q.SQL.Add('P.Codigo_Pais, Log.Descricao as Endereco, Se.Descricao as Setor from Pedido Ped');
    Q.SQL.add('inner join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
    Q.SQL.add('inner join Cidade Cid on (Cid.Codigo = Cli.Codigo_Cidade)');
    Q.SQL.add('inner join Logradouro Log on (Log.Codigo = Cli.Codigo_Logradouro)');
    Q.SQL.add('inner join Setor Se on (Se.Codigo = Cli.Codigo_Setor)');
    Q.SQL.add('inner join Pais P on (Cli.Codigo_Pais = P.Codigo)');
    Q.SQL.Add('where Ped.Data_Venda between :pDatai and :pDataf');
    Q.SQL.Add('and Ped.Codigo_Empresa = :pIDEmp');
    Q.SQL.Add('and Ped.Status = :Baixado');
    Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV)');
    Q.SQL.Add('group by Cli.Codigo, Cli.Nome_Nome_Fantasia, Cli.CPF, Cli.CNPJ,');
    Q.SQL.Add('Cli.Insc_Estadual, Cli.Numero, Cli.Complemento, Cid.Codigo_Municipio, Cli.Suframa,');
    Q.SQL.Add('P.Codigo_Pais, Log.Descricao, Se.Descricao');
    Q.Parameters.ParamByName('pDatai').Value := pDatai;
    Q.Parameters.ParamByName('pDataf').Value := pDataf;
    Q.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
    Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
    Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
    Q.Parameters.ParamByName('PDV').Value := 'PDV';
    Q.Open;
    aCont := 0;
    if not CdsClienteAux.Active then
      CdsClienteAux.CreateDataSet;
    CdsClienteAux.Open;
    CdsClienteAux.EmptyDataSet;
    while not Q.Eof do
    begin
      //aIDCliente := IntToStr(Q.FieldByName('IDCLIENTE').AsInteger);
      //if StrToInt(aIDCliente) = DataConfig.DataSet.FieldByName('CLIENTE_PADRAO').AsInteger then
      //begin
        //Inc(aCont);
        //aIDCliente := 'T'+IntToStr(aCont);
        //CdsClienteAux.Append;
        //CdsClienteAuxID.AsString        := aIDCliente;
        //CdsClienteAuxDESCRICAO.AsString := Q.FieldByname('cliente').AsString;
        //CdsClienteAuxCNPJCPF.AsString   := Q.FieldByname('CNPJCPF').AsString;
        //CdsClienteAux.Post;
      //end;
      aConteudo := '|0150';
      aConteudo := aConteudo + '|'+Trim(Q.FieldByName('Codigo_Cliente').AsString);
      aConteudo := aConteudo + '|'+Trim(Q.FieldByname('Nome_Nome_Fantasia').AsString);
      aConteudo := aConteudo + '|'+ZeroEsquerda(Q.FieldByName('Codigo_Pais').AsString,5);
      //
      if (q.FieldByName('CPF').AsString = '') then
      begin
        if length(Q.FieldByname('CNPJ').AsString) > 11 then
        begin
          aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(Q.FieldByname('CNPJ').AsString),14);
          aConteudo := aConteudo + '|'+'';
        end
        else
        begin
          aConteudo := aConteudo + '|'+'';
          aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(Q.FieldByname('CNPJ').AsString),11);
        end;
      end
      else if (q.FieldByName('CNPJ').AsString = '') then
      begin
        if length(Q.FieldByname('CPF').AsString) > 11 then
        begin
          aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(Q.FieldByname('CPF').AsString),14);
          aConteudo := aConteudo + '|'+'';
        end
        else
        begin
          aConteudo := aConteudo + '|'+'';
          aConteudo := aConteudo + '|'+ZeroEsquerda(FiltraNumero(Q.FieldByname('CPF').AsString),11);
        end;
      end;

      aConteudo := aConteudo + '|'+Trim(Q.FieldByname('Insc_Estadual').AsString);
      aConteudo := aConteudo + '|'+ZeroEsquerda(Q.FieldByName('Codigo_Municipio').AsString,7);
      aConteudo := aConteudo + '|'+Trim(Q.FieldByname('Suframa').AsString);
      aConteudo := aConteudo + '|'+Q.FieldByname('Endereco').AsString;
      aConteudo := aConteudo + '|'+Trim(FiltraNumero(Q.FieldByname('Numero').AsString));
      //aConteudo := aConteudo + '|'+'';
      aConteudo := aConteudo + '|'+Q.FieldByname('Complemento').AsString;
      aConteudo := aConteudo + '|'+Q.FieldByname('Setor').AsString;         /////// Alinhar???????
      GravaLinhaArquivo(aConteudo);
      Q.Next;
    end;}
    // registro 0175
    aConteudo := '|0175';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // registro 0190

    //Captura_Data_Movimento;
    Q.Close;
    Q.Connection:= dm.ADOConnection1;
    Q.SQL.Clear;
    Q.SQL.Add('select IP.UN, UM.Descricao from Pedido Ped');
    Q.SQL.Add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
    Q.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
    Q.SQL.Add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    Q.SQL.Add('where Ped.Data_Venda between :pDatai and :pDataf');
    Q.SQL.Add('and Ped.Codigo_Empresa = :pIDEmp');
    Q.SQL.Add('and Ped.COO > 0');
    Q.SQL.Add('and Ped.Status = :Baixado');
    Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV or Ped.Tipo = :DAV) and Ped.Data_Venda <> :Data and IP.Cancelado = :N');
    Q.SQL.Add('and Pro.Codigo_Unidade_Medida is not null');
    Q.SQL.Add('group by IP.UN, UM.Descricao');
    Q.Parameters.ParamByName('pDatai').Value := pDatai;
    Q.Parameters.ParamByName('pDataf').Value := pDataf;
    Q.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
    Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
    Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
    Q.Parameters.ParamByName('PDV').Value := 'PDV';
    Q.Parameters.ParamByName('DAV').Value := 'DAV-OS';
    Q.Parameters.ParamByName('N').Value := 'N';

    //if (dataf = '00/00/0000') or (dataf = '') then
      //Q.Parameters.ParamByName('Data').Value := '01/01/1950'
    //else
      Q.Parameters.ParamByName('Data').Value := date;

    Q.Open;
    while not Q.Eof do
    begin
      aConteudo := '|0190';
      aConteudo := aConteudo + '|'+Trim(Q.FieldByName('UN').AsString);
      aConteudo := aConteudo + '|'+Trim(Q.FieldByName('Descricao').AsString);
      GravaLinhaArquivo(aConteudo);
      Q.Next;
    end;

    //Movimentação Manual
    Q2.Close;
    Q2.Connection:= dm.ADOConnection1;
    Q2.SQL.Clear;
    Q2.SQL.Add('select IMM.UN, UM.Descricao from Movimentacao_Manual MM');
    Q2.SQL.Add('left join Itens_Movimentacao_Manual IMM on (MM.Codigo = IMM.Codigo)');
    Q2.SQL.Add('left join Produto Pro on (IMM.Codigo_Produto = Pro.Codigo)');
    Q2.SQL.Add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    Q2.SQL.Add('where MM.Data_Emissao between :pDatai and :pDataf');
    Q2.SQL.Add('and MM.Codigo_Empresa = :pIDEmp');
    Q2.SQL.Add('group by IMM.UN, UM.Descricao');
    Q2.Parameters.ParamByName('pDatai').Value := pDatai;
    Q2.Parameters.ParamByName('pDataf').Value := pDataf;
    Q2.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
    Q2.Open;

    if (Q2.IsEmpty = false) then
    begin
      while not Q2.Eof do
      begin
        if not (Q.Locate('UN', Q2.FieldByName('UN').AsString, [])) then
        begin
          aConteudo := '|0190';
          aConteudo := aConteudo + '|'+Trim(Q2.FieldByName('UN').AsString);
          aConteudo := aConteudo + '|'+Trim(Q2.FieldByName('Descricao').AsString);
          GravaLinhaArquivo(aConteudo);
          Q2.Next;
        end
        else
          Q2.Next;
      end;
    end;

    // registro 0200
    Q.Close;
    Q.Connection:= dm.ADOConnection1;
    Q.SQL.Clear;
    Q.SQL.Add('select IP.Codigo_Produto, Pro.Descricao, Pro.Codigo_Venda, Pro.Tipo_Tributacao,');
    Q.SQL.Add('IP.UN, IP.ICMS, IP.IPI, IP.Cancelado from Pedido Ped');
    Q.SQL.Add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
    Q.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
    Q.SQL.Add('where Ped.Data_Venda between :pDatai and :pDataf');
    Q.SQL.Add('and Ped.Codigo_Empresa = :pIDEmp and IP.Cancelado = :N');
    Q.SQL.Add('and Ped.Status = :Baixado');
    Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV or Ped.Tipo = :DAV) and Ped.Data_Venda <> :Data');
    Q.SQL.Add('group by IP.Codigo_Produto, Pro.Descricao, Pro.Codigo_Venda, Pro.Tipo_Tributacao,');
    Q.SQL.Add('IP.UN, IP.ICMS, IP.IPI, IP.Cancelado');
    Q.Parameters.ParamByName('pDatai').Value := pDatai;
    Q.Parameters.ParamByName('pDataf').Value := pDataf;
    Q.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
    Q.Parameters.ParamByName('N').Value := 'N';
    Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
    Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
    Q.Parameters.ParamByName('PDV').Value := 'PDV';
    Q.Parameters.ParamByName('DAV').Value := 'DAV-OS';

    Q.Parameters.ParamByName('Data').Value := date;

    Q.Open;

    while not Q.Eof do
    begin
      aConteudo := '|0200';
      aConteudo := aConteudo + '|'+Trim(Q.FieldByname('Codigo_Venda').AsString);
      aConteudo := aConteudo + '|'+Trim(Q.FieldByname('Descricao').AsString);
      aConteudo := aConteudo + '|'+Trim(Q.FieldByname('Codigo_Venda').AsString);
      aConteudo := aConteudo + '|'+'';
      aConteudo := aConteudo + '|'+Trim(Q.FieldByname('UN').AsString);

      if (Q.FieldByName('Tipo_Tributacao').AsString = 'T') or (Q.FieldByName('Tipo_Tributacao').AsString = 'I') or
          (Q.FieldByName('Tipo_Tributacao').AsString = 'N') or (Q.FieldByName('Tipo_Tributacao').AsString = 'F') then
        aConteudo := aConteudo + '|'+'00'
      else
        aConteudo := aConteudo + '|'+'09';

      Pega_NCM(Q.FieldByname('IPI').AsString);
      aConteudo := aConteudo + '|'+Trim(FiltraNumero(qAux_NCM.FieldByname('Codigo_NCM').AsString));
      aConteudo := aConteudo + '|'+'';
      aConteudo := aConteudo + '|'+'00';
      aConteudo := aConteudo + '|'+'';
      if (Q.FieldByname('ICMS').AsString = 'I1') or (Q.FieldByname('ICMS').AsString = 'N1') or
          (Q.FieldByname('ICMS').AsString = 'F1') then
        aConteudo := aConteudo + '|'+'0,00'
      else
        aConteudo := aConteudo + '|'+FormatFloat('0.00',Q.FieldByname('ICMS').AsFloat/100);
      GravaLinhaArquivo(aConteudo);
      Q.Next
    end;

    //movimentação Manual
    // registro 0200
    Q2.Close;
    Q2.Connection:= dm.ADOConnection1;
    Q2.SQL.Clear;
    Q2.SQL.Add('select IMM.Codigo_Produto, Pro.Descricao, Pro.Codigo_Venda, Pro.Tipo_Tributacao,');
    Q2.SQL.Add('IMM.UN, IMM.ICMS, IMM.IPI from Movimentacao_Manual MM');
    Q2.SQL.Add('left join Itens_Movimentacao_Manual IMM on (MM.Codigo = IMM.Codigo)');
    Q2.SQL.Add('left join Produto Pro on (IMM.Codigo_Produto = Pro.Codigo)');
    Q2.SQL.Add('where MM.Data_Emissao between :pDatai and :pDataf');
    Q2.SQL.Add('and MM.Codigo_Empresa = :pIDEmp');
    Q2.SQL.Add('group by IMM.Codigo_Produto, Pro.Descricao, Pro.Codigo_Venda, Pro.Tipo_Tributacao,');
    Q2.SQL.Add('IMM.UN, IMM.ICMS, IMM.IPI');
    Q2.Parameters.ParamByName('pDatai').Value := pDatai;
    Q2.Parameters.ParamByName('pDataf').Value := pDataf;
    Q2.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
    Q2.Open;

    if (Q2.IsEmpty = false) then
    begin
      while not Q2.Eof do
      begin
        if not (Q.Locate('Codigo_Produto', Q2.FieldByName('Codigo_Produto').AsInteger, [])) then
        begin
          aConteudo := '|0200';
          aConteudo := aConteudo + '|'+Trim(Q2.FieldByname('Codigo_Venda').AsString);
          aConteudo := aConteudo + '|'+Trim(Q2.FieldByname('Descricao').AsString);
          aConteudo := aConteudo + '|'+Trim(Q2.FieldByname('Codigo_Venda').AsString);
          aConteudo := aConteudo + '|'+'';
          aConteudo := aConteudo + '|'+Trim(Q2.FieldByname('UN').AsString);

          if (Q2.FieldByName('Tipo_Tributacao').AsString = 'T') or (Q2.FieldByName('Tipo_Tributacao').AsString = 'I') or
              (Q2.FieldByName('Tipo_Tributacao').AsString = 'N') or (Q2.FieldByName('Tipo_Tributacao').AsString = 'F') then
            aConteudo := aConteudo + '|'+'00'
          else
            aConteudo := aConteudo + '|'+'09';

          Pega_NCM(Q2.FieldByname('IPI').AsString);
          aConteudo := aConteudo + '|'+Trim(FiltraNumero(qAux_NCM.FieldByname('Codigo_NCM').AsString));
          aConteudo := aConteudo + '|'+'';
          aConteudo := aConteudo + '|'+'00';
          aConteudo := aConteudo + '|'+'';
          if (Q2.FieldByname('ICMS').AsString = 'I1') or (Q2.FieldByname('ICMS').AsString = 'N1') or
              (Q2.FieldByname('ICMS').AsString = 'F1') then
            aConteudo := aConteudo + '|'+'0,00'
          else
            aConteudo := aConteudo + '|'+FormatFloat('0.00',Q2.FieldByname('ICMS').AsFloat/100);
          GravaLinhaArquivo(aConteudo);
          Q2.Next
        end
        else
          Q2.Next;
      end;
    end;


    // registro 0205
    aConteudo := '|0205';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // registro 0206
    aConteudo := '|0206';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // grava registro 0220 - Fatores de Conversão de Unidades
    aConteudo := '|0220';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // grava registro 0400 - Tabela de natureza de operação / Prestacao
    aConteudo := '|0400';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // grava registro 0450 - tabela de informação complementar do documento fiscal
    aConteudo := '|0450';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // grava registro 0460 - Tabela de Observação do lançãmento fiscal
    aConteudo := '|0460';
    aConteudo := aConteudo + '|'+'';
    GravaLinhaArquivo(aConteudo);
    // grava registro 0990 - Encerramento do Bloco 0
    aConteudo := '|0990';
    aConteudo := aConteudo + '|'+IntToStr(sLBloco);
    GravaLinhaArquivo(aConteudo);
  finally
    Q.Free;
  end;
end;

procedure TFrmVendas_Periodo.GeraBloco0ACBr(pArquivo: String; pDatai,
  pDataf: TDateTime);
begin
   {with ACBrSpedFiscal1.Bloco_0 do
   begin
      // Dados da Empresa
      with Registro0000New do
      begin
         COD_VER    := vlVersao101;
         COD_FIN    := raOriginal;
         NOME       := UDeclaracao.razao_social;
         CNPJ       := UDeclaracao.cnpj;
         CPF        := UDeclaracao.cnpj; // Deve ser uma informação valida
         UF         := UDeclaracao.uf;
         IE         := UDeclaracao.insc_estadual;
         COD_MUN    := UDeclaracao.cod_municipio;
         IM         := UDeclaracao.insc_municipal;
         SUFRAMA    := UDeclaracao.suframa;
         IND_PERFIL := pfPerfilA;
         IND_ATIV   := atOutros;
      end;
      with Registro0001New do
      begin
         IND_MOV := imComDados;

         // FILHO - Dados complementares da Empresa
          telefone:= StringReplace(telefone, '-', '', [rfReplaceAll]);
          telefone:= StringReplace(telefone, '(', '', [rfReplaceAll]);
          telefone:= StringReplace(telefone, ')', '', [rfReplaceAll])
         with Registro0005New do
         begin
            FANTASIA   := UDeclaracao.nome_fantasia;
            CEP        := UDeclaracao.cep;
            ENDERECO   := UDeclaracao.endereco;
            NUM        := UDeclaracao.numero;
            COMPL      := UDeclaracao.complemento;
            BAIRRO     := UDeclaracao.setor;
            FONE       := UDeclaracao.telefone;
            FAX        := UDeclaracao.telefone;
            EMAIL      := UDeclaracao.email;
         end;
         // FILHO - Dados do contador.
         Captura_Contador;
         with Registro0100New do
         begin
            NOME       := qAux.FieldByName('Nome_Contador').AsString;
            CPF        := qAux.FieldByName('CPF').AsString;
            CRC        := qAux.FieldByName('CRC').AsString;
            CNPJ       := qAux.FieldByName('CNPJ').AsString;;
            CEP        := qAux.FieldByName('CEP').AsString;;
            ENDERECO   := qAux.FieldByName('Endereco').AsString;;
            NUM        := qAux.FieldByName('Numero').AsString;;
            COMPL      := qAux.FieldByName('Complemento').AsString;;
            BAIRRO     := qAux.FieldByName('Setor').AsString;;
            FONE       := qAux.FieldByName('Telefone').AsString;;
            FAX        := qAux.FieldByName('Telefone').AsString;;
            EMAIL      := qAux.FieldByName('Email').AsString;;
            COD_MUN    := qAux.FieldByName('Codigo_Municipio').AsString;;
         end;
//          Check(Reg0001.Registro0190.LocalizaRegistro(UNID), '(0-0190) UNIDADE MEDIDA: A unidade de medida "%s" foi duplicada na lista de registros 0190!', [UNID]);

         // FILHO
         Captura_Cliente;
         for int0150 := 1 to 10 do
         begin
            // 10 Clientes
            with Registro0150New do
            begin
               COD_PART := IntToStr(int0150);
               NOME     := qAux_Cliente.FieldByName('Nome_Nome_Fantasia').AsString;
               COD_PAIS := qAux_Cliente.FieldByName('Codigo_Pais').AsString;
               CNPJ     := qAux_Cliente.FieldByName('CNPJ').AsString;;
               CPF      := qAux_Cliente.FieldByName('CPF').AsString;
               IE       := qAux_Cliente.FieldByName('Insc_Estadual').AsString;;
               COD_MUN  := qAux_Cliente.FieldByName('Codigo_Municipio').AsString;;
               SUFRAMA  := qAux_Cliente.FieldByName('Suframa').AsString;;
               ENDERECO := qAux_Cliente.FieldByName('Endereco').AsString;;
               NUM      := qAux_Cliente.FieldByName('Numero').AsString;;
               COMPL    := qAux_Cliente.FieldByName('Complemento').AsString;;
               BAIRRO   := qAux_Cliente.FieldByName('Setor').AsString;;
               //
               // FILHO - 5 Alterações para cada cliente
               for int0175 := 1 to 5 do
               begin
                  with Registro0175New do
                  begin
                     DT_ALT   := Date + int0175;
                     NR_CAMPO := IntToStr(int0175);
                     CONT_ANT := 'CAMPO ANTERIOR ' + IntToStr(int0175);
                  end;
               end;
            end;
         end;
         // FILHO
         // 4 Unidades de medida
         // Const strUNID, esta declarada no inicio deste evento.
         for int0190 := Low(strUNID) to High(strUNID) do
         begin
            if not Registro0190.LocalizaRegistro(strUNID[int0190]) then
            begin
               with Registro0190New do
               begin
                  UNID  := strUNID[int0190];
                  DESCR := 'Descricao ' + strUNID[int0190];
               end;
            end;
         end;

         with Registro0200New do
         begin
          while not qAux_Item.Eof do
          begin
            Pega_ICMS_NC(Q.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
            Pega_IPI_NC(Q.FieldByName('Codigo_Grupo_Tributacao_IPI').AsInteger);

            COD_ITEM:= qAux_Item.FieldByName('Codigo_Produto').AsString;
            DESCR_ITEM:= qAux_Item.FieldByName('Descricao').AsString;
            COD_BARRA:= qAux_Item.FieldByName('Codigo_Venda').AsString;
            COD_ANT_ITEM:= '';
            UNID_INV:= qAux_Item.FieldByName('Unidade').AsString;
            TIPO_ITEM:= '00';
            COD_NCM:= qAux_Item.FieldByName('Codigo_NCM').AsString;
            EX_IPI:= '';
            COD_GEN:= '00';
            COD_LST:= '';
            ALIQ_ICMS:= qAux_ICMS.FieldByName('Aliquota').AsString;
            qAux_Item.Next;
          end;
         end;

         // FILHO
         for int0300 := 1 to 10 do
         begin
            // 10 Bens Imobilizados
            with Registro0300New do
            begin
               COD_IND_BEM := FormatFloat('000000', int0300);
               IDENT_MERC  := 1;
               DESCR_ITEM  := 'DESCRIÇÃO DO ITEM';
               COD_PRNC    := '';
               COD_CTA     := '';
               NR_PARC     := 10;
               // FILHO
               with Registro0305New do
               begin
                  COD_CCUS     := '123';
                  VIDA_UTIL    := 60;
               end;
            end;
         end;
      end;
   end;}
end;

procedure TFrmVendas_Periodo.GeraBloco1;
var aConteudo: Ansistring;
begin
  aConteudo := '|1001';
  aConteudo := aConteudo + '|'+'1';
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|1990';
  aConteudo := aConteudo + '|'+'2';
  GravaLinhaArquivo(aConteudo);
end;

procedure TFrmVendas_Periodo.GeraBlocoC(pArquivo:String;pDatai,pDataf:TDateTime);
var aConteudo, aux : String;
    aCodAux, i, i2: Integer;
    Q, Q2, Q05, Q20, Q400, Q490, Q100, Q140, Q141, Q170, Q190, Q350, Q370, Q390: TADOQuery;
    aValor, valor_op, bc_icms: Double;
    caixa, ali_icms, aux2, aux3, aux4, aux5, aValor2, cfop: AnsiString;
    ali_aux, cfop_aux, cst_aux: AnsiString;
begin
  sLBloco := 1;
  qtde_itens:= 0;
  qtde_registros:= 0;
  qtde_itens_20:= 0;
  qtde_registros_05:= 0;
  qtde_registros_400:= 0;
  qtde_registros_490:= 0;
  qtde_registros_001:= 0;
  qtde_registros_100:= 0;
  qtde_registros_140:= 0;
  qtde_registros_141:= 0;
  qtde_registros_170:= 0;
  qtde_registros_190:= 0;
  qtde_registros_350:= 0;
  qtde_registros_370:= 0;
  qtde_registros_390:= 0;

  Q := TADOQuery.Create(nil);
  Q2 := TADOQuery.Create(nil);
  Q05 := TADOQuery.Create(nil);
  Q20 := TADOQuery.Create(nil);
  Q400 := TADOQuery.Create(nil);
  Q490 := TADOQuery.Create(nil);
  Q100 := TADOQuery.Create(nil);
  Q140 := TADOQuery.Create(nil);
  Q141 := TADOQuery.Create(nil);
  Q170 := TADOQuery.Create(nil);
  Q190 := TADOQuery.Create(nil);
  Q350 := TADOQuery.Create(nil);
  Q370 := TADOQuery.Create(nil);
  Q390 := TADOQuery.Create(nil);

  try
    Q.Connection := dm.ADOConnection1;
    // grava registro C001 - Abertura do Bloco
    aConteudo := '|C001';
    aConteudo := aConteudo + '|'+'0';
    GravaArquivoBlocoC(aConteudo);
    Inc(qtde_registros_001);
    //GravaLinhaArquivo(aConteudo);

    //registro C100
    {with Q100, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select EP.*, CFOP.CFOP, Forn.Nome_Fantasia, Forn.CNPJ, Forn.Insc_Estadual_Municipal, Cid.UF,');
      add('IE.* from Entrada_Produtos EP');
      add('left join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
      add('left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');
      add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo)');
      add('where Data_Entrada between :DI and :DF');
      Parameters.ParamByName('DI').Value:= pDatai;
      Parameters.ParamByName('DF').Value:= pDataf;
      open;
    end;

    while not Q100.Eof do
    begin
      aConteudo := '|C100';   //1
      aConteudo := aConteudo + '|' + '0'; //2
      aConteudo := aConteudo + '|' + '1'; //3
      aConteudo := aConteudo + '|' + Q100.FieldByName('Nome_Fantasia').AsString; //4
      aConteudo := aConteudo + '|' + '01'; //5
      aConteudo := aConteudo + '|' + '00'; //6
      aConteudo := aConteudo + '|' + Q100.FieldByName('Serie').AsString; //7
      aConteudo := aConteudo + '|' + ZeroEsquerda(Q100.FieldByName('N_Nota_Fiscal').AsString,9);  //8
      aConteudo := aConteudo + '|' + ZeroEsquerda('',44);  //9
      aConteudo := aConteudo + '|' + FormatDateTime('DDMMYYYY', Q100.FieldByName('Data_Emissao').AsDateTime);  //10
      aConteudo := aConteudo + '|' + FormatDateTime('DDMMYYYY', Q100.FieldByName('Data_Entrada').AsDateTime);  //11
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Total_Nota').AsFloat);  //12
      aConteudo := aConteudo + '|' + Q100.FieldByName('Tipo_Pagamento').AsString;  //13
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Desconto').AsFloat);  //14
      aConteudo := aConteudo + '|' + FormatFloat('0.00',0);  //15
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Total_Produtos').AsFloat);  //16
      aConteudo := aConteudo + '|' + Q100.FieldByName('Tipo_Frete').AsString;  //17
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Valor_Frete').AsFloat);  //18
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Valor_Seguro').AsFloat);  //19
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Outras_Despesas').AsFloat);  //20
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Base_ICMS').AsFloat);  //21
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Valor_ICMS').AsFloat);  //22
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Base_ICMS_Subs').AsFloat);  //23
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Valor_ICMS_Subs').AsFloat);  //24
      aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Total_IPI').AsFloat);  //25
      aConteudo := aConteudo + '|' + FormatFloat('0.00',0);  //26
      aConteudo := aConteudo + '|' + FormatFloat('0.00',0);  //27
      aConteudo := aConteudo + '|' + FormatFloat('0.00',0);  //28
      aConteudo := aConteudo + '|' + FormatFloat('0.00',0);  //29


      //aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Total_PIS').AsFloat);  //26
      //aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Total_COFINS').AsFloat);  //27
      //aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Total_PIS_ST').AsFloat);  //28
      //aConteudo := aConteudo + '|' + FormatFloat('0.00',Q100.FieldByName('Total_COFINS_ST').AsFloat);  //29
      GravaArquivoBlocoC(aConteudo);
      Inc(qtde_registros_100);  }

      // grava registro C110 - Informações Complementares da NF
      aConteudo := '|C110';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);
      // grava registro C111 - Processo referenciado
      aConteudo := '|C111';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);
      // grava registro C112 - Documento de arrecadação referenciado
      aConteudo := '|C112';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);
      // grava registro C113 - Documento Fiscal Referenciado
      aConteudo := '|C113';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);
      // grava registro C114 - Cupom Fiscal Referenciado
      aConteudo := '|C114';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);
      // grava registro C115 - Local de entrega ou coleta
      aConteudo := '|C115';
      GravaLinhaArquivo(aConteudo);
      // grava registro C120 - operações de importação
      aConteudo := '|C120';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);
      // grava registro C130 - ISQN, IRRF e Previdencia Social
      aConteudo := '|C130';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);


      // registro C140 - Fatura
      {with Q140, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select LF.Codigo, LF.N_Documento, LF.Historico, LF.Valor_Cobrado, LF.Codigo_Tipo_Documento,');
        add('TD.Descricao as Tipo_Documento, count(PL.Codigo) as Qtde');
        add('from Lancamento_Financeiro LF');
        add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
        add('left join Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
        add('where LF.N_Documento = :Doc');
        add('group by LF.Codigo, LF.N_Documento, LF.Historico, LF.Valor_Cobrado, LF.Codigo_Tipo_Documento,');
        add('TD.Descricao');
        Parameters.ParamByName('Doc').Value:= Q100.FieldByName('N_Nota_Fiscal').AsString;
        open;
      end;

      Q140.First;
      while not Q140.Eof do
      begin
        aConteudo := '|C140';   //1
        aConteudo := aConteudo + '|' + '1'; //2

        if (Q140.FieldByName('Tipo_Documento').AsString = 'DUPLICATA') then
          aConteudo := aConteudo + '|' + '00' //3
        else if (Q140.FieldByName('Tipo_Documento').AsString = 'CHEQUE') then
          aConteudo := aConteudo + '|' + '01' //3
        else if (Q140.FieldByName('Tipo_Documento').AsString = 'PROMISSÓRIA') then
          aConteudo := aConteudo + '|' + '02' //3
        else if (Q140.FieldByName('Tipo_Documento').AsString = 'RECIBO') then
          aConteudo := aConteudo + '|' + '03' //3
        else
          aConteudo := aConteudo + '|' + '99';//3

        aConteudo := aConteudo + '|' + Q140.FieldByName('Historico').AsString; //4
        aConteudo := aConteudo + '|' + Q140.FieldByName('N_Documento').AsString;  //5
        aConteudo := aConteudo + '|' + ZeroEsquerda(Q140.FieldByName('Qtde').AsString,2);  //6
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q140.FieldByName('Valor_Cobrado').AsFloat);  //7
        GravaArquivoBlocoC(aConteudo);
        Inc(qtde_registros_140);

        // grava registro C141 - Vencimento da Fatura
        with Q141, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select PL.Codigo, PL.Parcela, PL.Data_Vencimento, PL.Valor');
          add('from Parcelas_Lancamentos PL');
          add('left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
          add('where PL.Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= Q140.FieldByName('Codigo').AsInteger;
          open;
        end;
        while not Q141.Eof do
        begin
          aConteudo := '|C141';   //1
          aConteudo := aConteudo + '|' + ZeroEsquerda(Q141.FieldByName('Parcela').AsString,2);  //2
          aConteudo := aConteudo + '|' + FormatDateTime('DDMMYYYY',Q141.FieldByName('Data_Vencimento').AsDateTime); //3
          aConteudo := aConteudo + '|' + FormatFloat('0.00',Q141.FieldByName('Valor').AsFloat);  //4
          GravaArquivoBlocoC(aConteudo);
          Inc(qtde_registros_141);
          Q141.Next;
        end;
        Q140.Next;
      end;    }

      // grava registro C160 - Volumes transportados
      aConteudo := '|C160';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);
      // grava registro C165 - operacoes de combustivel
      aConteudo := '|C165';
      aConteudo := aConteudo + '|';
      GravaLinhaArquivo(aConteudo);

      //registro C170

     { with Q170, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select EP.*, CFOP.CFOP, Forn.Nome_Fantasia, Forn.CNPJ, Forn.Insc_Estadual_Municipal, Cid.UF,');
        add('IE.*, IT.*, P.Codigo_Venda, P.Descricao from Entrada_Produtos EP');
        add('left join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
        add('left join Itens_Entrada IT on (EP.Codigo = IT.Codigo)');
        add('left join Produto P on (IT.Codigo_Produto = P.Codigo)');
        add('left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');
        add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
        add('left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo)');
        add('where EP.N_Nota_Fiscal = :Nota');
        Parameters.ParamByName('Nota').Value:= Q100.FieldByName('N_Nota_Fiscal').AsString;
        open;
      end;
      while not Q170.Eof do
      begin
        cfop:=  StringReplace(Q170.FieldByName('CFOP').AsString, '.','',[rfReplaceAll]);

        aConteudo := '|C170';   //1
        aConteudo := aConteudo + '|' + ZeroEsquerda(Q170.FieldByName('N_Item').AsString, 3); //2
        aConteudo := aConteudo + '|' + Q170.FieldByName('Codigo_Venda').AsString; //3
        aConteudo := aConteudo + '|' + Q170.FieldByName('Descricao').AsString; //4   --
        aConteudo := aConteudo + '|' + FormatFloat('0.00000',Q170.FieldByName('Quantidade').AsFloat); //5
        aConteudo := aConteudo + '|' + Q170.FieldByName('Unidade').AsString; //6
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q170.FieldByName('Total_Produtos').AsFloat); //7
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q170.FieldByName('Desconto').AsFloat); //8  --
        aConteudo := aConteudo + '|' + '0'; //9
        aConteudo := aConteudo + '|' + ZeroEsquerda(Q170.FieldByName('ST').AsString,3); // 10
        aConteudo := aConteudo + '|' + ZeroEsquerda(cfop,4); //11
        aConteudo := aConteudo + '|' + ''; //12 -- codigo da natureza da operação //12
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q170.FieldByName('Base_ICMS').AsFloat); //13
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q170.FieldByName('Aliquota_ICMS').AsFloat); //14
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q170.FieldByName('Valor_ICMS').AsFloat); //15
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q170.FieldByName('Base_ICMS_Subs').AsFloat); //16
        aConteudo := aConteudo + '|' + ''; //17 --aliquota icms da subs. trib. na uf de destino
        aConteudo := aConteudo + '|' + FormatFloat('0.00',Q170.FieldByName('Valor_ICMS_Subs').AsFloat); //18
        aConteudo := aConteudo + '|' + '0'; //apuração de ipi 0-mensal, 1-decendial //19

        aConteudo := aConteudo + '|' + '00';
        aConteudo := aConteudo + '|' + '';
        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '000010';
        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '01';
        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '0,000';
        aConteudo := aConteudo + '|' + '0,0000';
        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '01';
        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '000010';
        aConteudo := aConteudo + '|' + '0,000';
        aConteudo := aConteudo + '|' + '0,0000';
        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '';

        Grava_170(Q170.FieldByName('Aliquota_ICMS').AsFloat, Q170.FieldByName('Total_Nota').AsFloat,
        Q170.FieldByName('Base_ICMS').AsFloat, Q170.FieldByName('Valor_ICMS').AsFloat,
        Q170.FieldByName('Base_ICMS_Subs').AsFloat, Q170.FieldByName('Valor_ICMS_Subs').AsFloat,
        (Q170.FieldByName('Total_Produtos').AsFloat - Q170.FieldByName('Base_ICMS').AsFloat),
        Q170.FieldByName('Total_IPI').AsFloat, Q170.FieldByName('CFOP').AsString,
        Q170.FieldByName('ST').AsString);

        GravaArquivoBlocoC(aConteudo);
        Inc(qtde_registros_170);
        Q170.Next;
      end;
      Q100.Next;
    end;   }

    // grava registro C172 - Operacoes com ISSQN
    aConteudo := '|C172';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C173 - operacoes com medicamentos
    aConteudo := '|C173';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C174 - operações com armas de fogo
    aConteudo := '|C174';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C175 - operações com veiculos novos
    aConteudo := '|C175';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C176 - Ressarcimento de ICMS em operações com ST
    aConteudo := '|C176';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C177 - operações com produtos sujesto a selo de controle do IPI
    aConteudo := '|C177';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C178 - operações com produtos sujestos a tributação de IPI por unid ou quant
    aConteudo := '|C178';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C179 - Informações Complementares ST
    aConteudo := '|C179';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);


    //registro C190 - Registro analitico do Documento

    {with Q190, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select EP.*, CFOP.CFOP, Forn.Nome_Fantasia, Forn.CNPJ, Forn.Insc_Estadual_Municipal, Cid.UF,');
      add('IE.*, IT.* from Entrada_Produtos EP');
      add('left join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)');
      add('left join Itens_Entrada IT on (EP.Codigo = IT.Codigo)');
      add('left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');
      add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo)');
      add('where EP.N_Nota_Fiscal = :Nota');
      Parameters.ParamByName('Nota').Value:= Q100.FieldByName('N_Nota_Fiscal').AsString;
      open;
    end; }

    //while not Q190.Eof do
    //begin
      {ClientDataSet2.First;
      while not ClientDataSet2.Eof do
      begin

        cfop:= StringReplace(ClientDataSet2CFOP.AsString, '.','',[rfReplaceAll]);

        aConteudo := '|C190';   //1
        aConteudo := aConteudo + '|' + ZeroEsquerda(ClientDataSet2ST.AsString, 3); //2
        aConteudo := aConteudo + '|' + ZeroEsquerda(cfop, 4); //3

        aux:= FormatFloat('0.00', ClientDataSet2Aliquota.AsFloat);
        aux:= FiltraNumero(aux);
        aConteudo := aConteudo + '|' + ZeroEsquerda(aux,6); //4   --

        aConteudo := aConteudo + '|' + FormatFloat('0.00',ClientDataSet2Valor_Operacao.AsFloat); //5
        aConteudo := aConteudo + '|' + FormatFloat('0.00',ClientDataSet2BC_ICMS.AsFloat); //6
        aConteudo := aConteudo + '|' + FormatFloat('0.00',ClientDataSet2Valor_ICMS.AsFloat); //7
        aConteudo := aConteudo + '|' + FormatFloat('0.00',ClientDataSet2BC_ICMS_ST.AsFloat); //8
        aConteudo := aConteudo + '|' + FormatFloat('0.00',ClientDataSet2Valor_ICMS_ST.AsFloat); //9
        aConteudo := aConteudo + '|' + FormatFloat('0.00',ClientDataSet2Valor_Red_BC.AsFloat); //10
        aConteudo := aConteudo + '|' + FormatFloat('0.00',ClientDataSet2Valor_IPI.AsFloat); //11
        aConteudo := aConteudo + '|' + '';

        GravaArquivoBlocoC(aConteudo);
        Inc(qtde_registros_190);
        ClientDataSet2.Next;
      end;  }
    //end;

    // grava registro C195 - Observações do lançamentos fiscal
    aConteudo := '|C195';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C197 - outras operações Tributárias, ajustes e
    // informações de valores provenientes de documento fiscal
    aConteudo := '|C197';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C300 - Resumo diario de NF venda a consumidor
    aConteudo := '|C300';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C310 - Documentos cancelados de NF venda a consumidor
    aConteudo := '|C310';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C320 - Registro analitico do resumo diario das NF Venda Consumidor
    aConteudo := '|C320';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C321 - Itens do resumo diario dos documentos
    aConteudo := '|C321';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);



    // grava registro C350 - NF de Venda a Consumidor
    Q350.Close;
    Q350.Connection:= dm.ADOConnection1;
    Q350.SQL.Clear;
    Q350.SQL.Add('select MM.*, Cli.CNPJ, Cli.CPF from Movimentacao_Manual MM');
    Q350.SQL.Add('left join Cliente Cli on (MM.Codigo_Cliente = Cli.Codigo)');
    Q350.SQL.Add('where MM.Data_Emissao between :pDatai and :pDataf');
    Q350.SQL.Add('and MM.Codigo_Empresa = :pIDEmp ');
    Q350.Parameters.ParamByName('pDatai').Value    := pDatai;
    Q350.Parameters.ParamByName('pDataf').Value    := pDataf;
    Q350.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
    Q350.Open;
    Q350.First;

    while not Q350.Eof do
    begin
      aConteudo := '|C350';
      aConteudo := aConteudo + '|' + Q350.FieldByName('N_Serie').AsString;
      aConteudo := aConteudo + '|' + '';
      aConteudo := aConteudo + '|' + ZeroEsquerda(Q350.FieldByName('N_Ordem').AsString,6);
      aConteudo := aConteudo + '|' + FormatDateTime('DDMMYYYY',Q350.FieldByName('Data_Emissao').AsDateTime);

      if (Q350.FieldByName('CPF').AsString <> '') then
        aConteudo := aConteudo + '|' + Q350.FieldByName('CPF').AsString
      else if (Q350.FieldByName('CNPJ').AsString <> '') then
        aConteudo := aConteudo + '|' + Q350.FieldByName('CNPJ').AsString;

      aConteudo := aConteudo + '|' + FormatFloat('0.00', Q350.FieldByName('Total_Produtos').AsFloat);
      aConteudo := aConteudo + '|' + FormatFloat('0.00', Q350.FieldByName('Total_Pedido').AsFloat);
      aConteudo := aConteudo + '|' + FormatFloat('0.00', Q350.FieldByName('Desconto').AsFloat);
      aConteudo := aConteudo + '|' + FormatFloat('0.00', 0);
      aConteudo := aConteudo + '|' + FormatFloat('0.00', 0);
      aConteudo := aConteudo + '|' + '';
      GravaArquivoBlocoC(aConteudo);
      Inc(qtde_registros_350);

      Q370.Close;
      Q370.Connection:= dm.ADOConnection1;
      Q370.SQL.Clear;
      Q370.SQL.Add('select IMM.*, P.Codigo_Venda, P.Descricao from Itens_Movimentacao_Manual IMM');
      Q370.SQL.Add('left join Produto P on (IMM.Codigo_Produto = P.Codigo)');
      Q370.SQL.Add('where IMM.Codigo = :Codigo');
      Q370.Parameters.ParamByName('Codigo').Value := Q350.FieldByName('Codigo').AsInteger;
      Q370.Open;
      Q370.First;

      if not ClientDataSet3.Active then
        ClientDataSet3.CreateDataSet;
      ClientDataSet3.open;

      while not Q370.Eof do
      begin
        aConteudo := '|C370';
        aConteudo := aConteudo + '|' + Q370.FieldByName('Sequencia').AsString;
        aConteudo := aConteudo + '|' + Q370.FieldByName('Codigo_Venda').AsString;
        aConteudo := aConteudo + '|' + FormatFloat('0.000', Q370.FieldByName('Quantidade').AsFloat);
        aConteudo := aConteudo + '|' + Q370.FieldByName('UN').AsString;

        aConteudo := aConteudo + '|' + FormatFloat('0.00', Q370.FieldByName('Sub_Total').AsFloat);
        aConteudo := aConteudo + '|' + FormatFloat('0.00', Q370.FieldByName('Desconto').AsFloat);
        GravaArquivoBlocoC(aConteudo);
        Inc(qtde_registros_370);

        if (Q370.FieldByName('ICMS').AsString = 'I1') or (Q370.FieldByName('ICMS').AsString = 'N1') or
            (Q370.FieldByName('ICMS').AsString = 'F1') then
          ali_aux:= '0,00'
        else
          ali_aux:= FormatFloat('0.00',Q370.FieldByName('ICMS').AsFloat/100);

        cst_aux:= '0'+Q370.FieldByName('CST').AsString;
        cfop_aux:= '5102';

        if (cst_aux = '060') then
          cfop_aux:= '5403';


        if (ClientDataSet3.Locate('ST;CFOP;Aliquota', VarArrayOf([cst_aux, cfop_aux, ali_aux]), [])) then
        begin
          ClientDataSet3.Edit;
          ClientDataSet3.FieldByName('Valor_Operacao').AsFloat:= ClientDataSet3.FieldByName('Valor_Operacao').AsFloat + Q370.FieldByName('Sub_Total').AsFloat;
          ClientDataSet3.FieldByName('BC_ICMS').AsFloat:= ClientDataSet3.FieldByName('BC_ICMS').AsFloat + Q370.FieldByName('Sub_Total').AsFloat;
          ClientDataSet3.Post;
        end
        else
        begin
          Grava_370(cst_aux,
          ali_aux,
          cfop_aux,
          Q370.FieldByName('Sub_Total').AsFloat,
          Q370.FieldByName('BC').AsFloat,
          Q370.FieldByName('Valor_ICMS').AsFloat);
        end;


        Q370.Next;
      end;

      // grava registro C390 - Registro analitico das NF de venda a consumidor
      ClientDataSet3.First;
      while not ClientDataSet3.Eof do
      begin
        aConteudo := '|C390';
        aConteudo := aConteudo + '|' + ClientDataSet3.FieldByName('ST').AsString;
        aConteudo := aConteudo + '|' + ClientDataSet3.FieldByName('CFOP').AsString;
        aConteudo := aConteudo + '|' + ClientDataSet3.FieldByName('Aliquota').AsString;
        aConteudo := aConteudo + '|' + FormatFloat('0.00', ClientDataSet3.FieldByName('Valor_Operacao').AsFloat);
        aConteudo := aConteudo + '|' + FormatFloat('0.00', ClientDataSet3.FieldByName('BC_ICMS').AsFloat);
        aConteudo := aConteudo + '|' + FormatFloat('0.00', (ClientDataSet3.FieldByName('Valor_ICMS').AsFloat));

        valor_icms:= valor_icms + ClientDataSet3.FieldByName('Valor_ICMS').AsFloat;

        aConteudo := aConteudo + '|' + '0,00';
        aConteudo := aConteudo + '|' + '';
        GravaArquivoBlocoC(aConteudo);
          Inc(qtde_registros_390);
        ClientDataSet3.Next;
      end;

      ClientDataSet3.EmptyDataSet;
      Q350.Next;
    end;





    // grava registro C400 - Equipamento ECF

    Q400.Close;
    Q400.Connection:= dm.ADOConnection1;
    Q400.SQL.Clear;
    Q400.SQL.Add('select R02.Caixa, R02.N_Fabricacao, R02.Modelo_ECF, R02.Data_Movimento from R02');
    Q400.SQL.Add('where R02.Data_Movimento between :pDatai and :pDataf');
    Q400.SQL.Add('and R02.Codigo_Empresa = :pIDEmp');
    Q400.Parameters.ParamByName('pDatai').Value    := pDatai;
    Q400.Parameters.ParamByName('pDataf').Value    := pDataf;
    Q400.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
    Q400.Open;

    //if (Q400.RecordCount <> 0) then
    //begin
      //while not Q400.Eof do
      //begin
        aConteudo := '|C400';
        aConteudo := aConteudo + '|' + '2D';
        aConteudo := aConteudo + '|' + Trim(Q400.FieldByName('Modelo_ECF').AsString);
        aConteudo := aConteudo + '|' + Q400.FieldByName('N_Fabricacao').AsString;
        caixa:= copy(Q400.FieldByName('Caixa').AsString, 2,3);
        aConteudo := aConteudo + '|' + ZeroEsquerda(caixa,3);
        GravaArquivoBlocoC(aConteudo);
        Inc(qtde_registros_400);
        //GravaLinhaArquivo(aConteudo);

        // registro C405
        Q05.Close;
        Q05.Connection:= dm.ADOConnection1;
        Q05.SQL.Clear;
        Q05.SQL.Add('select R02.Caixa, R02.N_Fabricacao,');
        Q05.SQL.Add('R02.Data_Movimento, R02.CRZ,');
        Q05.SQL.Add('R02.COO_Inicial, R02.COO_Final, R02.CRO,');
        Q05.SQL.Add('R02.Grande_Total, R02.Venda_Bruta_Diaria, sum(convert(decimal(18,2), R03.Valor_Acumulado)) as N from R02');
        Q05.SQL.Add('left join R03 on (R02.Data_Movimento = R03.Data_Movimento)');
        Q05.SQL.Add('where R02.Data_Movimento between :pDatai and :pDataf');
        Q05.SQL.Add('and R02.Codigo_Empresa = :pIDEmp and (R03.Totalizador_Parcial = :1 or  R03.Totalizador_Parcial = :2)');
        Q05.SQL.Add('group by R02.Caixa, R02.N_Fabricacao,');
        Q05.SQL.Add('R02.Data_Movimento, R02.CRZ,');
        Q05.SQL.Add('R02.COO_Inicial, R02.COO_Final, R02.CRO,');
        Q05.SQL.Add('R02.Grande_Total, R02.Venda_Bruta_Diaria');
        Q05.Parameters.ParamByName('pDatai').Value    := pDatai;
        Q05.Parameters.ParamByName('pDataf').Value    := pDataf;
        Q05.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
        Q05.Parameters.ParamByName('1').Value := 'AT';
        Q05.Parameters.ParamByName('2').Value := 'AS';
        Q05.Open;
        Q05.First;

        while not Q05.Eof do
        begin
          if (Q05.FieldByName('COO_Inicial').AsString <> '000000') then
          begin
            aConteudo := '|C405';
            aConteudo := aConteudo + '|' + FormatDateTime('DDMMYYYY',Q05.FieldByName('Data_Movimento').AsDateTime);
            aConteudo := aConteudo + '|' + ZeroEsquerda(IntToStr(Q05.FieldByName('CRO').AsInteger),3);
            aConteudo := aConteudo + '|' + ZeroEsquerda(IntToStr(Q05.FieldByName('CRZ').AsInteger),6);
            aConteudo := aConteudo + '|' + ZeroEsquerda(IntToStr(Q05.FieldByName('COO_Final').AsInteger),6);
            aConteudo := aConteudo + '|' + FormatFloat('0.00', Q05.FieldByName('Grande_Total').AsFloat);
            aConteudo := aConteudo + '|' + FormatFloat('0.00', (Q05.FieldByName('Venda_Bruta_Diaria').AsFloat + Q05.FieldByName('N').AsFloat) /100);
            GravaArquivoBlocoC(aConteudo);
            Inc(qtde_registros_05);

            //GravaLinhaArquivo(aConteudo);
          // grava registro C410 - Pis e Cofins totalizados no dia
          {aConteudo := '|C410';
          aConteudo := aConteudo + '|';
          GravaLinhaArquivo(aConteudo);}


            // grava registro C420 - Registro dos Totalizadores parciais da Redução Z
            Q20.Close;
            Q20.Connection:= dm.ADOConnection1;
            Q20.SQL.Clear;
            Q20.SQL.Add('select R03.Totalizador_Parcial, R03.Valor_Acumulado from R03');
            Q20.SQL.Add('where R03.Data_Movimento = :pDatai ');
            Q20.SQL.Add('group by R03.Totalizador_Parcial, R03.Valor_Acumulado');
            Q20.Parameters.ParamByName('pDatai').Value:= Q05.FieldByName('Data_Movimento').AsDateTime;
            Q20.Open;
            while not Q20.Eof do
            begin
              aConteudo := '|C420';
              if (trim(Q20.FieldByName('Totalizador_Parcial').AsString) = 'FF') or
                 (trim(Q20.FieldByName('Totalizador_Parcial').AsString) = 'F') or
                 (trim(Q20.FieldByName('Totalizador_Parcial').AsString) = 'II') or
                 (trim(Q20.FieldByName('Totalizador_Parcial').AsString) = 'I') or
                 (trim(Q20.FieldByName('Totalizador_Parcial').AsString) = 'NN') or
                 (trim(Q20.FieldByName('Totalizador_Parcial').AsString) = 'N') then
              begin
                aux := trim(Q20.FieldByName('Totalizador_Parcial').AsString);
              end
              else
              begin
                aux := trim(Q20.FieldByName('Totalizador_Parcial').AsString);
              end;
              aux2:= '';
              aux2:= copy(Q20.FieldByName('Totalizador_Parcial').AsString, 3,1);
              aConteudo := aConteudo + '|' + Q20.FieldByName('Totalizador_Parcial').AsString;
              aConteudo := aConteudo + '|' + FormatFloat('0.00', Q20.FieldByName('Valor_Acumulado').AsFloat /100);
              if (aux2 = 'T') then
              begin
                aux2:= copy(Q20.FieldByName('Totalizador_Parcial').AsString, 1,2);
                aConteudo := aConteudo + '|' + aux2;
                aConteudo := aConteudo + '|' + 'Tributado ICMS';
              end
              else if (aux2 = 'S') then
              begin
                aux2:= copy(Q20.FieldByName('Totalizador_Parcial').AsString, 1,2);
                aConteudo := aConteudo + '|' + aux2;
                aConteudo := aConteudo + '|' + 'Tributado ISSQN';
              end
              else
              begin
                aConteudo := aConteudo + '|' + '';
                aConteudo := aConteudo + '|' + '';
              end;
              if (Q20.FieldByName('Valor_Acumulado').AsString = '00000000000000')  then
                Q20.Next
              else
              begin
                //GravaLinhaArquivo(aConteudo);
                GravaArquivoBlocoC(aConteudo);
                Inc(qtde_itens_20);
                Q20.Next
              end;
            end;

          // grava registro C425 - Resumo dos itens do Mov Diario

          if (perfil_arquivo = 'B') then
          begin
            Q.Close;
            Q.SQL.Clear;
            Q.SQL.Add('select IP.Codigo_Produto, IP.UN,');
            Q.SQL.Add('sum(IP.Qtde * IP.Sub_Total) as valor,');
            Q.SQL.Add('sum(IP.Qtde) as Quantidade from Pedido Ped');
            Q.SQL.Add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
            Q.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
            Q.SQL.Add('where Ped.Data_Venda = :pDatai');
            Q.SQL.Add('and Ped.Codigo_Empresa = :pIDEmp');
            Q.SQL.Add('and Ped.Status = :Baixado');
            Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV or Ped.Tipo = :DAV)');
            Q.SQL.Add('group by IP.Codigo_Produto, IP.UN');
            Q.Parameters.ParamByName('pDatai').Value := Q05.FieldByName('Data_Movimento').AsDateTime;
            Q.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
            Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
            Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
            Q.Parameters.ParamByName('PDV').Value := 'PDV';
            Q.Parameters.ParamByName('DAV').Value := 'DAV-OS';
            Q.Open;
            while not Q.Eof do
            begin
              aConteudo := '|C425';
              aConteudo := aConteudo + '|' + IntToStr(Q.FieldByName('Codigo_Produto').AsInteger);
              aConteudo := aConteudo + '|' + FormatFloat('0.000',Q.FieldByName('Quantidade').AsFloat);
              aConteudo := aConteudo + '|' + Q.FieldByName('UN').AsString;
              aConteudo := aConteudo + '|' + FormatFloat('0.00',Q.FieldByName('valor').AsFloat);
              aConteudo := aConteudo + '|' + '';
              aConteudo := aConteudo + '|' + '';
              //GravaLinhaArquivo(aConteudo);
              Q.Next;
            end;
          end;

          if (perfil_arquivo = 'A') then
          begin
            // grava registro C460 - Documentos Fiscais Emitidos por ECF
            Q.Close;
            Q.Connection:= dm.ADOConnection1;
            Q.SQL.Clear;
            Q.SQL.Add('select Ped.Codigo, Ped.COO, Ped.Data_Venda, Ped.Total_Pedido,');
            Q.SQL.Add('Ped.Status, Ped.Desconto, Cli.Nome_Nome_Fantasia, Cli.CPF, Cli.CNPJ, Ped.Status from Pedido Ped');
            Q.SQL.Add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
            Q.SQL.Add('where Ped.Data_Venda = :pDatai');
            Q.SQL.Add('and Ped.Codigo_Empresa = :pIDEmp');
            Q.SQL.Add('and Ped.Status = :Baixado');
            Q.SQL.Add('and (Ped.Tipo = :Pedido or Ped.Tipo = :PDV or Ped.Tipo = :DAV)');
            Q.Parameters.ParamByName('pDatai').Value    := Q05.FieldByName('Data_Movimento').AsDateTime;
            Q.Parameters.ParamByName('pIDEmp').Value := uDeclaracao.codigo_empresa;
            Q.Parameters.ParamByName('Baixado').Value := 'PAGO';
            Q.Parameters.ParamByName('Pedido').Value := 'PRÉ-VENDA';
            Q.Parameters.ParamByName('PDV').Value := 'PDV';
            Q.Parameters.ParamByName('DAV').Value := 'DAV-OS';
            Q.Open;

            if (Q.RecordCount <> 0) then
            begin
              while not Q.Eof do
              begin
                aConteudo := '|C460';
                aConteudo := aConteudo + '|' + '2D';
                aux := '00';
                if Q.FieldByName('Status').AsString = 'CANCELADO' then
                   aux := '02';
                aConteudo := aConteudo + '|' + aux;
                aConteudo := aConteudo + '|' + Q.FieldByName('COO').AsString;
                aConteudo := aConteudo + '|' + FormatDateTime('DDMMYYYY',Q.FieldByName('Data_Venda').AsDateTime);
                aConteudo := aConteudo + '|' + FormatFloat('0.00',Q.FieldByName('Total_Pedido').AsFloat + Q.FieldByName('Desconto').AsFloat); ///somar o total + descontos para ser maior que a soma dos itens do C470
                aConteudo := aConteudo + '|' + '';
                aConteudo := aConteudo + '|' + '';
                aConteudo := aConteudo + '|' + Q.FieldByName('CPF').AsString;
                aConteudo := aConteudo + '|' + Q.FieldByName('Nome_Nome_Fantasia').AsString;
                GravaArquivoBlocoC(aConteudo);
                Inc(qtde_registros);
                //GravaLinhaArquivo(aConteudo);

                // grava registro C470 - Itens dos doc fiscais emitidos por ECF
                Q2.Close;
                Q2.Connection:= dm.ADOConnection1;
                Q2.SQL.Clear;
                Q2.SQL.Add('select Pro.Codigo_Grupo_Tributacao, Pro.Codigo_Venda, Pro.Tipo_Tributacao, ');
                Q2.SQL.Add('IP.Codigo, IP.Codigo_Produto, IP.Qtde, IP.UN, IP.ICMS, IP.CST,');
                Q2.SQL.Add('IP.Sub_Total, IP.Desconto, IP.Cancelado from Pedido Ped');
                Q2.SQL.Add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
                Q2.SQL.Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
                Q2.SQL.Add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
                Q2.Parameters.ParamByName('Codigo').Value := Q.FieldByName('Codigo').AsInteger;
                Q2.Parameters.ParamByName('N').Value := 'N';
                Q2.Open;

                while not Q2.Eof do
                begin
                  //Pega_ICMS_NC(Q2.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
                  aConteudo := '|C470';
                  aConteudo := aConteudo + '|' + Q2.FieldByName('Codigo_Venda').AsString;
                  aConteudo := aConteudo + '|' + Formatfloat('0.000',Q2.FieldByName('Qtde').AsFloat);

                  if (Q2.FieldByName('Cancelado').AsString = 'S') then
                    aConteudo := aConteudo + '|' + Formatfloat('0.000',Q2.FieldByName('Qtde').AsFloat)
                  else
                    aConteudo := aConteudo + '|' + '';

                  aConteudo := aConteudo + '|' + Q2.FieldByName('UN').AsString;
                  aConteudo := aConteudo + '|' + formatfloat('0.00',Q2.FieldByName('Sub_Total').AsFloat);
                  CFOP := '5102';
                  CFOPP := '5102';

                  //valor_bc:= valor_bc + Q2.FieldByName('Sub_Total').AsFloat;

                  {if (Q2.FieldByName('Tipo_Tributacao').AsString = 'I') then
                    aux:= '040'
                  else if (Q2.FieldByName('Tipo_Tributacao').AsString = 'N') then
                    aux:= '041'
                  else if (Q2.FieldByName('Tipo_Tributacao').AsString = 'F') then
                  begin
                    aux:= '060';
                    CFOP:= '5403'
                  end
                  else}

                  aux:= '0'+Q2.FieldByName('CST').AsString;
                  if (aux = '060') then
                  begin
                    CFOP:= '5403';
                    CFOPP:= '5403';
                  end;

                  aConteudo := aConteudo + '|' + aux;
                  aConteudo := aConteudo + '|' + CFOP;
                  if (Q2.FieldByName('ICMS').AsString = 'I1') or (Q2.FieldByName('ICMS').AsString = 'N1') or
                      (Q2.FieldByName('ICMS').AsString = 'F1') then
                  begin
                    aConteudo := aConteudo + '|' + '0,00';
                    aliquota_icms:= StrToFloat('0,00');
                  end
                  else
                  begin
                    aConteudo := aConteudo + '|' + FormatFloat('0.00',Q2.FieldByName('ICMS').AsFloat/100);
                    aliquota_icms:= Q2.FieldByName('ICMS').AsFloat/100;
                  end;

                  valor_total_item:= Q2.FieldByName('Sub_Total').AsFloat;
                  Grava_Aliquota(i);

                  aConteudo := aConteudo + '|' + '';
                  aConteudo := aConteudo + '|' + '';
                  GravaArquivoBlocoC(aConteudo);
                  //GravaLinhaArquivo(aConteudo);
                  inc(qtde_itens);
                  Q2.Next;
                end;
              Q.Next;
              end;
            end;
          end;

          //inc(i);
          // grava registro C490 - Registro analitico do movimento diario
          Q490.Close;
          Q490.Connection:= dm.ADOConnection1;
          Q490.SQL.Clear;
          Q490.SQL.Add('select R03.Totalizador_Parcial, R03.Valor_Acumulado from R03');
          Q490.SQL.Add('where R03.Data_Movimento = :pDatai and R03.Valor_Acumulado <> :par');
          Q490.SQL.Add('group by R03.Totalizador_Parcial, R03.Valor_Acumulado');
          Q490.Parameters.ParamByName('pDatai').Value    := Q05.FieldByName('Data_Movimento').AsDateTime;
          Q490.Parameters.ParamByName('par').Value    := '00000000000000';
          Q490.Open;

          while not Q490.Eof do
          begin
            aux2:= '';
            aux2:= copy(Q490.FieldByName('Totalizador_Parcial').AsString, 4,1);
            aux3:= copy(Q490.FieldByName('Totalizador_Parcial').AsString, 1,5);
            aux4:= copy(Q490.FieldByName('Totalizador_Parcial').AsString, 3,1);
            aux5:= copy(Q490.FieldByName('Totalizador_Parcial').AsString, 1,3);

            if (aux5 = 'DT') or (aux5 = 'DS') or (aux5 = 'AT') or (aux5 = 'AS') or (aux5 = 'Can') or (aux5 = 'OPN') then
              Q490.Next
            else
            begin
              if (aux2 <> '0') and ((aux4 = 'T') or (aux4 = 'S')) then
                ali_icms:= copy(Q490.FieldByName('Totalizador_Parcial').AsString, 4,2)
              else if (aux2 = '0') and ((aux4 = 'T') or (aux4 = 'S')) then
                ali_icms:= copy(Q490.FieldByName('Totalizador_Parcial').AsString, 5,1)
              else
                ali_icms:= '0';

              if (trim(Q490.FieldByName('Totalizador_Parcial').AsString) = 'F1') or (trim(Q490.FieldByName('Totalizador_Parcial').AsString) = 'FS1') then
              begin
                CFOP:= '5403';
                aux:= '060';
              end
              else if (trim(Q490.FieldByName('Totalizador_Parcial').AsString) = 'I1') or (trim(Q490.FieldByName('Totalizador_Parcial').AsString) = 'IS1') then
              begin
                CFOP:= '5102';
                aux:= '040';
              end
              else if (trim(Q490.FieldByName('Totalizador_Parcial').AsString) = 'N1') or (trim(Q490.FieldByName('Totalizador_Parcial').AsString) = 'NS1') then
              begin
                CFOP:= '5102';
                aux:= '041';
              end
              else
              begin
                CFOP:= '5102';
                aux:= '000';
              end;

              aValor2:= FormatFloat('0.00', Q490.FieldByName('Valor_Acumulado').AsFloat/100);

              aConteudo := '|C490';
              aConteudo := aConteudo + '|' + aux;
              aConteudo := aConteudo + '|' + CFOP;
              aConteudo := aConteudo + '|' + FormatFloat('0.00',StrToFloat(ali_icms));
              aConteudo := aConteudo + '|' + aValor2;

              ClientDataSet1.First;
              valor_bc:= 0;
              //inc(i);

              while not ClientDataSet1.Eof do
              begin
                if (ClientDataSet1Aliquota.AsString = ali_icms) and (ClientDataSet1CFOP.AsString = CFOP) then
                  valor_bc:= valor_bc + ClientDataSet1Valor.AsFloat;
                ClientDataSet1.Next;
              end;

              if (ali_icms <> '0') then
                aConteudo := aConteudo + '|' + FloatToStr(valor_bc)
              else
                aConteudo := aConteudo + '|' + '0,00';

              aConteudo := aConteudo + '|' + FormatFloat('0.00',valor_bc*StrToFloat(ali_icms)/100);


              valor_icms:= valor_icms + (valor_bc*StrToFloat(ali_icms)/100);

              aConteudo := aConteudo + '|' + '';
              GravaArquivoBlocoC(aConteudo);
              inc(qtde_registros_490);
              //GravaLinhaArquivo(aConteudo);
              Q490.Next;
            end;
          end;
          ClientDataSet1.EmptyDataSet;
          {while not Q490.Eof do
          begin
            Pega_ICMS_NC(Q490.FieldByName('Codigo_Grupo_Tributacao').AsInteger);

            aConteudo := '|C490';
            CFOP := '5102';
            case qAux_ICMS.FieldByName('Codigo_Situacao').AsInteger of
              0 : aux := '040';
              1 : begin                                                            //verificar esse tipo de tributação
                    aux  := '060';
                    CFOP := '5405';
                  end;
              2 : aux := '000';
              3 : aux := '020';
              4 : aux := '000';
            end;
            aConteudo := aConteudo + '|' + aux;
            aConteudo := aConteudo + '|' + CFOP;
            aConteudo := aConteudo + '|' + FormatFloat('0.00',qAux_ICMS.FieldByName('Aliquota').AsFloat);
            aConteudo := aConteudo + '|' + Q490.FieldByName('valor_total').AsString;
            aConteudo := aConteudo + '|' + Q490.FieldByName('bc').AsString;
            aConteudo := aConteudo + '|' + FormatFloat('0.00',Q490.FieldByName('bc').AsFloat*qAux_ICMS.FieldByName('Aliquota').AsFloat/100);

            valor_icms:= valor_icms + (Q490.FieldByName('bc').AsFloat*qAux_ICMS.FieldByName('Aliquota').AsFloat/100);

            aConteudo := aConteudo + '|' + '';
            GravaArquivoBlocoC(aConteudo);
            inc(qtde_registros_490);
            //GravaLinhaArquivo(aConteudo);
            Q490.Next;
          end; }

          Q05.Next;
          end
          else
            Q05.Next;
        end;

        GravaQtdeBlocoC001;
        GravaQtdeBlocoC100;
        GravaQtdeBlocoC140;
        GravaQtdeBlocoC141;
        GravaQtdeBlocoC170;
        GravaQtdeBlocoC190;
        GravaQtdeBlocoC350;
        GravaQtdeBlocoC370;
        GravaQtdeBlocoC390;
        GravaQtdeBlocoC400;
        GravaQtdeBlocoC0520;
        GravaQtdeBlocoC6070;
        GravaQtdeBlocoC490;

    // grava registro C495 - Resumo Mensal de itens do ECF por estabelecimento
    aConteudo := '|C495';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C500 - NF Energia eletrica, NF Consumo fornecimento GAS
    aConteudo := '|C500';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C510 - Itens dos doc NF Energia e Gas
    aConteudo := '|C510';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C590 - Registro analitico Doc NF Energia e Gas
    aConteudo := '|C590';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C600 - Consolidação diaria NF Energia, gas, agua, etc...
    aConteudo := '|C600';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C601 -  Documentos Cancelados NF Energia, gas, luz, etc...
    aConteudo := '|C601';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C610 - Itens do Doc Consolidado NF Energia, gas, luz, etc...
    aConteudo := '|C610';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C690 - Registro Analitico Doc energia, fas, agua, etc...
    aConteudo := '|C690';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C700 - Consolidação de Doc NF Energia, gas, agua, etc...
    aConteudo := '|C700';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C790 - Registro analitico dos documentos
    aConteudo := '|C790';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C791 - Registro de informações de ST por UF
    aConteudo := '|C791';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    // grava registro C990 - Encerramento do Bloco
    aConteudo := '|C990';
    aConteudo := aConteudo + '|';
    GravaLinhaArquivo(aConteudo);
    aConteudo := '|C990';
    aConteudo := aConteudo + '|'+IntToStr(1+qtde_itens+qtde_registros+
                                          qtde_itens_20+qtde_registros_05+ qtde_registros_100+qtde_registros_140+
                                          qtde_registros_141+qtde_registros_170+qtde_registros_190+qtde_registros_400+
                                          qtde_registros_490+qtde_registros_001+qtde_registros_350+qtde_registros_370+
                                          qtde_registros_390);
    GravaLinhaArquivo(aConteudo);
  finally
    Q.Free;
  end;
end;

procedure TFrmVendas_Periodo.GeraBlocoD;
var aConteudo: Ansistring;
begin
  aConteudo := '|D001';
  aConteudo := aConteudo + '|'+'1';
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|D990';
  aConteudo := aConteudo + '|'+'2';
  GravaLinhaArquivo(aConteudo);
end;

procedure TFrmVendas_Periodo.GeraBlocoE(pArquivo: String; pDatai,
  pDataf: TDateTime);
var aConteudo, mes: Ansistring;
begin
  mes:= FormatDateTime('mmyyyy', StrToDateTime(MEdtData_Final.Text));
  aConteudo := '|E001';
  aConteudo := aConteudo + '|'+'0';
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|E100';
  aConteudo := aConteudo + '|'+ FormatDateTime('DDMMYYY', pDatai);
  aConteudo := aConteudo + '|'+ FormatDateTime('DDMMYYY', pDataf);
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|E110';
  aConteudo := aConteudo + '|'+ FormatFloat('0.00', valor_icms);
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ FormatFloat('0.00', valor_icms);
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ FormatFloat('0.00', valor_icms);
  aConteudo := aConteudo + '|'+ '0,00';
  aConteudo := aConteudo + '|'+ '0,00';
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|E116';
  aConteudo := aConteudo + '|'+ '000';
  aConteudo := aConteudo + '|'+ FormatFloat('0.00', valor_icms);
  aConteudo := aConteudo + '|'+ FormatDateTime('ddmmyyyy', StrToDateTime(MEdtData_Final.Text));
  aConteudo := aConteudo + '|'+ '247-1';
  aConteudo := aConteudo + '|'+ '';
  aConteudo := aConteudo + '|'+ '';
  aConteudo := aConteudo + '|'+ '';
  aConteudo := aConteudo + '|'+ '';
  aConteudo := aConteudo + '|'+ mes;
  GravaLinhaArquivo(aConteudo);

  // grava registro E990 - Encerramento do Bloco E
  aConteudo := '|E990';
  aConteudo := aConteudo + '|'+'5';
  GravaLinhaArquivo(aConteudo);

end;

procedure TFrmVendas_Periodo.GeraBlocoG;
var aConteudo: Ansistring;
begin
  aConteudo := '|G001';
  aConteudo := aConteudo + '|'+'1';
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|G990';
  aConteudo := aConteudo + '|'+'2';
  GravaLinhaArquivo(aConteudo);
end;

procedure TFrmVendas_Periodo.GeraBlocoH(pArquivo:String;pDatai,pDataf:TDateTime);
var aConteudo, aux : String;
    aDataFec : TDateTime;
    Ano,Mes,Dia : Word;
    aValorInvent : Double;
    Q : TADOQuery;
begin
  sLBloco := 1;
  Q := TADOQuery.Create(nil);
  try
    Q.Connection := dm.ADOConnection1;
    // define periodo e data
    DecodeDate(pDatai,Ano,Mes,Dia);
    {Dec(mes);
    if mes < 1 then
    begin
      Dec(ano);
      mes := 12;
    end;}
    aDataFec := EncodeDate(ano,mes,01);
    aDataFec := UltimoDia(aDataFec);
    // grava registro H001 - Abertura do Bloco
    aConteudo := '|H001';
    aConteudo := aConteudo + '|'+'0';
    GravaLinhaArquivo(aConteudo);
    // grava registro H005 - Totais do Inventário
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('select FE.Codigo_Produto, FE.Quantidade,');
    Q.SQL.Add('FE.Valor_Compra, FE.Sub_Total from Fechamento_Estoque FE');
    Q.SQL.Add('where FE.Mes = :pMes');
    Q.SQL.Add('and FE.Ano = :pAno');
    Q.SQL.Add('and FE.Codigo_Empresa = :pIDEmp');
    Q.Parameters.ParamByName('pMes').Value    := ZeroEsquerda(IntToStr(Mes),2);
    Q.Parameters.ParamByName('pAno').Value    := IntToStr(Ano);
    Q.Parameters.ParamByName('pIDEmp').Value := UDeclaracao.codigo_empresa;
    Q.Open;
    aValorInvent := 0;
    while not Q.Eof do
    begin
      //aValorInvent := aValorInvent + (Q.FieldByName('Quantidade').AsFloat * Q.FieldByName('Valor_Compra').AsFloat);
      if (Q.FieldByName('Sub_Total').AsFloat > 0) then
        aValorInvent := aValorInvent + Q.FieldByName('Sub_Total').AsFloat;
      Q.Next;
    end;
    // grava Registro
    aConteudo := '|H005';
    aConteudo := aConteudo + '|'+ FormatDateTime('DDMMYYY',aDataFec);
    aConteudo := aConteudo + '|'+ FormatFloat('0.00',aValorInvent);
    GravaLinhaArquivo(aConteudo);
    // grava registro H010 - Inventário
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('select FE.Mes, FE.Ano, FE.Codigo_Produto, Pro.Codigo_Venda,');
    Q.SQL.Add('FE.Quantidade, UM.Sigla as Unidade, FE.Valor_Compra from Fechamento_Estoque FE');
    Q.SQL.Add('left join Produto Pro on (FE.Codigo_Produto = Pro.Codigo)');
    Q.SQL.Add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    Q.SQL.Add('where Fe.Mes = :pMes');
    Q.SQL.Add('and FE.Ano = :pAno');
    Q.SQL.Add('and FE.Codigo_Empresa = :pIDEmp');
    Q.Parameters.ParamByName('pMes').Value    := ZeroEsquerda(IntToStr(Mes),2);
    Q.Parameters.ParamByName('pAno').Value    := IntToStr(ano);
    Q.Parameters.ParamByName('pIDEmp').Value := UDeclaracao.codigo_empresa;
    Q.Open;
    while not Q.Eof do
    begin
      if (Q.FieldByName('Quantidade').AsFloat*Q.FieldByName('Valor_Compra').AsFloat) > 0 then
      begin
        aConteudo := '|H010';
        aConteudo := aConteudo + '|'+ Q.FieldByName('Codigo_Venda').AsString;
        aConteudo := aConteudo + '|'+ Trim(Q.FieldByName('Unidade').AsString);
        aConteudo := aConteudo + '|'+ FormatFloat('0.000',Q.FieldByName('Quantidade').AsFloat);
        aConteudo := aConteudo + '|'+ FormatFloat('0.000000',Q.FieldByName('Valor_Compra').AsFloat);
        aConteudo := aConteudo + '|'+ FormatFloat('0.00',Q.FieldByName('Quantidade').AsFloat*Q.FieldByName('Valor_Compra').AsFloat);
        aConteudo := aConteudo + '|'+ '0';
        aConteudo := aConteudo + '|'+ '';
        aConteudo := aConteudo + '|'+ '';
        aConteudo := aConteudo + '|'+ '00000';
        GravaLinhaArquivo(aConteudo);
        Q.Next;
      end
      else
        Q.Next;
    end;
    // grava registro H990 - Encerramento do Bloco H
    aConteudo := '|H990';
    aConteudo := aConteudo + '|'+IntToStr(sLBloco);
    GravaLinhaArquivo(aConteudo);
  finally
    Q.Free;
  end;
end;

procedure TFrmVendas_Periodo.GeraRegistro10(pDatai, pdataf: TDatetime;
  pEstrutura, pNatureza, pFinalidade: String);
begin
  telefone:= StringReplace(telefone, '-', '', [rfReplaceAll]);
  telefone:= StringReplace(telefone, '(', '', [rfReplaceAll]);
  telefone:= StringReplace(telefone, ')', '', [rfReplaceAll]);
  with ACBrSintegra do
  begin
    Registro10.CNPJ := cnpj;
    Registro10.Inscricao := insc_estadual;
    Registro10.RazaoSocial := razao_social;
    Registro10.Cidade := cidade;
    Registro10.Estado := uf;
    Registro10.Telefone := telefone;
    Registro10.DataInicial := pDatai;
    Registro10.DataFinal := pdataf;
    Registro10.CodigoConvenio := pEstrutura;
    Registro10.NaturezaInformacoes := pNatureza;
    Registro10.FinalidadeArquivo := pFinalidade;
  end;
end;

procedure TFrmVendas_Periodo.GeraRegistro11;
begin
  cep:= StringReplace(cep, '-', '', [rfReplaceAll]);
  telefone_contato:= StringReplace(telefone_contato, '(', '', [rfReplaceAll]);
  telefone_contato:= StringReplace(telefone_contato, ')', '', [rfReplaceAll]);
  telefone_contato:= StringReplace(telefone_contato, '-', '', [rfReplaceAll]);

  with ACBrSintegra do
  begin
    Registro11.Endereco:= endereco;
    Registro11.Numero:= numero;
    Registro11.Bairro:= setor;
    Registro11.Cep:=cep;
    Registro11.Responsavel:= contato;
    Registro11.Telefone:=telefone_contato;
  end;
end;

procedure TFrmVendas_Periodo.GeraRegistro60M;
var
  wregistro60M: TRegistro60M;
begin

  {atotal := 0;
  Q := TADOQuery.Create(nil);
  qAux := TADOQuery.Create(nil);
  q60m := TADOQuery.Create(nil);

  with q60m, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select * from R02 where Data_Movimento between :DI and :DF');
    Parameters.ParamByName('DI').Value:= pDatai;
    Parameters.ParamByName('DF').Value:= pDataf;
    open;
  end;
  //Q.SQLConnection := ConexaoDados;
  //
  q60m.First;
  while not q60m.Eof do
  begin
    d1:= Copy(q60m.FieldByname('Data_Emissao').AsString, 1, 2);
    d2:= Copy(q60m.FieldByname('Data_Emissao').AsString, 3, 2);
    d3:= Copy(q60m.FieldByname('Data_Emissao').AsString, 5, 2);
    da:= d1 + '/' + d2 + '/' + d3;
    //data:= FormatDateTime('DD/MM/YYYY', StrToDateTime(da));
    data:= q60m.FieldByName('Data_Movimento').AsString;

    if (q60m.FieldByName('Venda_Bruta_Diaria').AsString = '0') then//or (StrToDateTime(data) = date) then
    begin
      q60m.Next;
    end
    else
    begin
      Linha := '60M';
      Linha := Linha + FormatDateTime('YYYYMMDD',StrToDateTime(data));
      //Linha := Linha + FormatDateTime('YYYYMMDD',StrToDateTime(da));
      Linha := Linha + AlinhaTXT(q60m.FieldByName('N_Fabricacao').AsString,1,20);
      caixa:= Copy(q60m.FieldByName('Caixa').AsString, 2,3);
      Linha := Linha + AlinhaTXT(caixa,1,3);
      Linha := Linha + '2D';
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('COO_Inicial').AsInteger),6);
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('COO_Final').AsInteger),6);
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('CRZ').AsInteger),6);
      Linha := Linha + ZeroEsquerda(IntToStr(q60m.FieldByName('CRO').AsInteger),3);

      venda_bruta:= Remove_Virgula(q60m.FieldByName('Venda_Bruta_Diaria').AsString);
      //venda_bruta:= Copy(q60m.FieldByName('Venda_Bruta_Diaria').AsString, 3,16);
      //aux := FormatFloat('0.00',StrToFloat(venda_bruta));
      //aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(venda_bruta,16);

      grande_total:= Remove_Virgula(q60m.FieldByName('Grande_Total').AsString);
      //grande_total:= copy(q60m.FieldByName('Grande_Total').AsString, 3,16);
      //aux := FormatFloat('0.00',StrToFloat(grande_total));
      //aux := FiltraNumero(aux);
      Linha := Linha + ZeroEsquerda(grande_total,16);

      Linha := Linha + AlinhaTXT('',1,37);
      writeLn(sArquivo,Linha);
      Inc(atotal);

      // processa registro 60a
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select * from R03 where Data_Movimento = :DI');
        Parameters.ParamByName('DI').Value:= data;
        open;
      end;

      qAux.First;
      while not qAux.Eof do
      begin
        Linha := '60A';
        Linha := Linha + FormatDateTime('YYYYMMDD',qAux.FieldByname('Data_Movimento').AsDateTime);
        Linha := Linha + AlinhaTXT(qAux.FieldByName('N_Fabricacao').AsString,1,20);

        tot_par:= copy(qAux.FieldByName('Totalizador_Parcial').AsString, 1,1);
        vai:= false;

        if (tot_par = 'T') then
        begin
          tot_par:= copy(qAux.FieldByName('Totalizador_Parcial').AsString, 4,4);
          Linha := Linha + AlinhaTXT(tot_par,1,4);
          vai:= true;
        end
        else
        begin
          tot_par:= copy(qAux.FieldByName('Totalizador_Parcial').AsString, 1,5);
          if (tot_par = 'I1') then
          begin
            tot_par:= 'I';
            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'N1') then
          begin
            tot_par:= 'N';
            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'F1') then
          begin
            tot_par:= 'F';
            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'DT') then
          begin
            tot_par:= 'DESC';

            valor_acu_aux:= qAux.FieldByName('Valor_Acumulado').AsString;
            //valor_acu_aux:= Copy(qAux.FieldByName('Valor_Acumulado').AsString,3,12);
            //valor_acu_aux:= FormatFloat('#0.0,0', StrToFloat(valor_acu_aux));
            //valor_acu_aux:= FiltraNumero(valor_acu_aux);

            qAux.Next;

            valor_acu:= qAux.FieldByName('Valor_Acumulado').AsString;
            //valor_acu:= Copy(qAux.FieldByName('Valor_Acumulado').AsString,3,12);
            //valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
            //valor_acu:= FiltraNumero(valor_acu);

            if (valor_acu_aux <> '0') or (valor_acu <> '0') then
            begin
              valor_acu:= FloatToStr(StrToFloat(valor_acu) + StrToFloat(valor_acu_aux));
              //valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
              //valor_acu:= FiltraNumero(valor_acu);
              valor_acu:= StringOfChar('0', 12-Length(valor_acu)) + valor_acu;
            end;

            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end
          else if (tot_par = 'Can-T') then
          begin
            tot_par:= 'CANC';

            valor_acu_aux:= qAux.FieldByName('Valor_Acumulado').AsString;
            //valor_acu_aux:= FormatFloat('#0.0,0', StrToFloat(valor_acu_aux));
            //valor_acu_aux:= FiltraNumero(valor_acu_aux);

            qAux.Next;

            valor_acu:= qAux.FieldByName('Valor_Acumulado').AsString;
            //valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
            //valor_acu:= FiltraNumero(valor_acu);

            if (valor_acu_aux <> '0') or (valor_acu <> '0') then
            begin
              valor_acu:= FloatToStr(StrToFloat(valor_acu) + StrToFloat(valor_acu_aux));
              //valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
              //valor_acu:= FiltraNumero(valor_acu);
              valor_acu:= StringOfChar('0', 12-Length(valor_acu)) + valor_acu;
            end;

            Linha := Linha + AlinhaTXT(tot_par,1,4);
            vai:= true;
          end;
        end;

        if (tot_par <> 'DESC') and (tot_par <> 'CANC') then
        begin
          valor_acu:= qAux.FieldByName('Valor_Acumulado').AsString;
          //valor_acu:= FormatFloat('#0.0,0', StrToFloat(valor_acu));
          //valor_acu:= FiltraNumero(valor_acu);
        end;

        //aux := FormatFloat('0.00',StrToFloat(valor_acu));
        //aux := FiltraNumero(aux);

        valor_acu:= StringOfChar('0', 12-Length(valor_acu)) + valor_acu;
        if (valor_acu = '0') then
          vai:= false;

        Linha := Linha + ZeroEsquerda(Remove_Virgula(valor_acu),12);
        Linha := Linha + AlinhaTXT('',1,79);

        if (vai) then
        begin
          writeLn(sArquivo,Linha);
          Inc(atotal);
          qAux.Next;
        end
        else
          qAux.Next;
      end;

  q60m.First;
  while not q60m.Eof do
  begin
    if (q60m.FieldByName('Venda_Bruta_Diaria').AsString = '0') then//or (StrToDateTime(data) = date) then
    begin
      q60m.Next;
    end
    else
    begin
      wregistro60M:=TRegistro60M.Create;
      wregistro60M.Emissao:=ACBrSintegra.Registro10.DataInicial;
      wregistro60M.NumSerie:= q60m.FieldByName('N_Fabricacao').AsString;
      wregistro60M.NumOrdem:= caixa;
      wregistro60M.ModeloDoc:='2D';
      wregistro60M.CooInicial:=q60m.FieldByName('COO_Inicial').AsInteger;
      wregistro60M.CooFinal:=q60m.FieldByName('COO_Final').AsInteger;
      wregistro60M.CRZ:=q60m.FieldByName('CRZ').AsInteger;
      wregistro60M.CRO:=q60m.FieldByName('CRO').AsInteger;
      wregistro60M.VendaBruta:=q60m.FieldByName('Venda_Bruta_Diaria').AsString;
      wregistro60M.ValorGT:=q60m.FieldByName('Grande_Total').AsString;
      ACBrSintegra.Registros60M.Add(wregistro60M);
    end;
  end;}
end;

procedure TFrmVendas_Periodo.ConsultaDadosContador;
begin
  try
    try
      qryDadosContador := TADOQuery.create(nil);
      with qryDadosContador, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT CO.*, S.Descricao as Setor, C.Descricao as Cidade, C.UF, C.Codigo_Municipio from Contabilista CO');
        Add('left join Setor S on (CO.Codigo_Setor = S.Codigo)');
        Add('left join Cidade C on (CO.Codigo_Cidade = C.Codigo)');
        open;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaProdutosInventario;
begin
  try
    try
      qryProdutoInventario := TADOQuery.create(nil);
      with qryProdutoInventario, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select P.Codigo, P.Codigo_Venda, P.Descricao, UM.Sigla as Unidade,');
        Add('P.Estoque, P.Valor_Compra, (P.Valor_Compra * P.Estoque) as ValorItem,');
        Add('(select SUM(P.Valor_Compra * P.Estoque) from Produto P');
        add('where P.Estoque > 0) as TotalInventario');
        Add('from Produto P');
        Add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
        Add('where P.Estoque > 0');
        open;
        First;

      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.Consulta0150;
begin
  try
    try
      qry0150 := TADOQuery.create(nil);
      with qry0150, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT C.Codigo as Codigo_Cliente, C.Razao_Social, C.CNPJ, C.CPF, C.Insc_Estadual, Pa.Codigo_Pais,');
        Add('Cid.Codigo_Municipio, C.Endereco, C.Numero, C.Complemento, S.Descricao as Setor');
        Add('from Pedido P');
        Add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
        Add('left join Cidade Cid on (C.Codigo_Cidade = Cid.Codigo)');
        Add('left join Pais Pa on (Cid.Codigo_Pais = Pa.Codigo)');
        Add('left join Setor S on (C.Codigo_Setor = S.Codigo)');

        Add('WHERE P.Data_Venda between :DI and :DF and P.Tipo = ' + QuotedStr('NFE') + '');
        Add('and P.Status = ' + QuotedStr('PAGO') + '');
        Add('group by C.Codigo, C.Razao_Social, C.CNPJ, C.CPF, C.Insc_Estadual, Pa.Codigo_Pais,');
        Add('Cid.Codigo_Municipio, C.Endereco, C.Numero, C.Complemento, S.Descricao');
        Parameters.ParamByName('DI').Value := StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value := StrToDate(MEdtData_Final.Text);;

        open;
        First;

      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.Consulta0190;
begin

  try
    try
      qry0190 := TADOQuery.create(nil);
      with qry0190, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select UM.Sigla as UN');
        Add('from Produto P');
        Add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
        Add('where P.Estoque > 0');
        Add('group by UM.Sigla');
        open;
        First;
        {Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT IP.UN');
        Add('from Itens_Pedido IP');
        Add('inner join Pedido P on (IP.Codigo = P.Codigo)');
        Add('WHERE P.Data_Venda between :DI and :DF and P.Tipo = ' + QuotedStr('NFE') + '');
        Add('and P.Status = ' + QuotedStr('PAGO') + '');
        Add('group by IP.UN');
        Parameters.ParamByName('DI').Value := StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value := StrToDate(MEdtData_Final.Text);;
        //Add('SELECT Un.Codigo, Un.Sigla, Un.Descricao FROM Unidade_Medida Un');
        open;
        First;}
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.Consulta0190H;
begin

  try
    try
      qry0190 := TADOQuery.create(nil);
      with qry0190, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT IP.UN');
        Add('from Itens_Pedido IP');
        Add('inner join Pedido P on (IP.Codigo = P.Codigo)');
        Add('WHERE P.Data_Venda between :DI and :DF and P.Tipo = ' + QuotedStr('NFE') + '');
        Add('and P.Status = ' + QuotedStr('PAGO') + '');
        Add('group by IP.UN');
        Parameters.ParamByName('DI').Value := StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value := StrToDate(MEdtData_Final.Text);;
        //Add('SELECT Un.Codigo, Un.Sigla, Un.Descricao FROM Unidade_Medida Un');
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.Consulta0200;
begin

  try
    try
      qry0200 := TADOQuery.create(nil);
      with qry0200, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select P.Codigo, P.Codigo_Venda, P.Descricao, UM.Sigla as Unidade,');
        Add('P.NCM from Produto P');
        Add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
        Add('where P.Estoque > 0');
        Add('union');
        Add('select IP.Codigo_Produto as Codigo, IP.Codigo_Venda, IP.Descricao, IP.UN as Unidade, IP.NCM');
        Add('from Itens_Pedido IP');
        Add('inner join Pedido P on (IP.Codigo = P.Codigo)');
        Add('where P.Data_Venda between :DI and :DF and P.Status = '+QuotedStr('PAGO')+' ');
        Add('and (P.Tipo = '+QuotedStr('PDV')+' or P.Tipo = '+QuotedStr('DAV')+')');
        Add('order by Descricao');
        Parameters.ParamByName('DI').Value:= StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDate(MEdtData_Final.Text);
        open;
        First;
        {Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select P.Codigo, P.Codigo_Venda, P.Descricao, UM.Sigla as Unidade,');
        Add('P.NCM from Produto P');
        Add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
        add('where P.Estoque > 0');
        open;
        First;}
        {Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT IP.Codigo_Produto, IP.Codigo_Venda, IP.Descricao, IP.NCM, IP.UN,');
        Add('IP.ICMS');
        Add('from Itens_Pedido IP');
        Add('inner join Pedido P on (IP.Codigo = P.Codigo)');
        Add('WHERE P.Data_Venda between :DI and :DF and P.Tipo = ' + QuotedStr('NFE') + '');
        Add('and P.Status = ' + QuotedStr('PAGO') + '');
        Add('group by IP.Codigo_Produto, IP.Codigo_Venda, IP.Descricao, IP.NCM, IP.UN,');
        Add('IP.ICMS');
        Parameters.ParamByName('DI').Value:= StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDate(MEdtData_Final.Text);
        open;
        First;}
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC100;
begin
  try
    try
      qryC100 := TADOQuery.create(nil);
      with qryC100, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT P.Codigo, P.Codigo_Cliente, P.N_Nota_Fiscal, P.Chave_NFe, P.Data_Venda,');
        Add('P.Data_Emissao_NFe, P.Total_Pedido, CP.Tipo_Pagamento, P.Desc_Acr, P.Total_Produtos,');
        Add('TNF.Tipo_Frete,');
        Add('SUM(cast(Replace(IP.Valor_ICMS, '+QuotedStr(',')+', '+QuotedStr('.')+') as float)) as Valor_ICMS,');
        Add('SUM(cast(Replace(IP.BC, '+QuotedStr(',')+', '+QuotedStr('.')+') as float)) as BC_ICMS,');
        Add('SUM(cast(Replace(IP.BC_ST, '+QuotedStr(',')+', '+QuotedStr('.')+') as float)) as BC_ST,');
        Add('SUM(cast(Replace(IP.Valor_ICMS_ST, '+QuotedStr(',')+', '+QuotedStr('.')+') as float)) as Valor_ICMS_ST');
        Add('from Pedido P');
        Add('inner join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('inner join Condicao_Pagamento CP on (P.Codigo_Forma_Pag = CP.Codigo)');
        Add('left join Transporte_NF TNF on (P.Codigo = TNF.Codigo_Pedido)');
        Add('WHERE P.Data_Venda between :DI and :DF and P.Tipo = '+QuotedStr('NFE')+'');
        Add('and P.Status = '+QuotedStr('PAGO')+'');
        Add('group by P.Codigo, P.Codigo_Cliente, P.N_Nota_Fiscal, P.Chave_NFe, P.Data_Venda,');
        Add('P.Data_Emissao_NFe, P.Total_Pedido, CP.Tipo_Pagamento, P.Desc_Acr, P.Total_Produtos,');
        Add('TNF.Tipo_Frete');
        Parameters.ParamByName('DI').Value := StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value := StrToDate(MEdtData_Final.Text);;
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC170;
begin
  try
    try
      qryc170 := TADOQuery.create(nil);
      with qryc170, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT ');
        Add('IP.Codigo,');
        Add('IP.Codigo_Registro as COD_ITEM, ');
        Add('IP.Codigo_Produto, ');
        Add('IP.N_Item as N_Item, ');
        Add('IP.Descricao as DESCR_COMPL, ');
        Add('IP.Qtde as QTD, ');
        Add('IP.UN as UNID, ');
        Add('IP.Sub_Total as VL_ITEM, ');
        Add('IP.Desc_Acr as VL_DESC, ');
        Add('IP.CST as CST_ICMS, ');
        Add('IP.CFOP, ');
        Add('IP.BC as VL_BC_ICMS, ');
        Add('IP.ICMS as ALIQ_ICMS, ');
        Add('IP.Valor_ICMS as VL_ICMS, ');
        Add('IP.BC_ST as BC_ST, ');
        Add('IP.Valor_ICMS_ST as Valor_ICMS_ST, ');
        Add('IP.CST_IPI as CST_IPI, ');
        Add('IP.BC_IPI as VL_BC_IPI, ');
        Add('IP.Valor_IPI as VL_IPI, ');
        Add('IP.CST_PIS, ');
        Add('IP.BC_PIS as VL_BC_PIS, ');
        Add('IP.Valor_PIS as VL_PIS, ');
        Add('IP.BC_COFINS as VL_BC_COFINS, ');
        Add('IP.CST_COFINS, ');
        Add('IP.Valor_COFINS as VL_COFINS ');

        Add('FROM ');
        Add('Itens_Pedido IP ');
        //Add('inner JOIN Pedido P on(P.Codigo = IP.Codigo)');
        Add('where IP.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qryC100.FieldByName('Codigo').AsInteger;
        //Parameters.ParamByName('DF').Value:= StrToDate(MEdtData_Final.Text);
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC190;
begin
  try
    try
      qryc190 := TADOQuery.create(nil);
      with qryc190, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select IP.CST, IP.CFOP, IP.ICMS, SUM(IP.Sub_Total) as ValorTotal,');
        Add('sum(cast(REPLACE(IP.BC,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as BC_ICMS,');
        Add('sum(cast(REPLACE(IP.Valor_ICMS,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_ICMS,');
        Add('sum(cast(REPLACE(IP.BC_ST,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as BC_ST,');
        Add('sum(cast(REPLACE(IP.Valor_ICMS_ST,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_ICMS_ST,');
        Add('sum(IP.Sub_Total - cast(REPLACE(IP.BC,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_Nao_Tributado,');
        Add('sum(cast(REPLACE(IP.Valor_IPI,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_IPI');
        Add('from Itens_Pedido IP');
        //Add('left join Pedido P on (IP.Codigo = P.Codigo)');
        Add('WHERE IP.Codigo = :Codigo');
        //Add('and status = ' + QuotedStr('PAGO') + '');
        Add('group by IP.CST, IP.CFOP, IP.ICMS');
        //Parameters.ParamByName('DI').Value := StrToDate(MEdtData_Inicial.Text);
        //Parameters.ParamByName('DF').Value := StrToDate(MEdtData_Final.Text);;
        Parameters.ParamByName('Codigo').Value := qryC100.FieldByName('Codigo').AsInteger;
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC400;
begin
  try
    try
      qryc400 := TADOQuery.create(nil);
      with qryc400, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select * from Configuracao_ECF');
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC405;
begin
  try
    try
      qryc405 := TADOQuery.create(nil);
      with qryc405, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select * from R02 where Data_Movimento between :DI and :DF and N_Fabricacao = :N_Fabricacao');
        Parameters.ParamByName('DI').Value:= StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDate(MEdtData_Final.Text);
        Parameters.ParamByName('N_Fabricacao').Value:= qryC400.FieldByName('N_Fabricacao').AsString;
        open;
        First;
        //ShowMessage(IntToStr(qryc405.RecordCount));
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC420;
begin
  try
    try
      qryc420 := TADOQuery.create(nil);
      with qryc420, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select * from R03 where Data_Movimento = :D');
        Parameters.ParamByName('D').Value:= StrToDate( Retorna_Data_Formatada(qryc405.FieldByName('Data_Movimento').AsString, 'DD/MM/YYYY'));
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC460;
begin
  try
    try
      qryc460 := TADOQuery.create(nil);
      with qryc460, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select P.Codigo, P.COO, P.Data_Venda, P.Total_Pedido, C.CPF, C.CNPJ, C.Razao_Social');
        Add('from Pedido P');
        Add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
        Add('where P.Data_Venda between :DI and :DF and P.Status = '+QuotedStr('PAGO')+' ');
        Add('and (P.Tipo = '+QuotedStr('PDV')+' or P.Tipo = '+QuotedStr('DAV')+')');
        Parameters.ParamByName('DI').Value:= StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDate(MEdtData_Final.Text);
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC470;
begin
  try
    try
      qryc470 := TADOQuery.create(nil);
      with qryc470, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select IP.Codigo, IP.Codigo_Produto, IP.Qtde, IP.UN, IP.Sub_Total,');
        Add('IP.CST, IP.CFOP, IP.ICMS');
        Add('from Itens_Pedido IP');
        Add('where IP.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qryc460.FieldByName('Codigo').AsInteger;
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.ConsultaC490;
begin
  try
    try
      qryc490 := TADOQuery.create(nil);
      with qryc490, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select IP.CST, IP.CFOP, IP.ICMS, SUM(IP.Sub_Total) as ValorTotal,');
        Add('sum(cast(REPLACE(IP.BC,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as BC_ICMS,');
        Add('sum(cast(REPLACE(IP.Valor_ICMS,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_ICMS');
        Add('from Itens_Pedido IP');
        Add('inner join Pedido P on (IP.Codigo = P.Codigo)');
        Add('where P.Data_Venda between :DI and :DF and P.Status = '+QuotedStr('PAGO')+' ');
        Add('and (P.Tipo = '+QuotedStr('PDV')+' or P.Tipo = '+QuotedStr('DAV')+')');
        Add('group by IP.CST, IP.CFOP, IP.ICMS');
        Parameters.ParamByName('DI').Value:= StrToDate(MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDate(MEdtData_Final.Text);
        open;
        First;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' erro ' + E.Message);
    end;
  finally
    // FreeAndNil(qrySped);
  end;
end;

procedure TFrmVendas_Periodo.GeraSped();
var
  Int1, Int2, Notas, i: Integer;
  aTotalICMS: Double;
  conexao: TADOConnection;
  nomeArq, codTot1Carac, codTot4Carac, codTot, EAD, hora, data: AnsiString;
  ListaUnidades:  TList<AnsiString>;
begin
  aTotalICMS := 0;
  ACBrSPEDFiscal1.DT_INI:= StrToDate(MEdtData_Inicial.Text);
  ACBrSPEDFiscal1.DT_FIN:= StrToDate(MEdtData_Final.Text);
  //nomeArq:= ExtractFilePath(Application.ExeName)+'SPED.txt';
  hora := FormatDateTime('hhmmss',Time);
  data := FormatDateTime('ddmmyyyy',date);
  nomeArq := Local_Arquivo(14) + n_laudo+data+hora+'.txt';
  ACBrSPEDFiscal1.Arquivo:= nomeArq;
  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef('1', 0);
  ACBrSPEDFiscal1.IniciaGeracao;
  if (ListaUnidades = nil) then
    ListaUnidades:= TList<AnsiString>.Create;

  SetLength(EAD, 256);
  {if pBloco = '2' then
  begin
    with ACBrSPEDFiscal1.Bloco_E do
    begin

    end;
  end;}

  //if pBloco = '0' then
  //begin
    with ACBrSPEDFiscal1.Bloco_0 do
    begin
      // informações da Empresa
      with Registro0000New do
      begin
        COD_VER := vlVersao109;
        COD_FIN := raOriginal;
        NOME := AnsiToUtf8(UDeclaracao.nome_fantasia);
        CNPJ := AnsiToUtf8(UDeclaracao.CNPJ);
        CPF := ''; // Deve ser uma informação valida
        UF := AnsiToUtf8(UDeclaracao.UF);
        IE := UDeclaracao.insc_estadual;
        COD_MUN := StrToInt(UDeclaracao.cod_municipio);
        IM := UDeclaracao.insc_municipal;
        SUFRAMA := UDeclaracao.SUFRAMA;
        IND_PERFIL := pfPerfilA;
        IND_ATIV := atOutros;
      end;
      with Registro0001New do
      begin
        IND_MOV := imComDados;
        // informações complementares da Empresa
        with Registro0005New do
        begin
          FANTASIA := AnsiToUtf8(UDeclaracao.nome_fantasia);
          CEP := UDeclaracao.CEP;
          ENDERECO := UDeclaracao.ENDERECO;
          NUM := UDeclaracao.numero;
          COMPL := UDeclaracao.complemento;
          BAIRRO := UDeclaracao.setor;
          FONE := UDeclaracao.telefone;
          FONE := stringReplace(FONE, '(', '', []);
          FONE := stringReplace(FONE, ')', '', []);
          FONE := stringReplace(FONE, '-', '', []);
          FAX := '';
          EMAIL := UDeclaracao.EMAIL;
        end;
        // informações da contabilidade.
        ConsultaDadosContador;
        with Registro0100New do
        begin
          NOME := qryDadosContador.FieldByName('Nome_Contador').AsString;
          CPF := qryDadosContador.FieldByName('CPF').AsString;
          CRC := qryDadosContador.FieldByName('CRC').AsString;
          CNPJ := qryDadosContador.FieldByName('CNPJ').AsString;
          CEP := qryDadosContador.FieldByName('CEP').AsString;
          ENDERECO := qryDadosContador.FieldByName('Endereco').AsString;
          NUM := qryDadosContador.FieldByName('Numero').AsString;
          COMPL := qryDadosContador.FieldByName('Complemento').AsString;
          BAIRRO := qryDadosContador.FieldByName('Setor').AsString;
          FONE := qryDadosContador.FieldByName('Telefone').AsString;
          FAX := qryDadosContador.FieldByName('Telefone').AsString;
          EMAIL := qryDadosContador.FieldByName('Email').AsString;
          COD_MUN := qryDadosContador.FieldByName('Codigo_Municipio').AsInteger;
        end;
        // Clientes
        Consulta0150;
        while not qry0150.Eof do
        begin
          with Registro0150New do
          begin
            COD_PART := qry0150.fieldbyname('Codigo_Cliente').asstring;
            NOME := qry0150.fieldbyname('Razao_Social').asstring;
            COD_PAIS := qry0150.fieldbyname('Codigo_Pais').asstring;
            CNPJ := qry0150.fieldbyname('CNPJ').asstring;
            CPF := qry0150.fieldbyname('CPF').asstring;
            IE := qry0150.fieldbyname('Insc_Estadual').asstring;
            COD_MUN := qry0150.fieldbyname('Codigo_Municipio').AsInteger;
            SUFRAMA := '';
            ENDERECO := qry0150.fieldbyname('Endereco').asstring;
            NUM := qry0150.fieldbyname('Numero').asstring;
            COMPL := qry0150.fieldbyname('Complemento').asstring;
            BAIRRO := qry0150.fieldbyname('Setor').asstring;
          end;
          qry0150.Next;
        end;

        Consulta0190;
        while not qry0190.Eof do
        begin
          {with Registro0190New do
          begin
            UNID := qry0190.fieldbyname('UN').asstring;
            //DESCR := qry0190.fieldbyname('UN').asstring;
          end;}
          Analisa_Lista_Unidade(ListaUnidades, qry0190.fieldbyname('UN').AsString);
          //ListaUnidades.Add(qry0190.fieldbyname('UN').AsString);
          qry0190.Next;
        end;
        //

        Consulta0200;
        while not qry0200.Eof do
        begin
          with Registro0200New do
          begin
            COD_ITEM := qry0200.fieldbyname('Codigo').asstring;
            DESCR_ITEM := qry0200.fieldbyname('Descricao').asstring;
            COD_BARRA := qry0200.fieldbyname('Codigo_Venda').asstring;
            COD_ANT_ITEM := '';
            UNID_INV := qry0200.fieldbyname('Unidade').asstring;
            TIPO_ITEM := tiMercadoriaRevenda;//qry0200.fieldbyname('descricao_produto').asstring;
            COD_NCM := qry0200.fieldbyname('NCM').asstring;
            EX_IPI := '';
            COD_GEN := Copy(qry0200.fieldbyname('NCM').asstring, 1,2); //dois primeiros digitos do NCM
            COD_LST := '';
            ALIQ_ICMS := 17;
            {if (qry0200.fieldbyname('ICMS').AsString = 'F') or
               (qry0200.fieldbyname('ICMS').AsString = 'F1') or
               (qry0200.fieldbyname('ICMS').AsString = '') or
               (qry0200.fieldbyname('ICMS').AsString = '0')then
            begin
              ALIQ_ICMS := 0;
            end
            else
            begin
              ALIQ_ICMS := Retorna_Aliquota(qry0200.fieldbyname('ICMS').AsString);
            end;}
          end;
          qry0200.Next;
        end;


        //0460
        FreeAndNil(qry0200);

      end;
    end;
    //ACBrSPEDFiscal1.WriteBloco_0;
  //end
  //else if pBloco = 'C' then
  //begin
    Notas := StrToInt64Def('1', 1);
    with ACBrSPEDFiscal1.Bloco_C do
    begin
      with RegistroC001New do
      begin
        IND_MOV := imComDados;
        //

        ConsultaC100;
        //ShowMessage('Qtde. Registros C100: '+IntToStr(qryc100.RecordCount));
        //ShowMessage(qryC100.FieldByName('Codigo').AsString);
        while not qryC100.Eof do
        begin
          with RegistroC100New do
          begin
            COD_PART := qryC100.fieldbyname('Codigo_Cliente').asstring;
            IND_EMIT := edEmissaoPropria;
            IND_OPER := tpSaidaPrestacao;
            COD_MOD := '55';
            COD_SIT := sdRegular;
            SER := '1';
            NUM_DOC := qryC100.fieldbyname('N_Nota_Fiscal').AsString;
            CHV_NFE := qryC100.fieldbyname('Chave_NFe').asstring;
            DT_DOC := qryC100.fieldbyname('Data_Venda').AsDateTime;
            DT_E_S := qryC100.fieldbyname('Data_Emissao_NFe').asdatetime;
            VL_DOC := qryC100.fieldbyname('Total_Pedido').AsFloat;

            if (qryC100.fieldbyname('Tipo_Pagamento').AsString = 'A VISTA') then
              IND_PGTO := tpVista
            else if (qryC100.fieldbyname('Tipo_Pagamento').AsString = 'A PRAZO') then
              IND_PGTO := tpPrazo
            else
              IND_PGTO := tpOutros;

            VL_DESC := qryC100.fieldbyname('Desc_Acr').asfloat;
            VL_ABAT_NT := 0;
            VL_MERC := qryC100.fieldbyname('Total_Produtos').AsFloat;

            if (qryC100.fieldbyname('Tipo_Frete').AsString = 'EMITENTE') then
              IND_FRT := tfPorContaEmitente
            else if (qryC100.fieldbyname('Tipo_Frete').AsString = 'DEST./REM.') then
              IND_FRT := tfPorContaDestinatario
            else if (qryC100.fieldbyname('Tipo_Frete').AsString = 'TERCEIROS') then
              IND_FRT := tfPorContaTerceiros
            else if (qryC100.fieldbyname('Tipo_Frete').AsString = 'SEM FRETE') then
              IND_FRT := tfSemCobrancaFrete;

            VL_SEG := 0;
            VL_OUT_DA := 0;
            VL_BC_ICMS := qryC100.fieldbyname('BC_ICMS').AsFloat;
            VL_ICMS := qryC100.fieldbyname('Valor_ICMS').AsFloat;
            VL_BC_ICMS_ST := qryC100.fieldbyname('BC_ST').AsFloat;
            VL_ICMS_ST := qryC100.fieldbyname('Valor_ICMS_ST').AsFloat;
            VL_IPI := 0;
            VL_PIS := 0;
            VL_COFINS := 0;
            VL_PIS_ST := 0;
            VL_COFINS_ST := 0;
            // c170

            // c110
            {with RegistroC110New do
            begin
              COD_INF := '001';
              TXT_COMPL :=
                'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL';
            end;}
            //

            { REGISTRO C112: DOCUMENTO DE ARRECADAÇÃO REFERENCIADO.
              Este registro deve ser apresentado, obrigatoriamente,
              quando no campo – “Informações Complementares” da
              nota fiscal - constar a identificação de um documento de arrecadação. }

            // c112

            {with RegistroC112New do
            begin
              COD_DA := daEstadualArrecadacao;
              UF := 'GO';
              NUM_DA := '??? nao saquei nada';
              COD_AUT := '5';
              VL_DA := 0;
              DT_VCTO := StrToDateTime('05-02-2015'); // ver formato de datas
              DT_PGTO := StrToDateTime('05-02-2015');
            end;}

            {ConsultaC170;
            //ShowMessage('Qtde. Registros C170: '+IntToStr(qryc170.RecordCount));
            //ShowMessage(qryC170.FieldByName('Codigo').AsString);
            while not qryc170.Eof do
            begin
              with RegistroC170New do
              // Inicio Adicionar os Itens:
              begin
                NUM_ITEM := qryc170.fieldByname('N_Item').AsString;
                COD_ITEM := qryc170.fieldByname('Codigo_Produto').AsString;
                DESCR_COMPL := qryc170.fieldByname('DESCR_COMPL').AsString;
                QTD := qryc170.fieldByname('QTD').asfloat;
                UNID := qryc170.fieldByname('UNID').AsString;
                VL_ITEM := qryc170.fieldByname('VL_ITEM').asfloat;
                VL_DESC := qryc170.fieldByname('VL_DESC').asfloat;
                IND_MOV := mfSim;        ////////
                CST_ICMS := qryc170.fieldByname('CST_ICMS').AsString;
                CFOP := qryc170.fieldByname('CFOP').AsString;
                COD_NAT := '';

                if (qryc170.fieldByname('ALIQ_ICMS').AsString = 'F') or
                   (qryc170.fieldByname('ALIQ_ICMS').AsString = 'F1') or
                   (qryc170.fieldByname('ALIQ_ICMS').AsString = '0') or
                   (qryc170.fieldByname('ALIQ_ICMS').AsString = '') then
                begin
                  ALIQ_ICMS := 0;
                end
                else
                begin
                  ALIQ_ICMS := Retorna_Aliquota(qryc170.fieldbyname('ALIQ_ICMS').AsString);
                end;

                VL_BC_ICMS := qryc170.fieldByname('VL_BC_ICMS').asfloat;
                VL_ICMS := qryc170.fieldByname('VL_ICMS').asfloat;
                VL_BC_ICMS_ST := qryc170.fieldByname('BC_ST').asfloat;
                ALIQ_ST := 0;
                VL_ICMS_ST := qryc170.fieldByname('Valor_ICMS_ST').asfloat;
                IND_APUR := iaMensal;
                CST_IPI :=  qryc170.fieldByname('CST_IPI').AsString; //ipiEntradaIsenta;
                COD_ENQ := '';
                VL_BC_IPI := qryc170.fieldByname('VL_BC_IPI').asfloat;
                ALIQ_IPI := 0;
                VL_IPI := qryc170.fieldByname('VL_IPI').Asfloat;
                CST_PIS := qryc170.fieldByname('CST_PIS').AsString; //pisOutrasOperacoes;
                VL_BC_PIS := qryc170.fieldByname('VL_BC_PIS').Asfloat;
                ALIQ_PIS_PERC := 0;
                QUANT_BC_PIS := 0;
                ALIQ_PIS_R := 0;
                VL_PIS := qryc170.fieldByname('VL_PIS').Asfloat;
                CST_COFINS := qryc170.fieldByname('CST_COFINS').AsString ; //nsOutrasOperacoes;
                VL_BC_COFINS := qryc170.fieldByname('VL_BC_COFINS').Asfloat;
                ALIQ_COFINS_PERC := 0;
                QUANT_BC_COFINS := 0;
                ALIQ_COFINS_R := 0;
                VL_COFINS := qryc170.fieldByname('VL_COFINS').Asfloat;
                COD_CTA := '000';
              end;
              qryc170.Next;
            end;}


            {ConsultaC176;
            with RegistroC176New do
            begin
              COD_MOD_ULT_E := '55';
              NUM_DOC_ULT_E := qryC100.fieldbyname('NUM_DOC').asstring;
              SER_ULT_E := '1';
              DT_ULT_E := 0;
              COD_PART_ULT_E := qry0150.fieldbyname('Codigo_Cliente').asstring;
              QUANT_ULT_E := 0;
              VL_UNIT_ULT_E := 0;
              VL_UNIT_BC_ST := 0;
            end;}



            //ConsultaC179;
            {with RegistroC179New do
            begin
              BC_ST_ORIG_DEST := 55;
              ICMS_ST_REP := qryC100.fieldbyname('NUM_DOC').asfloat;
              ICMS_ST_COMPL := 1;
              BC_RET := 0;
              ICMS_RET := qry0150.fieldbyname('Codigo_Cliente').asfloat;
            end;}

            ConsultaC190;
            // c190
            with RegistroC190New do
            begin
              CST_ICMS := qryc190.FieldByName('CST').AsString;
              CFOP := qryc190.FieldByName('CFOP').AsString;

              if (qryc190.fieldByname('ICMS').AsString = 'F') or
                 (qryc190.fieldByname('ICMS').AsString = 'F1') or
                 (qryc190.fieldByname('ICMS').AsString = '0') or
                 (qryc190.fieldByname('ICMS').AsString = '') then
              begin
                ALIQ_ICMS := 0;
              end
              else
              begin
                ALIQ_ICMS := Retorna_Aliquota(qryc190.fieldbyname('ICMS').AsString);
              end;

              //ALIQ_ICMS := qryc190.FieldByName('ICMS').AsFloat;
              VL_OPR := qryc190.FieldByName('ValorTotal').AsFloat;
              VL_BC_ICMS := qryc190.FieldByName('BC_ICMS').AsFloat;
              VL_ICMS := qryc190.FieldByName('Valor_ICMS').AsFloat;
              VL_BC_ICMS_ST := qryc190.FieldByName('BC_ST').AsFloat;
              VL_ICMS_ST := qryc190.FieldByName('Valor_ICMS_ST').AsFloat;
              VL_RED_BC := qryc190.FieldByName('Valor_Nao_Tributado').AsFloat;
              VL_IPI := qryc190.FieldByName('Valor_IPI').AsFloat;
              //COD_OBS := '1';
            end;
            aTotalICMS := aTotalICMS + 1;
          end;
          qryC100.Next;
        end;
        {with RegistroC176New do
        begin
          COD_MOD_ULT_E := '55';
          NUM_DOC_ULT_E := '5';
          SER_ULT_E := '02022015';
          DT_ULT_E := 02022015;
          COD_PART_ULT_E := '05';
          QUANT_ULT_E := 15;
          VL_UNIT_ULT_E := 20;
          VL_UNIT_BC_ST := 210;
        end;

        with RegistroC190New do
        begin
          CST_ICMS := '55';
          CFOP := '5';
          ALIQ_ICMS := 20;
          VL_OPR := 20;
          VL_BC_ICMS := 05;
          VL_ICMS := 20;
          VL_BC_ICMS_ST := 20;
          VL_ICMS_ST := 50;
          VL_RED_BC := 0;
          VL_IPI := 0;
          COD_OBS := '0';
        end;}
      end;

      ConsultaC400;
      while not qryC400.Eof do
      begin
        with RegistroC400New do
        begin
          COD_MOD := '2D';
          ECF_MOD := qryC400.FieldByName('Modelo_ECF').AsString;
          ECF_FAB := qryC400.FieldByName('N_Fabricacao').AsString;
          ECF_CX := qryC400.FieldByName('N_Caixa').AsString;
        end;

        ConsultaC405;
        while not qryc405.Eof do
        begin
          if (qryc405.FieldByName('Venda_Bruta_Diaria').AsFloat <> 0) then
          begin
            with RegistroC405New do
            begin
              DT_DOC := StrToDateTime(Retorna_Data_Formatada(qryc405.FieldByName('Data_Movimento').AsString, 'DD/MM/YYYY'));
              CRO := qryc405.FieldByName('CRO').AsInteger;
              CRZ := qryc405.FieldByName('CRZ').AsInteger;
              NUM_COO_FIN := qryc405.FieldByName('COO_Final').AsInteger;
              GT_FIN := qryc405.FieldByName('Grande_Total').AsFloat;
              VL_BRT := qryc405.FieldByName('Venda_Bruta_Diaria').AsFloat;

              ConsultaC420;
              while not qryc420.Eof do
              begin
                with RegistroC420New do
                begin
                  codTot1Carac:= Copy(qryc420.FieldByName('Totalizador_Parcial').AsString, 1,1);

                  if (codTot1Carac = '0') then
                  begin
                    codTot4Carac:= Copy(qryc420.FieldByName('Totalizador_Parcial').AsString, 3,5);
                    codTot:= Copy(qryc420.FieldByName('Totalizador_Parcial').AsString, 1,2);
                  end
                  else
                  begin
                    codTot4Carac:= qryc420.FieldByName('Totalizador_Parcial').AsString;
                    codTot:= '0';
                  end;

                  COD_TOT_PAR := codTot4Carac;
                  VLR_ACUM_TOT := qryc420.FieldByName('Valor_Acumulado').AsFloat;
                  NR_TOT := StrToint(codTot);
                  DESCR_NR_TOT := '';
                end;
                qryc420.Next;
              end;
            end;
          end;
          qryc405.Next;
        end;
        qryC400.Next;
      end;

        ConsultaC460;
        while not qryc460.Eof do
        begin
          with RegistroC460New do
          begin
            COD_MOD := '2D';
            COD_SIT := sdRegular;
            NUM_DOC := qryc460.FieldByName('COO').AsString;
            DT_DOC := qryc460.FieldByName('Data_Venda').AsDateTime;
            VL_DOC := qryc460.FieldByName('Total_Pedido').AsFloat;
            VL_PIS := 0;
            VL_COFINS := 0;

            if (qryc460.FieldByName('CPF').AsString <> '') then
              CPF_CNPJ := qryc460.FieldByName('CPF').AsString
            else
              CPF_CNPJ := qryc460.FieldByName('CNPJ').AsString;

            NOM_ADQ := qryc460.FieldByName('Razao_Social').AsString;

            ConsultaC470;
            while not qryc470.Eof do
            begin

              with RegistroC470New do
              begin
                COD_ITEM := qryc470.FieldByName('Codigo_Produto').AsString;
                QTD := qryc470.FieldByName('Qtde').AsFloat;
                QTD_CANC := 0;
                UNID := qryc470.FieldByName('UN').AsString;
                VL_ITEM := qryc470.FieldByName('Sub_Total').AsFloat;
                CST_ICMS := qryc470.FieldByName('CST').AsString;
                CFOP := qryc470.FieldByName('CFOP').AsString;

                if (qryc470.FieldByName('ICMS').AsString = 'F') or
                   (qryc470.FieldByName('ICMS').AsString = 'F1') or
                   (qryc470.FieldByName('ICMS').AsString = '0') or
                   (qryc470.FieldByName('ICMS').AsString = '') then
                begin
                  ALIQ_ICMS := 0;
                end
                else
                begin
                  ALIQ_ICMS := Retorna_Aliquota(qryc470.FieldByName('ICMS').AsString);
                end;
                VL_PIS := 0;
                VL_COFINS := 0;
              end;

              qryc470.Next;
            end;
          end;
          qryc460.Next;
        end;

        ConsultaC490;
        while not qryc490.Eof do
        begin
          with RegistroC490New do
          begin
            CST_ICMS := qryc490.FieldByName('CST').AsString;
            CFOP := qryc490.FieldByName('CFOP').AsString;

            if (qryc490.FieldByName('ICMS').AsString = 'F') or
               (qryc490.FieldByName('ICMS').AsString = 'F1') or
               (qryc490.FieldByName('ICMS').AsString = '0') or
               (qryc490.FieldByName('ICMS').AsString = '') then
            begin
              ALIQ_ICMS := 0;
            end
            else
            begin
              ALIQ_ICMS := Retorna_Aliquota(qryc490.FieldByName('ICMS').AsString);
            end;

            VL_OPR := qryc490.FieldByName('ValorTotal').AsFloat;
            VL_BC_ICMS := qryc490.FieldByName('BC_ICMS').AsFloat;
            VL_ICMS := qryc490.FieldByName('Valor_ICMS').AsFloat;
            //COD_OBS := ''
          end;

          qryc490.Next;
        end;
    end;

  //end
  //else if pBloco = 'D' then
  //begin
    {with ACBrSPEDFiscal1.Bloco_D do
    begin
      with RegistroD001New do
      begin
        IND_MOV := imSemDados;
      end;
    end;}
  //end
  //else if pBloco = 'E' then
  //begin
    {with ACBrSPEDFiscal1.Bloco_E do
    begin
      with RegistroE001New do
      begin
        IND_MOV := imComDados;
        with RegistroE100New do
        begin
          DT_INI := Datai.DateTime;
          DT_FIN := Dataf.DateTime;
        end;
        with RegistroE110New do
        begin
          VL_TOT_DEBITOS := aTotalICMS;
          VL_AJ_DEBITOS := 0;
          VL_TOT_AJ_DEBITOS := 0;
          VL_ESTORNOS_CRED := 0;
          VL_TOT_CREDITOS := 0;
          VL_AJ_CREDITOS := 0;
          VL_TOT_AJ_CREDITOS := 0;
          VL_ESTORNOS_DEB := 0;
          VL_SLD_CREDOR_ANT := 0;
          VL_SLD_APURADO := aTotalICMS;
          VL_TOT_DED := 0;
          VL_ICMS_RECOLHER := aTotalICMS;
          VL_SLD_CREDOR_TRANSPORTAR := 0;
          DEB_ESP := 0;
        end;
      end;
    end;}
  //end
  //else if pBloco = 'H' then
  //begin
    with ACBrSPEDFiscal1.Bloco_H do
    begin
      with RegistroH001New do
      begin
        IND_MOV := imComDados;
        //
        ConsultaProdutosInventario;
        with RegistroH005New do
        begin
          DT_INV := StrToDate(MEdtData_Final.Text);
          VL_INV := qryProdutoInventario.FieldByName('TotalInventario').AsFloat;
          MOT_INV:= miFinalPeriodo;
          // FILHO
          while not qryProdutoInventario.Eof do
          begin
            if (qryProdutoInventario.FieldByName('Estoque').AsFloat > 0) then
            begin
              with RegistroH010New do
              begin
                COD_ITEM := qryProdutoInventario.FieldByName('Codigo').AsString;
                UNID := qryProdutoInventario.FieldByName('Unidade').AsString;
                QTD := qryProdutoInventario.FieldByName('Estoque').AsFloat;
                VL_UNIT := qryProdutoInventario.FieldByName('Valor_Compra').AsFloat;
                VL_ITEM := qryProdutoInventario.FieldByName('ValorItem').AsFloat;
                IND_PROP := piInformante;
                //ListaUnidades.Add(qryProdutoInventario.fieldbyname('Unidade').AsString);
                Analisa_Lista_Unidade(ListaUnidades, qryProdutoInventario.fieldbyname('Unidade').AsString);
                //COD_PART := '';
                //TXT_COMPL := '';
                COD_CTA := '0';
              end;
            end;
            qryProdutoInventario.Next;
          end;
        end;
      end;
    end;

    for i := 0 to ListaUnidades.Count-1 do
    begin
      with ACBrSPEDFiscal1.Bloco_0.Registro0190New do
      begin
        UNID := ListaUnidades.Items[i];
        DESCR := Retorna_Descricao_Unidade(ListaUnidades.Items[i]);
      end;
      //ListaUnidades.Add(qry0190.fieldbyname('UN').AsString);
      //qry0190.Next;
    end;

    ACBrSPEDFiscal1.WriteBloco_0;
    ACBrSPEDFiscal1.WriteBloco_C(true);
    ACBrSPEDFiscal1.WriteBloco_H;
  //end
  //else if pBloco = '1' then
  //begin
    {with ACBrSPEDFiscal1.Bloco_1 do
    begin
      with Registro1001New do
      begin
        IND_MOV := imSemDados;
      end;

      with Registro1200New do
      begin
        COD_AJ_APUR := '1';
        SLD_CRED := 5;
        CRED_APR := 5;
        CRED_RECEB := 5;
        CRED_UTIL := 5;
        SLD_CRED_FIM := 5;
      end;
      with Registro1210New do
      begin
        TIPO_UTIL := '2';
        NR_DOC := '9';
        VL_CRED_UTIL := 7;
      end;
      with Registro1400New do
      begin
        COD_ITEM := '6';
        MUN := '9';
        VALOR := 5;
      end;
      with Registro1600New do
      begin
        COD_PART := 'GO';
        TOT_CREDITO := 9;
        TOT_DEBITO := 5;
      end;
      with Registro1700New do
      begin
        COD_DISP := cdaFSDA;
        COD_MOD := '9';
        SER := '9';
        SUB := 'GO';
        NUM_DOC_INI := '9';
        NUM_DOC_FIN := '9';
        NUM_AUT := '5';
      end;
      with Registro1710New do
      begin
        NUM_DOC_INI := 'GO';
        NUM_DOC_FIN := '9';
      end;
    end;}
  //end
  //else if pBloco = '9' then
  //begin
    ACBrSPEDFiscal1.WriteBloco_9;
  //end
  generateEAD(nomeArq, cChavePublica, cChavePrivada, EAD, 1);
end;

procedure TFrmVendas_Periodo.GeraBloco9(pArquivo:String;pDatai,pDataf:TDateTime);
var aConteudo, aux : String;
begin
  sLBloco := 1;
  // grava registro 9001 - Abertura do Bloco
  aConteudo := '|9001';
  aConteudo := aConteudo + '|'+'0';
  GravaLinhaArquivo(aConteudo);
  // grava registro 9100 - Registros do arquivo
  ControleLinhaBloco.First;
  ControleLinhaBloco.Next;
  while not ControleLinhaBloco.Eof do
  begin
    aConteudo := '|9900';
    aConteudo := aConteudo + '|' + ControleLinhaBloco.FieldByName('BLOCO').AsString;
    aConteudo := aConteudo + '|' + IntToStr(ControleLinhaBloco.FieldByName('QUANT').AsInteger);
    GravaLinhaArquivo(aConteudo);
    ControleLinhaBloco.Next;
  end;

  {aConteudo := '|9900';
  aConteudo := aConteudo + '|' + ControleLinhaBloco.FieldByName('BLOCO').AsString;
  aConteudo := aConteudo + '|' + IntToStr(ControleLinhaBloco.FieldByName('QUANT').AsInteger);
  GravaLinhaArquivo(aConteudo);}

  aConteudo := '|9900';
  aConteudo := aConteudo + '|' + '9001';
  aConteudo := aConteudo + '|' + IntToStr(1);
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|9900';
  aConteudo := aConteudo + '|' + '9900';
  aConteudo := aConteudo + '|' + IntToStr(sLRegistro+3);
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|9900';
  aConteudo := aConteudo + '|' + '9990';
  aConteudo := aConteudo + '|' + IntToStr(1);
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|9900';
  aConteudo := aConteudo + '|' + '9999';
  aConteudo := aConteudo + '|' + IntToStr(1);
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|9990';
  aConteudo := aConteudo + '|'+IntToStr(sLBloco+1);
  GravaLinhaArquivo(aConteudo);

  aConteudo := '|9999';
  aConteudo := aConteudo + '|'+IntToStr(sLArquivo+1+qtde_itens+qtde_registros+qtde_itens_20+qtde_registros_05+
                                        qtde_registros_400+qtde_registros_490+qtde_registros_001+qtde_registros_100+
                                        qtde_registros_140+qtde_registros_141+qtde_registros_170+qtde_registros_190+
                                        qtde_registros_350+qtde_registros_370+qtde_registros_390);
  GravaLinhaArquivo(aConteudo);

end;

procedure TFrmVendas_Periodo.GravaArquivoBlocoC(fConteudo:String);
begin
  fConteudo := fConteudo + '|';
  Writeln(sArquivo,fConteudo);
end;

procedure TFrmVendas_Periodo.GravaLinhaArquivo(fConteudo:String);
var aux : String;
begin
  if length(fConteudo) > 6 then
  begin
    fConteudo := fConteudo + '|';
    Writeln(sArquivo,fConteudo);
    // Soma no tatalizador de linhas
    Inc(sLBloco);
    Inc(sLArquivo);
    Inc(sLRegistro);
    // controle o contador de registros
    aux := Le_Linha_Arquivo(fConteudo,'|',2);
    if (sControleReg <> aux) and (copy(sControleReg,1,1) <> '9')  then
    begin
      if not ControleLinhaBloco.Active then
        ControleLinhaBloco.CreateDataSet;
      ControleLinhaBloco.open;
      ControleLinhaBloco.RecordCount;
      ControleLinhaBloco.Append;
      ControleLinhaBloco.FieldByname('BLOCO').AsString  := sControleReg;
      ControleLinhaBloco.FieldByName('QUANT').AsInteger := sLRegistro;
      ControleLinhaBloco.Post;
      sLRegistro   := 0;
      sControleReg := aux;
    end;
  end;

end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC001;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C001';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_001;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC0520;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C405';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_05;
  ControleLinhaBloco.Post;

  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C420';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_itens_20;
  ControleLinhaBloco.Post;

end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC400;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C400';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_400;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC490;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C490';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_490;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC100;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C100';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_100;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC140;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C140';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_140;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC141;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C141';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_141;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC170;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C170';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_170;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC190;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C190';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_190;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC350;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C350';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_350;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC370;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C370';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_370;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC390;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C390';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros_390;
  ControleLinhaBloco.Post;
end;

procedure TFrmVendas_Periodo.GravaQtdeBlocoC6070;
begin
  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C460';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_registros;
  ControleLinhaBloco.Post;

  if not ControleLinhaBloco.Active then
    ControleLinhaBloco.CreateDataSet;
  ControleLinhaBloco.open;
  ControleLinhaBloco.RecordCount;
  ControleLinhaBloco.Append;
  ControleLinhaBloco.FieldByname('BLOCO').AsString  := 'C470';
  ControleLinhaBloco.FieldByName('QUANT').AsInteger := qtde_itens;
  ControleLinhaBloco.Post;

end;

procedure TFrmVendas_Periodo.Grava_Aliquota(Registro: integer);
begin
  if not ClientDataSet1.Active then
    ClientDataSet1.CreateDataSet;
  ClientDataSet1.open;
  ClientDataSet1.RecordCount;
  ClientDataSet1.Append;
  ClientDataSet1.FieldByname('Valor').AsFloat  := valor_total_item;
  ClientDataSet1.FieldByName('Aliquota').AsFloat := aliquota_icms;
  ClientDataSet1.FieldByName('CFOP').AsString := CFOPP;
  ClientDataSet1.FieldByName('Registro').AsInteger := Registro;
  ClientDataSet1.Post;
end;

procedure TFrmVendas_Periodo.Grava_170(Aliquota, Valor_Operacao, BC_ICMS, Valor_ICMS, BC_ICMS_ST, Valor_ICMS_ST, Valor_Red_BC, Valor_IPI: double; CFOP, ST: AnsiString);
begin
  if not ClientDataSet2.Active then
    ClientDataSet2.CreateDataSet;
  ClientDataSet2.open;
  ClientDataSet2.RecordCount;
  ClientDataSet2.Append;
  ClientDataSet2.FieldByname('Aliquota').AsFloat  := Aliquota;
  ClientDataSet2.FieldByname('ST').AsString  := ST;
  ClientDataSet2.FieldByname('CFOP').AsString  := CFOP;
  ClientDataSet2.FieldByname('Valor_Operacao').AsFloat  := Valor_Operacao;
  ClientDataSet2.FieldByName('BC_ICMS').AsFloat := BC_ICMS;
  ClientDataSet2.FieldByName('Valor_ICMS').AsFloat := Valor_ICMS;
  ClientDataSet2.FieldByName('BC_ICMS_ST').AsFloat := BC_ICMS_ST;
  ClientDataSet2.FieldByName('Valor_ICMS_ST').AsFloat := Valor_ICMS_ST;
  ClientDataSet2.FieldByName('Valor_Red_BC').AsFloat := Valor_Red_BC;
  ClientDataSet2.FieldByName('Valor_IPI').AsFloat := Valor_IPI;
  ClientDataSet2.Post;
end;

procedure TFrmVendas_Periodo.Grava_370(CST, Ali_ICMS, CFOP: AnsiString; Valor_Operacao, Base_ICMS, Valor_ICMS: double);
begin
  if not ClientDataSet3.Active then
    ClientDataSet3.CreateDataSet;
  ClientDataSet3.open;
  ClientDataSet3.RecordCount;
  ClientDataSet3.Append;
  ClientDataSet3.FieldByname('Aliquota').AsString  := Ali_ICMS;
  ClientDataSet3.FieldByname('ST').AsString  := CST;
  ClientDataSet3.FieldByname('CFOP').AsString  := CFOP;
  ClientDataSet3.FieldByname('Valor_Operacao').AsFloat  := Valor_Operacao;
  ClientDataSet3.FieldByName('BC_ICMS').AsFloat := Base_ICMS;
  ClientDataSet3.FieldByName('Valor_ICMS').AsFloat := Valor_ICMS;
  ClientDataSet3.Post;
end;

function TFrmVendas_Periodo.Le_Linha_Arquivo(fTexto, fCaracter: string; fPosicao: Integer): string;
var aux:string;
    i, contador:integer;
begin
  // zera variaveis auxiliares
  aux := '';
  Result := '';
  contador := 0;
  // busca informações solicitadas no texto
  for i:=1 to length(fTexto) do
  begin
    if copy(fTexto,i,1) <> fCaracter then
      aux := aux + copy(fTexto,i,1)
    else
    begin
      contador := contador + 1;
      if contador = fPosicao then
      begin
        Break;
      end
      else
      begin
        aux := '';
      end;
    end;
  end;
  Result := aux;

end;

procedure TFrmVendas_Periodo.MEdtData_FinalExit(Sender: TObject);
begin
  Utili.Verifica_Data(MEdtData_Final);
end;

procedure TFrmVendas_Periodo.MEdtData_InicialExit(Sender: TObject);
begin
  Utili.Verifica_Data(MEdtData_Inicial);
end;

procedure TFrmVendas_Periodo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmVendas_Periodo.Free;
  FrmVendas_Periodo:= Nil;
end;

procedure TFrmVendas_Periodo.FormCreate(Sender: TObject);
begin
  Busca_Dados_SoftwareHouse;
  //nu_serie_inteiro:= 'BE091010100011216793';
end;

procedure TFrmVendas_Periodo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
    MEdtData_Final.Text:= DateToStr(date);
    MEdtData_Inicial.Text:= DateToStr(date);
    EdtECF.Text:= nu_serie_inteiro;
  end;
end;

procedure TFrmVendas_Periodo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

function TFrmVendas_Periodo.Valida: boolean;
begin
  Result:= false;
  if (MEdtData_Inicial.Text = '  /  /    ') or (MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;
  Result:= true;
end;

end.
