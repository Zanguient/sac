unit UGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, ComCtrls,
  ImgList, ToolWin, ShellApi, ADODB, Menus, IniFiles, DBTables;

type
  Controle = (Novo, Item, Insere, Altera, Exclui, Consultar, Vazio);

  TUtil = class
    procedure Habilita_Campos(loForm: TForm);
    procedure Desabilita_Campos(loForm: TForm);
    procedure Limpa_Campos(loform: TForm);
    procedure Somente_Apaga(var abobora: Char);
    procedure Somente_Numero_Virgula(var Key: Char);
    procedure Somente_Numero(var PamellaCarolinaOliveira: Char);
    procedure Somente_Numero_Sem_Zero(var Key: Char);
    procedure Inicia_Data(Data1, Data2: TMaskEdit);
    procedure Verifica_Data(Componente: TMaskEdit);
    function VerificaDataHoraValida(Componente: TMaskEdit): Boolean;
    procedure FormataFloat(Casas: integer; Componente: TEdit; Valor: double);
    procedure FormataFloatValor(Casas: integer; Valor: double);
    procedure Ordena_Grid(Query: TADOQuery; Column: TColumn);
    function Valida_CPF(xCPF: string): boolean;
    function Valida_CGC(xCGC: string): boolean;
    procedure AddItemMenuTree(ItemMenu : TMenuItem; Nivel : integer; var node1:tTreeNode);
    procedure ToggleTreeViewCheckBoxes(Node:TTreeNode; cUnChecked, cChecked:integer);
    function Retorna_Pedido_13_Caracteres(N_Pedido: AnsiString): AnsiString;
    procedure IniciaHint(Novo, Salvar, Excluir, Pesquisar, Cancelar, Fechar: TToolButton);
    end;
var
  Base: TADOConnection;
  //variaveis de controle de erros
  eMensagem: string;
  eUnidade: string;
  eRotina: string;
  user, banco, bancolocal, servidor, caminho, servidorlocal, eservidor: String;
  ipservidor: AnsiString;
  eExcecao: Exception;
  lrControle: Controle;

  achei: boolean;
  cor_linha_dbgrid: TColor;
  cor_fonte_dbgrid: TColor;
  expressao, caminho_servidor: Ansistring;

  procedure Pega_INI;
  function Abre_Conexao(var server: TADOConnection): boolean;
  function Abre_Conexao_Local(server: TADOConnection): boolean;
  function Mensagem_Padrao(var lrControle: Controle):String;
const
  cFlatUnCheck = 0;
  cFlatChecked = 1;
  telefone_relatorio = 'Fone.: (64)3631-1926 / (64)9958-7272';
  telefone_contato_fav = '(64)3631-1926 / (64)9958-7272';
  empresa_relatorio_rodape = 'FAV Sistemas e Consultoria';
  empresa_relatorio_cabecalho = 'SAC - Sistema de Acompanhamento e Gestão Comercial';

  hintNovo = 'Clique para gerar um novo registro.';
  hintSalvar = 'Clique para salvar o registro atual.';
  hintExcluir = 'Clique para excluir o registro selecionado.';
  hintPesquisar = 'Clique para pesquisar um registro.';
  hintCancelar = 'Clique para cancelar a inserção ou alteração do registro.';
  hintFechar = 'Clique para fechar a janela atual.';
implementation

uses UCadastro_Logradouro, UCadastro_Funcionarios, UDM, UDeclaracao;

function Abre_Conexao(var server: TADOConnection): boolean;
var
  i: integer;
begin
  Result:= true;
  server.Connected:= false;
  server.LoginPrompt:= false;

  server.ConnectionString:= PWideChar('Provider=SQLOLEDB.1;Password=@dminf@v01032011;Persist Security Info=True;User ID='+user+';Initial Catalog='+ banco +';Data Source='+ servidor + '');
  try
    server.Connected := true;
  except on E: Exception do
  begin
    ShowMessage('Erro ao conectar: '+E.Message);
    Result:= false;
  end;
  end;
end;

procedure Pega_INI;
var
  ArqIni: TIniFile;
  i: integer;
begin
  cor_linha_dbgrid:= clSilver;
  cor_fonte_dbgrid:= clBlack;

  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Conexao.ini');
  user:= ArqIni.ReadString('conecta', 'usuario', '');
  banco:= ArqIni.ReadString('conecta', 'base', '');
  servidor:= ArqIni.ReadString('conecta', 'servidor', '');
  bancolocal:= ArqIni.ReadString('conecta', 'baselocal', '');
  servidorlocal:= ArqIni.ReadString('conecta', 'servidorlocal', '');
  caminho_servidor:= ArqIni.ReadString('conecta', 'caminho', '');
  ipservidor:= ArqIni.ReadString('conecta', 'IPServidor', '');
  eservidor:= ArqIni.ReadString('conecta', 'eservidor', '');

  CIECF:= ArqIni.ReadString('ECF', 'ciecf', '');
  ArqIni.Free
