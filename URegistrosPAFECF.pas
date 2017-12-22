unit URegistrosPAFECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList, ACBrPAF,
  ADODB, ACBrPAFRegistros;

type
  TFrmRegistros_PAF_ECF = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    EdtInicio: TEdit;
    EdtFim: TEdit;
    RGOpcao: TRadioGroup;
    RGModo: TRadioGroup;
    ACBrPAF1: TACBrPAF;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure RGOpcaoClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
  private

    qMeiosPagamento, qP2, qE2: TADOQuery;

    function  ValidaIntervalo: Boolean;
    procedure Assina_Arquivo;
    procedure Carrega_Dados_Meios_PagamentoA2;
    procedure Carrega_Dados_ProdutosP2;
    procedure Carrega_Dados_EstoqueE2;
    procedure PreencherHeader(Header: TRegistroX1);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistros_PAF_ECF: TFrmRegistros_PAF_ECF;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmRegistros_PAF_ECF.Carrega_Dados_EstoqueE2;
begin
  qE2:= TADOQuery.Create(self);
  with qE2, SQL do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select P.Codigo_Venda, P.Descricao, P.Status_Estoque_Data, P.Estoque, UM.Sigla from Produto P');
    add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    Parameters.ParamByName('Status').Value:= 'ATIVO';
    Parameters.ParamByName('Tipo').Value:= 0;
    open;
    First;
  end;
end;

