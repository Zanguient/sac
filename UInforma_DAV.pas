unit UInforma_DAV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, RSPrint, ExtCtrls;

type
  TFrmInforma_DAV = class(TForm)
    EdtPedido: TEdit;
    RS: TRSPrinter;
    RGTipo: TRadioGroup;
    Button1: TButton;
    procedure EdtPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    qAux_DAV, qAux_Dados, qAux_Servico, qAux_Veiculo: TADOQuery;
    desc, acr: double;

    linha, conta, i, i2: integer;
    dav, dav2, tipo_rel, rodape: string;
    cn, cp: string;

    procedure Imprime_DAV;
    procedure Imprime_DAV_OS;
    procedure Pega_Itens;
    procedure Verifica_Produto;
    procedure Cabecalho_DAV;
  public
    { Public declarations }
  end;

var
  FrmInforma_DAV: TFrmInforma_DAV;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmInforma_DAV.Button1Click(Sender: TObject);
var
  i, i2: integer;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 0;
  for i := i to 300 do
  begin
    if (i2 = rs.Lines) then
    begin
      rs.NewPage;
      i2:= 0;
    end;
    inc(i2);
    rs.Write(i2, 1, IntToStr(i) + ' TESTE');
  end;
  rs.PreviewReal;
end;

procedure TFrmInforma_DAV.EdtPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Application.MessageBox('Função temporariamente desabilitada. Para reimprimir um DAV, vá em Movimentações > Gerar Venda. Após isso, pressione F2, digite o número do orçamento desejado e pressione Enter. Clique em Salvar e imprima o orçamento.', 'Função indisponível', MB_OK+MB_ICONEXCLAMATION);
  {if (key = VK_RETURN) then
  begin
    if (RGTipo.ItemIndex = 0) then
    begin
      Verifica_Produto;
      Pega_Itens;
      Imprime_DAV;
    end
    else
    begin
      Verifica_Produto;
      Pega_Itens;
      Imprime_DAV_OS;
    end;
  end;}
end;

procedure TFrmInforma_DAV.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmInforma_DAV.Free;
  FrmInforma_DAV:= nil;
end;

procedure TFrmInforma_DAV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    close;
end;

procedure TFrmInforma_DAV.Cabecalho_DAV;
var
  i: integer;
  endereco: AnsiString;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;
  i:= 0;
  i2:= 136;
  linha:= 0;
  conta:= 0;

  dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  dav2:= 'NÃO COMPROVA PAGAMENTO';
  tipo_rel:= 'DOCUMENTO AUXILIAR DE VENDA - ORÇAMENTO';


  inc(linha);
  rs.WriteFont(linha, Alinha_Centro(tipo_rel,i2),tipo_rel, [Bold] + [DobleWide]);
  inc(linha);
  rs.WriteFont(linha, Alinha_Centro(dav,i2), dav, [Bold] + [DobleWide]);
  inc(linha);
  rs.WriteFont(linha, Alinha_Centro(dav2,i2), dav2, [Bold] + [DobleWide]);

  inc(linha);
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(qAux_Dados.FieldByName('CPF').AsString,1,3)+'.'+Copy(qAux_Dados.FieldByName('CPF').AsString,4,3)+'.'+Copy(qAux_Dados.FieldByName('CPF').AsString,7,3)+'-'+
    Copy(qAux_Dados.FieldByName('CPF').AsString,10,2);

  //endereco:= LblTipo_Logradouro.Caption + ' ' + LblEndereco.Caption + ', Nº ' + LblNumero.Caption;
  inc(linha);
  rs.Write(linha,0, 'Empresa');
  rs.Write(linha,50, 'CNPJ');
  inc(linha);
  rs.Write(linha,0, nome_fantasia);
  rs.Write(linha,50, cn);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  inc(linha);
  rs.Write(linha,0, 'Destinatário');
  rs.Write(linha,50, 'CPF/CNPJ');
  inc(linha);
  rs.Write(linha,0,qAux_Dados.FieldByName('Nome_Nome_Fantasia').AsString);
  rs.Write(linha,50, cp);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  inc(linha);
  rs.Write(linha,0, 'Número do Documento: ' + qAux_DAV.FieldByName('N_Pedido').AsString);
  rs.Write(linha, 40, 'Número do Documento Fiscal: ' + qAux_DAV.FieldByName('COO').AsString);
  rs.Write(linha, 90, 'Página Nº: ' + IntToStr(rs.PageNo));

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  linha:= linha + 2;
  rs.WriteFont(linha,0,'Produtos', [Underline]);
  linha:= linha + 2;
  rs.WriteFont(linha,0,'Código Produto', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 74, 'Un.', [Underline]);
  rs.WriteFont(linha, 80, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 88, 'Valor Un.', [Underline]);
  rs.WriteFont(linha, 105, 'Valor Total', [Underline]);
  rs.WriteFont(linha, 120, 'Cancelado', [Underline]);
  linha:= linha + 2;
