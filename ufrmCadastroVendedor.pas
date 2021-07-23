unit ufrmCadastroVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmVendedor, ACBrBase,
  ACBrValidador;

type
  TfrmCadastroVendedor = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edNome: TEdit;
    EdComissaoAPrazo: TEdit;
    edComissaoAVista: TEdit;
    EdMaxDesconto: TEdit;
    lbCodigo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtcpfcnpj: TEdit;
    lblcpfcnpj: TLabel;
    acbrvldr1: TACBrValidador;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtcpfcnpjExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure limparFormulario();
  end;

var
  frmCadastroVendedor: TfrmCadastroVendedor;

implementation

{$R *.dfm}

procedure TfrmCadastroVendedor.Button1Click(Sender: TObject);
begin
  DmVendedor.cadastrar(edNome.Text,StrToFloat(edComissaoAVista.Text),StrToFloat(EdComissaoAPrazo.Text),StrToFloat(EdMaxDesconto.Text));

  ModalResult := mrOk;
end;

procedure TfrmCadastroVendedor.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadastroVendedor.FormShow(Sender: TObject);
begin
  limparFormulario();
end;

procedure TfrmCadastroVendedor.limparFormulario;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TEdit then
      TEdit( Components[I] ).Text := '';
  end;
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

procedure TfrmCadastroVendedor.edtcpfcnpjExit(Sender: TObject);
var
  cnpjCpf: string;
begin

//  cnpjCpf := edCnpjCpf.Text;

  cnpjCpf := soNumeros(edtcpfcnpj.Text);

  if Length(cnpjCpf) > 11 then
  begin

    acbrvldr1.TipoDocto := docCNPJ;
    acbrvldr1.Documento := cnpjCpf;
    if not acbrvldr1.Validar then
    begin
      ShowMessage(acbrvldr1.MsgErro);
    end;
    if cnpjCpf.Length = 14 then
      edtcpfcnpj.Text := acbrvldr1.Formatar;
  end
  else
  begin
    acbrvldr1.TipoDocto := docCPF;
    acbrvldr1.Documento := cnpjCpf;
    if not acbrvldr1.Validar then
    begin
      ShowMessage(acbrvldr1.MsgErro);
    end;
    if cnpjCpf.Length = 11 then
      edtcpfcnpj.Text := acbrvldr1.Formatar;
  end;

end;



end.
