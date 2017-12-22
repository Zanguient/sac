unit UGera_Etiqueta_Impressora_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls, ToolWin, ImgList, ExtCtrls, Mask,
  ACBrPAFClass, ACBrBase, ACBrETQ, ACBrDevice, UGeral;

type
  TFrmGera_Etiqueta_Impressora_Etiqueta = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label5: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    Label6: TLabel;
    EdtCodigo_Venda: TEdit;
    EdtPreco: TEdit;
    Label1: TLabel;
    GroupBox7: TGroupBox;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label23: TLabel;
    Label29: TLabel;
    Label25: TLabel;
    EdtTipo_Barra: TEdit;
    EdtHorizontal_Barra: TEdit;
    EdtVertical_Barra: TEdit;
    EdtLargura_Barra_Larga: TEdit;
    EdtLargura_Barra_Fina: TEdit;
    EdtAltura_Codigo: TEdit;
    ACBrETQ: TACBrETQ;
    Label2: TLabel;
    EdtCopias: TEdit;
    Label3: TLabel;
    EdtUnidade: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    EdtPreco_Venda: TEdit;
    Label7: TLabel;
    EdtUnidade_Venda: TEdit;
    MEdtData_Validade: TMaskEdit;
    Label8: TLabel;
    EdtQuantidade: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdtColunas: TEdit;
    Label13: TLabel;
    EdtLinhas: TEdit;
    GroupBox6: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    CBOrientacao: TComboBox;
    EdtTamanho_Fonte_Etiqueta_Campo_1: TEdit;
    EdtMultiplicador_H_Campo_1: TEdit;
    EdtMultiplicador_V_Campo_1: TEdit;
    EdtHorizontal_Texto_Campo_1: TEdit;
    EdtVertical_Texto_Campo_1: TEdit;
    EdtMultiplicador_H_Campo_2: TEdit;
    EdtMultiplicador_V_Campo_2: TEdit;
    EdtHorizontal_Texto_Campo_2: TEdit;
    EdtVertical_Texto_Campo_2: TEdit;
    EdtTamanho_Fonte_Etiqueta_Campo_2: TEdit;
    EdtMultiplicador_H_Campo_3: TEdit;
    EdtMultiplicador_V_Campo_3: TEdit;
    EdtHorizontal_Texto_Campo_3: TEdit;
    EdtVertical_Texto_Campo_3: TEdit;
    EdtTamanho_Fonte_Etiqueta_Campo_3: TEdit;
    EdtMultiplicador_V_Campo_4: TEdit;
    EdtTamanho_Fonte_Etiqueta_Campo_4: TEdit;
    EdtVertical_Texto_Campo_4: TEdit;
    EdtHorizontal_Texto_Campo_4: TEdit;
    EdtMultiplicador_H_Campo_4: TEdit;
    EdtMultiplicador_V_Campo_5: TEdit;
    EdtTamanho_Fonte_Etiqueta_Campo_5: TEdit;
    EdtVertical_Texto_Campo_5: TEdit;
    EdtHorizontal_Texto_Campo_5: TEdit;
    EdtMultiplicador_H_Campo_5: TEdit;
    Label11: TLabel;
    EdtDistancia_Horizontal: TEdit;
    Label12: TLabel;
    EdtDistancia_Vertical: TEdit;
    EdtCodEtiquetadora: TEdit;
    EdtDescricaoEtiquetadora: TEdit;
    Label14: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure EdtMultiplicador_H_Campo_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtMultiplicador_V_Campo_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtHorizontal_Texto_Campo_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtVertical_Texto_Campo_1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtMultiplicador_H_Campo_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtMultiplicador_V_Campo_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtHorizontal_Texto_Campo_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtVertical_Texto_Campo_2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtTamanho_Fonte_Etiqueta_Campo_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtLargura_Barra_LargaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLargura_Barra_FinaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtHorizontal_BarraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVertical_BarraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAltura_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCopiasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPreco_VendaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodEtiquetadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Utili: TUtil;
    procedure Ativa_Impressora;
    procedure Valida_Campos_Etiqueta;

    { Private declarations }
  public
    caminho: string;
    ativo: Boolean;
    { Public declarations }
  end;

var
  FrmGera_Etiqueta_Impressora_Etiqueta: TFrmGera_Etiqueta_Impressora_Etiqueta;

