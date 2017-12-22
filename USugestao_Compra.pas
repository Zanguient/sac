unit USugestao_Compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils, DateUtils, UConsulta;

type
  TFrmSugestao_Compra = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnPesquisa: TToolButton;
    BBtnGera_Entrega: TToolButton;
    BBtnFechar: TToolButton;
    qrysugestao_compra: TADOQuery;
    rs: TRSPrinter;
    LblCPF: TLabel;
    LblEndereco: TLabel;
    LblSetor: TLabel;
    LblTelefone: TLabel;
    LblCidade: TLabel;
    LblUF: TLabel;
    LblTipo_Logradouro: TLabel;
    LblNumero: TLabel;
    LblPedido: TLabel;
    DBGrid2: TDBGrid;
    ds_qry_compra: TDataSource;
    BBtnAltera: TToolButton;
    TabSheet2: TTabSheet;
    RGConsulta_Por: TRadioGroup;
    LblData_Cadastro: TLabel;
    MEdtData_Inicial: TMaskEdit;
    Label3: TLabel;
    MEdtData_Final: TMaskEdit;
    BBtnLimpar: TToolButton;
    Edit2: TEdit;
    EdtDias_Uteis: TEdit;
    Edit1: TEdit;
    EdtDias_Corridos: TEdit;
    Edit4: TEdit;
    EdtMedia_Ultimo_3_Meses: TEdit;
    Edit6: TEdit;
    EdtMedia_Ultimo_6_Meses: TEdit;
    Edit8: TEdit;
    EdtMedia_Ultimo_12_Meses: TEdit;
    Edit5: TEdit;
    EdtSaida_Mes_Atual: TEdit;
    Edit7: TEdit;
    EdtEntrada_Pendente: TEdit;
    Edit9: TEdit;
    EdtSaida_Pendente: TEdit;
    qrysugestao_compraCodigo_Original: TStringField;
    qrysugestao_compraCodigo_Venda: TStringField;
    qrysugestao_compraDescricao: TStringField;
    qrysugestao_compraValor_Compra: TFloatField;
    qrysugestao_compraSigla: TStringField;
    qrysugestao_compratotal_vendido: TFloatField;
    qrysugestao_compraprevisao_venda: TFloatField;
    qrysugestao_compraprevisao_venda_entrega: TFloatField;
    qrysugestao_compramedia_diaria: TFloatField;
    qrysugestao_compraEstoque: TFloatField;
    qrysugestao_comprasugestao: TFloatField;
    EdtDias_Entrega: TEdit;
    Label1: TLabel;
    qrysugestao_comprapendente: TFloatField;
    qrysugestao_compraEstoque_Maximo: TFloatField;
    qrysugestao_compraCodigo_Produto: TIntegerField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Atualiza_Dados;
    procedure Chama_Itens;
    procedure Chama_Pendentes;
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnPesquisaClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Util: TUtil;
    dias_anterior: integer;
    data_inicio, data_fim: TDate;
  public
    ativo: boolean;
    tipo: string;
  end;

var
  FrmSugestao_Compra: TFrmSugestao_Compra;
  Consulta: TConsulta;
implementation

uses UDM, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmSugestao_Compra.Atualiza_Dados;
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
    add('update Itens_Pedido set Qtde_Entregue = :Qtde_Entregue, Qtde_Restante = :Qtde_Restante');
    add('where N_Pedido = :Pedido and Codigo_Produto = :Produto');
    {Parameters.ParamByName('Qtde_Entregue').Value:= StrToFloat(EdtQtde_Entregue.Text);
    Parameters.ParamByName('Qtde_Restante').Value:= StrToFloat(EdtQtde_Restante.Text);
    Parameters.ParamByName('Pedido').Value:= qrypedidoN_Pedido.AsString;
    Parameters.ParamByName('Produto').Value:= StrToInt(LblProduto.Caption);}
    ExecSQL;
  end;
  finally
    FreeAndNil(qAux);
  end;

  Chama_Itens;
end;

procedure TFrmSugestao_Compra.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmSugestao_Compra.BBtnLimparClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  TabSheet1.Enabled:= false;
  qrysugestao_compra.Close;
  BBtnPesquisa.Enabled:= true;
  BBtnGera_Entrega.Enabled:= false;
  BBtnAltera.Enabled:= false;
  BBtnLimpar.Enabled:= false;
end;

procedure TFrmSugestao_Compra.BBtnPesquisaClick(Sender: TObject);
begin
  if (MEdtData_Inicial.Text <> '  /  /    ') and (MEdtData_Final.Text <> '  /  /    ') then
  begin
    EdtDias_Uteis.Text:= IntToStr(Dias_Uteis(StrToDateTime(MEdtData_Inicial.Text), StrToDateTime(MEdtData_Final.Text)));
    EdtDias_Corridos.Text:= IntToStr(DaysBetween(StrToDateTime(MEdtData_Final.Text), StrToDateTime(MEdtData_Inicial.Text)));
  end;

  Consulta.Sugestao_Compra;
  if (qrysugestao_compra.IsEmpty = false) then
  begin
    BBtnPesquisa.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    TabSheet1.Enabled:= true;
    PageControl1.TabIndex:= 1;
    data_inicio:= StrToDateTime(MEdtData_Inicial.Text) - 365;
    data_fim:= StrToDateTime(MEdtData_Final.Text) - 365;
    dias_anterior:= Dias_Uteis(data_inicio, data_fim);
  end;
end;

