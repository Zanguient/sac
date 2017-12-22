unit UInforma_NNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, URegistro;

type
  TFrmInforma_NNF = class(TForm)
    EdtNota_Origem: TEdit;
    LblCodigo: TLabel;
    EdtNota_Destino: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    Entrada: URegistro.TEntrada_Produtos;
    Itens_Entrada: URegistro.TItens_Entrada;
    Imposto: URegistro.TImpostos_Entrada;
    Transporte: URegistro.TTransporte_Entrada;
    qAux: TADOQuery;

    procedure Chama_Nota_Origem;
    function Chama_Entrada: boolean;
    procedure Ver_Pedido;
  public
    { Public declarations }
  end;

var
  FrmInforma_NNF: TFrmInforma_NNF;

implementation

uses UDeclaracao, UDM, UEntrada_Produtos, UGera_Etiqueta_Cliente, UGeral;

{$R *.dfm}

procedure TFrmInforma_NNF.Button1Click(Sender: TObject);
begin
  if (EdtNota_Origem.Text = '') or (EdtNota_Destino.Text = '') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;

  if (Application.MessageBox('Confirma a copia da Nota fiscal?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    Chama_Nota_Origem;
  end;
end;

function TFrmInforma_NNF.Chama_Entrada: boolean;
begin
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('Select EP.*, IE.*, TE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao, Cid.UF,');
    add('Trans.Nome_Fantasia as Nome_Transportadora, Vei.Placa, Vei.UF from Entrada_Produtos EP');
    add('left join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
    add('left join Transporte_Entrada TE on (EP.N_Nota_Fiscal = TE.N_Nota_Fiscal)');
    add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');
    add('left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo)');
    add('left join Transportadora Trans on (TE.Codigo_Transportadora = Trans.Codigo)');
    add('left join Veiculo Vei on (TE.Codigo_Veiculo = Vei.Codigo)');
    add('where EP.Status = :Status and EP.N_Nota_Fiscal = :N_Nota_Fiscal');
    Parameters.ParamByName('N_Nota_Fiscal').Value:= EdtNota_Origem.Text;
    Parameters.ParamByName('Status').Value:= 'S';
    open;
  end;

  if (qAux.IsEmpty = false) then
  begin
    Result:= true;
    with FrmEntrada_Produtos.qryitens_entrada, sql do
    begin
      close;
      clear;
      add('select IE.*, P.Codigo_Venda, P.Descricao, P.Estoque, P.Saldo_Estoque, P.Volume  from Itens_Entrada IE');
      add('left join Produto P on(IE.Codigo_Produto = P.Codigo)');
      add('where IE.N_Nota_Fiscal = :N_Nota_Fiscal');
      Parameters.ParamByName('N_Nota_Fiscal').Value:= EdtNota_Origem.Text;
      open;
    end;
    Ver_Pedido;
    Entrada.Inserir_Copia(Entrada);
    Itens_Entrada.Inserir_Copia(Itens_Entrada);
    Imposto.Inserir_Copia(Imposto);
    Transporte.Inserir_Copia;

  end
  else
    Result:= false;
end;

procedure TFrmInforma_NNF.Chama_Nota_Origem;
begin
  if (Chama_Entrada) then
  begin
    FrmEntrada_Produtos.achei:= true;
    //Ver_Pedido;
    FrmEntrada_Produtos.Atualiza_Dados;
    FrmEntrada_Produtos.EdtModelo.SetFocus;
    FrmInforma_NNF.Close;
  end
  else
  begin
    Application.MessageBox('Verifique o número da nota fiscal de origem e tente novamente', 'Nota fiscal não encontrada', MB_OK+MB_ICONHAND);
    abort;
  end;

  //FrmEntrada_Produtos.Verifica_Nota;
end;

procedure TFrmInforma_NNF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmInforma_NNF.Release;
end;

procedure TFrmInforma_NNF.Ver_Pedido;
begin
  //EdtCodigo.Text:= qAux.FieldByName('Codigo').AsString;
  FrmEntrada_Produtos.EdtN_Nota_Fiscal.Text:= EdtNota_Destino.Text;
  FrmEntrada_Produtos.EdtModelo.Text:= qAux.FieldByName('Modelo').AsString;
  FrmEntrada_Produtos.EdtSerie.Text:= qAux.FieldByName('Serie').AsString;
  FrmEntrada_Produtos.MEdtData_Emissao.Text:= qAux.FieldByName('Data_Emissao').AsString;
  FrmEntrada_Produtos.MEdtHora_Emissao.Text:= qAux.FieldByName('Hora_Emissao').AsString;
  FrmEntrada_Produtos.MEdtData_Entrada.Text:= qAux.FieldByName('Data_Entrada').AsString;
  FrmEntrada_Produtos.MEdtHora_Entrada.Text:= qAux.FieldByName('Hora_Entrada').AsString;
  FrmEntrada_Produtos.EdtCodigo_Fornecedor.Text:= qAux.FieldByName('Codigo_Fornecedor').AsString;
  FrmEntrada_Produtos.EdtFornecedor.Text:= qAux.FieldByName('Nome_Fantasia').AsString;
  FrmEntrada_Produtos.uf_destino:= qAux.FieldByName('UF').AsString;
  FrmEntrada_Produtos.EdtCodigo_CFOP.Text:= qAux.FieldByName('Codigo_CFOP').AsString;
  FrmEntrada_Produtos.EdtCFOP.Text:= qAux.FieldByName('CFOP').AsString + ' - ' + qAux.FieldByName('Descricao').AsString;
  FrmEntrada_Produtos.EdtCFOP2.Text:= qAux.FieldByName('CFOP').AsString;
  FrmEntrada_Produtos.EdtQuantidade_Itens.Text:= qAux.FieldByName('Quantidade_Itens').AsString;
  FrmEntrada_Produtos.MmoObservacao.Text:= qAux.FieldByName('Observacao').AsString;
  FrmEntrada_Produtos.qtde:= qAux.FieldByName('Quantidade_Itens').AsInteger;

  if (qAux.FieldByName('Tipo_Frete').AsInteger = 0) then
    FrmEntrada_Produtos.RGTipo_Frete.ItemIndex := 0
  else if (qAux.FieldByName('Tipo_Frete').AsInteger = 1) then
    FrmEntrada_Produtos.RGTipo_Frete.ItemIndex := 1
  else if (qAux.FieldByName('Tipo_Frete').AsInteger = 2) then
    FrmEntrada_Produtos.RGTipo_Frete.ItemIndex := 2
  else if (qAux.FieldByName('Tipo_Frete').AsInteger = 9) then
    FrmEntrada_Produtos.RGTipo_Frete.ItemIndex := 3;

  if (qAux.FieldByName('Tipo_Pagamento').AsInteger = 0) then
    FrmEntrada_Produtos.RGTipo_Pagamento.ItemIndex := 0
  else if (qAux.FieldByName('Tipo_Pagamento').AsInteger = 1) then
    FrmEntrada_Produtos.RGTipo_Pagamento.ItemIndex := 1
  else if (qAux.FieldByName('Tipo_Pagamento').AsInteger = 9) then
    FrmEntrada_Produtos.RGTipo_Pagamento.ItemIndex := 2;

  FrmEntrada_Produtos.EdtCodigo_Transportadora.Text:= qAux.FieldByName('Codigo_Transportadora').AsString;
  FrmEntrada_Produtos.EdtTransportadora.Text:= qAux.FieldByName('Nome_Transportadora').AsString;

  FrmEntrada_Produtos.EdtCodigo_Veiculo.Text:= qAux.FieldByName('Codigo_Veiculo').AsString;
  FrmEntrada_Produtos.EdtVeiculo.Text:= qAux.FieldByName('Placa').AsString;
  FrmEntrada_Produtos.EdtUF_Veiculo.Text:= qAux.FieldByName('UF').AsString;

  FrmEntrada_Produtos.EdtQuantidade_Transportada.Text:= qAux.FieldByName('Quantidade').AsString;
  FrmEntrada_Produtos.EdtEspecie.Text:= qAux.FieldByName('Especie').AsString;
  FrmEntrada_Produtos.EdtMarca.Text:= qAux.FieldByName('Marca').AsString;
  FrmEntrada_Produtos.EdtNumero_Transportado.Text:= qAux.FieldByName('Numero').AsString;
  FrmEntrada_Produtos.EdtPeso_Bruto.Text:= qAux.FieldByName('Peso_Bruto').AsString;
  FrmEntrada_Produtos.EdtPeso_Liquido.Text:= qAux.FieldByName('Peso_Liquido').AsString;

  FrmEntrada_Produtos.EdtTotal_Produtos.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total_Produtos').AsFloat);
  FrmEntrada_Produtos.EdtTotal_Produtos.Text:= StringReplace(FrmEntrada_Produtos.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtBase_ICMS.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Base_ICMS').AsFloat);
  FrmEntrada_Produtos.EdtBase_ICMS.Text:= StringReplace(FrmEntrada_Produtos.EdtBase_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtValor_ICMS.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Valor_ICMS').AsFloat);
  FrmEntrada_Produtos.EdtValor_ICMS.Text:= StringReplace(FrmEntrada_Produtos.EdtValor_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtBase_ICMS_Substituicao.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Base_ICMS_Subs').AsFloat);
  FrmEntrada_Produtos.EdtBase_ICMS_Substituicao.Text:= StringReplace(FrmEntrada_Produtos.EdtBase_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtValor_ICMS_Substituicao.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Valor_ICMS_Subs').AsFloat);
  FrmEntrada_Produtos.EdtValor_ICMS_Substituicao.Text:= StringReplace(FrmEntrada_Produtos.EdtValor_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtValor_Frete.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Valor_Frete').AsFloat);
  FrmEntrada_Produtos.EdtValor_Frete.Text:= StringReplace(FrmEntrada_Produtos.EdtValor_Frete.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtValor_Seguro.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Valor_Seguro').AsFloat);
  FrmEntrada_Produtos.EdtValor_Seguro.Text:= StringReplace(FrmEntrada_Produtos.EdtValor_Seguro.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtOutras_Despesas.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Outras_Despesas').AsFloat);
  FrmEntrada_Produtos.EdtOutras_Despesas.Text:= StringReplace(FrmEntrada_Produtos.EdtValor_Seguro.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtTotal_IPI.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total_IPI').AsFloat);
  FrmEntrada_Produtos.EdtTotal_IPI.Text:= StringReplace(FrmEntrada_Produtos.EdtTotal_IPI.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtDesconto.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Desconto').AsFloat);
  FrmEntrada_Produtos.EdtDesconto.Text:= StringReplace(FrmEntrada_Produtos.EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.EdtTotal_Nota.Text:= FormatFloat('#0.0,00', qAux.FieldByName('Total_Nota').AsFloat);
  FrmEntrada_Produtos.EdtTotal_Nota.Text:= StringReplace(FrmEntrada_Produtos.EdtTotal_Nota.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmEntrada_Produtos.BBtnSalvar.Enabled:= true;
  FrmEntrada_Produtos.BBtnExcluir.Enabled:= true;
  FrmEntrada_Produtos.BBtnCancelar.Enabled:= false;
  FrmEntrada_Produtos.BBtnCancela_Nota.Enabled:= false;
  FrmEntrada_Produtos.BBtnCopia_Nota.Enabled:= false;
end;

end.