end;

function Abre_Conexao_Local(server: TADOConnection): boolean;
var
  ArqIni: TIniFile;
  i: integer;
begin
  Result:= true;
  server.Connected:= false;

  server.ConnectionString:= PWideChar('Provider=SQLOLEDB.1;Password=@dminf@v01032011;Persist Security Info=True;User ID='+user+';Initial Catalog='+ bancolocal +';Data Source='+ servidorlocal + '');
  try
    server.Connected := true;
  except
    Result:= false;
  end;
end;

function Mensagem_Erro(loException: Exception; lcUnidade, lcRotina: string): string;
begin
  // inicializa
  eMensagem := loException.Message;
  eUnidade := lcUnidade;
  eRotina := lcRotina;
  eExcecao := loException;
  // retorna o valor da função
  Result := loException.Message + eUnidade + eRotina;
end;

function Mensagem_Padrao(var lrControle: Controle):String;
begin
  try
    case lrControle of
      Insere: Application.MessageBox('Registro salvo.', 'FAV Sistemas', MB_OK+MB_ICONQUESTION);
      Altera: Application.MessageBox('Registro alterado.', 'FAV Sistemas', MB_OK+MB_ICONQUESTION);
      Exclui: Application.MessageBox('Registro excluido.', 'FAV Sistemas', MB_OK+MB_ICONQUESTION);
      Item: Application.MessageBox('Ítem inserido.', 'FAV Sistemas', MB_OK+MB_ICONQUESTION);
    end;

  except
    on E: Exception do
      ShowMessage(Mensagem_Erro(E, 'Geral', ' Mensagem_Erro'));
  end;
end;
{ TUtil }

procedure TUtil.IniciaHint(Novo, Salvar, Excluir, Pesquisar, Cancelar,
  Fechar: TToolButton);
begin
  Novo.Hint:= hintNovo;
  Salvar.Hint:= hintSalvar;
  Excluir.Hint:= hintExcluir;
  Pesquisar.Hint:= hintPesquisar;
  Cancelar.Hint:= hintCancelar;
  Fechar.Hint:= hintFechar;
end;

procedure TUtil.Inicia_Data(Data1, Data2: TMaskEdit);
begin
  Data1.Text:= DateToStr(date);
  Data2.Text:= DateToStr(date);
end;

procedure TUtil.AddItemMenuTree(ItemMenu: TMenuItem; Nivel: integer;
  var node1: tTreeNode);
var I : integer;
    node2 :Ttreenode;
    s_str :string;
begin
  {if Nivel = 0  then
   Begin
    s_str := ItemMenu.Caption;
    Delete(s_str, Pos('&', ItemMenu.Caption), 1);
    node1 := FrmCadastro_Funcionarios.TreeView1.Items.Add(nil, s_str);
   end;

  for I := 0 to ItemMenu.Count-1 do
  begin
    if (ItemMenu.Items[I].Caption <> '-') then
     Begin
      s_str := ItemMenu.Items[I].Caption;
      Delete(s_str, Pos('&', ItemMenu.Items[I].Caption), 1);
      node2 := FrmCadastro_Funcionarios.TreeView1.Items.AddChild(node1,s_str);
     end;

    if ItemMenu.Items[I].Count > 0 then
      AddItemMenuTree(ItemMenu.Items[I],Succ(Nivel),node2);

  end;}
end;

procedure TUtil.Desabilita_Campos(loForm: TForm);
var
  X: Integer;
begin
  for x := 0 to loform.ComponentCount - 1 do
    if loForm.Components[X] is TPageControl then
      TPageControl(loForm.Components[X]).Enabled:= false;
end;

