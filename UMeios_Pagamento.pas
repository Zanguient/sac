unit UMeios_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ADODB, DB, Grids, DBGrids, ComCtrls,
  ToolWin, ImgList, ACBrECFClass;

type
  TFrmMeios_Pagamento = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    ADOQuery4: TADOQuery;
    ADOQuery4Desconto: TFloatField;
    ADOQuery3: TADOQuery;
    ADOQuery3Datamov: TDateTimeField;
    ADOQuery3Totalizador_Parcial: TStringField;
    ADOQuery3valor_venda: TFloatField;
    ADOQuery3iss: TFloatField;
    ADOQueryP: TADOQuery;
    ADOQueryPDatamov: TDateTimeField;
    ADOQueryPCaixa: TStringField;
    ADOQueryPCRZ: TStringField;
    ADOQueryPCOO: TStringField;
    ADOQueryPvalor_venda: TFloatField;
    ADOQueryPDesconto: TFloatField;
    ADOQuery2: TADOQuery;
    ADOQuery2Totalizador_Parcial: TStringField;
    ADOQuery2Data_Movimento: TDateTimeField;
    ADOQuery2valor_venda: TFloatField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
  private
    cChavePublica, cChavePrivada: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMeios_Pagamento: TFrmMeios_Pagamento;

implementation

uses UDeclaracao, UMenu_Geral, UDM;

{$R *.dfm}

procedure TFrmMeios_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMeios_Pagamento.BBtnSalvarClick(Sender: TObject);
var
  sAux: TADOQuery;
  //Descricao, Tipo_Documento, Valor, Data: AnsiString;
  cindice, cdescricao: AnsiString;
  aux: Ansistring;
  FormasPagamento: TACBrECFFormasPagamento;
begin
  sAux:= TADOQuery.Create(self);
  FormasPagamento := TACBrECFFormasPagamento.Create;

  with sAux, sql do
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
  end;

  cindice:= '02';
  cdescricao:= 'MEIOS DE PGTO';
  //iRetorno:= Bematech_FI_NomeiaRelatorioGerencialMFD(PAnsiChar(cindice), PAnsiChar(cdescricao));
  //Analisa_iRetorno;

  //iRetorno:= Bematech_FI_AbreRelatorioGerencialMFD(PAnsiChar(cindice));
  //Analisa_iRetorno;

  aux:= 'Meio de Pag.' + '   ' + 'Tipo' + '         ' + 'Valor' + '     ' + 'Data' + #13+#10+#13+#10;

  //iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
  //Analisa_iRetorno;
  try
    try
      if (sAux.IsEmpty = false) then
      begin
        sAux.First;
        while not sAux.Eof do
        begin
          with FormasPagamento.New do
          begin
            Descricao:= sAux.FieldByName('Forma_Pagamento').AsString;
            //ValorFiscal:= sAux.FieldByName('Valor').AsFloat;
            Data:= sAux.FieldByName('Data').AsDateTime;

            {aux:= Descricao + StringOfChar(' ',15 - Length(Descricao)) +
                  Tipo_Documento + StringOfChar(' ',13 - Length(Tipo_Documento)) +
                  Valor + StringOfChar(' ',10 - Length(Valor)) + Data + #13+#10;

            iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
            Analisa_iRetorno;}
            sAux.Next;
          end;
        end;

        {aux:= '---------SOMA INDIVIDUAL DO PERÍODO---------' +#13+#10;
        iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
        Analisa_iRetorno;

        with sAux, sql do
        begin
          close;
          clear;
          Connection:=  dm.ADOConnection1;
          add('select FE.Forma_Pagamento, sum(FE.Valor) as Valor from Fechamento_Venda FE');
          add('where Data between :DI and :DF and FE.Status = :Status and (FE.Tipo_Documento = :Tipo1 or FE.Tipo_Documento = :Tipo2 or FE.Tipo_Documento = :Tipo3)');
          add('group by FE.Forma_Pagamento');
          Parameters.ParamByName('DI').Value:= StrToDateTime(MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(MEdtData_Final.Text);
          Parameters.ParamByName('Status').Value:= 'PAGO';
          Parameters.ParamByName('Tipo1').Value:= 'CUPOM FISCAL';
          Parameters.ParamByName('Tipo2').Value:= 'SUPRIMENTO';
          Parameters.ParamByName('Tipo3').Value:= 'SANGRIA';
          open;
        end;

        sAux.First;
        while not sAux.Eof do
        begin
          aux:= sAux.FieldByName('Forma_Pagamento').AsString + ' = ' + FormatFloat('#0.0,0',sAux.FieldByName('Valor').AsFloat) + #13+#10;
          iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
          Analisa_iRetorno;
          sAux.Next;
        end;

        with sAux, sql do
        begin
          close;
          clear;
          Connection:=  dm.ADOConnection1;
          add('select sum(FE.Troco) as Valor from Fechamento_Venda FE');
          add('where Data between :DI and :DF and FE.Status = :Status and (FE.Tipo_Documento = :Tipo1 or FE.Tipo_Documento = :Tipo2 or FE.Tipo_Documento = :Tipo3)');
          Parameters.ParamByName('DI').Value:= StrToDateTime(MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(MEdtData_Final.Text);
          Parameters.ParamByName('Status').Value:= 'PAGO';
          Parameters.ParamByName('Tipo1').Value:= 'CUPOM FISCAL';
          Parameters.ParamByName('Tipo2').Value:= 'SUPRIMENTO';
          Parameters.ParamByName('Tipo3').Value:= 'SANGRIA';
          open;
        end;

        sAux.First;
        while not sAux.Eof do
        begin
          aux:= 'TROCO = ' + FormatFloat('#0.0,0',sAux.FieldByName('Valor').AsFloat) + #13+#10;
          iRetorno:= Bematech_FI_UsaRelatorioGerencialMFD(aux);
          Analisa_iRetorno;
          sAux.Next;
        end;}

        DM.ACBrECF1.PafMF_RelMeiosPagamento(FormasPagamento, aux, 1);
      end;
    Except
      Erro_Processo;
      abort;
    end;
  finally
    //iRetorno:= Bematech_FI_FechaRelatorioGerencial;
    //Analisa_iRetorno;
    FreeAndNil(sAux);
    den_op:= 'RG';
    Registra_R06;
    UDeclaracao.Insere_Historico(usuario, 'GEROU RELATÓRIO DE MEIOS DE PAGAMENTO PELO ECF.', TimeToStr(time), consu, date);
    Processo_Concluido;
  end;
end;

procedure TFrmMeios_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMeios_Pagamento.Free;
  FrmMeios_Pagamento:= Nil;
end;

procedure TFrmMeios_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
    MEdtData_Final.Text:= DateToStr(date);
    MEdtData_Inicial.Text:= DateToStr(date);
  end;
end;

procedure TFrmMeios_Pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
