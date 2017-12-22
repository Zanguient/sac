unit UChama_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UDeclaracao;

type
  TFrmChama_Etiqueta = class(TForm)
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_etiqueta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_etiquetaCodigo: TIntegerField;
    qrychama_etiquetaDescricao: TStringField;
    qrychama_etiquetaMargem_Superior: TFloatField;
    qrychama_etiquetaMargem_Inferior: TFloatField;
    qrychama_etiquetaMargem_Esquerda: TFloatField;
    qrychama_etiquetaMargem_Direita: TFloatField;
    qrychama_etiquetaDistancia_Vertical: TFloatField;
    qrychama_etiquetaDistancia_Horizontal: TFloatField;
    qrychama_etiquetaAltura_Etiqueta: TFloatField;
    qrychama_etiquetaLargura_Etiqueta: TFloatField;
    qrychama_etiquetaTamanho_Fonte: TFloatField;
    qrychama_etiquetaLargura_Pagina: TFloatField;
    qrychama_etiquetaAltura_Pagina: TFloatField;
    qrychama_etiquetaEtiqueta_Linha: TFloatField;
    qrychama_etiquetaLinha_Pagina: TFloatField;
    qrychama_etiquetaData_Cadastro: TDateTimeField;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    ds_qry_consulta_etiquetadora: TDataSource;
    qrychama_etiquetadora: TADOQuery;
    qrychama_etiquetadoraCodigo: TIntegerField;
    qrychama_etiquetadoraData_Cadastro: TDateTimeField;
    qrychama_etiquetadoraDescricao: TStringField;
    qrychama_etiquetadoraTipo_Barra_Etiqueta: TFloatField;
    qrychama_etiquetadoraLargura_Barra_Larga: TFloatField;
    qrychama_etiquetadoraLargura_Barra_Fina: TFloatField;
    qrychama_etiquetadoraDistancia_Horizontal_Etiqueta: TFloatField;
    qrychama_etiquetadoraDistancia_Vertical_Etiqueta: TFloatField;
    qrychama_etiquetadoraAltura_Codigo: TFloatField;
    qrychama_etiquetadoraHorizontal_Barra_Etiqueta: TFloatField;
    qrychama_etiquetadoraVertical_Barra_Etiqueta: TFloatField;
    qrychama_etiquetadoraOrientacao_Impressao_Texto_Etiqueta: TStringField;
    qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_1: TFloatField;
    qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_1: TFloatField;
    qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_1: TFloatField;
    qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_1: TFloatField;
    qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_1: TFloatField;
    qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_2: TFloatField;
    qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_2: TFloatField;
    qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_2: TFloatField;
    qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_2: TFloatField;
    qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_2: TFloatField;
    qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_3: TFloatField;
    qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_3: TFloatField;
    qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_3: TFloatField;
    qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_3: TFloatField;
    qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_3: TFloatField;
    qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_4: TFloatField;
    qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_4: TFloatField;
    qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_4: TFloatField;
    qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_4: TFloatField;
    qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_4: TFloatField;
    qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_5: TFloatField;
    qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_5: TFloatField;
    qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_5: TFloatField;
    qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_5: TFloatField;
    qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_5: TFloatField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Etiqueta: TFrmChama_Etiqueta;
  Consulta: TConsulta;

implementation

uses UDM, UCadastro_Etiqueta, UGera_Etiqueta_Produto, UGeral,
  UGera_Etiqueta_Cliente, UEntrada_Produtos, UGera_Etiqueta_Produto_2,
  UGera_Etiqueta_Impressora_Etiqueta;

{$R *.dfm}

procedure TFrmChama_Etiqueta.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Etiqueta.BBtnFiltrarClick(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex = 0) then
  begin
    Consulta.Chama_Etiqueta;
  end
  else
    Consulta.Chama_Etiquetadora;
end;

