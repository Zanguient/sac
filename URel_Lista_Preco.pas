unit URel_Lista_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, QRExport;

type
  TFrmRel_Lista_Preco = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRGroup1: TQRGroup;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel2: TQRLabel;
    qryconsulta: TADOQuery;
    qryconsultaCodigo_Venda: TStringField;
    qryconsultaDescricao: TStringField;
    qryconsultaData_Fabricacao: TDateTimeField;
    qryconsultaData_Validade: TDateTimeField;
    qryconsultaValor_Compra: TFloatField;
    qryconsultaPreco_Vista: TFloatField;
    qryconsultaGrupo_Produto: TStringField;
    qryconsultaMarca: TStringField;
    qryconsultaLocal: TStringField;
    qryconsultaDetalhe: TStringField;
    qryconsultaNome_Fantasia: TStringField;
    QRLabel16: TQRLabel;
    LblConsulta_Por: TQRLabel;
    QRLabel18: TQRLabel;
    LblParametro: TQRLabel;
    qryconsultaCodigo: TAutoIncField;
    qryconsultaCodigo_Original: TStringField;
    qryconsultaCodigo_Similar: TStringField;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExcelFilter1: TQRExcelFilter;
    QRBand2: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    qryconsultaPreco_Prazo: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qryconsultaData_FabricacaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryconsultaData_ValidadeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Lista_Preco: TFrmRel_Lista_Preco;

implementation

uses UGeral, UDeclaracao, UConsulta_Custo_Venda, UConsulta_Produto_Cadastrado;

{$R *.dfm}

procedure TFrmRel_Lista_Preco.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Lista_Preco.qryconsultaData_FabricacaoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

procedure TFrmRel_Lista_Preco.qryconsultaData_ValidadeGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

procedure TFrmRel_Lista_Preco.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  case FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex of
    0: LblConsulta_Por.Caption:= 'Tudo';
    1: LblConsulta_Por.Caption:= 'Grupo';
    2: LblConsulta_Por.Caption:= 'Marca';
    3: LblConsulta_Por.Caption:= 'Local';
    4: LblConsulta_Por.Caption:= 'Fornecedor';
    5: LblConsulta_Por.Caption:= 'Data Validade';
  end;

  if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 1) or
     (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 2) or
     (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 3) or
     (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 4) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Produto_Cadastrado.EdtDescricao.Text;
  end
  else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblParametro.Enabled:= false;
  end
  else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 5) then
  begin
    LblParametro.Enabled:= false;
  end;

  if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 0) then
  begin
    with qryconsulta, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, P.Data_Fabricacao, P.Data_Validade, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Prazo,');
      add('GP.Descricao as Grupo_Produto, M.Descricao as Marca,');
      add('LP.Local, LP.Detalhe, F.Nome_Fantasia from Produto P');
      add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
      add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');
      add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');

      case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
        0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Descricao');
        1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by GP.Descricao');
        2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by M.Descricao');
        3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by LP.Local');
        4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by F.Nome_Fantasia');
        5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Data_Validade');
      end;

      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_ativo;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;

      case FrmConsulta_Produto_Cadastrado.RGStatus.ItemIndex of
        0: Parameters.ParamByName('Status').Value:= 'ATIVO';
        1: Parameters.ParamByName('Status').Value:= 'INATIVO';
      end;

      open;
    end;
  end
  else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 1) or
          (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 2) or
          (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 3) or
          (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 4) then
  begin
    with qryconsulta, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, P.Data_Fabricacao, P.Data_Validade, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Prazo,');
      add('GP.Descricao as Grupo_Produto, M.Descricao as Marca,');
      add('LP.Local, LP.Detalhe, F.Nome_Fantasia from Produto P');
      add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
      add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');
      add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');

      if FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 1 then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Grupo = :Codigo order by P.Data_Validade');
        end;
      end
      else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 2) then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Marca = :Codigo order by P.Data_Validade');
        end;
      end
      else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 3) then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Local = :Codigo order by P.Data_Validade');
        end;
      end
      else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 4) then
      begin
        case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
          0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by P.Descricao');
          1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by GP.Descricao');
          2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by M.Descricao');
          3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by LP.Local');
          4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by F.Nome_Fantasia');
          5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Codigo_Fornecedor = :Codigo order by P.Data_Validade');
        end;
      end;

      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_ativo;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;

      case FrmConsulta_Produto_Cadastrado.RGStatus.ItemIndex of
        0: Parameters.ParamByName('Status').Value:= 'ATIVO';
        1: Parameters.ParamByName('Status').Value:= 'INATIVO';
      end;

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Produto_Cadastrado.EdtCodigo.Text);
      open;
    end;
  end
  else if (FrmConsulta_Produto_Cadastrado.RGConsulta_Por.ItemIndex = 5) then
  begin
    with qryconsulta, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_Venda, P.Descricao, P.Data_Fabricacao, P.Data_Validade, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Prazo,');
      add('GP.Descricao as Grupo_Produto, M.Descricao as Marca,');
      add('LP.Local, LP.Detalhe, F.Nome_Fantasia from Produto P');
      add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
      add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');
      add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');

      add('');

      case (FrmConsulta_Produto_Cadastrado.RGOrdena_Por.ItemIndex) of
        0: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by P.Descricao');
        1: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by GP.Descricao');
        2: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by M.Descricao');
        3: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by LP.Local');
        4: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by F.Nome_Fantasia');
        5: add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Data_Validade between :DI and :DF order by P.Data_Validade');
      end;

      Parameters.ParamByName('Tabela').Value:= codigo_tabela_preco_ativo;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;

      case FrmConsulta_Produto_Cadastrado.RGStatus.ItemIndex of
        0: Parameters.ParamByName('Status').Value:= 'ATIVO';
        1: Parameters.ParamByName('Status').Value:= 'INATIVO';
      end;

      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Produto_Cadastrado.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Produto_Cadastrado.MEdtData_Final.Text);
      open;
    end;
  end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
