unit UCadastro_NCM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Gauges;

type
  TFrmCadastro_NCM = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblMarca: TLabel;
    EdtDescricao: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtCodigo_NCM: TEdit;
    Label2: TLabel;
    EdtEx: TEdit;
    RGTabela: TRadioGroup;
    Label3: TLabel;
    EdtAliquota_Nacional: TEdit;
    Label4: TLabel;
    EdtAliquota_Importada: TEdit;
    Label5: TLabel;
    EdtVersao: TEdit;
    Label6: TLabel;
    EdtAliquota_Estadual: TEdit;
    Label7: TLabel;
    EdtAliquota_Municipal: TEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    MEdtVigencia_Inicio: TMaskEdit;
    Label9: TLabel;
    MEdtVigencia_Fim: TMaskEdit;
    Button1: TButton;
    Gauge1: TGauge;
    EdtArquivo: TEdit;
    Label10: TLabel;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    BbtnNovo: TToolButton;
    Label11: TLabel;
    EdtIVA: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure MEdtVigencia_InicioExit(Sender: TObject);
    procedure MEdtVigencia_FimExit(Sender: TObject);
    procedure EdtIVAKeyPress(Sender: TObject; var Key: Char);
  private
    NCM: URegistro.TNCM;
    Util: TUtil;
    function StringToArray(value,delimiter : string):TStringList;
    procedure TesteCSV;
    procedure InsereNCM(Codigo_NCM, Ex, Tipo, Descricao, Versao: AnsiString; ANacional, AImport, AEst, AMun: Double; VigenciaInicio, VigenciaFim, DataCad: TDateTime);
    procedure AlteraNCM(Codigo_NCM, Descricao, Ex, Tipo, Versao: AnsiString; ANacional, AImport, AEst, AMun: Double; VigenciaInicio, VigenciaFim: TDateTime);
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_NCM: TFrmCadastro_NCM;
implementation

uses UDM, UDeclaracao, UChama_NCM;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_NCM.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_NCM);
  Util.Desabilita_Campos(FrmCadastro_NCM);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_NCM.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    NCM.Excluir(NCM);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU NCM ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_NCM);
  END;
end;

procedure TFrmCadastro_NCM.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_NCM.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_NCM);
  Util.Limpa_Campos(FrmCadastro_NCM);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  achei:= false;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  EdtCodigo_NCM.SetFocus;

end;

procedure TFrmCadastro_NCM.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        NCM.Inserir(NCM);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU NCM ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        NCM.Alterar(NCM);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU NCM ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_NCM);
end;

procedure TFrmCadastro_NCM.Button1Click(Sender: TObject);
var
  Arq : TextFile;
  Arqorigem, Linha, x : String;
  codigo_ncm, ex, tipo, descricao, aliquota_nacional, aliquota_importada, aliquota_estadual, aliquota_municipal,
  vigencia_inicio, vigencia_fim, chave, versao, fonte: AnsiString;
  Str : TStringList;
  teste: TStringList;
begin
  TesteCSV;
end;

procedure TFrmCadastro_NCM.Button2Click(Sender: TObject);
begin
  OpenDialog1.Filter:= '';
  OpenDialog1.FileName:= '';
  OpenDialog1.Execute;
  EdtArquivo.Text:= OpenDialog1.FileName;
end;

function TFrmCadastro_NCM.StringToArray(value,delimiter : string):TStringList;
var
   dx : integer;
   ns : string;
   txt : string;
   sl : TStringList;
   delta : integer;
begin
   sl:=TStringList.create;
   delta := Length(delimiter) ;
   txt := value + delimiter;
   sl.BeginUpdate;
   sl.Clear;
   try
     while Length(txt) > 0 do
     begin
       dx := Pos(delimiter, txt) ;
       ns := Copy(txt,0,dx-1) ;
       sl.Add(ns) ;
       txt := Copy(txt,dx+delta,MaxInt) ;
     end;
   finally
     sl.EndUpdate;
   end;
  stringtoarray:=sl;
  sl.free;
end;

procedure TFrmCadastro_NCM.TesteCSV;
var
  Linhas, Colunas:TStringList;
  i,j:integer;
  codigo_ncm, ex, tipo, descricao, chave, versao, fonte: AnsiString;
  aliquota_nacional, aliquota_importada, aliquota_estadual, aliquota_municipal: double;
  vigencia_inicio, vigencia_fim: TDate;
