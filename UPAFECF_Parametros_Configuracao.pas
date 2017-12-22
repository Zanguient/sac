unit UPAFECF_Parametros_Configuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,  Mask, ComCtrls, ToolWin, ImgList;

type
  TFrmPAFECF_Parametros_Configuracao = class(TForm)
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPAFECF_Parametros_Configuracao: TFrmPAFECF_Parametros_Configuracao;

implementation

uses UDeclaracao, UDM, ACBrECFClass;

{$R *.dfm}

procedure TFrmPAFECF_Parametros_Configuracao.BBtnFecharClick(
  Sender: TObject);
begin
  close;
end;

procedure TFrmPAFECF_Parametros_Configuracao.BBtnSalvarClick(Sender: TObject);
var
  cDescricao, cIndice, Rel: String;
  RG       : TACBrECFRelatorioGerencial;
begin
  cDescricao:= 'Parâmetros de C';
  dm.ACBrECF1.CarregaRelatoriosGerenciais;

  RG  :=  dm.ACBrECF1.AchaRGDescricao(cdescricao);

  if (RG = Nil) then
    dm.ACBrECF1.ProgramaRelatoriosGerenciais(cDescricao);

  cIndice:= ECF.Acha_RG_Descricao(cdescricao);

  Rel:= #10+#13+'Funcionalidades: '+#10+#13;
  Rel:= Rel + 'Tipo de Funcionamento: Em rede.'+#10+#13;
  Rel:= Rel + 'Tipo de Desenvolvimento: Comercializável'+#10+#13+#10+#13;

  Rel:= Rel + 'Parametro para Não Concomitancia'+#10+#13;
  Rel:= Rel + 'Pré-Venda      NÃO'+#10+#13;
  Rel:= Rel + 'DAV por ECF      NÃO'+#10+#13;
  Rel:= Rel + 'DAV Impressora Não Fiscal      SIM'+#10+#13;
  Rel:= Rel + 'DAV-OS     SIM'+#10+#13+#10+#13;

  Rel:= Rel + 'Perfis Atendidos: S, T, V, W, Z'+#10+#13;
  Rel:= Rel + 'Requisitos Atendidos: I, II, III, IV, VI, VII, VIII, XI, XII, XIII, XIV, XV, XVI, XVII, XVIII, XIX, XX, XXI, XXII, XXIII, '+
                                     'XXIV, XXV, XXVI, XXVII, XXVIII, XXIX, XXX, XXXI, XXXII, XXXIII, LI, LII';

  dm.ACBrECF1.PafMF_RelParametrosConfiguracao(Rel);

  den_op:= 'RG';
  Registra_R06;

  Processo_Concluido;

end;

procedure TFrmPAFECF_Parametros_Configuracao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmPAFECF_Parametros_Configuracao.Free;
  FrmPAFECF_Parametros_Configuracao:= Nil;
end;

procedure TFrmPAFECF_Parametros_Configuracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmPAFECF_Parametros_Configuracao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
