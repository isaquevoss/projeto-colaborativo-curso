unit uFuncoesArqs;

interface



function CriarPasta(sNome: string): Boolean;
function DefineSegurancaTodos(pFileOuFolder: string): Boolean;
function ConverteParaBmp(ACaminhoFoto: string) : string;


implementation

uses
  System.SysUtils, uSegurancaSID, Winapi.Windows, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Graphics;

function DefineSegurancaTodos(pFileOuFolder: string): Boolean;
begin
    Result:= SetEveryoneRWEDAccessToFileOrFolderAndSubobjects(pFileOuFolder);
end;

function CriarPasta(sNome: string): Boolean;
begin
  Result := False;
  if sNome = '' then
    exit;
  ///
  if not(DirectoryExists(sNome)) then
  begin
    ForceDirectories(sNome);
    DefineSegurancaTodos(sNome);
    Sleep(500);
  end;
  ///
  Result := DirectoryExists(sNome);
end;

function ConverteParaBmp(ACaminhoFoto: string) : string;
var
   cjBmp: TBitmap;
   cjJpg: TJpegImage;
   strNomeSemExtensao, sNovoArq, sTipo: string;
   AFoto: TImage;
   cjPNG : TPNGObject;
   cjGif : TGIFImage;
begin
   cjGif := TGIFImage.Create;
   cjJpg := TJPegImage.Create;
   cjBmp := TBitmap.Create;
   cjPNG := TPNGObject.Create;

   sNovoArq := 'Logo.bmp';

   AFoto         := TImage.Create(nil);
   AFoto.Visible := False;
   sTipo  := UpperCase(ExtractFileExt(ACaminhoFoto));

   try
      if sTipo = '.PNG' then
      begin
         cjPNG.LoadFromFile(ACaminhoFoto);
         cjBmp.Assign(cjPNG);
         //MudarTamanhoImagem(cjPNG, 230, 180); //220/200
      end
      else
      if sTipo = '.GIF' then
      begin
         cjGif.LoadFromFile(ACaminhoFoto);
         cjBmp.Assign(cjGif);
         //MudarTamanhoImagem(cjGif, 230, 180);
      end
      else
      if (sTipo = '.JPG') or (sTipo = '.JPEG')  then
      begin
         cjJpg.LoadFromFile(ACaminhoFoto);
         cjBmp.Assign(cjJpg);
         //MudarTamanhoImagem(cjBmp, 230, 180);
      end
      else
      begin
         cjBmp.LoadFromFile(ACaminhoFoto);
         //MudarTamanhoImagem(cjJpg, 230, 180);
      end;

      cjBmp.SaveToFile(sNovoArq);

//      DeleteFile(PAnsiChar(ACaminhoFoto));

      cjGif.Free;
      cjJpg.Free;
      cjBmp.Free;
      cjPNG.Free;

      Result := sNovoArq;
   except
      Result := ACaminhoFoto;
   end;

   AFoto.Free;
end;

end.
