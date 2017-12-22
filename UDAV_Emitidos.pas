unit UDAV_Emitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls, ToolWin, ImgList, ExtCtrls, Mask,
  ACBrPAFClass;

type
  TFrmDAV_Emitidos = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    RGTipo: TRadioGroup;
    LblData_Cadastro: TLabel;
    MEdtInicio: TMaskEdit;
    Label1: TLabel;
    MEdtFim: TMaskEdit;
    SaveDialog1: TSaveDialog;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    caminho: string;
    { Public declarations }
  end;

var
  FrmDAV_Emitidos: TFrmDAV_Emitidos;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmDAV_Emitidos.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmDAV_Emitidos.BBtnSalvarClick(Sender: TObject);
var
  qAux, qAux2: TADOQuery;
  aux, cIndice, cDescricao: string;
  loArquivo: TextFile;
  coo, n_pedido, data, data2, titulo, valor, coo_vinc, NomeArquivo, registroEAD, tipo_op, modeloecf: string;
  i: integer;
  DAVsE: TACBrECFDAVs;
begin
  i:= 0;
  setlength( registroEAD, 256 );

  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  with qAux, sql do
  begin                                                     //colocar o CCF do docuemnto fiscal vinculado
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select P.N_Pedido, P.Data_Venda, P.Tipo, P.Total_Pedido, P.COO, P.CCF, P.DAVC from Pedido P');
    add('where P.Data_Venda between :DI and :DF and (P.Tipo = :DAV or P.Tipo = :DAVOS or P.DAVC = :DAVC)');
    add('order by P.N_Pedido asc');
    Parameters.ParamByName('DI').Value:= StrToDateTime(MEdtInicio.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(MEdtFim.Text);
    Parameters.ParamByName('DAV').Value:= 'DAV';
    Parameters.ParamByName('DAVOS').Value:= 'DAV-OS';
    Parameters.ParamByName('DAVC').Value:= 'SIM';
    open;
    First;
  end;

  if (qAux.IsEmpty = false) then
  begin
    if (RGTipo.ItemIndex = 1) then
    begin
      cIndice:= '4';
      cDescricao:= 'DAV Emitidos';
      //iRetorno:= Bematech_FI_NomeiaRelatorioGerencialMFD(PChar(cIndice), PChar(cDescricao));
      //Analisa_iRetorno;

      //iRetorno:= Bematech_FI_AbreRelatorioGerencialMFD(PChar(cIndice));
      //Analisa_iRetorno;

      aux:= 'Número' + '       ' + 'Data' + '       ' + 'Tipo' + '      ' + 'Valor' + '   ' + 'CCF' +#13+#10+#13+#10;
      //iRetorno:= Bematech_FI_RelatorioGerencial(aux);
      //Analisa_iRetorno;

      DAVsE := TACBrECFDAVs.Create;
      try

        while not qAux.Eof do
        begin
          if (qAux.FieldByName('Tipo').AsString = 'DAV-OS') then
            tipo_op:= 'OS       '
          else
            tipo_op:= 'ORCAMENTO';

          n_pedido:= qAux.FieldByName('N_Pedido').AsString;
          with DAVsE.New do
          begin
            Numero:= n_pedido;//qAux.FieldByName('N_Pedido').AsString;

            if (qAux.FieldByName('COO').AsString <> '') then
              COO_Dav:= qAux.FieldByName('COO').AsInteger;

            if (qAux.FieldByName('CCF').AsString <> '') then
              COO_Cupom:= qAux.FieldByName('CCF').AsInteger;

            Titulo:= tipo_op;
            DtEmissao:= qAux.FieldByName('Data_Venda').AsDateTime;
            Valor:= qAux.FieldByName('Total_Pedido').AsFloat;
          end;
            qAux.Next;
          {if (qAux.FieldByName('Tipo').AsString = 'DAV-OS') then
            tipo_op:= 'OS       '
          else
            tipo_op:= 'ORCAMENTO';

          aux:= qAux.FieldByName('N_Pedido').AsString + ' ' + qAux.FieldByName('Data_Venda').AsString + ' ' +
                tipo_op + ' ' + FormatFloat('0.00',qAux.FieldByName('Total_Pedido').AsFloat) + '  ' +
                qAux.FieldByName('CCF').AsString + #13+#10;
          iRetorno:= Bematech_FI_RelatorioGerencial(aux);
          Analisa_iRetorno;}
        end;

        dm.ACBrECF1.PafMF_RelDAVEmitidos(DAVsE, aux, 0);
      finally
        DAVsE.Free;
      end;
      //Bematech_FI_FechaRelatorioGerencial;
      den_op:= 'RG';
      //Coleta_Dados_R06;
      //R06.Inserir_Outros(R06);
      //R06.Inserir_Outros_Aux(R06);
      Processo_Concluido;
    end
    else
    begin
      SaveDialog1.InitialDir:= Local_Arquivo(14);
      //SaveDialog1.Execute();
      caminho := Local_Arquivo(14) + 'DAV Emitidos.txt';

      AssignFile(loArquivo, caminho);
      Rewrite(loArquivo);

      writeln(loArquivo, 'D1' + StringOfChar('0', 14 - Length(cnpj)) + cnpj +
              insc_estadual + StringOfChar(' ',14 - Length(insc_estadual)) +
              insc_municipal + StringOfChar(' ', 14 - Length(insc_municipal)) +
              razao_social + StringOfChar(' ', 50 - Length(razao_social)));

      while not qAux.Eof do
      begin

        modeloecf:= '';

        with qAux2, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select * from Pedido_Aux where N_Pedido = :N_Pedido');
          Parameters.ParamByName('N_Pedido').Value:= qAux.FieldByName('N_Pedido').AsString;
          open;
        end;

      if (qAux2.FieldByName('N_Pedido').AsString <> qAux.FieldByName('N_Pedido').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('COO').AsString <> qAux.FieldByName('COO').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Data').AsString <> qAux.FieldByName('Data_Venda').AsString) then
        modeloecf:= '????????????????????';

      if (qAux2.FieldByName('Valor').AsString <> qAux.FieldByName('Total_Pedido').AsString) then
        modeloecf:= '????????????????????';

        coo:= qAux.FieldByName('COO').AsString;
        n_pedido:= qAux.FieldByName('N_Pedido').AsString;
        data:= FormatDateTime('YYYYMMDD', qAux.FieldByName('Data_Venda').AsDateTime);
        data2:= data;
        titulo:= qAux.FieldByName('Tipo').AsString;

        if (titulo = 'DAV-OS') then
          titulo:= 'OS'
        ELSE
          titulo:= 'ORCAMENTO';

        valor:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Pedido').AsFloat);
        valor:= StringReplace(valor, ',', '', [rfReplaceAll]);
        valor:= StringReplace(valor, ThousandSeparator, '', [rfReplaceAll]);

        tipo:= StringReplace(tipo, '-', '', [rfReplaceAll]);
        coo_vinc:= qAux.FieldByName('CCF').AsString;

        {writeln(loArquivo, 'D2' + StringOfChar('0', 14 - Length(cnpj)) + cnpj +
                nu_serie + StringOfChar(' ',20 - Length(nu_serie)) +
                mf + StringOfChar(' ', 1 - Length(mf)) +
                tipo + StringOfChar(' ', 7 - Length(tipo)) +
                marca + StringOfChar(' ', 20 - Length(marca)) +
                modelo + StringOfChar(' ', 20 - Length(modelo)) +
                StringOfChar('0', 6 - Length(coo)) + coo +
                n_pedido + StringOfChar(' ', 13 - Length(n_pedido)) +
                data2 + StringOfChar(' ', 8 - Length(data2)) +
                titulo + StringOfChar(' ', 30 - Length(titulo)) +
                StringOfChar('0', 8 - Length(valor)) + valor +
                StringOfChar('0', 6 - Length(coo_vinc)) + coo_vinc); }

        writeln(loArquivo, 'D2' + StringOfChar('0', 14 - Length(cnpj)) + cnpj +
                '' + StringOfChar(' ',20 - Length('')) +
                '' + StringOfChar(' ', 1 - Length('')) +
                '' + StringOfChar(' ', 7 - Length('')) +
                '' + StringOfChar(' ', 20 - Length('')) +
                modeloecf + StringOfChar(' ', 20 - Length(modeloecf)) +
                StringOfChar('0', 6 - Length('0')) + '0' +
                n_pedido + StringOfChar(' ', 13 - Length(n_pedido)) +
                data2 + StringOfChar(' ', 8 - Length(data2)) +
                titulo + StringOfChar(' ', 30 - Length(titulo)) +
                StringOfChar('0', 8 - Length(valor)) + valor +
                StringOfChar('0', 6 - Length(coo_vinc)) + coo_vinc);

        inc(i);
        qAux.Next;
      end;

      writeln(loArquivo, 'D9' + StringOfChar('0', 14 - Length(cnpj)) + cnpj +
              insc_estadual + StringOfChar(' ',14 - Length(insc_estadual)) +
              StringOfChar('0', 6 - Length(IntToStr(i))) + IntToStr(i));

      write(loArquivo);
      CloseFile(loArquivo);
      NomeArquivo := caminho;
      generateEAD(NomeArquivo, cChavePublica, cChavePrivada, registroEAD, 1);
      Arquivo_Gerado(Caminho);
    end;
    UDeclaracao.Insere_Historico(usuario, 'GEROU RELATÓRIO/ARQUIVO ELETRÔNICO DE DAV EMITIDOS.', TimeToStr(time), consu, date);
  end
  else
  begin
    Application.MessageBox('Não há dados a serem impressos', 'Dados não encontrados', MB_OK+MB_ICONQUESTION);
    abort;
  end;

end;

procedure TFrmDAV_Emitidos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmDAV_Emitidos.Free;
  FrmDAV_Emitidos:= Nil;
end;

procedure TFrmDAV_Emitidos.FormCreate(Sender: TObject);
begin
  Centraliza_Form(FrmDAV_Emitidos);
end;

procedure TFrmDAV_Emitidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    close;

  if (key = vk_f2) then
  begin
    MEdtInicio.ReadOnly:= false;
    MEdtFim.ReadOnly:= false;
    BBtnSalvar.Enabled:= true;
    MEdtInicio.Text:= DateToStr(date);
    MEdtFim.Text:= DateToStr(date);
  end;
end;

end.
