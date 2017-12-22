unit Modelo.Dominio.DocumentosFinanceiro.TPromissoriaDominio;

interface

uses
  Modelo.Entidade.DocumentosFinanceiro.TPromissoriaEntidade, Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade;
  type
    TPromissoriaDominio = class
      private
        //FPromissoriaEntidade : TPromissoriaEntidade;
      public
        procedure GeraPromissoria(FPE : TPromissoriaEntidade);
    end;

implementation

{ TPromissoriaDominio }

uses UDM, UDeclaracao, SysUtils, RSPrint, DateUtils, URel_Promissoria,
  Util.Configs;

procedure TPromissoriaDominio.GeraPromissoria(
  FPE: TPromissoriaEntidade);
var
  i, i2, linha, conta: integer;
  vencimento, texto, val, val2, pagavel, cli, cli_cpf, cli_endereco, cli_so, auxVencimento, auxTexto, auxCli: AnsiString;
begin
  //if (dm.rs.Paginas = 0) then
    //dm.rs.BeginDoc;

  i:= 0;
  i2:= 136;
  linha:= 1;
  conta:= 0;

  //vencimento:= 'VENCIMENTO, '+FormatDateTime('DD'+QuotedStr(' DE ')+'MMMM'+QuotedStr(' DE ')+'yyyy',FPE.DataVencimento)+#13+#10;
  //texto:= 'AOS '+IntToStr(DayOf(FPE.DataVencimento)) +' DIAS DO MÊS DE '+FormatDateTime('MMMM',FPE.DataVencimento)+' DO ANO DE '+IntToStr(YearOf(FPE.DataVencimento))+', PAGAREI POR ESTA ÚNICA VIA DE NOTA PROMISSÓRIA '+#13+#10;
  //val:= 'OU À SUA ORDEM A QUANTIA DE: *** '+NumeroParaExtenso(FPE.Valor)+'***'+#13+#10;
  val2:= 'EM MOEDA CORRENTE NACIONAL.'+#13+#10+#13+#10;
  pagavel:= 'PAGÁVEL EM: '+trim(Cidade)+'-'+trim(uf)+#13+#10;
  cli:= 'EMITENTE: '+FPE.NomeCliente+#13+#10;

  if (Length(FPE.CPFCNPJ)=11) then
    cli_cpf:= 'CPF/CNPJ: '+TConfigs.FormataCPF(FPE.CPFCNPJ)+#13+#10
  else if (Length(FPE.CPFCNPJ)=14) then
    cli_cpf:= 'CPF/CNPJ: '+TConfigs.FormataCNPJ(FPE.CPFCNPJ)+#13+#10
  else
    cli_cpf:= 'CPF/CNPJ: '+FPE.CPFCNPJ+#13+#10;

  cli_endereco:= 'ENDEREÇO: '+FPE.Endereco+#13+#10;
  cli_so:= FPE.NomeCliente+#13+#10;

  auxVencimento:= vencimento;
  auxTexto:= texto+val+val2+pagavel+cli+cli_cpf+cli_endereco;
  auxCli:= cli_so;

//  FrmRel_Promissoria:= TFrmRel_Promissoria.Create(auxVencimento, auxTexto, auxCli);
//  FrmRel_Promissoria.Release;
//  FrmRel_Promissoria:= Nil;

  {auxPro:= Alinha_Centro(vencimento,i2),vencimento, [Bold] + [DobleWide] + ' ' +#13+#10+#13+#10;
  auxPro:= auxPro + 'VALOR R$ '+'***'+FormatFloat('#0.0,0',FPE.Valor)+'***', [Bold] + [DobleWide] +#13+#10;
  auxPro:= auxPro + texto, [Bold] + [DobleWide] +#13+#10+#13+#10;
  auxPro:= auxPro + razao_social, [Bold] + [DobleWide]+#13+#10;
  auxPro:= auxPro + 'CNPJ.: '+CNPJ, [Bold] + [DobleWide]+#13+#10+#13+#10;
  auxPro:= auxPro + val, [Bold] + [DobleWide]+#13+#10;
  auxPro:= auxPro + val2, [Bold] + [DobleWide]+#13+#10+#13+#10;
  auxPro:= auxPro + pagavel, [Bold] + [DobleWide]+#13+#10+#13+#10;
  auxPro:= auxPro + cli, [Bold] + [DobleWide]+#13+#10;
  auxPro:= auxPro + Length(cli)+20, trim(Cidade)+'-'+trim(uf)+', '+FormatDateTime('dd'+QuotedStr(' DE ')+'MMMM'+QuotedStr(' DE ')+'yyyy',FPE.Data_Atual), [Bold] + [DobleWide]+#13+#10;
  auxPro:= auxPro + cli_cpf, [Bold] + [DobleWide]+#13+#10;
  auxPro:= auxPro + cli_endereco, [Bold] + [DobleWide]+#13+#10+#13+#10;
  auxPro:= auxPro + Alinha_Centro(cli_so,i2),cli_so, [Bold] + [DobleWide]+#13+#10;}

//  dm.rs.WriteFont(linha, Alinha_Centro(vencimento,i2),vencimento, [Bold] + [DobleWide]);
//  inc(linha);
//  inc(linha);
//  dm.rs.WriteFont(linha, 90,'VALOR R$ '+'***'+FormatFloat('#0.0,0',FPE.Valor)+'***', [Bold] + [DobleWide]);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, texto, [Bold] + [DobleWide]);
//  inc(linha);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, razao_social, [Bold] + [DobleWide]);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, 'CNPJ.: '+CNPJ, [Bold] + [DobleWide]);
//  inc(linha);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, val, [Bold] + [DobleWide]);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, val2, [Bold] + [DobleWide]);
//  inc(linha);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, pagavel, [Bold] + [DobleWide]);
//  inc(linha);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, cli, [Bold] + [DobleWide]);
//  dm.rs.WriteFont(linha, Length(cli)+20, trim(Cidade)+'-'+trim(uf)+', '+FormatDateTime('dd'+QuotedStr(' DE ')+'MMMM'+QuotedStr(' DE ')+'yyyy',FPE.Data_Atual), [Bold] + [DobleWide]);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, cli_cpf, [Bold] + [DobleWide]);
//  inc(linha);
//  dm.rs.WriteFont(linha, i, cli_endereco, [Bold] + [DobleWide]);
//  inc(linha);
//  inc(linha);
//  inc(linha);
//  dm.rs.WriteFont(linha, Alinha_Centro(cli_so,i2),cli_so, [Bold] + [DobleWide]);
//
//  dm.rs.Print;
end;

end.