begin
  Linhas := TStringList.Create;
  Colunas := TStringList.Create;

  try
   Linhas.LoadFromFile(EdtArquivo.Text); //Carregando arquivo
   Gauge1.MaxValue:= Linhas.Count;
   for i := 1 to Pred(Linhas.Count) do
   begin
     Gauge1.Progress:= i;
     {Transformando os dados das colunas em Linhas}
     Colunas.text := StringReplace(Linhas.Strings[i],';',#13,[rfReplaceAll]);

     codigo_ncm:= Colunas.Strings[0];
     ex:= Colunas.Strings[1];
     tipo:= Colunas.Strings[2];
     descricao:= Colunas.Strings[3];
     aliquota_nacional:= StrToFloat( StringReplace (Colunas.Strings[4], '.', ',', [rfReplaceAll]));
     aliquota_importada:= StrToFloat(StringReplace (Colunas.Strings[5], '.', ',', [rfReplaceAll]));
     aliquota_estadual:= StrToFloat(StringReplace (Colunas.Strings[6], '.', ',', [rfReplaceAll]));
     aliquota_municipal:= StrToFloat(StringReplace (Colunas.Strings[7], '.', ',', [rfReplaceAll]));
     vigencia_inicio:= StrToDate(Colunas.Strings[8]);
     vigencia_fim:= StrToDate(Colunas.Strings[9]);
     versao:= Colunas.Strings[11];

     if (Verifica_NCM_Ja_Existe(codigo_ncm, DM.ADOConnection1)) then
     begin
       AlteraNCM(codigo_ncm, descricao, ex, tipo, versao, aliquota_nacional, aliquota_importada, aliquota_estadual,
       aliquota_municipal, vigencia_inicio, vigencia_fim);
     end
     else
     begin
       InsereNCM(codigo_ncm, ex, tipo, descricao, versao, aliquota_nacional, aliquota_importada, aliquota_estadual,
       aliquota_municipal, vigencia_inicio, vigencia_fim, now);
     end;

   end;
   Processo_Concluido;
  finally
    Linhas.Free;
    Colunas.Free;
  end;
end;

procedure TFrmCadastro_NCM.InsereNCM(Codigo_NCM, Ex, Tipo, Descricao, Versao: AnsiString; ANacional, AImport, AEst, AMun: Double; VigenciaInicio, VigenciaFim, DataCad: TDateTime);
var
  qAux, qaux2: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  begin
    with qAux, SQL do
    begin
      close;
      clear;
      Connection := DM.ADOConnection1;
      add('Insert into NCM (Codigo_NCM, Descricao, Data_Cadastro, Ex, Aliquota_Nacional, Aliquota_Importada, Versao, Tabela, Aliquota_Estadual, Aliquota_Municipal, Vigencia_Inicio, Vigencia_Fim)');
      add('values (:Codigo_NCM, :Descricao, :Data_Cadastro, :Ex, :Aliquota_Nacional, :Aliquota_Importada, :Versao, :Tabela, :Aliquota_Estadual, :Aliquota_Municipal, :Vigencia_Inicio, :Vigencia_Fim)');
      Parameters.ParamByName('Codigo_NCM').Value := Codigo_NCM;
      Parameters.ParamByName('Descricao').Value := Descricao;
      Parameters.ParamByName('Data_Cadastro').Value := DataCad;
      Parameters.ParamByName('Ex').Value := Ex;
      Parameters.ParamByName('Aliquota_Nacional').Value := ANacional;
      Parameters.ParamByName('Aliquota_Importada').Value := Aimport;
      Parameters.ParamByName('Versao').Value := Versao;
      Parameters.ParamByName('Tabela').Value := Tipo;
      Parameters.ParamByName('Aliquota_Estadual').Value := AEst;
      Parameters.ParamByName('Aliquota_Municipal').Value := AMun;
      Parameters.ParamByName('Vigencia_Inicio').Value := VigenciaInicio;
      Parameters.ParamByName('Vigencia_Fim').Value := VigenciaFim;
      ExecSQL;
    end;
  end;

end;

procedure TFrmCadastro_NCM.AlteraNCM(Codigo_NCM, Descricao, Ex, Tipo, Versao: AnsiString; ANacional, AImport, AEst, AMun: Double; VigenciaInicio, VigenciaFim: TDateTime);
var
  qAux, qaux2: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  begin
    with qAux, SQL do
    begin
      close;
      clear;
      Connection := DM.ADOConnection1;
      add('Update NCM set Descricao = :Descricao,');
      add('Ex = :Ex, Aliquota_Nacional = :Aliquota_Nacional, Aliquota_Importada = :Aliquota_Importada,');
      add('Versao = :Versao, Tabela = :Tabela, Aliquota_Estadual = :Aliquota_Estadual, Aliquota_Municipal = :Aliquota_Municipal, Vigencia_Inicio = :Vigencia_Inicio,');
      add('Vigencia_Fim = :Vigencia_Fim');
      add('where Codigo_NCM = :Codigo_NCM');
      Parameters.ParamByName('Codigo_NCM').Value := Codigo_NCM;
      Parameters.ParamByName('Descricao').Value := Descricao;
      Parameters.ParamByName('Ex').Value := Ex;
      Parameters.ParamByName('Aliquota_Nacional').Value := ANacional;
      Parameters.ParamByName('Aliquota_Importada').Value := Aimport;
      Parameters.ParamByName('Versao').Value := Versao;
      Parameters.ParamByName('Tabela').Value := Tipo;
      Parameters.ParamByName('Aliquota_Estadual').Value := AEst;
      Parameters.ParamByName('Aliquota_Municipal').Value := AMun;
      Parameters.ParamByName('Vigencia_Inicio').Value := VigenciaInicio;
      Parameters.ParamByName('Vigencia_Fim').Value := VigenciaFim;
      ExecSQL;
    end;
  end;
end;

function TFrmCadastro_NCM.Confira: boolean;
begin
  Confira:= false;
  if EdtDescricao.Text = '' then
  begin
    Mensagem_Falta_Dados;;
    EdtDescricao.SetFocus;
    abort;
  end;

  if EdtCodigo_NCM.Text = '' then
  begin
    Mensagem_Falta_Dados;;
    EdtCodigo_NCM.SetFocus;
    abort;
  end;

  if EdtIVA.Text = '' then
  begin
    Mensagem_Falta_Dados;;
    EdtIVA.SetFocus;
    abort;
  end;

  if EdtAliquota_Nacional.Text = '' then
  begin
    Mensagem_Falta_Dados;;
    EdtAliquota_Nacional.SetFocus;
    abort;
  end;

  if EdtAliquota_Importada.Text = '' then
  begin
    Mensagem_Falta_Dados;;
    EdtAliquota_Importada.SetFocus;
    abort;
  end;

  if EdtAliquota_Estadual.Text = '' then
  begin
    Mensagem_Falta_Dados;;
    EdtAliquota_Estadual.SetFocus;
    abort;
  end;

  if EdtAliquota_Municipal.Text = '' then
  begin
    Mensagem_Falta_Dados;;
    EdtAliquota_Municipal.SetFocus;
    abort;
  end;

  if MEdtVigencia_Inicio.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;;
    MEdtVigencia_Inicio.SetFocus;
    abort;
  end;

  if MEdtVigencia_Fim.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;
    MEdtVigencia_Fim.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_NCM.EdtIVAKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_NCM.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_NCM.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_NCM.Free;
        FrmCadastro_NCM:= Nil;
      end;
end;

procedure TFrmCadastro_NCM.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_NCM);
  Util.Limpa_Campos(FrmCadastro_NCM);
  Util.Desabilita_Campos(FrmCadastro_NCM);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_NCM.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_NCM.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_NCM.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_NCM.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_NCM.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_NCM.MEdtVigencia_FimExit(Sender: TObject);
begin
Util.Verifica_Data(MEdtVigencia_Fim);
end;

procedure TFrmCadastro_NCM.MEdtVigencia_InicioExit(Sender: TObject);
begin
Util.Verifica_Data(MEdtVigencia_Inicio);
end;

procedure TFrmCadastro_NCM.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_NCM, FrmChama_NCM);
  FrmChama_NCM.ShowModal;
  FrmChama_NCM.Release;
end;

end.
