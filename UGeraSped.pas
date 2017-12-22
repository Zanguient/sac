unit UGeraSped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  Vcl.ExtCtrls, Vcl.CheckLst, Vcl.ActnList, Datasnap.DBClient, ACBrSpedFiscal,
  Vcl.Buttons, ACBrEFDBlocos, ACBrConsts, ACBrUtil;

type
  TFrmGerarSped = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    EdtCodEmp: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Datai: TDateTimePicker;
    Dataf: TDateTimePicker;
    Label1: TLabel;
    ListaBlocos: TCheckListBox;
    ChSTIPI: TCheckBox;
    ChDespesasAcessorias: TCheckBox;
    ChEntradasEFD: TCheckBox;
    GrpDtInvent: TGroupBox;
    DataInvent: TDateTimePicker;
    ChBensConsumo: TCheckBox;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    ChTruncado: TCheckBox;
    edNotas: TEdit;
    edBufNotas: TEdit;
    edBufLinhas: TEdit;
    GroupBox5: TGroupBox;
    SpeedButton3: TSpeedButton;
    EdtPath: TEdit;
    OpenDialog1: TOpenDialog;
    qrySped: TADOQuery;
    daSped: TDataSource;
    qrySpedNome: TStringField;
    qrySpedCodigo_Municipio: TStringField;
    qrySpedEndereco: TStringField;
    qrySpedCPF_CNPJ: TStringField;
    qrySpedNumero: TStringField;
    qrySpedInscricao_Estadual: TStringField;
    qrySpedComplemento: TStringField;
    qrySpedSetor: TStringField;
    qrySpedN_Pedido: TStringField;
    qrySpedData_Venda: TDateTimeField;
    qrySpedCodigo_Cliente: TIntegerField;
    qry0200: TADOQuery;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnNovoClick(Sender: TObject);
    // procedure MEdtData_CadastroExit(Sender: TObject);
    // procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure EdtLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LancamentoKeyPress(Sender: TObject; var Key: Char);
    // procedure MEdtData_CobrancaExit(Sender: TObject);
    // procedure MEdtData_CobrancaEnter(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Util: TUtil;
    procedure ConsultaDadosContador;

  public
    qry0150, qry0190, qryC100,qryc170, qryDadosContador, qryc190, qryProdutoInventario: TADOQuery;

    procedure GerarDadosBloco(pBloco: String);
    procedure Consulta0150();
    procedure Consulta0190();
    procedure Consulta0200();
    procedure ConsultaC100();
    procedure ConsultaC170();
    procedure ConsultaC176();
    procedure ConsultaC190();
    procedure ConsultaProdutosInventario;
    // protected
    // function Confira: Boolean; virtual;
  end;

var
  FrmGerarSped: TFrmGerarSped;

implementation

uses UDM, UDeclaracao, UCadastro_Ocorrencia_Cobranca, Util.TLog;

{$R *.dfm}
{ TFrmPadrao }

procedure TFrmGerarSped.BBtnCancelarClick(Sender: TObject);
begin
  BBtnSalvar.Enabled := true;

end;

procedure TFrmGerarSped.BBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmGerarSped.BBtnNovoClick(Sender: TObject);
begin
  BBtnSalvar.Enabled := true;
end;