end;

procedure TFrmInforma_DAV.Imprime_DAV;
var
  i: integer;
begin
  Cabecalho_DAV;

  qAux_DAV.First;
  while not qAux_DAV.Eof do
  begin
    rs.Write(linha, 0, qAux_DAV.FieldByName('Codigo_Venda').AsString);
    rs.Write(linha, 16, qAux_DAV.FieldByName('Descricao').AsString);
    rs.Write(linha, 74, qAux_DAV.FieldByName('UN').AsString);
    rs.Write(linha, 80, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Qtde').AsFloat));
    rs.Write(linha, 88, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Valor_Unitario').AsFloat));
    rs.Write(linha, 105, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Sub_Total').AsFloat));
    rs.Write(linha, 124, qAux_DAV.FieldByName('Cancelado').AsString);
    Inc(linha);

    if (linha = rs.Lines) then
    begin
      rs.NewPage;
      Cabecalho_DAV;
    end;

    qAux_DAV.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha + 1,i, '-');

  if (linha <= rs.Lines - 3) then
  begin
    i:= 1;
    rs.Write(linha + 2, i, 'Qtde. Itens.......: ' + qAux_DAV.FieldByName('Qtde_Itens').AsString);
    rs.WriteFont(linha + 3, i, 'Total Pedido......: ' + FormatFloat('#0.0,0', qAux_DAV.FieldByName('Total_Pedido').AsFloat), [Bold]);
  end
  else
  begin
    rs.NewPage;
    linha:= 1;
    i:= 1;
    rs.Write(linha, i, 'Qtde. Itens.......: ' + qAux_DAV.FieldByName('Qtde_Itens').AsString);
    rs.WriteFont(linha + 1, i, 'Total Pedido......: ' + FormatFloat('#0.0,0', qAux_DAV.FieldByName('Total_Pedido').AsFloat), [Bold]);
  end;

  rodape:= 'É vedada a autenticação deste documento';

  if (linha <= rs.Lines - 1) then
    rs.Write(linha + 7,Alinha_Centro(rodape, i2), rodape)
  else
  begin
    rs.NewPage;
    linha:= 1;
    rs.Write(linha,Alinha_Centro(rodape, i2), rodape)
  end;
  rs.Print;
end;

procedure TFrmInforma_DAV.Imprime_DAV_OS;
var
  i, i2, linha: integer;
  dav, dav2, tipo_rel, rodape: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 136;

  dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  dav2:= 'NÃO COMPROVA PAGAMENTO';
  tipo_rel:= 'DOCUMENTO AUXILIAR DE VENDA - ORDEM DE SERVIÇO';

  rs.WriteFont(1, Alinha_Centro(tipo_rel,i2),tipo_rel, [Bold] + [DobleWide]);
  rs.WriteFont(2, Alinha_Centro(dav,i2), dav, [Bold] + [DobleWide]);
  rs.WriteFont(3, Alinha_Centro(dav2,i2), dav2, [Bold] + [DobleWide]);

  for i := 0 to i2 do
    rs.Write(4,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(qAux_Dados.FieldByName('CPF').AsString,1,3)+'.'+Copy(qAux_Dados.FieldByName('CPF').AsString,4,3)+'.'+Copy(qAux_Dados.FieldByName('CPF').AsString,7,3)+'-'+
    Copy(qAux_Dados.FieldByName('CPF').AsString,10,2);

  rs.Write(5,0, 'Denominação');
  rs.Write(5,50, 'CNPJ');
  rs.Write(6,0, nome_fantasia);
  rs.Write(6,50, cn);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(7,i,'-');

  rs.Write(8,0, 'Identificação do Destinatário');
  rs.Write(8,50, 'CPF/CNPJ');
  rs.Write(9,0, qAux_Dados.FieldByName('Nome_Nome_Fantasia').AsString);
  rs.Write(9,50, cp);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(10,i,'-');
  rs.Write(11,0, 'Veículo: ' + qAux_Veiculo.FieldByName('Veiculo').AsString); rs.Write(11,60, 'Renavam: ' + qAux_Veiculo.FieldByName('Renavam').AsString);
  rs.Write(12,0, 'Marca: ' + qAux_Veiculo.FieldByName('Marca').AsString); rs.Write(12,30, 'Modelo: ' + qAux_Veiculo.FieldByName('Modelo').AsString + ' - ' + qAux_Veiculo.FieldByName('Ano_Fabricacao').AsString);
  rs.Write(13, 0, 'Placa: ' + qAux_Veiculo.FieldByName('Placa').AsString);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(14,i, '-');

  rs.Write(15,0, 'Número do Documento: ' + qAux_DAV.FieldByName('N_Pedido').AsString);
  rs.Write(15, 40, 'Número do Documento Fiscal: ' + qAux_DAV.FieldByName('COO').AsString);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(16,i, '-');

  rs.WriteFont(18,0,'Produtos', [Underline]);
  rs.WriteFont(19,0,'Código Produto', [Underline]);
  rs.WriteFont(19, 16, 'Descrição', [Underline]);
  rs.WriteFont(19, 74, 'Un.', [Underline]);
  rs.WriteFont(19, 80, 'Qtde.', [Underline]);
  rs.WriteFont(19, 88, 'Valor Un.', [Underline]);
  //rs.WriteFont(19, 85, 'Desc.', [Underline]);
  //rs.WriteFont(19, 95, 'Acr.', [Underline]);
  rs.WriteFont(19, 105, 'Valor Total', [Underline]);
  rs.WriteFont(19, 120, 'Canc.', [Underline]);

  {with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo, UM.Sigla as Unidade from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    Parameters.ParamByName('Tipo').Value:= 0;
    open;
    First;
  end; }

  linha:= 21;
  qAux_DAV.First;
  while not qAux_DAV.Eof do
  begin
    rs.Write(linha, 0, qAux_DAV.FieldByName('Codigo_Venda').AsString);
    rs.Write(linha, 16, qAux_DAV.FieldByName('Descricao').AsString);
    rs.Write(linha, 74, qAux_DAV.FieldByName('UN').AsString);
    rs.Write(linha, 80, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Qtde').AsFloat));
    rs.Write(linha, 88, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Valor_Unitario').AsFloat));
    //rs.Write(linha, 85, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Desconto_1').AsFloat));
    //rs.Write(linha, 95, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Acrecimo_1').AsFloat));
    rs.Write(linha, 105, FormatFloat('#0.0,0', qAux_DAV.FieldByName('Sub_Total').AsFloat));
    rs.Write(linha, 124, qAux_DAV.FieldByName('Cancelado').AsString);
    Inc(linha);
    qAux_DAV.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  linha:= linha + 1;
  rs.WriteFont(linha,0,'Serviços', [Underline]);
  linha:= linha + 2;
  rs.WriteFont(linha,0,'Código Serviço', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 74, 'Valor Un.', [Underline]);
  //rs.WriteFont(linha, 85, 'Desc.', [Underline]);
  //rs.WriteFont(linha, 92, 'Valor Total', [Underline]);
  rs.WriteFont(linha, 90, 'Canc.', [Underline]);

  {with qryitens_os, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo, UM.Sigla as Unidade from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    Parameters.ParamByName('Tipo').Value:= 1;
    open;
    First;
  end;}

  linha:= linha + 2;
  qAux_Servico.First;
  while not qAux_Servico.Eof do
  begin
    rs.Write(linha, 0, qAux_Servico.FieldByName('Codigo_Venda').AsString);
    rs.Write(linha, 16, qAux_Servico.FieldByName('Descricao').AsString);
    rs.Write(linha, 74, FormatFloat('#0.0,0', qAux_Servico.FieldByName('Valor_Unitario').AsFloat));
    //rs.Write(linha, 85, FormatFloat('#0.0,0', qAux_Servico.FieldByName('Desconto_1').AsFloat));
    //rs.Write(linha, 92, FormatFloat('#0.0,0', qAux_Servico.FieldByName('Sub_Total').AsFloat));
    rs.Write(linha, 94, qAux_Servico.FieldByName('Cancelado').AsString);
    Inc(linha);
    qAux_Servico.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha + 1,i, '-');

  rs.Write(linha + 2, 0, 'DAV-OS Anteriores');
  rs.Write(linha + 3, 0, qAux_DAV.FieldByName('DAVAnt').AsString);

  rodape:= 'É vedada a autenticação deste documento';
  rs.Write(linha + 10,Alinha_Centro(rodape, i2), rodape);
  rs.Print;
end;

procedure TFrmInforma_DAV.Pega_Itens;
begin
  qAux_DAV:= TADOQuery.Create(self);
  qAux_Dados:= TADOQuery.Create(self);
  acr:= 0;
  desc:= 0;

  if (RGTipo.ItemIndex = 0) then
  begin
    with qAux_DAV, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.*, IP.* from Pedido Ped');
      add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
      add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('where Ped.N_Pedido = :Pedido and P.Tipo = :Tipo and (Ped.Tipo = :DAV or Ped.DAVC = :SIM)');
      Parameters.ParamByName('Pedido').Value:= StringOfChar('0', 12-Length(EdtPedido.Text)) + EdtPedido.Text;
      Parameters.ParamByName('Tipo').Value:= 0;
      Parameters.ParamByName('DAV').Value:= 'DAV';
      Parameters.ParamByName('SIM').Value:= 'SIM';
      open;
      First;
    end;

    while not qAux_DAV.Eof do
    begin
      if (qAux_DAV.FieldByName('Cancelado').AsString = 'S') then
        qAux_DAV.Next
      else
      begin
        if (qAux_DAV.FieldByName('Desc_Acr_1').AsFloat > 0) then
          acr:= acr + qAux_DAV.FieldByName('Desc_Acr_1').AsFloat
        else
          desc:= desc + qAux_DAV.FieldByName('Desc_Acr_1').AsFloat;
        qAux_DAV.Next;
      end;

    end;

  end
  else
  begin
    with qAux_DAV, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.*, IP.*, P.Codigo_Venda, P.Descricao from Pedido Ped');
      add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
      add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('where Ped.N_Pedido = :Pedido and P.Tipo = :Tipo and Ped.Tipo = :DAV');
      Parameters.ParamByName('Pedido').Value:= StringOfChar('0', 12-Length(EdtPedido.Text)) + EdtPedido.Text;
      Parameters.ParamByName('Tipo').Value:= 0;
      Parameters.ParamByName('DAV').Value:= 'DAV-OS';
      open;
    end;
  end;

  with qAux_Dados, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select Cli.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L.Tipo_Logradouro from Cliente Cli');
    add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
    add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
    add('left join Logradouro L on (Cli.Codigo_Logradouro = L.Codigo)');
    add('where Cli.Codigo = :Cliente');
    Parameters.ParamByName('Cliente').Value:= qAux_DAV.FieldByName('Codigo_Cliente').AsInteger;
    open;
  end;

  if (RGTipo.ItemIndex = 1) then
  begin
    qAux_Veiculo:= TADOQuery.Create(self);
    with qAux_Veiculo, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select V.*, M.Descricao as Marca from Veiculo V');
      add('left join Marca M on (V.Codigo_Marca = M.Codigo)');
      add('where V.Codigo = :Veiculo');
      Parameters.ParamByName('Veiculo').Value:= qAux_DAV.FieldByName('Codigo_Veiculo').AsInteger;
      open;
    end;

    qAux_Servico:= TADOQuery.Create(self);
    with qAux_Servico, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.*, IP.* from Pedido Ped');
      add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
      add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('where Ped.N_Pedido = :Pedido and P.Tipo = :Tipo');
      Parameters.ParamByName('Pedido').Value:= StringOfChar('0', 12-Length(EdtPedido.Text)) + EdtPedido.Text;
      Parameters.ParamByName('Tipo').Value:= 1;
      open;
    end;
  end;
end;

procedure TFrmInforma_DAV.Verifica_Produto;
var
  qAux: TADOQuery;
begin
  if (EdtPedido.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPedido.SetFocus;
    abort;
  end;

  qAux:= TADOQuery.Create(self);

  if (RGTipo.ItemIndex = 0) then
  begin
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.N_Pedido from Pedido Ped');
      add('where Ped.N_Pedido = :Pedido and (Ped.Tipo = :DAV or Ped.DAVC = :SIM)');
      Parameters.ParamByName('Pedido').Value:= StringOfChar('0', 12-Length(EdtPedido.Text)) + EdtPedido.Text;
      Parameters.ParamByName('DAV').Value:= 'DAV';
      Parameters.ParamByName('SIM').Value:= 'SIM';
      open;

      if (IsEmpty) then
      begin
        Application.MessageBox('Número do DAV não encontrado.', 'DAV não encontrado', MB_OK+MB_ICONHAND);
        EdtPedido.SetFocus;
        abort;
      end;
    end;
  end
  else
  begin
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.N_Pedido from Pedido Ped');
      add('where Ped.N_Pedido = :Pedido and Ped.Tipo = :DAV');
      Parameters.ParamByName('Pedido').Value:= StringOfChar('0', 12-Length(EdtPedido.Text)) + EdtPedido.Text;
      Parameters.ParamByName('DAV').Value:= 'DAV-OS';
      open;

      if (IsEmpty) then
      begin
        Application.MessageBox('Número do DAV-OS não encontrado.', 'DAV-OS não encontrado', MB_OK+MB_ICONHAND);
        EdtPedido.SetFocus;
        abort;
      end;
    end;
  end;
end;

end.
