unit uFuncoesLog;

interface

uses
  FireDAC.Comp.Client;

procedure GravaLog(sAssunto,sErro:string;Qry:TFDQuery);
procedure GravaLogLinha(sLinha:string;sArquivo:string='');

implementation

uses
  System.Classes, System.AnsiStrings, uFuncoesStr, System.SysUtils, uFuncoesArqs;

procedure GravaLogLinha(sLinha:string;sArquivo:string='');
var
  sNomeArquivo : string;
  List_ALL : TStringList;
  I : Integer;
begin
  try
    ///Verifica se existe o diretorio de log
    CriarPasta(ExtractFilePath(ParamStr(0)) +'\LOG\');

    ///Abre o log completo
    List_ALL := TStringList.Create;
    if sArquivo='' then
      sNomeArquivo := StringReplace( ExtractFileName(ParamStr(0)),'.exe','',[rfReplaceAll]) ;
    //
    sNomeArquivo := ExtractFilePath(ParamStr(0))+'\LOG\'+sNomeArquivo+'_Linha.log';
    if FileExists(sNomeArquivo) then  List_ALL.LoadFromFile(sNomeArquivo);


    List_ALL.Add( FormatDateTime('YYYY-mm-dd hh:nn:ss.zzz',Now)+' | '+sLinha );

    try
    List_ALL.SaveToFile(sNomeArquivo);
    except
    end;

    ///FECHA as listas
    List_ALL.Free;
  except
  end;
end;
procedure GravaLog(sAssunto,sErro:string;Qry:TFDQuery);
var
  sNomeArquivo : string;
  List_Erro,List_ALL : TStringList;
  I : Integer;
begin
  try
    ///Verifica se existe o diretorio de log
    CriarPasta(ExtractFilePath(ParamStr(0)) +'\LOG\');

    ///Abre o log completo
    List_ALL := TStringList.Create;
    sNomeArquivo := StrTran( ExtractFileName(ParamStr(0)),'.exe','') ;
    sNomeArquivo := ExtractFilePath(ParamStr(0))+'\LOG\'+sNomeArquivo+'.log';
    if FileExists(sNomeArquivo) then  List_ALL.LoadFromFile(sNomeArquivo);

    ///Grava o log de erro
    List_Erro := TStringList.Create;
    List_Erro.Add('----------------------------------------------');
    List_Erro.Add(sAssunto);
    List_Erro.Add(' ');
    List_Erro.Add('----------------------------------------------');
    List_Erro.Add('EXCEPTION: ');
    List_Erro.Text := List_Erro.Text + sErro;
    //List_Erro.Add(sErro);
    List_Erro.Add(' ');
    if Qry<>nil then
    begin
        List_Erro.Add('----------------------------------------------');
        List_Erro.Add('SQL:');
        List_Erro.Add(Qry.SQL.Text);
        List_Erro.Add('----------------------------------------------');
        List_Erro.Add('PARAMS:');
        for I := 0 to Qry.ParamCount-1 do
          List_Erro.Add( Qry.Params[I].Name+' ='+Qry.Params[I].AsString);
        List_Erro.Add('----------------------------------------------');
    end;
    ///sNomeArquivo := sAtualDIR+'\LOG\GFISCAL_'+FormatDateTime('yyyymmdd',Date)+'_'+LimpaNumero(TimeTostr(Time))+'.log';
    //List_Erro.SaveToFile(sNomeArquivo);

    //// grava o erro dentro do log geral
    List_ALL.Add('');
    List_ALL.Add(Replicate('=',100));
    List_ALL.Add(Replicate('$',100));
    List_ALL.Add(Replicate('=',100));
    List_ALL.Add('LOG GERADO NO DIA '+DateToStr(Date)+' AS '+TimeToStr(Time));
    for I := 0 to List_Erro.Count - 1 do
    begin
        List_ALL.Add(List_Erro[I]);
    end;
    try
    List_ALL.SaveToFile(sNomeArquivo);
    except
    end;

    ///FECHA as listas
    List_Erro.Free;
    List_ALL.Free;
  except
  end;
end;

end.
