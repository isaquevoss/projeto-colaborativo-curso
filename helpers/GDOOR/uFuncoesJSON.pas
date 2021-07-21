unit uFuncoesJSON;

interface

uses
  system.JSON;

procedure RemoveDateTimeZeroJSON(AJsonObject: TJSONObject);

implementation
  uses
    System.SysUtils;

procedure RemoveDateTimeZeroJSON(AJsonObject: TJSONObject);
var
  LPair: TJSONPair;
  LItem: TObject;
  i: Integer;
  _Datetime: TDateTime;
begin

  for i := AJsonObject.Count - 1 downto 0 do
  begin
    LPair := TJSONPair(AJsonObject.Pairs[i]);

    if LPair.JsonValue is TJSONObject then
    begin
      RemoveDateTimeZeroJSON(TJSONObject(LPair.JsonValue));
    end
    else if LPair.JsonValue is TJSONArray then
    begin
      for LItem in TJSONArray(LPair.JsonValue) do
        if LItem is TJSONObject then
          RemoveDateTimeZeroJSON(TJSONObject(LItem))
    end
    else if (LPair.JsonValue.value <> '') then
    begin
      try
        if pos('1899-12-30',LPair.JsonValue.Value ) > 0 then
          AJsonObject.RemovePair(LPair.JsonString.value).DisposeOf;
      except

      end;



    end;

  end;

end;

end.
