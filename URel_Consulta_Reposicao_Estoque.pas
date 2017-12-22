unit URel_Consulta_Reposicao_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, QRExport;

type
  TFrmRel_Consulta_Reposicao_Estoque = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    LblConsulta_Por: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qryconsulta_reposicao: TADOQuery;
    QRBand2: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel17: TQRLabel;
    LblParametro: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    LblEstoque_Minimo: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    qryconsulta_reposicaoCodigo: TAutoIncField;
    qryconsulta_reposicaoDescricao: TStringField;
    qryconsulta_reposicaoSigla: TStringField;
    qryconsulta_reposicaoEstoque: TFloatField;
    qryconsulta_reposicaoEstoque_Minimo: TFloatField;
    qryconsulta_reposicaoEm_Estoque_Minimo: TStringField;
    qryconsulta_reposicaoValor_Ultima_Compra: TFloatField;
    qryconsulta_reposicaoUltima_Compra: TDateTimeField;
    qryconsulta_reposicaoValor_Compra_Unitario: TFloatField;
    qryconsulta_reposicaoCodigoGrupo: TAutoIncField;
    qryconsulta_reposicaoGrupo: TStringField;
    qryconsulta_reposicaoMarca: TStringField;
    qryconsulta_reposicaoValor_Compra: TFloatField;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    qryconsulta_reposicaoCodigo_Original: TStringField;
    qryconsulta_reposicaoCodigo_Similar: TStringField;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    QRTextFilter1: TQRTextFilter;
    LblTelefone_Empresa: TQRLabel;
    QRBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel19: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel20: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel21: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel22: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel26: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel27: TQRLabel;
    QRExpr11: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qryconsulta_reposicaoUltima_CompraGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Reposicao_Estoque: TFrmRel_Consulta_Reposicao_Estoque;

implementation

uses UGeral, UConsulta_Reposicao_Estoque, UDeclaracao;
{$R *.dfm}

procedure TFrmRel_Consulta_Reposicao_Estoque.FormCreate(Sender: TObject);
begin
  // if (FrmEscolha_Impressao.preview = true) then
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Reposicao_Estoque.
  qryconsulta_reposicaoUltima_CompraGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text := ''
  else
    Text := Sender.AsString;
end;

procedure TFrmRel_Consulta_Reposicao_Estoque.QuickRep1BeforePrint
  (Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLabeldata.Caption := datetostr(now);
  QRLabelHora.Caption := timetostr(time);
  LblEmpresa.Caption := nome_fantasia;
  LblTelefone_Empresa.Caption:= 'TELEFONE: '+telefone;

  if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption := 'Tudo'
  else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption := 'Grupo'
  else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption := 'Marca'
  else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Por.Caption := 'Produtos Bloqueados para Venda';

  if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
    LblEstoque_Minimo.Caption := 'Tudo'
  else if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 1) then
    LblEstoque_Minimo.Caption := 'Igual ou abaixo';

  if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 0) or
    (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 3) then
    LblParametro.Enabled := false
  else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 1) or
    (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 2) or
    (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 4) then
  begin
    LblParametro.Enabled := true;
    LblParametro.Caption := FrmConsulta_Reposicao_Estoque.EdtDescricao.Text;
  end;

  with qryconsulta_reposicao do
  begin
    close;
    sql.clear;
    sql.add(
      'select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
    sql.add(
      'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo as CodigoGrupo, GP.Descricao as Grupo, M.Descricao as Marca from Produto P');
    sql.add(
      'left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    sql.add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
    sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');

    if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end
      else
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Estoque <= P.Estoque_Minimo');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end;

      Parameters.ParamByName('Empresa').Value := UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value := 'ATIVO';
      Parameters.ParamByName('Tipo').Value := 0;
      open;

    end
    else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Grupo = :Codigo');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end
      else
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Grupo = :Codigo and P.Estoque <= P.Estoque_Minimo');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end;

      Parameters.ParamByName('Empresa').Value := UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value := 'ATIVO';
      Parameters.ParamByName('Tipo').Value := 0;
      Parameters.ParamByName('Codigo').Value := StrToInt
        (FrmConsulta_Reposicao_Estoque.EdtCodigo.Text);
      open;

    end
    else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Marca = :Codigo');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end
      else
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Codigo_Marca = :Codigo and P.Estoque <= P.Estoque_Minimo ');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end;

      Parameters.ParamByName('Empresa').Value := UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value := 'ATIVO';
      Parameters.ParamByName('Tipo').Value := 0;
      Parameters.ParamByName('Codigo').Value := StrToInt
        (FrmConsulta_Reposicao_Estoque.EdtCodigo.Text);
      open;

    end
    else if (FrmConsulta_Reposicao_Estoque.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Reposicao_Estoque.RGEstoque_Minimo.ItemIndex = 0) then
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Em_Estoque_Minimo = :Codigo');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end
      else
      begin
        sql.add(
          'where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo and P.Em_Estoque_Minimo = :Codigo and P.Estoque <= P.Estoque_Minimo ');
        sql.add(
          'group by P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Descricao, UM.Sigla, P.Estoque, P.Estoque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra,');
        sql.add(
          'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Codigo, GP.Descricao, M.Descricao');
        {case (FrmConsulta_Reposicao_Estoque.RGOrdena_Por.ItemIndex) of
          0: sql.add('order by P.Descricao');
          1: sql.add('order by GP.Descricao, P.Descricao');
          2: sql.add('order by M.Descricao, P.Descricao');
        end;}
      end;

      Parameters.ParamByName('Empresa').Value := UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value := 'ATIVO';
      Parameters.ParamByName('Tipo').Value := 0;
      Parameters.ParamByName('Codigo').Value := 'BLOQUEAR VENDA';
      open;

    end;
  end;

  LblTelefone_Rodape.Caption := telefone_relatorio;
  LblEmpresa_Rodape.Caption := empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption := empresa_relatorio_cabecalho;

end;

end.