procedure TFrmRegistros_PAF_ECF.Carrega_Dados_Meios_PagamentoA2;
begin
  qMeiosPagamento:= TADOQuery.Create(self);
  with qMeiosPagamento, SQL do
  begin
    close;
    clear;
    Connection:=  dm.ADOConnection1;
    add('select FE.Forma_Pagamento, FE.Data, FE.Tipo_Documento, sum(FE.Valor) as Valor from Fechamento_Venda FE');
    add('where Data between :DI and :DF and FE.Status = :Status and (FE.Tipo_Documento = :Tipo1 or FE.Tipo_Documento = :Tipo2 or FE.Tipo_Documento = :Tipo3)');
    add('group by Forma_Pagamento, Data, Tipo_Documento');
    Parameters.ParamByName('DI').Value:= StrToDateTime(MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(MEdtData_Final.Text);
    Parameters.ParamByName('Status').Value:= 'PAGO';
    Parameters.ParamByName('Tipo1').Value:= 'CUPOM FISCAL';
    Parameters.ParamByName('Tipo2').Value:= 'SUPRIMENTO';
    Parameters.ParamByName('Tipo3').Value:= 'SANGRIA';
    open;
    First;
  end;
end;

procedure TFrmRegistros_PAF_ECF.Carrega_Dados_ProdutosP2;
begin
  qP2:= TADOQuery.Create(self);
  with qP2, SQL do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select ITP.Preco_Vista,');
    add('Pro.Codigo, Pro.Tipo, Pro.Codigo_Venda, Pro.Descricao, Pro.Producao_Propria, Pro.Arred_Trunc, ');
    add('UM.Sigla, RI.Aliquota as ICMS, RI.Tipo_Recolhimento, RISS.Aliquota as ISS, CST.Codigo_Situacao, ITI.Origem, ITI.Destino from Produto Pro');

    add('left join Itens_Tabela_Preco ITP on (ITP.Codigo_Produto = Pro.Codigo)');
    add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
    add('left join Itens_Tratamento_ICMS ITI on (ITI.Codigo = TI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
    add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
    add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
    add('where Pro.Status = :Status and TP.Codigo = :Codigo ');//and Pro.Codigo = :Produto');
    Parameters.ParamByName('Status').Value:= 'ATIVO';
    Parameters.ParamByName('GO1').Value:= uf;
    Parameters.ParamByName('GO2').Value:= uf;
    Parameters.ParamByName('Codigo').Value:= codigo_tabela_preco_ativo;
    //Parameters.ParamByName('Produto').Value:= qryconsulta_produtoCodigo.AsInteger;
    open;
    First;
  end;
end;

procedure TFrmRegistros_PAF_ECF.Assina_Arquivo;
var
  arquivo: TStringList;
  caminho, registroEAD: AnsiString;
begin
  //GeraChave;
  setlength( registroEAD, 256 );
  caminho:= Local_Arquivo(14) + 'Retorno.txt';
  //arquivo:= TStringList.Create;
  //arquivo.LoadFromFile(caminho);
  generateEAD(caminho, cChavePublica, cChavePrivada, registroEAD, 1);
  //arquivo.SaveToFile(caminho);
  //arquivo.Add('EAD'+registroEAD);
  //arquivo.Free;
  Arquivo_Gerado(caminho);
end;

procedure TFrmRegistros_PAF_ECF.BBtnFecharClick(
  Sender: TObject);
begin
  close;
end;

procedure TFrmRegistros_PAF_ECF.PreencherHeader(Header: TRegistroX1);
begin
  // o header dos relatórios PAF a maioria são todos iguais
  Header.UF         := uf;
  Header.CNPJ       := cnpj_emitente;
  Header.IE         := insc_estadual;
  Header.IM         := insc_municipal;
  Header.RAZAOSOCIAL:= razao_social;
end;

procedure TFrmRegistros_PAF_ECF.BBtnSalvarClick(
  Sender: TObject);
var
  sAliquota: AnsiString;
begin
  //U1
  with ACBrPAF1.PAF_U.RegistroU1 do
  begin
    CNPJ:= cnpj_emitente;
    IE:= insc_estadual;
    IM:= insc_municipal;
    RAZAOSOCIAL:= razao_social;
    InclusaoExclusao:= true;
  end;

  //A2
  ACBrPAF1.PAF_A.RegistroA2.Clear;
  Carrega_Dados_Meios_PagamentoA2;
  while not (qMeiosPagamento.Eof) do
  begin
    with ACBrPAF1.PAF_A.RegistroA2.New do
    begin
      DT:= qMeiosPagamento.FieldByName('Data').AsDateTime;
      MEIO_PGTO:= qMeiosPagamento.FieldByName('Forma_Pagamento').AsString;
      if (qMeiosPagamento.FieldByName('Tipo_Documento').AsString = 'CUPOM FISCAL') then
        TIPO_DOC:= '1'
      else
        TIPO_DOC:= '2';
      VL:= qMeiosPagamento.FieldByName('Valor').AsFloat;
      RegistroValido:= true;
      qMeiosPagamento.Next;
    end;
  end;

  //P1
  PreencherHeader(ACBrPAF1.PAF_P.RegistroP1);
  //P2
  ACBrPAF1.PAF_P.RegistroP2.Clear;
  Carrega_Dados_ProdutosP2;
  while not (qP2.Eof) do
  begin
    with ACBrPAF1.PAF_P.RegistroP2.New do
    begin
      COD_MERC_SERV:= qP2.FieldByName('Codigo_Venda').AsString;
      DESC_MERC_SERV:= qP2.FieldByName('Descricao').AsString;
      UN_MED:= qP2.FieldByName('Sigla').AsString;
      IAT:= qP2.FieldByName('Arred_Trunc').AsString;
      IPPT:= qP2.FieldByName('Producao_Propria').AsString;

      if (qP2.FieldByName('Tipo').AsString = '0') then
      begin
        if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'TRIBUTADO') then
          ST:= 'T'
        else if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'I') then
          ST:= 'I'
        else if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'NT') then
          ST:= 'N'
        else if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'ST') then
          ST:= 'F';
      end
      else
      begin
        ST:= 'S';
      end;

      if (qP2.FieldByName('Tipo').AsString = '0') then
      begin
        if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'TRIBUTADO') then
        begin
          if Length(qP2.FieldByName('ICMS').AsString) = 1 then
            sAliquota  := '0' + qP2.FieldByName('ICMS').AsString + '00' //0700
          else if Length(qP2.FieldByName('ICMS').AsString) = 2 then
            sAliquota  := qP2.FieldByName('ICMS').AsString + '00'       //1200
          else if Length(qP2.FieldByName('ICMS').AsString) = 3 then
            sAliquota  := '0'+qP2.FieldByName('ICMS').AsString + '0'       //0840
          else if Length(qP2.FieldByName('ICMS').AsString) = 4 then
            sAliquota  := qP2.FieldByName('ICMS').AsString + '0';       //1320
          ALIQ:= StrToFloat(sAliquota);
        end
        else
          ALIQ:= 0;
      end
      else
      begin
        if Length(qP2.FieldByName('ISS').AsString) = 1 then
          sAliquota  := '0' + qP2.FieldByName('ISS').AsString + '00' //0700
        else if Length(qP2.FieldByName('ISS').AsString) = 2 then
          sAliquota  := qP2.FieldByName('ISS').AsString + '00'       //1200
        else if Length(qP2.FieldByName('ISS').AsString) = 3 then
          sAliquota  := '0'+qP2.FieldByName('ISS').AsString + '0'       //0840
        else if Length(qP2.FieldByName('ISS').AsString) = 4 then
          sAliquota  := qP2.FieldByName('ISS').AsString + '0';       //1320
        ALIQ:= StrToFloat(sAliquota);
      end;

      VL_UNIT:= qP2.FieldByName('Preco_Vista').AsFloat;
    end;
    qP2.Next;
  end;

  //E1
  PreencherHeader(ACBrPAF1.PAF_E.RegistroE1);
  //E2
  ACBrPAF1.PAF_E.RegistroE2.Clear;
  Carrega_Dados_EstoqueE2;
  while not (qE2.Eof) do
  begin
    with (ACBrPAF1.PAF_E.RegistroE2.New) do
    begin
      COD_MERC:= qE2.FieldByName('Codigo_Venda').AsString;
      DESC_MERC:= qE2.FieldByName('Descricao').AsString;
      UN_MED:= qE2.FieldByName('Sigla').AsString;
      QTDE_EST:= qE2.FieldByName('Estoque').AsFloat;
      RegistroValido:= True;
      qE2.Next;
    end;
  end;
  //E3
  with (ACBrPAF1.PAF_E.RegistroE3) do
  begin

    RegistroValido:= True;
  end;
  /////


