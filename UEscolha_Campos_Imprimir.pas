unit UEscolha_Campos_Imprimir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Buttons, QRCtrls,
  CheckLst, ADODB;

type
  TFrmEscolha_Campos_Imprimir = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SBtnAdicionar: TSpeedButton;
    SBtnRemover: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ListBox2: TListBox;
    ListBox1: TListBox;
    procedure imprime(pForm: TForm);
    procedure visualiza_impressao(pForm: TForm);
    procedure FormCreate(Sender: TObject);
    procedure SBtnAdicionarClick(Sender: TObject);
    procedure SBtnRemoverClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BBtnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnOKClick(Sender: TObject);
  private
    { Private declarations }

    qtde_registro: integer;
    qCamposVisivel, qCamposInvisivel, qCampos: TADOQuery;

    function PosCampo(Campo: AnsiString): integer;
    procedure Salva_Campos(Codigo_Empresa, Codigo_Usuario, Visivel: integer; Nome_Campo, Nome_Apresentacao, Tipo_Relatorio: AnsiString);
    procedure Deleta_Campos(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
    procedure Altera_Campos(Codigo_Empresa, Codigo_Usuario, Visivel: integer;
      Tipo_Relatorio, Nome_Campo: AnsiString);
    procedure Verifica_Campos(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
    procedure Atualiza_Campos(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
    procedure Atualiza_Campos_Visivel(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
    procedure Atualiza_Campos_Invisivel(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
    procedure Setar_Largura;
    procedure Mostra_Relatorio;
    procedure Monta_Componentes_Basicos;
    procedure Create_Relatorio;
    procedure Atualiza_Query_Relatorio;
    procedure Libera_Componentes_Memoria;

  public
    { Public declarations }

  tipo_relatorio: AnsiString;
  Pagina:Integer;
  QrLabel:array of TQrLabel;
  QrDbText:array of TQrDbtext;
  Desc,Campo:array of String;
  Largura:Array of Integer;
  var
      preview: boolean;
  end;

var
  FrmEscolha_Campos_Imprimir: TFrmEscolha_Campos_Imprimir;

implementation

uses URel_Consulta_Lancamento_Financeiro_Sintetico_Teste, UDM,
  UConsulta_Lancamentos_Financeiros, UDeclaracao,
  URel_Consulta_Lancamento_Financeiro_Sintetico_Condicao_Pagamento,
  URel_Consulta_Lancamento_Financeiro_Sintetico_CliForn;

{$R *.dfm}

procedure TFrmEscolha_Campos_Imprimir.BBtnOKClick(Sender: TObject);
var
  i, Col, Tamc:integer;
  NCampo,Ordem: AnsiString;
begin
  if Listbox2.Items.Count > 0 then
  begin

  Create_Relatorio;

  Col := 5;

  for i := 0 to listbox2.Items.Count -1 do
    begin
     //Obtendo o Tamanho e Nome do Campo
      Tamc   := Largura[PosCampo(ListBox2.Items.Strings[i])] ;
      NCampo := Campo[PosCampo(ListBox2.Items.Strings[i])];

     //Criando Componentes Para os Títulos das Colunas
     {if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
     begin
       QrLabel[i+1] := TQrLabel.Create(FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.ChildBand1);
       QrLabel[i+1].Parent     := FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.ChildBand1;
     end
     else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
     begin
       QrLabel[i+1] := TQrLabel.Create(FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.ChildBand1);
       QrLabel[i+1].Parent     := FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.ChildBand1;
     end
     else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
     begin
       QrLabel[i+1] := TQrLabel.Create(FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.ChildBand1);
       QrLabel[i+1].Parent     := FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.ChildBand1;
     end;}

     QrLabel[i+1].Left       := Col;
     QrLabel[i+1].Top        := 4;
     QrLabel[i+1].Caption    := ListBox2.Items.Strings[i];
     QrLabel[i+1].Font.Style := [fsbold];
     QrLabel[i+1].Font.Size := 8;
     QrLabel[i+1].Font.Name:= 'Tahoma';

     //Criando Componentes de Exibição de Dados das Colunas

     {if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
     begin
       QrDbtext[i+1] := TQrDbtext.Create(FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRBand3);
       QrDbText[i+1].Parent    :=  FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRBand3;
       QrDbText[i+1].DataSet   := FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.ADOQuery1;
     end
     else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
     begin
       QrDbtext[i+1] := TQrDbtext.Create(FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRBand3);
       QrDbText[i+1].Parent    :=  FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRBand3;
       QrDbText[i+1].DataSet   := FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.ADOQuery1;
     end
     else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
     begin
       QrDbtext[i+1] := TQrDbtext.Create(FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRBand3);
       QrDbText[i+1].Parent    :=  FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRBand3;
       QrDbText[i+1].DataSet   := FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.ADOQuery1;
     end; }

     QrDbText[i+1].Left       := Col;
     QrDbText[i+1].Top        := 8;
     QrDbText[i+1].DataField := NCampo;
     QrDbText[i+1].Font.Size := 8;
     QrDbText[i+1].Font.Name:= 'Tahoma';

     Col := Col + (Tamc);    //estava 5 * Tamc

   end;

    Atualiza_Query_Relatorio;
    Monta_Componentes_Basicos;
    Mostra_Relatorio;
    Libera_Componentes_Memoria;
  end;

end;

procedure TFrmEscolha_Campos_Imprimir.Libera_Componentes_Memoria;
var
  i: integer;
begin
   for i := 0 to listbox2.Items.Count -1 do
   begin
     QrLabel[i+1].free;
     QrDbText[i+1].free;
   end;
end;

procedure TFrmEscolha_Campos_Imprimir.Atualiza_Query_Relatorio;
begin
  {if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.Atualiza_Query;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Atualiza_Query;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.Atualiza_Query;
  end; }
end;

procedure TFrmEscolha_Campos_Imprimir.Create_Relatorio;
begin
  {if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.Create(nil);
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Create(nil);
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.Create(nil);
  end;}
end;

procedure TFrmEscolha_Campos_Imprimir.Monta_Componentes_Basicos;
begin
  {if (Pagina > 740) then
  begin
    if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QuickRep1.Page.Orientation:= TPrinterOrientation.poLandscape;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.Width:= 1120;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.LblEmpresa.Width:= 657;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRTituloData.Left:= 931;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRTitulohora.Left:= 931;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRLabeldata.Left:= 967;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRLabelhora.Left:= 967;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.LblTelefone_Rodape.Left:= 956;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRLabel25.Left:= 465;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRExpr2.Left:= 513;
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QuickRep1.Page.Orientation:= TPrinterOrientation.poLandscape;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Width:= 1120;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.LblEmpresa.Width:= 657;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRTituloData.Left:= 931;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRTitulohora.Left:= 931;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRLabeldata.Left:= 967;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRLabelhora.Left:= 967;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.LblTelefone_Rodape.Left:= 956;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRLabel25.Left:= 465;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRExpr2.Left:= 513;
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QuickRep1.Page.Orientation:= TPrinterOrientation.poLandscape;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.Width:= 1120;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.LblEmpresa.Width:= 657;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRTituloData.Left:= 931;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRTitulohora.Left:= 931;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRLabeldata.Left:= 967;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRLabelhora.Left:= 967;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.LblTelefone_Rodape.Left:= 956;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRLabel25.Left:= 465;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRExpr2.Left:= 513;
    end;
  end
  else
  begin
    if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QuickRep1.Page.Orientation := TPrinterOrientation.poPortrait;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.Width:= 808;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.LblEmpresa.Width:= 333;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRTituloData.Left:= 603;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRTitulohora.Left:= 603;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRLabeldata.Left:= 639;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRLabelhora.Left:= 639;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.LblTelefone_Rodape.Left:= 626;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRLabel25.Left:= 328;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QRExpr2.Left:= 376;
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QuickRep1.Page.Orientation := TPrinterOrientation.poPortrait;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Width:= 808;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.LblEmpresa.Width:= 333;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRTituloData.Left:= 603;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRTitulohora.Left:= 603;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRLabeldata.Left:= 639;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRLabelhora.Left:= 639;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.LblTelefone_Rodape.Left:= 626;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRLabel25.Left:= 328;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRExpr2.Left:= 376;
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QuickRep1.Page.Orientation := TPrinterOrientation.poPortrait;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.Width:= 808;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.LblEmpresa.Width:= 333;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRTituloData.Left:= 603;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRTitulohora.Left:= 603;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRLabeldata.Left:= 639;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRLabelhora.Left:= 639;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.LblTelefone_Rodape.Left:= 626;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRLabel25.Left:= 328;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QRExpr2.Left:= 376;
    end;
  end;}
end;

procedure TFrmEscolha_Campos_Imprimir.Mostra_Relatorio;
begin
  {if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.QuickRep1.Preview;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste.Release;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Teste:= Nil;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QuickRep1.Preview;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Release;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn:= Nil;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.QuickRep1.Preview;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.Release;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao:= Nil;
  end; }
end;

procedure TFrmEscolha_Campos_Imprimir.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmEscolha_Campos_Imprimir.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmEscolha_Campos_Imprimir.Release;
  FreeAndNil(qCamposVisivel);
  FreeAndNil(qCamposInvisivel);
end;

procedure TFrmEscolha_Campos_Imprimir.Salva_Campos(Codigo_Empresa, Codigo_Usuario, Visivel: integer; Nome_Campo, Nome_Apresentacao, Tipo_Relatorio: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('insert into Configuracao_Relatorio (Codigo_Empresa, Codigo_Usuario, Nome_Campo, Nome_Apresentacao, Tipo_Relatorio, Visivel) values');
      add('(:Codigo_Empresa, :Codigo_Usuario, :Nome_Campo, :Nome_Apresentacao, :Tipo_Relatorio, :Visivel)');
      Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Codigo_Usuario').Value:= Codigo_Usuario;
      Parameters.ParamByName('Nome_Campo').Value:= Nome_Campo;
      Parameters.ParamByName('Nome_Apresentacao').Value:= Nome_Apresentacao;
      Parameters.ParamByName('Tipo_Relatorio').Value:= Tipo_Relatorio;
      Parameters.ParamByName('Visivel').Value:= Visivel;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.Deleta_Campos(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Delete from Configuracao_Relatorio where Codigo_Empresa = :Codigo_Empresa and Codigo_Usuario = :Codigo_Usuario and');
      add('Tipo_Relatorio = :Tipo_Relatorio');
      Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Codigo_Usuario').Value:= Codigo_Usuario;
      Parameters.ParamByName('Tipo_Relatorio').Value:= Tipo_Relatorio;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.Altera_Campos(Codigo_Empresa, Codigo_Usuario, Visivel: integer; Tipo_Relatorio, Nome_Campo: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Update Configuracao_Relatorio set Visivel = :Visivel where Codigo_Empresa = :Codigo_Empresa and');
      add('Codigo_Usuario = :Codigo_Usuario and Tipo_Relatorio = :Tipo_Relatorio and Nome_Apresentacao = :Nome_Apresentacao');
      Parameters.ParamByName('Visivel').Value:= Visivel;
      Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Codigo_Usuario').Value:= Codigo_Usuario;
      Parameters.ParamByName('Tipo_Relatorio').Value:= Tipo_Relatorio;
      Parameters.ParamByName('Nome_Apresentacao').Value:= Nome_Campo;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.Atualiza_Campos(Codigo_Empresa,
  Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
begin
  if (qCampos = nil) then
    qCampos:= TADOQuery.Create(self);

  with qCampos, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select Nome_Campo, Nome_Apresentacao, Visivel, (select count(*) from Configuracao_Relatorio where Codigo_Empresa = :Codigo_Empresa1 and');
    add('Codigo_Usuario = :Codigo_Usuario1 and Tipo_Relatorio = :Tipo_Relatorio1) as Qtde from Configuracao_Relatorio where Codigo_Empresa = :Codigo_Empresa2 and');
    add('Codigo_Usuario = :Codigo_Usuario2 and Tipo_Relatorio = :Tipo_Relatorio2');
    //add('group by Nome_Campo, Nome_Apresentacao');
    Parameters.ParamByName('Codigo_Empresa1').Value:= Codigo_Empresa;
    Parameters.ParamByName('Codigo_Usuario1').Value:= Codigo_Usuario;
    Parameters.ParamByName('Tipo_Relatorio1').Value:= Tipo_Relatorio;
    Parameters.ParamByName('Codigo_Empresa2').Value:= Codigo_Empresa;
    Parameters.ParamByName('Codigo_Usuario2').Value:= Codigo_Usuario;
    Parameters.ParamByName('Tipo_Relatorio2').Value:= Tipo_Relatorio;
    open;
    First;
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.Atualiza_Campos_Invisivel(Codigo_Empresa,
  Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
begin
  if (qCamposInvisivel = nil) then
    qCamposInvisivel:= TADOQuery.Create(self);

  with qCamposInvisivel, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select Nome_Campo, Nome_Apresentacao, (select count(*) from Configuracao_Relatorio where Codigo_Empresa = :Codigo_Empresa1 and');
    add('Codigo_Usuario = :Codigo_Usuario1 and Tipo_Relatorio = :Tipo_Relatorio1 and Visivel = :Visivel1) as Qtde from Configuracao_Relatorio where Codigo_Empresa = :Codigo_Empresa2 and');
    add('Codigo_Usuario = :Codigo_Usuario2 and Tipo_Relatorio = :Tipo_Relatorio2 and Visivel = :Visivel2');
    //add('group by Nome_Campo, Nome_Apresentacao');
    Parameters.ParamByName('Codigo_Empresa1').Value:= Codigo_Empresa;
    Parameters.ParamByName('Codigo_Usuario1').Value:= Codigo_Usuario;
    Parameters.ParamByName('Tipo_Relatorio1').Value:= Tipo_Relatorio;
    Parameters.ParamByName('Visivel1').Value:= 1;
    Parameters.ParamByName('Codigo_Empresa2').Value:= Codigo_Empresa;
    Parameters.ParamByName('Codigo_Usuario2').Value:= Codigo_Usuario;
    Parameters.ParamByName('Tipo_Relatorio2').Value:= Tipo_Relatorio;
    Parameters.ParamByName('Visivel2').Value:= 1;
    open;
    First;
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.Atualiza_Campos_Visivel(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
begin
  if (qCamposVisivel = nil) then
    qCamposVisivel:= TADOQuery.Create(self);

  with qCamposVisivel, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select Nome_Campo, Nome_Apresentacao, (select count(*) from Configuracao_Relatorio where Codigo_Empresa = :Codigo_Empresa1 and');
    add('Codigo_Usuario = :Codigo_Usuario1 and Tipo_Relatorio = :Tipo_Relatorio1 and Visivel = :Visivel1) as Qtde from Configuracao_Relatorio where Codigo_Empresa = :Codigo_Empresa2 and');
    add('Codigo_Usuario = :Codigo_Usuario2 and Tipo_Relatorio = :Tipo_Relatorio2 and Visivel = :Visivel2');
    //add('group by Nome_Campo, Nome_Apresentacao');
    Parameters.ParamByName('Codigo_Empresa1').Value:= Codigo_Empresa;
    Parameters.ParamByName('Codigo_Usuario1').Value:= Codigo_Usuario;
    Parameters.ParamByName('Tipo_Relatorio1').Value:= Tipo_Relatorio;
    Parameters.ParamByName('Visivel1').Value:= 0;
    Parameters.ParamByName('Codigo_Empresa2').Value:= Codigo_Empresa;
    Parameters.ParamByName('Codigo_Usuario2').Value:= Codigo_Usuario;
    Parameters.ParamByName('Tipo_Relatorio2').Value:= Tipo_Relatorio;
    Parameters.ParamByName('Visivel2').Value:= 0;
    open;
    First;
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.Setar_Largura;
begin
  {if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
  begin
    Largura[1] := 200;
    Largura[2] := 158;
    Largura[3] := 114;
    Largura[4] := 72;
    Largura[5] := 42;
    Largura[6] := 70;
    Largura[7] := 68;
    Largura[8] := 66;
    Largura[9] := 66;
    Largura[10] := 66;
    Largura[11] := 60;
    Largura[12] := 56;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
  begin
    Largura[1] := 80;
    Largura[2] := 180;
    Largura[3] := 130;
    Largura[4] := 72;
    Largura[5] := 42;
    Largura[6] := 70;
    Largura[7] := 68;
    Largura[8] := 66;
    Largura[9] := 66;
    Largura[10] := 66;
    Largura[11] := 60;
    Largura[12] := 56;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
  begin
    Largura[1] := 80;
    Largura[2] := 180;
    Largura[3] := 220;
    Largura[4] := 72;
    Largura[5] := 42;
    Largura[6] := 70;
    Largura[7] := 68;
    Largura[8] := 66;
    Largura[9] := 66;
    Largura[10] := 66;
    Largura[11] := 60;
    Largura[12] := 56;
  end; }
end;

procedure TFrmEscolha_Campos_Imprimir.Verifica_Campos(Codigo_Empresa, Codigo_Usuario: integer; Tipo_Relatorio: AnsiString);
var
  i: integer;
begin
  i:= 1;
  Atualiza_Campos(Codigo_Empresa, Codigo_Usuario, Tipo_Relatorio);

  {if (qCampos.IsEmpty) then
  begin
    if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
    begin
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Nome', 'Nome', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Historico', 'Histórico', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Cond_Pag', 'Cond. Pag.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Data_Vencimento', 'Vencimento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Dias_Venc', 'Dias V.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Data_Pagamento', 'Pagamento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor', 'Valor Bruto', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Pagar', 'Valor Total', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Pago', 'Valor Pago', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Restante', 'Valor Rest.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'N_Cheque', 'Cheque', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Conta', 'Conta', Tipo_Relatorio);
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
    begin
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'N_Documento', 'Documento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Historico', 'Histórico', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Cond_Pag', 'Cond. Pag.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Data_Vencimento', 'Vencimento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Dias_Venc', 'Dias V.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Data_Pagamento', 'Pagamento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor', 'Valor Bruto', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Pagar', 'Valor Total', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Pago', 'Valor Pago', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Restante', 'Valor Rest.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'N_Cheque', 'Cheque', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Conta', 'Conta', Tipo_Relatorio);
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
    begin
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'N_Documento', 'Documento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Historico', 'Histórico', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Nome', 'Cli./Forn.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Data_Vencimento', 'Vencimento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Dias_Venc', 'Dias V.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Data_Pagamento', 'Pagamento', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor', 'Valor Bruto', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Pagar', 'Valor Total', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Pago', 'Valor Pago', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Valor_Restante', 'Valor Rest.', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'N_Cheque', 'Cheque', Tipo_Relatorio);
      Salva_Campos(Codigo_Empresa, Codigo_Usuario, 0, 'Conta', 'Conta', Tipo_Relatorio);
    end;
  end; }

  Atualiza_Campos(Codigo_Empresa, Codigo_Usuario, Tipo_Relatorio);
  //Atualiza_Campos_Visivel(Codigo_Empresa, Codigo_Usuario, Tipo_Relatorio);
  qtde_registro:= qCampos.FieldByName('Qtde').AsInteger;

  SetLength(QrLabel, qtde_registro);
  SetLength(QrDbText, qtde_registro);
  SetLength(Desc, qtde_registro);
  SetLength(Campo, qtde_registro);
  SetLength(Largura, qtde_registro);

  Setar_Largura;

  while not (qCampos.Eof) do
  begin
    Campo[i] := qCampos.FieldByName('Nome_Campo').AsString;
    Desc[i] := qCampos.FieldByName('Nome_Apresentacao').AsString;

    if (qCampos.FieldByName('Visivel').AsInteger = 0) then
    begin
      ListBox2.Items.Add(Desc[i]);
      Pagina :=  Pagina + Largura[PosCampo(Desc[i])];
    end
    else
    begin
      ListBox1.Items.Add(Desc[i]);
    end;

    inc(i);
    qCampos.Next;
  end;

  i:= 1;
  //qtde_registro:= qCamposInvisivel.FieldByName('Qtde').AsInteger;
  //SetLength(Desc, qtde_registro);
  //SetLength(Campo, qtde_registro);

  //qCamposVisivel.Close;
  //FreeAndNil(qCamposVisivel);
 { Atualiza_Campos_Visivel(Codigo_Empresa, Codigo_Usuario, Tipo_Relatorio);
  while not (qCamposVisivel.Eof) do
  begin
    //Campo[i] := qCamposInvisivel.FieldByName('Nome_Campo').AsString;
    //Desc[i] := qCamposInvisivel.FieldByName('Nome_Apresentacao').AsString;
    ListBox2.Items.Add(qCamposVisivel.FieldByName('Nome_Apresentacao').AsString);
    inc(i);
    Pagina :=  Pagina + Largura[PosCampo(qCamposVisivel.FieldByName('Nome_Apresentacao').AsString)];
    qCamposVisivel.Next;
  end;}

  {Atualiza_Campos_Invisivel(Codigo_Empresa, Codigo_Usuario, Tipo_Relatorio);
  while not (qCamposInvisivel.Eof) do
  begin
    //Campo[i] := qCamposInvisivel.FieldByName('Nome_Campo').AsString;
    //Desc[i] := qCamposInvisivel.FieldByName('Nome_Apresentacao').AsString;
    ListBox1.Items.Add(qCamposInvisivel.FieldByName('Nome_Apresentacao').AsString);
    inc(i);
    qCamposInvisivel.Next;
  end;}


end;

procedure TFrmEscolha_Campos_Imprimir.FormCreate(Sender: TObject);
var
  i:integer;
begin
  {if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 0) then
  begin
    tipo_relatorio:= 'Financeiro Sintetico 1 Documento';
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 1) then
  begin
    tipo_relatorio:= 'Financeiro Sintetico 1 Cli/Forn';
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> Nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) and (FrmConsulta_Lancamentos_Financeiros.RGAgrupa_Por.ItemIndex = 2) then
  begin
    tipo_relatorio:= 'Financeiro Sintetico 1 CondPag';
  end; }

  Verifica_Campos(UDeclaracao.Codigo_Empresa, UDeclaracao.codigo_usu, tipo_relatorio);

  //Pagina:= 1038;
end;

function TFrmEscolha_Campos_Imprimir.PosCampo(Campo: AnsiString): integer;
var
  i:integer;
begin
  for i := 1 to 12 do
  begin
    if Campo = Desc[i] then
    begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.SpeedButton1Click(Sender: TObject);
var
 i: integer;
begin
  if Listbox2.ItemIndex > 0 then
  begin
    i := ListBox2.ItemIndex;
    ListBox2.Items.Move(i,i-1);
    ListBox2.ItemIndex := i-1;
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.SBtnAdicionarClick(Sender: TObject);
begin
  // Verificamos se existem itens
  if Listbox1.ItemIndex >= 0 then
  begin
    // Verificamos se o nº de caracteres do campo não ultrapassa o total da pagina
    if Pagina + Largura[PosCampo(Listbox1.Items.Strings[ListBox1.ItemIndex])] > 1038 then
    begin
      ShowMessage('Campo supera o tamanho da página')
    end
    else
    begin
      // Adiciona o Campo escolhido na lista de seleção
      Pagina :=  Pagina + Largura[PosCampo(Listbox1.Items.Strings[ListBox1.ItemIndex])];
      Altera_Campos(UDeclaracao.Codigo_Empresa, UDeclaracao.codigo_usu, 0, tipo_relatorio, Listbox1.Items.Strings[ListBox1.ItemIndex]);
      ListBox2.Items.Add(ListBox1.Items.Strings[ListBox1.ItemIndex]);
      ListBox1.Items.Delete(ListBox1.ItemIndex);
    end;
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.SBtnRemoverClick(Sender: TObject);
begin
  if Listbox2.ItemIndex >= 0 then
  begin
    Pagina :=  Pagina - Largura[PosCampo(Listbox2.Items.Strings[ListBox2.ItemIndex])];
    Altera_Campos(UDeclaracao.Codigo_Empresa, UDeclaracao.codigo_usu, 1, tipo_relatorio, ListBox2.Items.Strings[ListBox2.ItemIndex]);
    ListBox1.Items.Add(ListBox2.Items.Strings[ListBox2.ItemIndex]);
    ListBox2.Items.Delete(ListBox2.ItemIndex);
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.SpeedButton4Click(Sender: TObject);
var
  i:integer;
begin
  if Listbox2.ItemIndex < ListBox2.Items.Count - 1  then
  begin
    i := ListBox2.ItemIndex;
    ListBox2.Items.Move(i,i+1);
    ListBox2.ItemIndex := i+1;
  end;
end;

procedure TFrmEscolha_Campos_Imprimir.imprime(pForm: TForm);
begin
  pForm:= TForm.Create(self);
  pForm.Print;
  pForm.Release;
  pForm:= Nil;
end;

procedure TFrmEscolha_Campos_Imprimir.visualiza_impressao(pForm: TForm);
begin
  //pForm:= FrmConsulta_Lancamento_Banco;
  pForm:= pForm.Create(self);
  pForm.Release;
  pForm:= Nil;
end;

end.
