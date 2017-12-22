unit UChama_Veiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, DBClient, Provider;

type
  TFrmChama_Veiculo = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_veiculo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_veiculoCodigo: TAutoIncField;
    qrychama_veiculoData_Cadastro: TDateTimeField;
    qrychama_veiculoVeiculo: TStringField;
    qrychama_veiculoCodigo_Cliente: TIntegerField;
    qrychama_veiculoCodigo_Marca: TIntegerField;
    qrychama_veiculoModelo: TStringField;
    qrychama_veiculoAno_Fabricacao: TStringField;
    qrychama_veiculoPlaca: TStringField;
    qrychama_veiculoChassi: TStringField;
    qrychama_veiculoRenavam: TStringField;
    qrychama_veiculoDescricao: TStringField;
    qrychama_veiculoNome_Nome_Fantasia: TStringField;
    qrychama_veiculoUF: TStringField;
    qrychama_veiculoANTT: TStringField;
    qrychama_veiculoTipo: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Veiculo: TFrmChama_Veiculo;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Veiculo, UPedido_Venda, UDeclaracao, UOS, UEntrada_Produtos,
  UNFE;

{$R *.dfm}

procedure TFrmChama_Veiculo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Veiculo.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Veiculo;
end;

procedure TFrmChama_Veiculo.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Veiculo <> Nil) and (FrmCadastro_Veiculo.ativo = true) then
  begin
    FrmCadastro_Veiculo.EdtCodigo.Text:= qrychama_veiculoCodigo.AsString;
    FrmCadastro_Veiculo.MEdtData_Cadastro.Text:= qrychama_veiculoData_Cadastro.AsString;
    FrmCadastro_Veiculo.EdtVeiculo.Text:= qrychama_veiculoVeiculo.AsString;
    FrmCadastro_Veiculo.EdtCodigo_Cliente.Text:= qrychama_veiculoCodigo_Cliente.AsString;
    FrmCadastro_Veiculo.EdtCliente.Text:= qrychama_veiculoNome_Nome_Fantasia.AsString;
    FrmCadastro_Veiculo.EdtCodigo_Marca.Text:= qrychama_veiculoCodigo_Marca.AsString;
    FrmCadastro_Veiculo.EdtMarca.Text:= qrychama_veiculoDescricao.AsString;
    FrmCadastro_Veiculo.EdtModelo.Text:= qrychama_veiculoModelo.AsString;
    FrmCadastro_Veiculo.EdtAno_Fabricacao.Text:= qrychama_veiculoAno_Fabricacao.AsString;
    FrmCadastro_Veiculo.EdtPlaca.Text:= qrychama_veiculoPlaca.AsString;
    FrmCadastro_Veiculo.EdtUF.Text:= qrychama_veiculoUF.AsString;
    FrmCadastro_Veiculo.EdtChassi.Text:= qrychama_veiculoChassi.AsString;
    FrmCadastro_Veiculo.EdtRenavam.Text:= qrychama_veiculoRenavam.AsString;
    FrmCadastro_Veiculo.EdtANTT.Text:= qrychama_veiculoANTT.AsString;

    if (qrychama_veiculoTipo.AsString = 'VEÍCULO') then
      FrmCadastro_Veiculo.RGTipo.ItemIndex:= 0
    else
      FrmCadastro_Veiculo.RGTipo.ItemIndex:= 1;

    FrmChama_Veiculo.Close;
    FrmCadastro_Veiculo.BBtnSalvar.Enabled:= true;
    FrmCadastro_Veiculo.BBtnExcluir.Enabled:= true;
    FrmCadastro_Veiculo.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Veiculo.BBtnCancelar.Enabled:= true;
    FrmCadastro_Veiculo.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Veiculo);
    FrmCadastro_Veiculo.achei:= true;
  end
  else if (FrmOS <> Nil) and (FrmOS.ativo = true) then
  begin
    FrmOS.EdtCodigo_Veiculo.Text:= qrychama_veiculoCodigo.AsString;
    FrmOS.EdtVeiculo.Text:= qrychama_veiculoVeiculo.AsString;
    FrmOS.LblMarca.Caption:= qrychama_veiculoDescricao.AsString;
    FrmOS.LblModelo.Caption:= qrychama_veiculoModelo.AsString;
    FrmOS.LblAno.Caption:= qrychama_veiculoAno_Fabricacao.AsString;
    FrmOS.LblPlaca.Caption:= qrychama_veiculoPlaca.AsString;
    FrmOS.LblRenavam.Caption:= qrychama_veiculoRenavam.AsString;
    FrmChama_Veiculo.Close;
  end
  else if (FrmEntrada_Produtos <> nil) and (FrmEntrada_Produtos.ativo = true) then
  begin
    FrmEntrada_Produtos.EdtCodigo_Veiculo.Text:= qrychama_veiculoCodigo.AsString;
    FrmEntrada_Produtos.EdtVeiculo.Text:= qrychama_veiculoPlaca.AsString;
    FrmEntrada_Produtos.EdtUF_Veiculo.Text:= qrychama_veiculoUF.AsString;
    FrmChama_Veiculo.Close;
  end
  else if (FrmNFE <> nil) and (FrmNFE.ativo = true) and (FrmNFE.veiculo = 1) then
  begin
    FrmNFE.EdtCodigo_Veiculo.Text:= qrychama_veiculoCodigo.AsString;
    FrmNFE.EdtVeiculo.Text:= qrychama_veiculoPlaca.AsString;
    FrmNFE.EdtUF_Veiculo.Text:= qrychama_veiculoUF.AsString;
    antt:= qrychama_veiculoANTT.AsString;
    placa_transportadora:= qrychama_veiculoPlaca.AsString;
    FrmChama_Veiculo.Close;
  end
  else if (FrmNFE <> nil) and (FrmNFE.ativo = true) and (FrmNFE.veiculo = 2) then
  begin
    FrmNFE.EdtCodigo_Reboque.Text:= qrychama_veiculoCodigo.AsString;
    FrmNFE.EdtReboque.Text:= qrychama_veiculoPlaca.AsString;
    FrmNFE.EdtUF_Reboque.Text:= qrychama_veiculoUF.AsString;
    antt_reboque:= qrychama_veiculoANTT.AsString;
    FrmChama_Veiculo.Close;
  end
  else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) then
  begin
    //FrmPedido_Venda.EdtCodigo_Veiculo.Text:= qrychama_veiculoCodigo.AsString;
    //FrmPedido_Venda.EdtPlaca.Text:= qrychama_veiculoPlaca.AsString;
    //FrmPedido_Venda.EdtMarca.Text:= qrychama_veiculoDescricao.AsString;
    //FrmPedido_Venda.EdtModelo:= qrychama_veiculoModelo.AsString;
    FrmChama_Veiculo.Close;
  end;
end;

procedure TFrmChama_Veiculo.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Veiculo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Veiculo.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_veiculo, Column);
end;

procedure TFrmChama_Veiculo.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Veiculo;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Veiculo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Veiculo.Release;
end;

procedure TFrmChama_Veiculo.FormCreate(Sender: TObject);
begin
  //Abre_Conexao(dm.ADOConnection1);
  //Inicializa_Dados_Principais_Movimentacao(3, qrychama_veiculo, qrychama_veiculo);
  //if (FileExists(Local_Arquivo(16))) then
    //qrychama_veiculo.LoadFromFile(Local_Arquivo(16));
end;

procedure TFrmChama_Veiculo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
