unit uFuncoesValida;

interface

function ValidaCNPJ_CPF(Info : String) : string;

implementation

uses
  uFuncoesStr, System.SysUtils, uFuncoesMsgs, Winapi.Windows;


function ValidaCNPJ_CPF(Info : String) : string;
var
  I, iTamanho, iValor, iDigito1, iDigito2 : integer;
  bValida : Boolean;
  sAuxiliar : string;
begin
  bValida := False;

  sAuxiliar := LimpaNumero(Info);

  for I := 1 to Length(sAuxiliar) do
  begin
    if not (sAuxiliar[i] in ['0'..'9']) then
    begin
      Mensagem_Aviso('Letras não são permitidas.');
      Result := sAuxiliar;
      exit;
    end;
  end;

  if Length(sAuxiliar) < 11 then
  begin
    Mensagem_Aviso('A informação digitada, não se refere a um CNPJ/CPF válido.');
    Result := '';
    Exit;
  end
  else
  if Length(sAuxiliar) = 14 then
  begin
    {verifica o primeiro digito}
    iValor := StrToInt(sAuxiliar[01])*5 + StrToInt(sAuxiliar[02])*4 +
              StrToInt(sAuxiliar[03])*3 + StrToInt(sAuxiliar[04])*2 +
              StrToInt(sAuxiliar[05])*9 + StrToInt(sAuxiliar[06])*8 +
              StrToInt(sAuxiliar[07])*7 + StrToInt(sAuxiliar[08])*6 +
              StrToInt(sAuxiliar[09])*5 + StrToInt(sAuxiliar[10])*4 +
              StrToInt(sAuxiliar[11])*3 + StrToInt(sAuxiliar[12])*2 ;

    iDigito1 := iValor mod 11;

    if iDigito1 <= 1 then
      iDigito1 := 0
    else
      iDigito1 := 11 - iDigito1;

    {verifica o segundo digito}
    iValor := StrToInt(sAuxiliar[01])*6 + StrToInt(sAuxiliar[02])*5 +
              StrToInt(sAuxiliar[03])*4 + StrToInt(sAuxiliar[04])*3 +
              StrToInt(sAuxiliar[05])*2 + StrToInt(sAuxiliar[06])*9 +
              StrToInt(sAuxiliar[07])*8 + StrToInt(sAuxiliar[08])*7 +
              StrToInt(sAuxiliar[09])*6 + StrToInt(sAuxiliar[10])*5 +
              StrToInt(sAuxiliar[11])*4 + StrToInt(sAuxiliar[12])*3 + iDigito1 * 2;

    iDigito2 := iValor mod 11;

    if iDigito2 <= 1 then
      iDigito2 := 0
    else
      iDigito2 := 11 - iDigito2;

   {faz a checagem}

    if StrToInt(sAuxiliar[13]) = iDigito1 then
    begin
      if StrToInt(sAuxiliar[14]) = iDigito2 then
      begin

        bValida := True;

        Insert('.',sAuxiliar,3);
        Insert('.',sAuxiliar,7);
        Insert('/',sAuxiliar,11);
        Insert('-',sAuxiliar,16);

        Result := sAuxiliar;
      end;
    end;

    if not(bValida) then
    begin
      Mensagem_Aviso('O CNPJ não esta correto.');
      Result := '';
    end;
  end
  else
  begin
    sAuxiliar := LimpaNumero(Info);

    {verifica primeiro digito}
    iValor := 0;
    for I := 1 to 9 do
      iValor := iValor + (StrToInt(sAuxiliar[i]) * i);

    iDigito1 := iValor mod 11;

    if iDigito1 = 10 then
      iDigito1 := 0;

    {verifica segundo digito}
    iValor := 0;
    for i := 1 to 8 do
      iValor := iValor + (StrToInt(sAuxiliar[i + 1]) * (i));

    iValor := iValor + (iDigito1*9);

    iDigito2 := iValor mod 11;

    if iDigito2 = 10 then
      iDigito2 := 0;

    {faz a validação}
    if iDigito1 = StrToInt(sAuxiliar[10]) then
    begin
      if iDigito2 = StrToInt(sAuxiliar[11]) then
      begin
        bValida := True;
        Insert('.',sAuxiliar,4);
        Insert('.',sAuxiliar,8);
        Insert('-',sAuxiliar,12);
        Result := sAuxiliar;
      end;
    end;

    if not(bValida) then
    begin
      Mensagem_Aviso('O CPF não esta correto.');
      Result := '';
    end;
  end;

end;

end.
