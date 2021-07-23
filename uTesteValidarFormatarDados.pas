unit uTesteValidarFormatarDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ACBrBase, ACBrValidador,
  Vcl.ExtCtrls;

type
  TFrmValidarFormatarDados = class(TForm)
    ACBrValidador1: TACBrValidador;
    Edit1: TEdit;
    Label1: TLabel;
    imgerro: TImage;
    imgok: TImage;
    img: TImage;
    edCnpjCpf: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure Edit1Change(Sender: TObject);
    procedure edCnpjCpfExit(Sender: TObject);
    procedure edCnpjCpfChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmValidarFormatarDados: TFrmValidarFormatarDados;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TFrmValidarFormatarDados.Edit1Change(Sender: TObject);
var
  cnpj: string;
begin
  cnpj := Edit1.Text;
  ACBrValidador1.Documento := cnpj;
  ACBrValidador1.TipoDocto := docCNPJ;
  Edit1.Text := ACBrValidador1.Formatar();

  if not ACBrValidador1.validar then
    img.Picture := imgerro.Picture
  else
    img.Picture := imgok.Picture;
end;

function soNumeros(_texto: string): string;
var
  i: Integer;
  letra: string;
begin
  for i := 1 to _texto.Length do
  begin
    letra := Copy(_texto, i, 1);
    if Pos(letra, '1234567890') > 0 then
      Result := Result + Copy(_texto, i, 1);
  end;
end;

procedure TFrmValidarFormatarDados.edCnpjCpfChange(Sender: TObject);
begin
  if soNumeros(edCnpjCpf.Text).Length > 11 then
    ComboBox1.ItemIndex := 1
  else
    ComboBox1.ItemIndex := 0;


end;

procedure TFrmValidarFormatarDados.edCnpjCpfExit(Sender: TObject);
var
  cnpjCpf: string;
begin

//  cnpjCpf := edCnpjCpf.Text;

  cnpjCpf := soNumeros(edCnpjCpf.Text);

  if Length(cnpjCpf) > 11 then
  begin

    ACBrValidador1.TipoDocto := docCNPJ;
    ACBrValidador1.Documento := cnpjCpf;
    if not ACBrValidador1.Validar then
    begin
      ShowMessage(ACBrValidador1.MsgErro);
    end;
    if cnpjCpf.Length = 14 then
      edCnpjCpf.Text := ACBrValidador1.Formatar;
  end
  else
  begin
    ACBrValidador1.TipoDocto := docCPF;
    ACBrValidador1.Documento := cnpjCpf;
    if not ACBrValidador1.Validar then
    begin
      ShowMessage(ACBrValidador1.MsgErro);
    end;
    if cnpjCpf.Length = 11 then
      edCnpjCpf.Text := ACBrValidador1.Formatar;
  end;

end;

end.

