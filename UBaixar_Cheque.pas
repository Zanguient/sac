unit UBaixar_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmBaixar_Cheque = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    EdtFavorecido: TEdit;
    Label2: TLabel;
    MEdtData_Saida: TMaskEdit;
    GroupBox1: TGroupBox;
    LblCodigo: TLabel;
    LblData_Cadastro: TLabel;
    EdtCheque: TEdit;
    MEdtData_Entrada: TMaskEdit;
    Label1: TLabel;
    EdtValor: TEdit;
    Label4: TLabel;
    MmoObservacoes: TMemo;
    SPAtualiza_Cheque: TADOStoredProc;
    Label3: TLabel;
    EdtSituacao: TEdit;
    Label5: TLabel;
    MEdtData_Vencimento: TMaskEdit;
    BbtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtChequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_SaidaEnter(Sender: TObject);
    procedure EdtChequeDblClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_SaidaExit(Sender: TObject);
  private
    Setor: URegistro.TSetor;
    Util: TUtil;
  public
    ativo: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmBaixar_Cheque: TFrmBaixar_Cheque;
implementation

uses UDM, UChama_Cheque, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmBaixar_Cheque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmBaixar_Cheque.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmBaixar_Cheque);
  Util.Limpa_Campos(FrmBaixar_Cheque);
  BBtnSalvar.Enabled:= true;
  BbtnNovo.Enabled:= false;
  achei:= false;
  EdtCheque.SetFocus;
end;

procedure TFrmBaixar_Cheque.BBtnSalvarClick(Sender: TObject);
begin
  if (Confira = true) then
  begin
    with SPAtualiza_Cheque do
    begin
      Parameters.ParamByName('@N_Cheque').Value:= EdtCheque.Text;
      Parameters.ParamByName('@Favorecido').Value:= EdtFavorecido.Text;
      Parameters.ParamByName('@Data_Saida').Value:= StrToDateTime(MEdtData_Saida.Text);
      Parameters.ParamByName('@Status').Value:= 'BAIXADO';
      ExecProc;
    end;
    Application.MessageBox('Dados do cheque atualizado com sucesso', 'Baixa Concluida', MB_OK+MB_ICONQUESTION);
    UDeclaracao.Insere_Historico(usuario, 'REALIZOU BAIXA DO CHEQUE NÚMERO ' + EdtCheque.Text + '.', TimeToStr(time), alteracao, date);
    BBtnSalvar.Enabled:= false;
    BbtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmBaixar_Cheque);
  end;
end;

function TFrmBaixar_Cheque.Confira: boolean;
begin
    Confira:= false;
    if EdtCheque.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCheque.SetFocus;
        abort;
      end;

    if MEdtData_Saida.Text = '  /  /    ' then
      begin
        Mensagem_Falta_Dados;
        MEdtData_Saida.SetFocus;
        abort;
      end;
      Confira:= true;
end;

procedure TFrmBaixar_Cheque.EdtChequeDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
  FrmChama_Cheque.ShowModal;
  FrmChama_Cheque.Free;
end;

procedure TFrmBaixar_Cheque.EdtChequeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
      FrmChama_Cheque.ShowModal;
      FrmChama_Cheque.Free;
    end;
    
  if (key = vk_return) then
  begin
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('select CC.Favorecido, CC.N_Cheque, CC.Valor, CC.Data_Cadastro, CC.Tipo from Cheque CC');
        add('where CC.N_Cheque = :Parametro');
        Parameters.ParamByName('Parametro').Value:= EdtCheque.Text;
        open;
        if (IsEmpty = true) then
          begin
            Application.MessageBox('Cheque não encontrado. Verifique se digitou o número do cheque corretamente ou o mesmo não está cadastrado', 'Cheque não encontrado', MB_OK+MB_ICONEXCLAMATION);
            abort;
          end
          else
          begin
            EdtFavorecido.Text:= qAux.FieldByName('Favorecido').AsString;
            EdtValor.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Valor').AsFloat);
            EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
            MEdtData_Entrada.Text:= qAux.FieldByName('Data_Cadastro').AsString;
            EdtSituacao.Text:= qAux.FieldByName('Tipo').AsString;
            EdtFavorecido.SetFocus;
          end;
      end;
  end;
end;

procedure TFrmBaixar_Cheque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmBaixar_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmBaixar_Cheque.Free;
  FrmBaixar_Cheque:= Nil;
end;

procedure TFrmBaixar_Cheque.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmBaixar_Cheque);
  Util.Limpa_Campos(FrmBaixar_Cheque);
  Util.Desabilita_Campos(FrmBaixar_Cheque);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, nil, nil, nil, BBtnFechar);
end;

procedure TFrmBaixar_Cheque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmBaixar_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmBaixar_Cheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmBaixar_Cheque.MEdtData_SaidaEnter(Sender: TObject);
begin
  MEdtData_Saida.Text:= DateToStr(date);
end;

procedure TFrmBaixar_Cheque.MEdtData_SaidaExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Saida);
end;

procedure TFrmBaixar_Cheque.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

end.