procedure TFrmChama_Etiqueta.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Etiqueta <> NIl) and (FrmCadastro_Etiqueta.ativo = true) and
    (PageControl1.ActivePageIndex = 0) then
  begin
    FrmCadastro_Etiqueta.EdtCodigo.Text := qrychama_etiquetaCodigo.AsString;
    FrmCadastro_Etiqueta.EdtDescricao.Text :=
      qrychama_etiquetaDescricao.AsString;
    FrmCadastro_Etiqueta.MEdtData_Cadastro.Text :=
      qrychama_etiquetaData_Cadastro.AsString;

    FrmCadastro_Etiqueta.EdtMargem_Superior.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaMargem_Superior.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Superior.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtMargem_Superior.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtMargem_Inferior.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaMargem_Inferior.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Inferior.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtMargem_Inferior.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaMargem_Esquerda.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtMargem_Direita.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaMargem_Direita.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Direita.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtMargem_Direita.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaDistancia_Vertical.AsFloat);
    FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaDistancia_Horizontal.AsFloat);
    FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaAltura_Etiqueta.AsFloat);
    FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaLargura_Etiqueta.AsFloat);
    FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaTamanho_Fonte.AsFloat);
    FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtLargura_Pagina.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaLargura_Pagina.AsFloat);
    FrmCadastro_Etiqueta.EdtLargura_Pagina.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtLargura_Pagina.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtAltura_Pagina.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaAltura_Pagina.AsFloat);
    FrmCadastro_Etiqueta.EdtAltura_Pagina.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtAltura_Pagina.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaEtiqueta_Linha.AsFloat);
    FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtLinha_Pagina.Text :=
      FormatFloat('#0.0,0', qrychama_etiquetaLinha_Pagina.AsFloat);
    FrmCadastro_Etiqueta.EdtLinha_Pagina.Text :=
      StringReplace(FrmCadastro_Etiqueta.EdtLinha_Pagina.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.PageControl1.TabIndex := 0;
    FrmChama_Etiqueta.close;

    FrmCadastro_Etiqueta.BBtnSalvar.Enabled := true;
    FrmCadastro_Etiqueta.BBtnExcluir.Enabled := true;
    FrmCadastro_Etiqueta.BBtnPesquisar.Enabled := true;
    FrmCadastro_Etiqueta.BBtnCancelar.Enabled := true;
    FrmCadastro_Etiqueta.BBtnNovo.Enabled := false;
    Util.Habilita_Campos(FrmCadastro_Etiqueta);
    FrmCadastro_Etiqueta.achei := true;
  end
  else if (FrmGera_Etiqueta <> NIl) and (FrmGera_Etiqueta.ativo = true) then
  begin
    FrmGera_Etiqueta.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta.EdtEtiqueta.Text := qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta.linha_pagina := qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta.margem_direita := qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta.altura_pagina := qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta.largura_pagina := qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta.tamanho_fonte := qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end
  else if (FrmGera_Etiqueta_Produto <> NIl) and
    (FrmGera_Etiqueta_Produto.ativo = true) then
  begin
    FrmGera_Etiqueta_Produto.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta_Produto.EdtEtiqueta.Text :=
      qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta_Produto.linha_pagina :=
      qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta_Produto.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta_Produto.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta_Produto.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta_Produto.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta_Produto.margem_direita :=
      qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta_Produto.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta_Produto.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta_Produto.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto.altura_pagina :=
      qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto.largura_pagina :=
      qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto.tamanho_fonte :=
      qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end
  else if (FrmGera_Etiqueta_Produto_2 <> NIl) and
    (FrmGera_Etiqueta_Produto_2.ativo = true) then
  begin
    FrmGera_Etiqueta_Produto_2.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta_Produto_2.EdtEtiqueta.Text :=
      qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta_Produto_2.linha_pagina :=
      qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta_Produto_2.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta_Produto_2.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta_Produto_2.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta_Produto_2.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta_Produto_2.margem_direita :=
      qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta_Produto_2.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta_Produto_2.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta_Produto_2.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto_2.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto_2.altura_pagina :=
      qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto_2.largura_pagina :=
      qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto_2.tamanho_fonte :=
      qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end
  else if (FrmEntrada_Produtos <> NIl) and (FrmEntrada_Produtos.ativo = true)
  then
  begin
    FrmEntrada_Produtos.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmEntrada_Produtos.EdtEtiqueta.Text := qrychama_etiquetaDescricao.AsString;
    FrmEntrada_Produtos.linha_pagina := qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmEntrada_Produtos.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmEntrada_Produtos.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmEntrada_Produtos.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmEntrada_Produtos.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmEntrada_Produtos.margem_direita :=
      qrychama_etiquetaMargem_Direita.AsFloat;

    FrmEntrada_Produtos.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmEntrada_Produtos.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmEntrada_Produtos.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmEntrada_Produtos.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmEntrada_Produtos.altura_pagina := qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmEntrada_Produtos.largura_pagina :=
      qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmEntrada_Produtos.tamanho_fonte :=
      qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end
  
end;

procedure TFrmChama_Etiqueta.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmChama_Etiqueta.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    DBGrid1DblClick(self);
  end;
end;

procedure TFrmChama_Etiqueta.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_etiqueta, Column);
end;