implementation

uses UDeclaracao, UDM, UChama_Produto, Util.Mensagens, UChama_Etiqueta;

{$R *.dfm}

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.BBtnFecharClick
  (Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.Valida_Campos_Etiqueta;
begin
  if (EdtProduto.Text = '') then
  begin
    TMensagens.MensagemErro('Informe o nome do produto.');
    EdtProduto.SetFocus;
    abort;
  end;

  if (EdtCodigo_Venda.Text = '') then
  begin
    TMensagens.MensagemErro('Informe o código do produto.');
    EdtCodigo_Venda.SetFocus;
    abort;
  end;

  { if (EdtPreco.Text = '') then
    begin
    TMensagens.MensagemErro('Informe o preço do produto.');
    EdtPreco.SetFocus;
    abort;
    end; }

  if (EdtPreco_Venda.Text = '') then
  begin
    TMensagens.MensagemErro('Informe o preço do produto.');
    EdtPreco_Venda.SetFocus;
    abort;
  end;

  if (EdtCopias.Text = '') then
  begin
    TMensagens.MensagemErro
      ('Informe pelo menos o valor 1 para o número de cópias.');
    EdtCopias.SetFocus;
    abort;
  end;

  if (EdtMultiplicador_H_Campo_1.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtMultiplicador_H_Campo_1.SetFocus;
    abort;
  end;

  if (EdtMultiplicador_V_Campo_1.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtMultiplicador_V_Campo_1.SetFocus;
    abort;
  end;

  if (EdtMultiplicador_H_Campo_2.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtMultiplicador_H_Campo_2.SetFocus;
    abort;
  end;

  if (EdtMultiplicador_V_Campo_2.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtMultiplicador_V_Campo_2.SetFocus;
    abort;
  end;

  if (EdtHorizontal_Texto_Campo_1.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtHorizontal_Texto_Campo_1.SetFocus;
    abort;
  end;

  if (EdtHorizontal_Texto_Campo_2.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtHorizontal_Texto_Campo_2.SetFocus;
    abort;
  end;

  if (EdtHorizontal_Barra.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtHorizontal_Barra.SetFocus;
    abort;
  end;

  if (EdtTamanho_Fonte_Etiqueta_Campo_1.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtTamanho_Fonte_Etiqueta_Campo_1.SetFocus;
    abort;
  end;

  if (EdtTamanho_Fonte_Etiqueta_Campo_2.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtTamanho_Fonte_Etiqueta_Campo_2.SetFocus;
    abort;
  end;

  if (EdtTipo_Barra.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtTipo_Barra.SetFocus;
    abort;
  end;

  if (EdtLargura_Barra_Larga.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtLargura_Barra_Larga.SetFocus;
    abort;
  end;

  if (EdtLargura_Barra_Fina.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtLargura_Barra_Fina.SetFocus;
    abort;
  end;

  if (EdtVertical_Texto_Campo_1.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtVertical_Texto_Campo_1.SetFocus;
    abort;
  end;

  if (EdtVertical_Texto_Campo_2.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtVertical_Texto_Campo_2.SetFocus;
    abort;
  end;

  if (EdtVertical_Barra.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtVertical_Barra.SetFocus;
    abort;
  end;

  if (EdtAltura_Codigo.Text = '') then
  begin
    TMensagens.MensagemErro('Informe um valor.');
    EdtAltura_Codigo.SetFocus;
    abort;
  end;

end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.BBtnSalvarClick
  (Sender: TObject);
var
  orientacao: TACBrETQOrientacao;
  produto, preco, validade, total, quantidade: AnsiString;
  colunas, linhas, copias, i, j, k, mais_v, mais_h, mais_v_preco: integer;
begin
  Valida_Campos_Etiqueta;
  Ativa_Impressora;
  mais_h := StrToInt(EdtDistancia_Horizontal.Text);;
  mais_v := StrToInt(EdtDistancia_Vertical.Text);;
  mais_v_preco := 0;

  // mais_v := StrToInt(EdtMais_V.Text);
  // mais_v_preco:= StrToInt(EdtMais_V.Text)+20;

  colunas := StrToInt(EdtColunas.Text);
  linhas := StrToInt(EdtLinhas.Text);
  copias := StrToInt(EdtCopias.Text);

  if (CBOrientacao.ItemIndex = 0) then
    orientacao := orNormal
  else if (CBOrientacao.ItemIndex = 1) then
    orientacao := or270
  else if (CBOrientacao.ItemIndex = 2) then
    orientacao := or180
  else if (CBOrientacao.ItemIndex = 3) then
    orientacao := or90;

  produto := EdtProduto.Text;
  preco := 'R$/' + EdtUnidade.Text + ': ' + EdtPreco.Text;
  quantidade := 'Qtde.: ' + EdtQuantidade.Text + ' ' + EdtUnidade_Venda.Text;
  validade := 'Validade: ' + MEdtData_Validade.Text + '. ';
  total := EdtPreco_Venda.Text; // 'TOTAL: '+EdtPreco_Venda.Text;
  Avanco_Impressora_Etiqueta := 0;

  with ACBrETQ do
  begin
    if Modelo = etqPpla then
    begin
      { ImprimirTexto(orNormal, 2, 2, 2, 190, 5, 'BISCOITO MARILAN RECH 335G');
        ImprimirTexto(orNormal, 2, 2, 1, 158, 5, 'CHOC BRANCO');
        ImprimirBarras(orNormal, 'F', '2', '2', 32, 0, '7896003701685', 90, becSIM);
        ImprimirTexto(orNormal, 3, 3, 2, 15, 300, 'R$');
        ImprimirTexto(orNormal, 3, 4, 4, 15, 450, '20.59'); }
    end
    else
    begin

      for i := 0 to linhas - 1 do
      begin
        for j := 0 to colunas - 1 do
        begin
          // for k := 0 to copias do
          // begin
          ImprimirTexto(orientacao,
            StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_1.Text),
            StrToInt(EdtMultiplicador_H_Campo_1.Text),
            StrToInt(EdtMultiplicador_V_Campo_1.Text),
            StrToInt(EdtVertical_Texto_Campo_1.Text),
            StrToInt(EdtHorizontal_Texto_Campo_1.Text) + mais_h, produto);

          if (EdtPreco.Text <> '') then
          begin
            ImprimirTexto(orientacao,
              StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_2.Text),
              StrToInt(EdtMultiplicador_H_Campo_2.Text),
              StrToInt(EdtMultiplicador_V_Campo_2.Text),
              StrToInt(EdtVertical_Texto_Campo_2.Text) + mais_v,
              StrToInt(EdtHorizontal_Texto_Campo_2.Text) + mais_h, preco);
          end;

          if (EdtQuantidade.Text <> '') then
          begin
            ImprimirTexto(orientacao,
              StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_3.Text),
              StrToInt(EdtMultiplicador_H_Campo_3.Text),
              StrToInt(EdtMultiplicador_V_Campo_3.Text),
              StrToInt(EdtVertical_Texto_Campo_3.Text) + mais_v,
              StrToInt(EdtHorizontal_Texto_Campo_3.Text) + mais_h, quantidade);
          end;

          if (MEdtData_Validade.Text <> '  /  /    ') then
          begin
            ImprimirTexto(orientacao,
              StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_4.Text),
              StrToInt(EdtMultiplicador_H_Campo_4.Text),
              StrToInt(EdtMultiplicador_V_Campo_4.Text),
              StrToInt(EdtVertical_Texto_Campo_4.Text) + mais_v,
              StrToInt(EdtHorizontal_Texto_Campo_4.Text) + mais_h, validade);
          end;

          ImprimirTexto(orientacao,
            StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_5.Text),
            StrToInt(EdtMultiplicador_H_Campo_5.Text),
            StrToInt(EdtMultiplicador_V_Campo_5.Text),
            StrToInt(EdtVertical_Texto_Campo_5.Text) + mais_v,
            StrToInt(EdtHorizontal_Texto_Campo_5.Text) + mais_h, total);

          ImprimirBarras(orientacao, EdtTipo_Barra.Text,
            EdtLargura_Barra_Larga.Text, EdtLargura_Barra_Fina.Text,
            StrToInt(EdtVertical_Barra.Text) + mais_v,
            StrToInt(EdtHorizontal_Barra.Text) + mais_h, EdtCodigo_Venda.Text,
            StrToInt(EdtAltura_Codigo.Text), becSIM);

          mais_h := mais_h + StrToInt(EdtDistancia_Horizontal.Text);
          // end;
        end;

        Imprimir(StrToInt(EdtCopias.Text), Avanco_Impressora_Etiqueta);
        j := 0;
        mais_v := StrToInt(EdtDistancia_Vertical.Text);
        // mais_v_preco:= StrToInt(EdtMais_V.Text)+10;
        mais_h := 0;
      end;
    end;

    Desativar;
  end;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.Ativa_Impressora;
var
  limpa: Boolean;
begin

  if (Limpar_Memoria_Impressora_Etiqueta = 0) then
    limpa := True
  else
    limpa := false;

  with ACBrETQ do
  begin
    DPI := TACBrETQDPI(dpi_impressora_etiqueta);
    Modelo := TACBrETQModelo(modelo_etiqueta);
    Porta := Porta_Impressora_Etiqueta;
    LimparMemoria := limpa;

    Ativar;
  end;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtAltura_CodigoKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtCodEtiquetadoraKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Etiqueta, FrmChama_Etiqueta);
    FrmChama_Etiqueta.ShowModal;
    FrmChama_Etiqueta.Free;
  end;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtCodigo_ProdutoKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtCopiasKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtHorizontal_BarraKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtHorizontal_Texto_Campo_1KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtHorizontal_Texto_Campo_2KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtLargura_Barra_FinaKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtLargura_Barra_LargaKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtMultiplicador_H_Campo_1KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtMultiplicador_H_Campo_2KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtMultiplicador_V_Campo_1KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtMultiplicador_V_Campo_2KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtPrecoKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero_Virgula(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtPreco_VendaKeyPress
  (Sender: TObject; var Key: Char);
begin
  // Utili.Somente_Numero_Virgula(key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtQuantidadeExit
  (Sender: TObject);
var
  preco_tabela, qtde, total: double;
begin
  if (EdtPreco.Text <> '') and (EdtQuantidade.Text <> '') then
  begin
    preco_tabela := StrToFloat(EdtPreco.Text);
    qtde := StrToFloat(EdtQuantidade.Text);
    total := Calcula_Valor(FloatToStr(preco_tabela * qtde));
    Utili.FormataFloat(2, EdtPreco_Venda, total);
  end
  else
  begin
    TMensagens.MensagemWarning
      ('Se preferir calcular automático o preço de venda (preço de tabela * quantidade), informe o preço de tabela e/ou a quantidade.');
  end;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtQuantidadeKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
var
  preco_tabela, qtde, total: double;
begin
  if (Key = VK_F5) then
  begin
    if (EdtPreco.Text = '') then
    begin
      TMensagens.MensagemErro
        ('Por favor, informe o preço de tabela do produto.');
      abort;
    end;

    if not(dm.ACBrBAL1.ativo) then
    begin
      if not(Conecta_Balanca(dm.ACBrBAL1)) then
        abort;
    end;

    preco_tabela := StrToFloat(EdtPreco.Text);
    qtde := dm.ACBrBAL1.LePeso(Balanca_TimeOut);
    EdtQuantidade.Text := FloatToStr(qtde);
    total := Calcula_Valor(FloatToStr(preco_tabela * qtde));
    Utili.FormataFloat(2, EdtPreco_Venda, total);
    EdtPreco_Venda.SetFocus;
  end;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtQuantidadeKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero_Virgula(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtTamanho_Fonte_Etiqueta_Campo_2KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.EdtVertical_BarraKeyPress
  (Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtVertical_Texto_Campo_1KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.
  EdtVertical_Texto_Campo_2KeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Numero(Key);
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.FormActivate(Sender: TObject);
begin
  ativo := True;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmGera_Etiqueta_Impressora_Etiqueta.Free;
  FrmGera_Etiqueta_Impressora_Etiqueta := Nil;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.FormCreate(Sender: TObject);
begin
  CBOrientacao.ItemIndex := Orientacao_Impressao_Texto_Etiqueta;
  EdtMultiplicador_H_Campo_1.Text :=
    IntToStr(Multiplicador_H_Texto_Etiqueta_Campo_1);
  EdtMultiplicador_V_Campo_1.Text :=
    IntToStr(Multiplicador_V_Texto_Etiqueta_Campo_1);
  EdtVertical_Texto_Campo_1.Text := IntToStr(Vertical_Texto_Etiqueta_Campo_1);
  EdtHorizontal_Texto_Campo_1.Text :=
    IntToStr(Horizontal_Texto_Etiqueta_Campo_1);
  EdtTamanho_Fonte_Etiqueta_Campo_1.Text :=
    IntToStr(Tamanho_Fonte_Texto_Etiqueta_Campo_1);

  EdtMultiplicador_H_Campo_2.Text :=
    IntToStr(Multiplicador_H_Texto_Etiqueta_Campo_2);
  EdtMultiplicador_V_Campo_2.Text :=
    IntToStr(Multiplicador_V_Texto_Etiqueta_Campo_2);
  EdtVertical_Texto_Campo_2.Text := IntToStr(Vertical_Texto_Etiqueta_Campo_2);
  EdtHorizontal_Texto_Campo_2.Text :=
    IntToStr(Horizontal_Texto_Etiqueta_Campo_2);
  EdtTamanho_Fonte_Etiqueta_Campo_2.Text :=
    IntToStr(Tamanho_Fonte_Texto_Etiqueta_Campo_2);

  EdtMultiplicador_H_Campo_3.Text :=
    IntToStr(Multiplicador_H_Texto_Etiqueta_Campo_3);
  EdtMultiplicador_V_Campo_3.Text :=
    IntToStr(Multiplicador_V_Texto_Etiqueta_Campo_3);
  EdtVertical_Texto_Campo_3.Text := IntToStr(Vertical_Texto_Etiqueta_Campo_3);
  EdtHorizontal_Texto_Campo_3.Text :=
    IntToStr(Horizontal_Texto_Etiqueta_Campo_3);
  EdtTamanho_Fonte_Etiqueta_Campo_3.Text :=
    IntToStr(Tamanho_Fonte_Texto_Etiqueta_Campo_3);

  EdtMultiplicador_H_Campo_4.Text :=
    IntToStr(Multiplicador_H_Texto_Etiqueta_Campo_4);
  EdtMultiplicador_V_Campo_4.Text :=
    IntToStr(Multiplicador_V_Texto_Etiqueta_Campo_4);
  EdtVertical_Texto_Campo_4.Text := IntToStr(Vertical_Texto_Etiqueta_Campo_4);
  EdtHorizontal_Texto_Campo_4.Text :=
    IntToStr(Horizontal_Texto_Etiqueta_Campo_4);
  EdtTamanho_Fonte_Etiqueta_Campo_4.Text :=
    IntToStr(Tamanho_Fonte_Texto_Etiqueta_Campo_4);

  EdtMultiplicador_H_Campo_5.Text :=
    IntToStr(Multiplicador_H_Texto_Etiqueta_Campo_5);
  EdtMultiplicador_V_Campo_5.Text :=
    IntToStr(Multiplicador_V_Texto_Etiqueta_Campo_5);
  EdtVertical_Texto_Campo_5.Text := IntToStr(Vertical_Texto_Etiqueta_Campo_5);
  EdtHorizontal_Texto_Campo_5.Text :=
    IntToStr(Horizontal_Texto_Etiqueta_Campo_5);
  EdtTamanho_Fonte_Etiqueta_Campo_5.Text :=
    IntToStr(Tamanho_Fonte_Texto_Etiqueta_Campo_5);

  EdtDistancia_Horizontal.Text := IntToStr(Distancia_Horizontal_Etiqueta);
  EdtDistancia_Vertical.Text := IntToStr(Distancia_Vertical_Etiqueta);

  EdtTipo_Barra.Text := Tipo_Barra_Etiqueta;
  EdtLargura_Barra_Larga.Text := IntToStr(Largura_Barra_Larga);
  EdtLargura_Barra_Fina.Text := IntToStr(Largura_Barra_Fina);
  EdtHorizontal_Barra.Text := IntToStr(Horizontal_Barra_Etiqueta);
  EdtVertical_Barra.Text := IntToStr(Vertical_Barra_Etiqueta);
  EdtAltura_Codigo.Text := IntToStr(Altura_Barra);
  EdtQuantidade.Text := '';
  EdtCopias.Text := '1';

  if (Balanca_Modelo <> 0) then
  begin
    Conecta_Balanca(dm.ACBrBAL1);
  end;

end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    close;
end;

procedure TFrmGera_Etiqueta_Impressora_Etiqueta.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, True, True);
  end;
end;

end.