end;

procedure TFrmRegistros_PAF_ECF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmRegistros_PAF_ECF.Free;
  FrmRegistros_PAF_ECF:= Nil;
end;

procedure TFrmRegistros_PAF_ECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmRegistros_PAF_ECF.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmRegistros_PAF_ECF.RGOpcaoClick(Sender: TObject);
begin
  if (RGOpcao.ItemIndex = 0) then
  begin
    EdtInicio.Enabled:= false;
    EdtFim.Enabled:= false;
    MEdtData_Final.Enabled:= true;
    MEdtData_Inicial.Enabled:= true;
  end
  else
  begin
    EdtInicio.Enabled:= true;
    EdtFim.Enabled:= true;
    MEdtData_Final.Enabled:= false;
    MEdtData_Inicial.Enabled:= false;
  end;
end;

function TFrmRegistros_PAF_ECF.ValidaIntervalo: Boolean;
begin
  Result:= False;

  if (RGOpcao.ItemIndex = 0) then
    begin
      if (MEdtData_Inicial.Text = '  /  /    ') or (MEdtData_Final.Text = '  /  /    ') then
        begin
          ShowMessage('Digite um valor valido');
          MEdtData_Inicial.SetFocus;
          Exit;
        end;
    end;

  if (RGOpcao.ItemIndex = 1) then
    begin
      if (EdtInicio.Text = '') or (EdtFim.Text = '') then
        begin
          ShowMessage('Digite um valor valido');
          EdtInicio.SetFocus;
          exit
        end;
    end;

 Result:= true;
end;

end.