procedure TFrmSugestao_Compra.Chama_Itens;
var
  qAux: TADOQuery;
  data, hoje: Tdate;
  dia1, dia2, dia3: integer;
begin
  qAux:= TADOQuery.Create(self);
  try
    hoje:= date;
    //últimos 90 dias
    data:= hoje - 90;
    dia1:= DaysBetween(hoje, data);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IP.Codigo_Produto, (sum(IP.Qtde) / :Dia) as total from Itens_Pedido IP');
      add('inner join Pedido P on (IP.Codigo = P.Codigo)');
      add('where P.Data_Venda between :DI and :DF and IP.Codigo_Produto = :Produto and P.Status = :Status');
      add('group by IP.Codigo_Produto');
      Parameters.ParamByName('Dia').Value:= dia1;
      Parameters.ParamByName('DI').Value:= data;
      Parameters.ParamByName('DF').Value:= hoje;
      Parameters.ParamByName('Produto').Value:= qrysugestao_compraCodigo_Produto.AsInteger;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      open;
    end;
    EdtMedia_Ultimo_3_Meses.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total').AsFloat);

    //últimos 180 dias
    data:= hoje - 180;
    dia2:= DaysBetween(hoje, data);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IP.Codigo_Produto, (sum(IP.Qtde) / :Dia) as total from Itens_Pedido IP');
      add('inner join Pedido P on (IP.Codigo = P.Codigo)');
      add('where P.Data_Venda between :DI and :DF and IP.Codigo_Produto = :Produto and P.Status = :Status');
      add('group by IP.Codigo_Produto');
      Parameters.ParamByName('Dia').Value:= dia2;
      Parameters.ParamByName('DI').Value:= data;
      Parameters.ParamByName('DF').Value:= hoje;
      Parameters.ParamByName('Produto').Value:= qrysugestao_compraCodigo_Produto.AsInteger;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      open;
    end;
    EdtMedia_Ultimo_6_Meses.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total').AsFloat);

    //últimos 365 dias
    data:= hoje - 365;
    dia3:= DaysBetween(hoje, data);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IP.Codigo_Produto, (sum(IP.Qtde) / :Dia) as total from Itens_Pedido IP');
      add('inner join Pedido P on (IP.Codigo = P.Codigo)');
      add('where P.Data_Venda between :DI and :DF and IP.Codigo_Produto = :Produto and P.Status = :Status');
      add('group by IP.Codigo_Produto');
      Parameters.ParamByName('Dia').Value:= dia3;
      Parameters.ParamByName('DI').Value:= data;
      Parameters.ParamByName('DF').Value:= hoje;
      Parameters.ParamByName('Produto').Value:= qrysugestao_compraCodigo_Produto.AsInteger;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      open;
    end;
    EdtMedia_Ultimo_12_Meses.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total').AsFloat);
  finally
    FreeAndNil(qAux);
  end;

end;

procedure TFrmSugestao_Compra.Chama_Pendentes;
var
  qAux: TADOQuery;
  hoje: TDate;
begin
  hoje:= date;
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IP.Codigo_Produto, (sum(IP.Qtde_Restante)) as total from Itens_Pedido IP');
      add('inner join Pedido P on (IP.Codigo = P.Codigo)');
      add('where IP.Codigo_Produto = :Produto and P.Status = :Status');
      add('group by IP.Codigo_Produto');
      Parameters.ParamByName('Produto').Value:= qrysugestao_compraCodigo_Produto.AsInteger;
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      open;
    end;
    EdtSaida_Pendente.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total').AsFloat);

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IP.Codigo_Produto, (sum(IP.Qtde)) as total from Itens_Pedido IP');
      add('inner join Pedido P on (IP.Codigo = P.Codigo)');
      add('where P.Data_Venda between :DI and :DF and IP.Codigo_Produto = :Produto and P.Status = :Status');
      add('group by IP.Codigo_Produto');
      Parameters.ParamByName('DI').Value:= Primeiro_Dia(hoje);
      Parameters.ParamByName('DF').Value:= hoje;
      Parameters.ParamByName('Produto').Value:= qrysugestao_compraCodigo_Produto.AsInteger;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      open;
    end;
    EdtSaida_Mes_Atual.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total').AsFloat);

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IC.Codigo_Produto, (sum(IC.Qtde_Restante)) as total from Itens_Compra IC');
      add('where IC.Codigo_Produto = :Produto');
      add('group by IC.Codigo_Produto');
      Parameters.ParamByName('Produto').Value:= qrysugestao_compraCodigo_Produto.AsInteger;
      open;
    end;
    EdtEntrada_Pendente.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total').AsFloat);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmSugestao_Compra.DBGrid2CellClick(Column: TColumn);
begin
  Chama_Itens;
  Chama_Pendentes;
  //BBtnGera_Entrega.Enabled:= true;
  //BBtnAltera.Enabled:= true;
end;

procedure TFrmSugestao_Compra.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmSugestao_Compra.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Chama_Itens;
     BBtnGera_Entrega.Enabled:= true;
    BBtnAltera.Enabled:= true;
  end;
end;

procedure TFrmSugestao_Compra.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmSugestao_Compra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmSugestao_Compra.Free;
  FrmSugestao_Compra:= Nil;
end;

procedure TFrmSugestao_Compra.FormCreate(Sender: TObject);
begin
  //Util.Limpa_Campos(FrmSugestao_Compra);
  PageControl1.TabIndex:= 0;
end;

procedure TFrmSugestao_Compra.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmSugestao_Compra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmSugestao_Compra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