procedure TFrmGerarSped.BBtnSalvarClick(Sender: TObject);
begin
  if EdtCodEmp.Text = '' then
  begin
    MessageDlg('É necessário selecionar a empresa!', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (not(ListaBlocos.Checked[0])) or (not(ListaBlocos.Checked[8])) then
  begin
    MessageDlg('Os Blocos 0 e 9 são obrigatórios!', mtWarning, [mbOK], 0);
    Abort;
  end;




  // Configura o componente

  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

  ACBrSPEDFiscal1.DT_INI := Datai.Date;

  ACBrSPEDFiscal1.DT_FIN := Dataf.Date;

  ACBrSPEDFiscal1.Path := EdtPath.Text;

  ACBrSPEDFiscal1.Arquivo := 'SPED_' + FormatDateTime('ddmmyyyyhhmmss',
    now) + '.txt';

  // repassa os dados

  if ListaBlocos.Checked[0] then
    GerarDadosBloco('0');

  if ListaBlocos.Checked[1] then
    GerarDadosBloco('C');

  if ListaBlocos.Checked[2] then
    GerarDadosBloco('D');

  if ListaBlocos.Checked[3] then
    GerarDadosBloco('E');

  if ListaBlocos.Checked[5] then
    GerarDadosBloco('H');

  if ListaBlocos.Checked[7] then
    GerarDadosBloco('1');

  // gera o arquivo

  ACBrSPEDFiscal1.SaveFileTXT;

  if ListaBlocos.Checked[8] then
    GerarDadosBloco('9');

  ShowMessage('Arquivo Gerado com sucesso!');

  BBtnSalvar.Enabled := true;

  // Util.Desabilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
end;

procedure TFrmGerarSped.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGerarSped.ConsultaDadosContador;
begin
  try
    try
      qryDadosContador := TADOQuery.create(nil);
      with qryDadosContador, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT CO.*, S.Descricao as Setor, C.Descricao as Cidade, C.UF, C.Codigo_Municipio from Contabilista');
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

procedure TFrmGerarSped.ConsultaProdutosInventario;
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
        Add('(select SUM(P.Valor_Compra * P.Estoque) from Produto P) as TotalInventario');
        Add('from Produto P');
        Add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
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

procedure TFrmGerarSped.Consulta0150;
begin
  try
    try
      qry0150 := TADOQuery.create(nil);
      with qry0150, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT C.Codigo as Codigo_Cliente, C.Razao_Social, C.CNPJ, C.CPF, C.Insc_Estadual, P.Codigo_Pais,');
        Add('Cid.Codigo_Municipio, C.Endereco, C.Numero, C.Complemento, S.Descricao as Setor');
        Add('from Pedido P');
        Add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
        Add('left join Cidade Cid on (C.Codigo_Cidade = Cid.Codigo)');
        Add('left join Pais P on (C.Codigo_Pais = P.Codigo)');
        Add('left join Setor S on (C.Codigo_Setor = S.Codigo)');

        Add('WHERE P.Data_Venda between :Datai and :Dataf and Tipo = ' + QuotedStr('NFE') + '');
        Add('and status = ' + QuotedStr('PAGO') + ')');
        //Parameters.ParamByName('Datai').Value := ;
        //Parameters.ParamByName('Dataf').Value := ;

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

procedure TFrmGerarSped.Consulta0190;
begin

  try
    try
      qry0190 := TADOQuery.create(nil);
      with qry0190, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT Un.Codigo, Un.Sigla, Un.Descricao FROM Unidade_Medida Un');
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

procedure TFrmGerarSped.Consulta0200;
begin

  try
    try
      qry0200 := TADOQuery.create(nil);
      with qry0200, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT IP.Codigo_Produto, IP.Codigo_Venda, IP.Descricao, IP.NCM, IP.UN,');
        Add('IP.ICMS');
        Add('from Itens_Pedido IP');
        Add('inner join Pedido P on (IP.Codigo = P.Codigo)');
        Add('where P.Data_Venda between :DI and :DF');
        Add('group by IP.Codigo_Produto, IP.Codigo_Venda, IP.Descricao, IP.NCM, IP.UN,');
        Add('IP.ICMS');
        //Parameters.ParamByName('DI').Value:= StrToDate();
        //Parameters.ParamByName('DF').Value:= StrToDate();
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

procedure TFrmGerarSped.ConsultaC100;
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
        Add('TNF.Tipo_Frete');
        Add('from Pedido P');
        Add('inner join Condicao_Pagamento CP on (P.Codigo_Forma_Pag = CP.Codigo)');
        Add('inner join Transporte_NF TNF on (P.Codigo = TNF.Codigo_Pedido)');
        Add('where P.Data_Venda between :DI and :DF');
        //Parameters.ParamByName('DI').Value:= StrToDate();
        //Parameters.ParamByName('DF').Value:= StrToDate();
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

procedure TFrmGerarSped.ConsultaC170;
begin
  try
    try
      qryc170 := TADOQuery.create(nil);
      with qryc170, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('SELECT '+
              'Itens_Pedido.Codigo_Registro as COD_ITEM, '+
              'Itens_Pedido.Codigo_Produto, '+
              'Itens_Pedido.N_Item, '+
              'Itens_Pedido.Descricao as DESCR_COMPL, '+
              'Itens_Pedido.Qtde as QTD, '+
              'Itens_Pedido.UN as UNID, '+
              'Itens_Pedido.Sub_Total as VL_ITEM, '+
              'Itens_Pedido.Desc_Acr as VL_DESC, '+
              'Itens_Pedido.CST as CST_ICMS, '+
              'Itens_Pedido.CFOP, '+
              'Itens_Pedido.BC as VL_BC_ICMS, '+
              'Itens_Pedido.ICMS as ALIQ_ICMS, '+
              'Itens_Pedido.Valor_ICMS as VL_ICMS, '+
              'Itens_Pedido.CST_IPI as CST_IPI, '+
              'Itens_Pedido.BC_IPI as VL_BC_IPI, '+
              'Itens_Pedido.Valor_IPI as VL_IPI, '+
              'Itens_Pedido.CST_PIS, '+
              'Itens_Pedido.BC_PIS as VL_BC_PIS, '+
              'Itens_Pedido.Valor_PIS as VL_PIS, '+
              'Itens_Pedido.BC_COFINS as VL_BC_COFINS, '+
              'Itens_Pedido.CST_COFINS, '+
              'Itens_Pedido.Valor_COFINS as VL_COFINS '+

            'FROM '+
              'Itens_Pedido IP '+
            'LEFT JOIN '+
              'Pedido P on(Pedido.Codigo = Itens_Pedido.Codigo)');
        Add('where P.Data_Venda between :DI and :DF');
        //Parameters.ParamByName('DI').Value:= StrToDate();
        //Parameters.ParamByName('DF').Value:= StrToDate();
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

procedure TFrmGerarSped.ConsultaC176;
begin

end;

procedure TFrmGerarSped.ConsultaC190;
begin
  try
    try
      qryc190 := TADOQuery.create(nil);
      with qryc190, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select IP.CST, IP.CFOP, IP.ICMS, SUM(IP.Sub_Total + IP.Valor_IPI + IP.Valor_ICMS_ST) as ValorTotal,');
        Add('sum(cast(REPLACE(IP.BC,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as BC_ICMS,');
        Add('sum(cast(REPLACE(IP.Valor_ICMS,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_ICMS,');
        Add('sum(cast(REPLACE(IP.BC_ST,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as BC_ST,');
        Add('sum(cast(REPLACE(IP.Valor_ICMS_ST,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_ICMS_ST,');
        Add('sum(IP.Sub_Total - cast(REPLACE(IP.BC,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_Nao_Tributado,');
        Add('sum(cast(REPLACE(IP.Valor_IPI,'+QuotedStr(',')+','+QuotedStr('.')+') as float)) as Valor_IPI');
        Add('from Itens_Pedido IP');
        Add('left join Pedido P on (IP.Codigo = P.Codigo)');
        Add('where P.Data_Venda between :DI and :DF');
        Add('group by IP.CST, IP.CFOP, IP.ICMS');
        //Parameters.ParamByName('DI').Value:= StrToDate();
        //Parameters.ParamByName('DF').Value:= StrToDate();
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

procedure TFrmGerarSped.EdtCodigo_LancamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmGerarSped.EdtLancamentoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmGerarSped.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FreeAndNil(FrmGerarSped);
end;

procedure TFrmGerarSped.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f2) then
  begin
  end;

  if (Key = vk_escape) then
    Close;