procedure TUtil.FormataFloat(Casas: integer; Componente: TEdit; Valor: Double);
begin
  if (Casas = 2) then
    expressao:= '#0.0,0'
  else if (Casas = 3) then
    expressao:= '#0.0,00';

  Componente.Text:= FormatFloat(expressao, Valor);
  Componente.Text:= StringReplace(Componente.text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TUtil.FormataFloatValor(Casas: integer; Valor: double);
begin
end;

procedure TUtil.Habilita_Campos(loForm: TForm);
var
  X: Integer;
begin
  for x := 0 to loform.ComponentCount - 1 do
    if loForm.Components[X] is TPageControl then
      TPageControl(loForm.Components[X]).Enabled:= true;
end;

procedure TUtil.Limpa_Campos(loform: TForm);
var
  X: Integer;
begin
  for x := 0 to loform.ComponentCount - 1 do
    if (loForm.Components[X] is TEdit ) AND (TEdit(loForm.Components[X]).Text <> '') then
      TEdit(loForm.Components[X]).Clear
    else if loForm.Components[X] is TMaskEdit then
      TMaskEdit(loForm.Components[X]).Clear
    else if loform.Components[X] is TComboBox then
      TComboBox(loform.Components[X]).ItemIndex:= -1
    else if loForm.Components[X] is TMemo then
      TMemo(loForm.Components[X]).Clear
    else if loForm.Components[X] is TCheckBox then
      TCheckBox(loForm.Components[X]).Checked:= true;

end;

procedure TUtil.Ordena_Grid(Query: TADOQuery; Column: TColumn);
begin
  if (Query.Sort <> Column.FieldName+ ' ASC') then
    Query.Sort:= Column.FieldName+ ' ASC'
  else
    Query.sort:= Column.fieldname+ ' DESC';
end;

function TUtil.Retorna_Pedido_13_Caracteres(N_Pedido: AnsiString): AnsiString;
begin
  result := StringOfChar('0', 12-Length(N_Pedido)) + N_Pedido;
end;

procedure TUtil.Somente_Apaga(var abobora: Char);
begin
  if not (abobora in [#08]) then
    abobora := #0
end;

procedure TUtil.Somente_Numero(var PamellaCarolinaOliveira: Char);
begin
  if not(PamellaCarolinaOliveira in ['0' .. '9', #08]) then
    PamellaCarolinaOliveira := #0
end;

procedure TUtil.Somente_Numero_Sem_Zero(var Key: Char);
begin
  if not (key in ['1'..'9', ',', #08]) then
    key := #0
end;

procedure TUtil.Somente_Numero_Virgula(var Key: Char);
begin
  if not (key in ['0'..'9', ',', #08]) then
    key := #0
end;

function TUtil.Valida_CGC(xCGC: string): boolean;
Var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
  Check : String;
begin
  d1 := 0;
  d4 := 0;
  xx := 1;
for nCount := 1 to Length( xCGC )-2 do
    begin
    if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       xx := xx+1;
       end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
       begin
       digito1 := 0;
       end
   else
       begin
       digito1 := 11 - resto;
       end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
end;

function TUtil.Valida_CPF(xCPF: string): boolean;
Var
  d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
  Check : String;
Begin
  d1 := 0; d4 := 0; xx := 1;
for nCount := 1 to Length( xCPF )-2 do
  begin
  if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
     begin
     d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
     d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
     xx := xx+1;
     end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
    begin
      digito1 := 0;
    end
    else
    begin
      digito1 := 11 - resto;
    end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
     begin
       digito2 := 0;
     end
     else
       begin
         digito2 := 11 - resto;
       end;
    Check := IntToStr(Digito1) + IntToStr(Digito2);
    if Check <> copy(xCPF,succ(length(xCPF)-2),2) then
      begin
       Result := False;
      end
      else
       begin
         Result := True;
       end;
End;

function TUtil.VerificaDataHoraValida(Componente: TMaskEdit): Boolean;
begin
  try
    Result:= true;
    if (Componente.Text <> '  /  /       :  :  ') then
    begin
      StrToDateTime(Componente.Text);
    end;

  except on EConvertError do
  begin
    Result:= false;
  end;
  end;
end;

procedure TUtil.Verifica_Data(Componente: TMaskEdit);
begin
  try
    if (Componente.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      Componente.SetFocus;
      abort;
    end
    else
    begin
      StrToDate(Componente.Text);
    end;

  except
  on EConvertError do
    begin
      Application.MessageBox('Data inválida', 'Erro', MB_OK+MB_ICONHAND);
      Componente.Clear;
      Componente.SetFocus;
      abort;
    end;

  end;

end;

procedure TUtil.ToggleTreeViewCheckBoxes(Node :TTreeNode; cUnChecked, cChecked:integer);
var
  tmp:TTreeNode;
begin
  if Assigned(Node) then
  begin
    if Node.StateIndex = cUnChecked then
      Node.StateIndex := cChecked
    else if Node.StateIndex = cChecked then
      Node.StateIndex := cUnChecked
  end; // if Assigned(Node)
end; (*ToggleTreeViewCheckBoxes*)

end.
