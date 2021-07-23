unit uFuncoesApplication;

interface

uses
  Vcl.Forms, System.Types, System.SysUtils, Windows, System.Win.Registry, uFuncoesStr, Winapi.TlHelp32, Winapi.PsAPI,
  System.Classes, Winapi.ShellAPI, Vcl.Controls, Winapi.Messages, Winsock, uFuncoesMsgs, FireDAC.Comp.Client;

const
  LF = #13#10; 

Procedure FecharApplication;
Procedure FecharSistema(sLog: string = '');
function SysWinVersion: string;
function TaskKill(ExeFileName: string): Boolean;
function ProcessoExist(ExeProcesso: string): Boolean;
function TaskKillBat(ExeFileName: string): Boolean;
function SysSystemDir: string;
procedure FocoNoCampo(Sender: TObject);
function iIF(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
function VersaoArquivo(Exe: string = ''): string;
procedure TABnoENTER(Key: Char; Form: TForm);
function ExecutarComando(CmdLine: AnsiString; Visibility: Integer): DWORD;
function SysComputerName: string;
function SysIP: string;
function SysUserFromWindows: string;
function DeletarPasta(FullPath : string) : boolean;
function FloatToInt(i1: Real): Integer;
function StrZero(Num: Double; Zeros, Deci: Integer): string;
function QtdCasasDecimais(Value: Extended): Integer;
procedure AbreAjuda(Param: string);
function Feriado(pConexao : TFDConnection; pData : TDate) : Boolean;
procedure GerarLancamentoCaixa(Historico,Integra: string; Entrada, Saida:Currency; Conexao : TFDConnection);
procedure GerarContaReceber(Documento,Historico,Cod_Cliente,Nom_Cliente,Especie,Num_conta,Cto_custo,Portador, Tipo_Doc : string; Emissao,Vencimento : TDateTime ; Valor_Dup : Currency ;  Num_Parcela : Integer ; Conexao : TFDConnection);
procedure EstornarLancamentoCaixa(Integra: string;Conexao : TFDConnection);
procedure EstornarContaReceber(Documento: string;Conexao : TFDConnection);


implementation

uses
  uFuncoesLog;


function SysUserFromWindows: string;
var
  userName: string;
  userNameLen: DWORD;
begin
  userNameLen := 255;
  SetLength(userName, userNameLen);

  if GetUserName(PChar(userName), userNameLen) then
    Result := Copy(userName, 1, userNameLen - 1)
  else
    Result := 'Desconhecido';
end;

function SysIP: string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PansiChar(Name), 255);
  SetLength(Name, StrLen(PansiChar(Name)));
  HostEnt := gethostbyname(PansiChar(Name));
  with HostEnt^ do
    Result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
  WSACleanup;
end;

function SysComputerName: string;
var
  I: DWORD;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

function ExecutarComando(CmdLine: AnsiString; Visibility: Integer): DWORD;
{ Executa o comando e aguarda o término }
{ Exemplo: cmd /C teste.bat }
var
  zAppName: array [0 .. 512] of Char;
  zCurDir: array [0 .. 255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, String(CmdLine));
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil, zAppName, // pointer to command line string }
    nil, // pointer to process security attributes }
    nil, // pointer to thread security attributes }
    false, // handle inheritance flag }
    CREATE_NEW_CONSOLE or // creation flags }
    NORMAL_PRIORITY_CLASS, nil, // pointer to new environment block }
    nil, // pointer to current directory name }
    StartupInfo, // pointer to STARTUPINFO }
    ProcessInfo) then
  begin
    Result := 9; // pointer to PROCESS_INF }
  end
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);

    GetExitCodeProcess(ProcessInfo.hProcess, Result);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end;

procedure TABnoENTER(Key: Char; Form: TForm);
begin
  // verifica se a tecla pressionada é a tecla ENTER, conhecida pelo delphi como #13
  If Key = #13 then
  Begin
    // se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Form.Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

function VersaoArquivo(Exe: string = ''): string;
var
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  if Exe = '' then
    Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d', [LongRec(FixedPtr.dwFileVersionMS).Hi, LongRec(FixedPtr.dwFileVersionMS).Lo, LongRec(FixedPtr.dwFileVersionLS).Hi,
    LongRec(FixedPtr.dwFileVersionLS).Lo]);
end;