end;

procedure TFrmGerarSped.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmGerarSped.GerarDadosBloco(pBloco: String);
var
  Int1, Int2, Notas: Integer;
  aTotalICMS: Double;
  conexao: TADOConnection;
begin
  aTotalICMS := 0;

  if pBloco = '2' then
  begin
    with ACBrSPEDFiscal1.Bloco_E do
    begin

    end;
  end;

  if pBloco = '0' then
  begin
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
          with Registro0190New do
          begin
            UNID := qry0190.fieldbyname('Sigla').asstring;
            DESCR := qry0190.fieldbyname('Descricao').asstring;
          end;
          qry0190.Next;
        end;
        //

        Consulta0200;
        while not qry0200.Eof do
        begin
          with Registro0200New do
          begin
            COD_ITEM := qry0200.fieldbyname('Codigo_Produto').asstring;
            DESCR_ITEM := qry0200.fieldbyname('Descricao').asstring;
            COD_BARRA := qry0200.fieldbyname('Codigo_Venda').asstring;
            COD_ANT_ITEM := '';
            UNID_INV := qry0200.fieldbyname('UN').asstring;
            TIPO_ITEM := tiMercadoriaRevenda;//qry0200.fieldbyname('descricao_produto').asstring;
            COD_NCM := qry0200.fieldbyname('NCM').asstring;
            EX_IPI := '';
            COD_GEN := Copy(qry0200.fieldbyname('NCM').asstring, 1,2); //dois primeiros digitos do NCM
            COD_LST := '';
            ALIQ_ICMS := qry0200.fieldbyname('ICMS').asstring;
          end;
          qry0200.Next;
        end;


        //0460
        FreeAndNil(qry0200);

      end;
    end;
  end
  else if pBloco = 'C' then
  begin
    Notas := StrToInt64Def(edNotas.Text, 1);
    with ACBrSPEDFiscal1.Bloco_C do
    begin
      with RegistroC001New do
      begin
        IND_MOV := imComDados;
        //

        ConsultaC100;
        while qryC100.Eof do
        begin
          with RegistroC100New do
          begin
            COD_PART := qryC100.fieldbyname('Codigo_Cliente').asstring;
            IND_EMIT := edEmissaoPropria;
            IND_OPER := tpEntradaAquisicao;
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
            VL_BC_ICMS := 0;        //
            VL_ICMS := 0;           //
            VL_BC_ICMS_ST := 0;     //
            VL_ICMS_ST := 0;        //
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

            ConsultaC170;
            while qryc170.Eof do
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
                VL_BC_ICMS := qryc170.fieldByname('VL_BC_ICMS').asfloat;
                ALIQ_ICMS := qryc170.fieldByname('ALIQ_ICMS').asfloat;
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
            end;


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
              ALIQ_ICMS := qryc190.FieldByName('ICMS').AsFloat;
              VL_OPR := qryc190.FieldByName('ValorTotal').AsFloat;
              VL_BC_ICMS := qryc190.FieldByName('BC_ICMS').AsFloat;
              VL_ICMS := qryc190.FieldByName('Valor_ICMS').AsFloat;
              VL_BC_ICMS_ST := qryc190.FieldByName('BC_ST').AsFloat;
              VL_ICMS_ST := qryc190.FieldByName('Valor_ICMS_ST').AsFloat;
              VL_RED_BC := qryc190.FieldByName('Valor_Nao_Tributado').AsFloat;
              VL_IPI := qryc190.FieldByName('Valor_IPI').AsFloat;
              COD_OBS := qryc190.FieldByName('').AsString;
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
    end;
  end
  else if pBloco = 'D' then
  begin
    {with ACBrSPEDFiscal1.Bloco_D do
    begin
      with RegistroD001New do
      begin
        IND_MOV := imSemDados;
      end;
    end;}
  end
  else if pBloco = 'E' then
  begin
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
  end
  else if pBloco = 'H' then
  begin
    with ACBrSPEDFiscal1.Bloco_H do
    begin
      with RegistroH001New do
      begin
        IND_MOV := imComDados;
        //
        ConsultaProdutosInventario;
        with RegistroH005New do
        begin
          DT_INV := Date;
          VL_INV := qryProdutoInventario.FieldByName('TotalInventario').AsFloat;
          MOT_INV:= miFinalPeriodo;
          // FILHO
          while not qryProdutoInventario.Eof do
          begin
            with RegistroH010New do
            begin
              COD_ITEM := qryProdutoInventario.FieldByName('Codigo').AsString;
              UNID := qryProdutoInventario.FieldByName('Unidade').AsString;
              QTD := qryProdutoInventario.FieldByName('Estoque').AsFloat;
              VL_UNIT := qryProdutoInventario.FieldByName('Valor_Compra').AsFloat;
              VL_ITEM := qryProdutoInventario.FieldByName('ValorItem').AsFloat;
              IND_PROP := piInformante;
              COD_PART := '';
              TXT_COMPL := '';
              COD_CTA := '';
            end;
            qryProdutoInventario.Next;
          end;
        end;
      end;
    end;
  end
  else if pBloco = '1' then
  begin
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
  end
  else if pBloco = '9' then
  begin
    ACBrSPEDFiscal1.WriteBloco_9;
  end
end;

procedure TFrmGerarSped.Panel1Exit(Sender: TObject);
begin
  Close;
end;

procedure TFrmGerarSped.SpeedButton3Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtPath.Text := ExtractFilePath(OpenDialog1.FileName);
end;

end.
