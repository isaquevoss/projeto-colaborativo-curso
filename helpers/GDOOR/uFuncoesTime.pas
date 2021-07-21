unit uFuncoesTime;

interface

function TempoRestante(iQtdTotal, iQtdRestante: integer; DateTimeInicial: TDateTime): TDateTime;
function JSONDate_To_Datetime(JSONDate: string): TDatetime; //  'ddd, d mmm yyyy hh:nn:ss'
function IncrementaData(Tipo: String; Data: TDate): TDate;

implementation

uses
  system.dateutils, system.SysUtils, system.StrUtils;

function TempoRestante(iQtdTotal, iQtdRestante: integer; DateTimeInicial: TDateTime): TDateTime;
var
  Milliseconds: integer;
begin
  Milliseconds := MilliSecondsBetween(Now, DateTimeInicial);
  Milliseconds := trunc(Milliseconds * ((iQtdRestante - iQtdTotal) / iQtdRestante));
  Result := Milliseconds / (SecsPerDay * 1000.0);
end;

function JSONDate_To_Datetime(JSONDate: string): TDatetime;
var Year, Month, Day, Hour, Minute, Second: Word;
  sMonth : String;
begin

  Year        := StrToInt(Copy(JSONDate, 13, 4));
  sMonth       := Copy(JSONDate, 9, 3);
  Day         := StrToInt(Copy(JSONDate, 6, 2));
  Hour        := StrToInt(Copy(JSONDate, 18, 2));
  Minute      := StrToInt(Copy(JSONDate, 21, 2));
  Second      := StrToInt(Copy(JSONDate, 24, 2));

  case AnsiIndexStr(sMonth,['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']) of
    0: Month := 1;
    1: Month := 2;
    2: Month := 3;
    3: Month := 4;
    4: Month := 5;
    5: Month := 6;
    6: Month := 7;
    7: Month := 8;
    8: Month := 9;
    9: Month := 10;
    10: Month := 11;
    11: Month := 12;
  end;

  Result := EncodeDateTime(Year, Month, Day, Hour, Minute, Second, 0);
end;

function IncrementaData(Tipo: String; Data: TDate): TDate;
var
  y, m, d, u: Word;
  Da: TDate;
  function Ultimodia(Data: TDate): word;
  var
    y, m, d: Word;
    Ud: TDate;
  begin
    DecodeDate(Data, y, m, d);
    m := m + 1;
    if m > 12 then
    begin
      y := y + 1;
      m := 1;
    end;
    Ud := EncodeDate(y, m, 1) - 1;
    DecodeDate(Ud, y, m, d);
    Result := d;
  end;
begin
  DecodeDate(Data, y, m, d);
  if Tipo = 'MES' then
  begin
    m := m + 1;
    if m > 12 then
    begin
      y := y + 1;
      m := 1;
    end;
    Da := EncodeDate(y, m, 1);
    u := Ultimodia(Da);
    if d > u then
      d := u;
    Da := EncodeDate(y, m, d);
  end
  else
  if Tipo = '7' then
    Da := EncodeDate(y, m, d) + 7
  else
  if Tipo = '15' then
    Da := EncodeDate(y, m, d) + 15
  else
  if Tipo = '30' then
    Da := EncodeDate(y, m, d) + 30
  else
    Da := EncodeDate(y, m, d) + StrToInt(Tipo);
  Result := Da;
end;



end.