function iIF(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Expressao then
    Result := ParteTRUE
  else
    Result := ParteFALSE;
end;

function SysSystemDir: string;
begin
  SetLength(Result, MAX_PATH);
  if GetSystemDirectory(PChar(Result), MAX_PATH) > 0 then
    Result := IncludeTrailingPathDelimiter(string(PChar(Result)))
  else
    Result := '';
end;

function TaskKillBat(ExeFileName: string): Boolean;
var
  sArq: TStringList;
  sArqBat: string;
begin
  Result := false;
  sArqBat := SysSystemDir + '\mataF.bat';
  sArq := TStringList.Create;
  sArq.Add('taskkill /F /IM "' + ExeFileName + '" /T');
  sArq.Add('tasklist /nh /fi "imagename eq ' + ExeFileName + '" | find /i "' + ExeFileName + '" >nul && (taskkill /F /IM "' + ExeFileName + '" /T )');
  sArq.Add('del "' + sArqBat + '" /s');
  Try
    sArq.SaveToFile(sArqBat);
  except
  End;
  sArq.Free;

  if FileExists(sArqBat) then
    ShellExecute(0, 'Open', PChar(sArqBat), '', PChar(ExtractFilePath(sArqBat)), SW_hide);

  Result := not(ProcessoExist(ExeFileName))
end;

function SysWinVersion: string;
var
  VersionInfo: TOSVersionInfo;
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\MicroSoft\Windows NT\CurrentVersion', TRUE);
  Result := Trim(StrTran(Reg.ReadString('ProductName'), 'Microsoft', ''));

  if Result = '' then
  begin
    VersionInfo.dwOSVersionInfoSize := Sizeof(VersionInfo);
    GetVersionEx(VersionInfo);
    Result := '';
    with VersionInfo do
    begin
      case dwPlatformId of
        1:
          case dwMinorVersion of
            0:
              Result := 'Windows 95';
            10:
              Result := 'Windows 98';
            90:
              Result := 'Windows Me';
          end;
        2:
          case dwMajorVersion of
            3:
              Result := 'Windows NT ' + intToStr(dwMajorVersion) + '.' + intToStr(dwMinorVersion);
            4:
              Result := 'Windows NT ' + intToStr(dwMajorVersion) + '.' + intToStr(dwMinorVersion);
            5:
              case dwMinorVersion of
                0:
                  Result := 'Windows 2000';
                1:
                  Result := 'Windows XP';
                2:
                  Result := 'Windows Server 2003';
              end;
            6:
              case dwMinorVersion of
                0:
                  Result := 'Windows Vista';
                1:
                  Result := 'Windows Seven';
                2:
                  Result := 'Windows Server 2008';
              end;
          end;
      else
        Result := 'Windows ' + intToStr(dwPlatformId) + ' - ' + intToStr(dwMajorVersion) + '.' + intToStr(dwMinorVersion);
      end;
    end;
  end;
  if (Result = '') then
    Result := 'Windows +';
end;

procedure FocoNoCampo(Sender: TObject);
begin
  try
    if (TWinControl(Sender).Enabled) and (TWinControl(Sender).Visible) then
      TWinControl(Sender).SetFocus;
  except

  end;
end;

function TerminarProcesso(sFile: string): Boolean;
var
  verSystem: TOSVersionInfo;
  hdlSnap, hdlProcess: THandle;
  bPath, bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: Array [0 .. 1023] of DWORD;
  iC: DWORD;
  K, iCount: Integer;
  arrModul: Array [0 .. 299] of Char;
  hdlModul: HMODULE;
begin
  Result := false;
  if ExtractFileName(sFile) = sFile then
    bPath := false
  else
    bPath := TRUE;
  verSystem.dwOSVersionInfoSize := Sizeof(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
  begin

    hdlSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    peEntry.dwSize := Sizeof(peEntry);
    bLoop := Process32First(hdlSnap, peEntry);
    while Integer(bLoop) <> 0 do
    begin
      if bPath then
      begin
        if CompareText(peEntry.szExeFile, sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, false, peEntry.th32ProcessID), 0);
          Result := TRUE;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(peEntry.szExeFile), sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, false, peEntry.th32ProcessID), 0);
          Result := TRUE;
        end;
      end;
      bLoop := Process32Next(hdlSnap, peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else if verSystem.dwPlatformId = VER_PLATFORM_WIN32_NT then
  begin

    EnumProcesses(@arrPid, Sizeof(arrPid), iC);
    iCount := iC div Sizeof(DWORD);
    for K := 0 to Pred(iCount) do
    begin
      hdlProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, arrPid[K]);
      if (hdlProcess <> 0) then
      begin
        EnumProcessModules(hdlProcess, @hdlModul, Sizeof(hdlModul), iC);
        GetModuleFilenameEx(hdlProcess, hdlModul, arrModul, Sizeof(arrModul));
        if bPath then
        begin
          if CompareText(arrModul, sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, false, arrPid[K]), 0);
            Result := TRUE;
          end;
        end
        else
        begin
          if CompareText(ExtractFileName(arrModul), sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, false, arrPid[K]), 0);
            Result := TRUE;
          end;
        end;
        CloseHandle(hdlProcess);
      end;
    end;
  end;

  { Se ainda nao finalizou tenta o taskKill }
  if Result = false then
    Result := TaskKill(sFile);

  if ProcessoExist(sFile) then
    Result := TaskKillBat(sFile);
