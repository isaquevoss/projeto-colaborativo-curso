unit uFuncoesStr;

interface

uses
  Vcl.Controls, SysUtils, Vcl.ComCtrls, System.Classes;

function Centraliza(S: string; T: Integer): string;
function QuebrarTexto(pTexto: string; iLimite: Integer): string;
function StrTran(sP1, sP2, sP3: string): string;
function Replicate(pP1: string; pP2: Integer): string;
function LimpaNumeroVirgPonto(pP1:String):String; //0123456789,.
function LimpaNumero(pP1: string): string;        //0123456789
function ZerosEsquerda(const i: string; const Casas: byte): string;
function RemoveZerosEsq(s: string): string;
function RTF2Text(sRTF: string; Parent: TWinControl): string;
function EncodeBase64(const inStr: string): string;
function TrocaDoisPontoPorVirgula(S: String): String;
function TrocaVirgulaPorPonto(S: String): String;

implementation

function RTF2Text(sRTF: string; Parent: TWinControl): string;
var
  Rich: TRichEdit;
  List: TStringList;
  ms: TMemoryStream;
begin
  if Pos('{\rtf', sRTF) > 0 then
  begin
    List := TStringList.Create;
    Rich := TRichEdit.Create(Parent);
    ms := TMemoryStream.Create;
    try
      Rich.Parent := Parent;

      List.Text := sRTF;
      List.SaveToStream(ms);
      ms.Position := 0;
      Rich.Lines.LoadFromStream(ms);
      Result := Rich.Lines.Text;
    finally
      ms.Free;
      Rich.Free;
      List.Free;
    end;
  end
  else
    Result := sRTF;
end;

function EncodeBase64(const inStr: string): string;

  function Encode_Byte(b: Byte): char;
  const
    Base64Code: string[64] =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  begin
    Result := Char(Base64Code[(b and $3F)+1]);
  end;
var
  i: Integer;
begin
  i := 1;
  Result := '';
  while i <= Length(InStr) do
  begin
    Result := Result + Encode_Byte(Byte(inStr[i]) shr 2);
    Result := Result + Encode_Byte((Byte(inStr[i]) shl 4) or (Byte(inStr[i+1]) shr 4));
    if i+1 <= Length(inStr) then
      Result := Result + Encode_Byte((Byte(inStr[i+1]) shl 2) or (Byte(inStr[i+2]) shr 6))
    else
      Result := Result + '=';
    if i+2 <= Length(inStr) then
      Result := Result + Encode_Byte(Byte(inStr[i+2]))
    else
      Result := Result + '=';
    Inc(i, 3);
  end;
end;

function LimpaNumero(pP1: string): string;
var
    I: Integer;
begin
    Result := '';

    If (pP1 = '') then
        Result := ''
    else
    begin
        for I := 1 to length(pP1) do
            if Pos(Copy(pP1, I, 1), '0123456789') > 0 then
                Result := Result + Copy(pP1, I, 1);
    end;
end;
function LimpaNumeroVirgPonto(pP1:String):String;
{Limpa uma string deixando somente números e virgulas e pontos}
var
   I:Integer;
begin
   Result:='';
   for I := 1 to length(pP1) do
   begin
     if Pos(Copy(pP1,I,1),'0123456789,.') > 0 then
        Result:=Result+Copy(pP1,I,1);
   end;
end;

function ZerosEsquerda(const i: string; const Casas: byte): string;
var
  Ch: AnsiChar;
begin
  Result := I;

  if length(i)>Casas then
    Exit
  else
    Ch := '0';

  while Length(Result) < Casas do
    Result := String(Ch) + Result;
end;

function Centraliza(S: string; T: Integer): string;
var
  Comp, Espa: String;
begin
  Result := '';
  Comp := '                                                ';
  S := Trim(S);
  if Length(S) < T then
  begin
    Espa := Copy(Comp, 1, Round((T - Length(S)) / 2));
    Comp := Espa + S + Espa;
    if Length(Comp) < T then
      Comp := Comp + ' ';
    if Length(Comp) > T then
      Comp := Copy(Comp, 1, T);
    Result := Comp;
  end
  else
    Result := Copy(S, 1, T);
end;

function QuebrarTexto(pTexto: string; iLimite: Integer): string;
var
  iTam, iCc: Integer;
  sSobra, sCopia: String;
begin
  Result := '';
  //sSobra := Trim(pTexto);
  sSobra := pTexto;
  iTam := Length(sSobra);
  iCc := 0;
  while iTam > iLimite do
  begin
   // sCopia := Trim(Copy(sSobra, 1, iLimite));
    sCopia := Copy(sSobra, 1, iLimite);
    iCc := iCc + Length(sCopia);
    ///
    if Result <> '' then
      Result := Result + #10 + sCopia
    else
      Result := sCopia;
    ///
    sSobra := Trim(Copy(pTexto, iCc + 1, Length(pTexto)));
    iTam := Length(sSobra);
  end;
  /// /
  if Result <> '' then
    Result := Result + #13 + sSobra
  else
    Result := sSobra;
end;

function StrTran(sP1, sP2, sP3: string): string;
begin
  Result := sP1;
  if sP1 = '' then
    Exit;

  while (Pos(sP2, sP1) <> 0) do
  begin
    Insert(sP3, sP1, Pos(sP2, sP1));
    Delete(sP1, Pos(sP2, sP1), Length(sP2));
  end;

  Result := sP1;
end;

function Replicate(pP1: string; pP2: Integer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to pP2 do
    Result := Copy(Result + pP1, 1, I);
end;

function RemoveZerosEsq(s: string): string;
begin
  if Trim(s) <> '' then
  begin
    while Copy(s, 1, 1) = '0' do
    begin
      s := Copy(s, 2, Length(s));
    end;
  end;
  Result := s;
end;

function TrocaVirgulaPorPonto(S: String): String;
var
  I: Integer;
begin
  for I := 1 to length(S) do
  begin
    if copy(S, I, 1) = ',' then
    begin
      Delete(S, I, 1);
      Insert('.', S, I);
    end;
  end;
  Result := S;
end;

function TrocaDoisPontoPorVirgula(S: String): String;
var
  I: Integer;
begin
  for I := 1 to length(S) do
  begin
    if copy(S, I, 1) = ':' then
    begin
      Delete(S, I, 1);
      Insert(',', S, I);
    end;
  end;
  Result := S;
end;

end.