procedure TFrmChama_Etiqueta.DBGrid2DblClick(Sender: TObject);
begin
  if (FrmCadastro_Etiqueta <> NIl) and (FrmCadastro_Etiqueta.ativo = true) and
    (PageControl1.ActivePageIndex = 1) then
  begin
    FrmCadastro_Etiqueta.edtCodCompleta.Text :=
      qrychama_etiquetadoraCodigo.AsString;
    FrmCadastro_Etiqueta.EdtDescricaoCompleta.Text :=
      qrychama_etiquetadoraDescricao.AsString;
    FrmCadastro_Etiqueta.edtDataCompleta.Text :=
      qrychama_etiquetadoraData_Cadastro.AsString;

    FrmCadastro_Etiqueta.EdtTipo_Barra.Text :=
      qrychama_etiquetadoraTipo_Barra_Etiqueta.AsString;
    FrmCadastro_Etiqueta.EdtLargura_Barra_Larga.Text :=
      qrychama_etiquetadoraLargura_Barra_Larga.AsString;
    FrmCadastro_Etiqueta.EdtLargura_Barra_Fina.Text :=
      qrychama_etiquetadoraLargura_Barra_Fina.AsString;
    FrmCadastro_Etiqueta.EdtDistHoriz.Text :=
      qrychama_etiquetadoraDistancia_Horizontal_Etiqueta.AsString;
    FrmCadastro_Etiqueta.EdtDistVert.Text :=
      qrychama_etiquetadoraDistancia_Vertical_Etiqueta.AsString;

    FrmCadastro_Etiqueta.EdtAltura_Codigo.Text :=
      qrychama_etiquetadoraAltura_Codigo.AsString;
    FrmCadastro_Etiqueta.EdtHorizontal_Barra.Text :=
      qrychama_etiquetadoraHorizontal_Barra_Etiqueta.AsString;
    FrmCadastro_Etiqueta.EdtVertical_Barra.Text :=
      qrychama_etiquetadoraVertical_Barra_Etiqueta.AsString;

    if (qrychama_etiquetadoraOrientacao_Impressao_Texto_Etiqueta.AsString =
      'Normal') then
    begin
      FrmCadastro_Etiqueta.CBOrientacao.ItemIndex := 0;
    end
    else if (qrychama_etiquetadoraOrientacao_Impressao_Texto_Etiqueta.AsString =
      '270') then
    begin
      FrmCadastro_Etiqueta.CBOrientacao.ItemIndex := 1;
    end
    else if (qrychama_etiquetadoraOrientacao_Impressao_Texto_Etiqueta.AsString =
      '180') then
    begin
      FrmCadastro_Etiqueta.CBOrientacao.ItemIndex := 2;
    end
    else if (qrychama_etiquetadoraOrientacao_Impressao_Texto_Etiqueta.AsString =
      '90') then
      FrmCadastro_Etiqueta.CBOrientacao.ItemIndex := 3;

    FrmCadastro_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_1.Text :=
      qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_1.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_V_Campo_1.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_1.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_H_Campo_1.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_1.AsString;
    FrmCadastro_Etiqueta.EdtHorizontal_Texto_Campo_1.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_1.AsString;
    FrmCadastro_Etiqueta.EdtVertical_Texto_Campo_1.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_1.AsString;

    FrmCadastro_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_2.Text :=
      qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_2.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_V_Campo_2.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_2.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_H_Campo_2.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_2.AsString;
    FrmCadastro_Etiqueta.EdtHorizontal_Texto_Campo_2.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_2.AsString;
    FrmCadastro_Etiqueta.EdtVertical_Texto_Campo_2.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_2.AsString;

    FrmCadastro_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_3.Text :=
      qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_3.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_V_Campo_3.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_3.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_H_Campo_3.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_3.AsString;
    FrmCadastro_Etiqueta.EdtHorizontal_Texto_Campo_3.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_3.AsString;
    FrmCadastro_Etiqueta.EdtVertical_Texto_Campo_3.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_3.AsString;

    FrmCadastro_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_4.Text :=
      qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_4.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_V_Campo_4.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_4.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_H_Campo_4.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_4.AsString;
    FrmCadastro_Etiqueta.EdtHorizontal_Texto_Campo_4.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_4.AsString;
    FrmCadastro_Etiqueta.EdtVertical_Texto_Campo_4.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_4.AsString;

    FrmCadastro_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_5.Text :=
      qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_5.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_V_Campo_5.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_5.AsString;
    FrmCadastro_Etiqueta.EdtMultiplicador_H_Campo_5.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_5.AsString;
    FrmCadastro_Etiqueta.EdtHorizontal_Texto_Campo_5.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_5.AsString;
    FrmCadastro_Etiqueta.EdtVertical_Texto_Campo_5.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_5.AsString;

    FrmCadastro_Etiqueta.PageControl1.TabIndex := 1;


    // FrmCadastro_Etiqueta.EdtMargem_Superior.Text:= FormatFloat('#0.0,0', qrychama_etiquetadoraTipo_Barra_Etiqueta.AsFloat);
    // FrmCadastro_Etiqueta.EdtMargem_Superior.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Superior.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtMargem_Inferior.Text:= FormatFloat('#0.0,0', qrychama_etiquetaMargem_Inferior.AsFloat);
    // FrmCadastro_Etiqueta.EdtMargem_Inferior.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Inferior.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text:= FormatFloat('#0.0,0', qrychama_etiquetaMargem_Esquerda.AsFloat);
    // FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtMargem_Direita.Text:= FormatFloat('#0.0,0', qrychama_etiquetaMargem_Direita.AsFloat);
    // FrmCadastro_Etiqueta.EdtMargem_Direita.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Direita.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text:= FormatFloat('#0.0,0', qrychama_etiquetaDistancia_Vertical.AsFloat);
    // FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text:= StringReplace(FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text:= FormatFloat('#0.0,0', qrychama_etiquetaDistancia_Horizontal.AsFloat);
    // FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text:= StringReplace(FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text:= FormatFloat('#0.0,0', qrychama_etiquetaAltura_Etiqueta.AsFloat);
    // FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text:= StringReplace(FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text:= FormatFloat('#0.0,0', qrychama_etiquetaLargura_Etiqueta.AsFloat);
    // FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text:= StringReplace(FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text:= FormatFloat('#0.0,0', qrychama_etiquetaTamanho_Fonte.AsFloat);
    // FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text:= StringReplace(FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtLargura_Pagina.Text:= FormatFloat('#0.0,0', qrychama_etiquetaLargura_Pagina.AsFloat);
    // FrmCadastro_Etiqueta.EdtLargura_Pagina.Text:= StringReplace(FrmCadastro_Etiqueta.EdtLargura_Pagina.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtAltura_Pagina.Text:= FormatFloat('#0.0,0', qrychama_etiquetaAltura_Pagina.AsFloat);
    // FrmCadastro_Etiqueta.EdtAltura_Pagina.Text:= StringReplace(FrmCadastro_Etiqueta.EdtAltura_Pagina.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text:= FormatFloat('#0.0,0', qrychama_etiquetaEtiqueta_Linha.AsFloat);
    // FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text:= StringReplace(FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text, ThousandSeparator, '', [rfReplaceAll]);
    //
    // FrmCadastro_Etiqueta.EdtLinha_Pagina.Text:= FormatFloat('#0.0,0', qrychama_etiquetaLinha_Pagina.AsFloat);
    // FrmCadastro_Etiqueta.EdtLinha_Pagina.Text:= StringReplace(FrmCadastro_Etiqueta.EdtLinha_Pagina.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmChama_Etiqueta.close;

    FrmCadastro_Etiqueta.BBtnSalvar.Enabled := true;
    FrmCadastro_Etiqueta.BBtnExcluir.Enabled := true;
    FrmCadastro_Etiqueta.BBtnPesquisar.Enabled := true;
    FrmCadastro_Etiqueta.BBtnCancelar.Enabled := true;
    FrmCadastro_Etiqueta.BBtnNovo.Enabled := false;
    Util.Habilita_Campos(FrmCadastro_Etiqueta);
    FrmCadastro_Etiqueta.edtDataCompleta.ReadOnly := true;
    FrmCadastro_Etiqueta.MEdtData_Cadastro.ReadOnly := true;
    FrmCadastro_Etiqueta.achei := true;
  end
  else if (FrmGera_Etiqueta <> NIl) and (FrmGera_Etiqueta.ativo = true) then
  begin
    FrmGera_Etiqueta.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta.EdtEtiqueta.Text := qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta.linha_pagina := qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta.margem_direita := qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta.altura_pagina := qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta.largura_pagina := qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta.tamanho_fonte := qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end
  else if (FrmGera_Etiqueta_Produto <> NIl) and
    (FrmGera_Etiqueta_Produto.ativo = true) then
  begin
    FrmGera_Etiqueta_Produto.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta_Produto.EdtEtiqueta.Text :=
      qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta_Produto.linha_pagina :=
      qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta_Produto.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta_Produto.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta_Produto.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta_Produto.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta_Produto.margem_direita :=
      qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta_Produto.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta_Produto.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta_Produto.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto.altura_pagina :=
      qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto.largura_pagina :=
      qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto.tamanho_fonte :=
      qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end
  else if (FrmGera_Etiqueta_Produto_2 <> NIl) and
    (FrmGera_Etiqueta_Produto_2.ativo = true) then
  begin
    FrmGera_Etiqueta_Produto_2.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta_Produto_2.EdtEtiqueta.Text :=
      qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta_Produto_2.linha_pagina :=
      qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta_Produto_2.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta_Produto_2.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta_Produto_2.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta_Produto_2.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta_Produto_2.margem_direita :=
      qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta_Produto_2.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta_Produto_2.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta_Produto_2.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto_2.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto_2.altura_pagina :=
      qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto_2.largura_pagina :=
      qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto_2.tamanho_fonte :=
      qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end
  else if (FrmEntrada_Produtos <> NIl) and (FrmEntrada_Produtos.ativo = true)
  then
  begin
    FrmEntrada_Produtos.EdtCodigo_Etiqueta.Text :=
      qrychama_etiquetaCodigo.AsString;
    FrmEntrada_Produtos.EdtEtiqueta.Text := qrychama_etiquetaDescricao.AsString;
    FrmEntrada_Produtos.linha_pagina := qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmEntrada_Produtos.etiqueta_linha :=
      qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmEntrada_Produtos.margem_superior :=
      qrychama_etiquetaMargem_Superior.AsFloat;
    FrmEntrada_Produtos.margem_inferior :=
      qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmEntrada_Produtos.margem_esquerda :=
      qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmEntrada_Produtos.margem_direita :=
      qrychama_etiquetaMargem_Direita.AsFloat;

    FrmEntrada_Produtos.distancia_horizontal :=
      qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmEntrada_Produtos.distancia_vertical :=
      qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmEntrada_Produtos.altura_etiqueta :=
      qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmEntrada_Produtos.largura_etiqueta :=
      qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmEntrada_Produtos.altura_pagina := qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmEntrada_Produtos.largura_pagina :=
      qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmEntrada_Produtos.tamanho_fonte :=
      qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.close;
  end else if (FrmGera_Etiqueta_Impressora_Etiqueta <> NIl) and
    (FrmGera_Etiqueta_Impressora_Etiqueta.ativo = true) then
  begin

    FrmGera_Etiqueta_Impressora_Etiqueta.EdtCodEtiquetadora.Text := qrychama_etiquetadoraCodigo.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtDescricaoEtiquetadora.Text := qrychama_etiquetadoraDescricao.AsString;

    FrmGera_Etiqueta_Impressora_Etiqueta.CBOrientacao.Text :=
      qrychama_etiquetadoraOrientacao_Impressao_Texto_Etiqueta.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtTipo_Barra.Text :=
      qrychama_etiquetadoraTipo_Barra_Etiqueta.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtLargura_Barra_Larga.Text :=
      qrychama_etiquetadoraLargura_Barra_Larga.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtLargura_Barra_Fina.Text :=
      qrychama_etiquetadoraLargura_Barra_Fina.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtHorizontal_Barra.Text :=
      qrychama_etiquetadoraHorizontal_Barra_Etiqueta.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtVertical_Barra.Text :=
      qrychama_etiquetadoraVertical_Barra_Etiqueta.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtAltura_Codigo.Text :=
      qrychama_etiquetadoraAltura_Codigo.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtDistancia_Horizontal.Text :=
      qrychama_etiquetadoraDistancia_Horizontal_Etiqueta.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtDistancia_Vertical.Text :=
      qrychama_etiquetadoraDistancia_Vertical_Etiqueta.AsString;

    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_H_Campo_1.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_1.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_V_Campo_1.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_1.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtHorizontal_Texto_Campo_1.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_1.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtVertical_Texto_Campo_1.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_1.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_1.Text
      := qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_1.AsString;

    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_H_Campo_2.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_2.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_V_Campo_2.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_2.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtHorizontal_Texto_Campo_2.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_2.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtVertical_Texto_Campo_2.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_2.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_2.Text
      := qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_2.AsString;

    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_H_Campo_3.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_3.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_V_Campo_3.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_3.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtHorizontal_Texto_Campo_3.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_3.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtVertical_Texto_Campo_3.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_3.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_3.Text
      := qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_3.AsString;

    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_H_Campo_4.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_4.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_V_Campo_4.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_4.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtHorizontal_Texto_Campo_4.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_4.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtVertical_Texto_Campo_4.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_4.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_4.Text
      := qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_4.AsString;

    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_H_Campo_5.Text :=
      qrychama_etiquetadoraMultiplicador_V_Texto_Etiqueta_Campo_5.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtMultiplicador_V_Campo_5.Text :=
      qrychama_etiquetadoraMultiplicador_H_Texto_Etiqueta_Campo_5.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtHorizontal_Texto_Campo_5.Text :=
      qrychama_etiquetadoraHorizontal_Texto_Etiqueta_Campo_5.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtVertical_Texto_Campo_5.Text :=
      qrychama_etiquetadoraVertical_Texto_Etiqueta_Campo_5.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtTamanho_Fonte_Etiqueta_Campo_5.Text
      := qrychama_etiquetadoraTamanho_Fonte_Texto_Etiqueta_Campo_5.AsString;

    FrmChama_Etiqueta.close;
  end
end;

procedure TFrmChama_Etiqueta.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    DBGrid1DblClick(self);
  end;
end;

procedure TFrmChama_Etiqueta.DBGrid2TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_etiquetadora, Column);
end;

procedure TFrmChama_Etiqueta.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    BBtnFiltrarClick(self);

    if (PageControl1.ActivePageIndex = 0) then
      DBGrid1.SetFocus
    else
      DBGrid2.SetFocus;
  end;
end;

procedure TFrmChama_Etiqueta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Etiqueta.Release;
end;

procedure TFrmChama_Etiqueta.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
end;

procedure TFrmChama_Etiqueta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_escape) then
    close;
end;

end.