end;

function ProcessoExist(ExeProcesso: string): Boolean;
var
  ContinueLoop: Bool;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
  sLista: TStringList;
  I: Integer;
begin
  Result := false;
  sLista := TStringList.Create;

  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while ContinueLoop { and (not Boolean(Result)) } do
  begin
    sLista.Add(FProcessEntry32.szExeFile);
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;

  for I := 0 to sLista.Count - 1 do
  begin
    if AnsiUpperCase(ExeProcesso) = AnsiUpperCase(sLista[I]) then
      Result := TRUE;
  end;

  sLista.Free;
end;

function TaskKill(ExeFileName: string): Boolean;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: Bool;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := false;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result := (TerminateProcess(OpenProcess(PROCESS_TERMINATE, Bool(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

Procedure FecharApplication;
begin
  // se for windows server, nao derruba exe
  if (Pos('server', AnsiUpperCase(SysWinVersion)) = 0) and (Pos('20', AnsiUpperCase(SysWinVersion)) = 0) then
    // Demais windows derruba pelo nome do exe
    TerminarProcesso(Application.ExeName);

  //
  Application.Terminate;
end;

Procedure FecharSistema(sLog: string = '');
begin
  // FecharApplication(sLog);
  FecharApplication
end;

function DeletarPasta(FullPath : string) : boolean;
var
  sr: TSearchRec;
  FullName: string;
begin
  Result := True;
  if (FindFirst(FullPath + '\*.*', faAnyFile, sr) = 0) then
  try
    repeat
      FullName := IncludeTrailingPathDelimiter(FullPath) + sr.Name;
      if (sr.Name <> '.') and (sr.Name <> '..') then
      begin
        if ((sr.Attr and faDirectory) = 0) then Result := DeleteFile(pWideChar(FullName))
        else Result := DeletarPasta(FullName);
      end;
    until (FindNext(sr) <> 0) or not Result;
  finally

  end;
  Result := Result and DirectoryExists(FullPath) and RemoveDir(FullPath);
end;

function FloatToInt(i1: Real): Integer;
begin
  Result := StrToInt(StrZero(i1, 1, 0));
end;

function StrZero(Num: Double; Zeros, Deci: Integer): string;
var
  sVal: string;
begin
  sVal := FloatToStr(Num);
  if (QtdCasasDecimais(Num) = 3) and (sVal[Length(sVal)] = '5') and (Deci <= 2) then
  begin
    sVal := sVal + '6';
    Num := StrToFloat(sVal);
  end;

  /// Função original STRZERO
  Result := '';
  Result := Result + StrTran(Format('%' + IntToStr(Zeros) + '.' + IntToStr(Deci) + 'f', [Num]), ' ', '0');
  if Pos('-', Result) > 0 then
  begin
    Delete(Result, Pos('-', Result), 1);
    Result := '-' + Result;
  end;
end;

function QtdCasasDecimais(Value: Extended): Integer;
Var
  x: String;
begin
  x := FloatToStr(Value + 0);
  Result := 0;

  while Pos(',', x) > 0 do
  begin
    Result := Result + 1;
    Value := Value * 10;
    x := FloatToStr(Value + 0);
  end;
end;

procedure AbreAjuda(Param: string);
var
  PrEt, pDirApp: String;
begin
  pDirApp := ExtractFilePath(Application.ExeName);
  PrEt := pDirApp + 'Ajuda.exe';

  if not FileExists(PrEt) then
    Mensagem_Aviso('O programa Ajuda.exe não foi localizado na pasta.' + #13#10 + pDirApp)
  else
    ShellExecute(Application.Handle, 'open', PChar(PrEt), PChar(Param), PChar(pDirApp), SW_SHOW);
end;

function Feriado(pConexao : TFDConnection; pData : TDate) : Boolean;
var
  pQuery: TFDQuery;

begin
	pQuery := TFDQuery.Create(nil);
  pQuery.Connection := pConexao;

  pQuery.open('select * from FERIADOS');
  pQuery.first;

  Result := false;
  while not pQuery.eof do
  begin
    if FormatDateTime('ddMM',pData)=FormatDateTime('ddMM',pQuery.FieldByName('DATA').AsDateTime) then
    Result:=true;
    pQuery.Next;
	end;
end;

procedure GerarLancamentoCaixa(Historico,Integra: string; Entrada, Saida:Currency; Conexao : TFDConnection);
var
  wQr : TFDQuery;
begin
  wQr := TFDQuery.Create(nil);
  wQr.Connection := Conexao;
  wQr.SQL.Clear;
  wQr.SQL.Text := 'INSERT INTO CAIXA'
              +LF+'(DATA,'
              +LF+'HORA,'
              +LF+'HISTORICO,'
              +LF+'ENTRADA,'
              +LF+'SAIDA,'
              +LF+'INTEGRA)'
              +LF+'VALUES('
              +LF+':DATA,'
              +LF+':HORA,'
              +LF+':HISTORICO,'
              +LF+':ENTRADA,'
              +LF+':SAIDA,'
              +LF+':INTEGRA)';
  wQr.ParamByName('DATA').AsDate :=  Now;
  wQr.ParamByName('HORA').AsTime :=  Now;       
  wQr.ParamByName('HISTORICO').AsString := Historico;
  wQr.ParamByName('ENTRADA').AsCurrency := Entrada;
  wQr.ParamByName('SAIDA').AsCurrency := Saida;
  wQr.ParamByName('INTEGRA').AsString := Integra;

  try
    wQr.ExecSQL;
  Except on e: Exception do
    begin
     Mensagem_Erro('Ocorreu um erro ao gerar registro no livro caixa.'+LF+e.Message);
     GravaLog('Gerando movimentação no Livro Caixa',e.Message,wQr);
    end;
  end;

  try
    wQr.SQL.Clear;
    wQr.SQL.Text := ' INSERT INTO ROTAS (DOCUMENTO, ORIGEM, DESTINO) VALUES (:DOCUMENTO, :ORIGEM, :DESTINO) ';
    wQr.ParamByName('DOCUMENTO').AsString := Integra;
    wQr.ParamByName('ORIGEM').AsString := 'R';
    wQr.ParamByName('DESTINO').AsString := 'C';
    wQr.ExecSQL;
  except on e: Exception do
    GravaLog('Gravando rotas do Livro Caixa',e.Message,wQr);
  end;

  FreeAndNil(wQr);
end;

procedure GerarContaReceber(Documento,Historico,Cod_Cliente,Nom_Cliente,Especie,Num_conta,Cto_custo,Portador, Tipo_Doc : string; Emissao,Vencimento : TDateTime ; Valor_Dup : Currency ;  Num_Parcela : Integer ; Conexao : TFDConnection);
var
wQr : TFDQuery;
begin
  wQr := TFDQuery.Create(nil);
  wQr.Connection := Conexao;
  wQr.SQL.Clear;
  wQr.SQL.Text := 'INSERT INTO RECEBER('
              +LF+'DOCUMENTO,'
              +LF+'HISTORICO,'
              +LF+'COD_CLIENTE,'
              +LF+'NOM_CLIENTE,'
              +LF+'ESPECIE,'
              +LF+'NUM_CONTA,'
              +LF+'CTO_CUSTO,'
              +LF+'PORTADOR,'
              +LF+'TIPO_DOC,'
              +LF+'EMISSAO,'
              +LF+'VENCIMENTO,'
              +LF+'VALOR_DUP,'
              +LF+'NUM_PARCELA'
              +LF+')VALUES('
              +LF+':DOCUMENTO,'
              +LF+':HISTORICO,'
              +LF+':COD_CLIENTE,'
              +LF+':NOM_CLIENTE,'
              +LF+':ESPECIE,'
              +LF+':NUM_CONTA,'
              +LF+':CTO_CUSTO,'
              +LF+':PORTADOR,'
              +LF+':TIPO_DOC,'
              +LF+':EMISSAO,'
              +LF+':VENCIMENTO,'
              +LF+':VALOR_DUP,'
              +LF+':NUM_PARCELA)';

 wQr.ParamByName('DOCUMENTO').AsString := Documento;
 wQr.ParamByName('HISTORICO').AsString := Historico;
 wQr.ParamByName('COD_CLIENTE').AsString := Cod_Cliente;
 wQr.ParamByName('NOM_CLIENTE').AsString := Nom_Cliente;
 wQr.ParamByName('ESPECIE').AsString := Especie;
 if Num_conta <> '' then
 wQr.ParamByName('NUM_CONTA').AsString := num_conta;
 if Cto_custo <> '' then
 wQr.ParamByName('CTO_CUSTO').AsString := Cto_custo;
 wQr.ParamByName('PORTADOR').AsString := Portador;
 wQr.ParamByName('TIPO_DOC').AsString :=  Tipo_Doc;
 wQr.ParamByName('EMISSAO').AsDate :=  Emissao;
 wQr.ParamByName('VENCIMENTO').AsDate := Vencimento;
 wQr.ParamByName('VALOR_DUP').AsCurrency := Valor_Dup;
 wQr.ParamByName('NUM_PARCELA').AsInteger := Num_Parcela;

 try
  wQr.ExecSQL;
 Except on e: Exception do
  begin
   Mensagem_Erro('Ocorreu um erro ao gerar a conta a receber.'+LF+e.Message);
   GravaLog('Gerando conta a receber',e.Message,wQr);
  end;
 end;
  FreeAndNil(wQr);
end;

procedure EstornarLancamentoCaixa(Integra: string;Conexao : TFDConnection);
var
wQr, wQrAux : TFDQuery;
begin

  wQr := TFDQuery.Create(nil);
  wQr.Connection := Conexao;
  wQr.SQL.Clear;
  wQr.SQL.Text := 'SELECT * FROM CAIXA WHERE CAIXA.INTEGRA like :INTEGRA';
  wQr.ParamByName('INTEGRA').AsString := Integra;
  wQr.Open;
  wQr.First;
 try
  wQrAux := TFDQuery.Create(nil);
  wQrAux.Connection := Conexao;
  while not wQr.Eof do
  begin
     wQrAux.sql.Clear;
     wQrAux.SQL.Text :=  'insert into CAIXA ' +
                     '(DATA, HORA, HISTORICO, ENTRADA, SAIDA, PLACONTA, ' +
                     ' DESCONTA, CTOCUSTO, DESCUSTO, INTEGRA) ' +
                     ' values ' +
                     '(:DATA, :HORA, :HISTORICO, :ENTRADA, :SAIDA, :PLACONTA, ' +
                     ' :DESCONTA, :CTOCUSTO, :DESCUSTO, :INTEGRA) ';
    wQrAux.ParamByName('DATA').AsDate        := now;
    wQrAux.ParamByName('HORA').AsTime        := now;
    wQrAux.ParamByName('HISTORICO').AsString := 'Canc./Estorno do documento: ' + wQr.FieldByName('INTEGRA').AsString;
    wQrAux.ParamByName('ENTRADA').AsFloat    := 0;
    wQrAux.ParamByName('SAIDA').AsFloat      := wQr.FieldByName('ENTRADA').AsFloat;
    wQrAux.ParamByName('PLACONTA').AsString  := wQr.FieldByName('PLACONTA').AsString;
    wQrAux.ParamByName('DESCONTA').AsString  := wQr.FieldByName('DESCONTA').AsString;
    wQrAux.ParamByName('CTOCUSTO').AsString  := wQr.FieldByName('CTOCUSTO').AsString;
    wQrAux.ParamByName('DESCUSTO').AsString  := wQr.FieldByName('DESCUSTO').AsString;
    wQrAux.ExecSQL;
    wQr.Next;
  end;
  //Altera o integra para não gerar estorno em duplicidade caso reprocessar o financeiro e estornar
  wQr.SQL.Clear;
  wQr.SQL.Text := 'UPDATE CAIXA SET INTEGRA = ''E''||INTEGRA WHERE INTEGRA like :INTEGRA';
  wQr.ParamByName('INTEGRA').AsString := Integra;
  wQr.ExecSQL;

 Except on e: Exception do
  begin
   Mensagem_Erro('Ocorreu um erro ao estornar os lançamentos do caixa.'+LF+e.Message);
   GravaLog('Estornar lançamento do livro caixa',e.Message,wQr);
  end;
 end;
  FreeAndNil(wQr);
  FreeAndNil(wQrAux);
end;

procedure EstornarContaReceber(Documento: string;Conexao : TFDConnection);
var
wQr : TFDQuery;
begin
  wQr := TFDQuery.Create(nil);
  wQr.Connection := Conexao;
  wQr.SQL.Clear;
  wQr.SQL.Text := 'DELETE FROM RECEBER WHERE DOCUMENTO LIKE :DOCUMENTO;';
  wQr.ParamByName('DOCUMENTO').AsString := Documento + '%';
 try
  wQr.ExecSQL;
 Except on e: Exception do
  begin
   Mensagem_Erro('Ocorreu um erro ao estornar a conta a receber.'+LF+e.Message);
   GravaLog('Estornando conta a receber',e.Message,wQr);
  end;
 end;
  FreeAndNil(wQr);
end;
end.
