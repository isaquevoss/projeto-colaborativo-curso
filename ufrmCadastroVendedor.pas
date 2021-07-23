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

uses
  Winapi.Windows;

{$R *.dfm}

procedure TfrmCadastroVendedor.Button1Click(Sender: TObject);
begin
  DmVendedor.cadastrar(edNome.Text,StrToFloat(edComissaoAVista.Text),StrToFloat(EdComissaoAPrazo.Text),StrToFloat(EdMaxDesconto.Text), edtCpfCnpj.Text);

  ModalResult := mrOk;
end;

procedure TfrmCadastroVendedor.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadastroVendedor.cbbCpfCnpjSelect(Sender: TObject);
begin
    if cbbCpfCnpj.ItemIndex = -1 then
    edtCpfCnpj.Enabled := False
  else
    edtCpfCnpj.Enabled := True;

  edtCpfCnpj.Text := '';
end;

procedure TfrmCadastroVendedor.edtCpfCnpjChange(Sender: TObject);
begin

  if cbbCpfCnpj.ItemIndex = 0 then
  begin
    edtCpfCnpj.MaxLength := 14;

    if length(edtCpfCnpj.Text) = 3 then
    begin
      edtCpfCnpj.Text := edtCpfCnpj.Text + '.';
      edtCpfCnpj.SelStart := length(edtCpfCnpj.Text);
    end;

    if length(edtCpfCnpj.Text) = 7 then
    begin
      edtCpfCnpj.Text := edtCpfCnpj.Text + '.';
      edtCpfCnpj.SelStart := length(edtCpfCnpj.Text);
    end;

    if length(edtCpfCnpj.Text) = 11 then
    begin
      edtCpfCnpj.Text := edtCpfCnpj.Text + '-';
      edtCpfCnpj.SelStart := length(edtCpfCnpj.Text);
    end;
  end;

  if cbbCpfCnpj.ItemIndex = 1 then
  begin
    edtCpfCnpj.MaxLength := 18;

    if length(edtCpfCnpj.Text) = 2 then
    begin
      edtCpfCnpj.Text := edtCpfCnpj.Text + '.';
      edtCpfCnpj.SelStart := length(edtCpfCnpj.Text);
    end;

    if length(edtCpfCnpj.Text) = 6 then
    begin
      edtCpfCnpj.Text := edtCpfCnpj.Text + '.';
      edtCpfCnpj.SelStart := length(edtCpfCnpj.Text);
    end;

    if length(edtCpfCnpj.Text) = 10 then
    begin
      edtCpfCnpj.Text := edtCpfCnpj.Text + '/';
      edtCpfCnpj.SelStart := length(edtCpfCnpj.Text);
     end;

    if length(edtCpfCnpj.Text) = 15 then
    begin
      edtCpfCnpj.Text := edtCpfCnpj.Text + '-';
      edtCpfCnpj.SelStart := length(edtCpfCnpj.Text);
    end;
  end;
end;

procedure TfrmCadastroVendedor.edtCpfCnpjExit(Sender: TObject);
begin
  if Length(edtCpfCnpj.Text) = 18 then
  begin
    acbrvldrcpf.Documento := edtCpfCnpj.Text;
    acbrvldrcpf.TipoDocto := docCNPJ;

    if not acbrvldrcpf.Validar then
    begin
      ShowMessage('CNPJ inválido!');
      edtCpfCnpj.SetFocus;
    end;
  end;

  if Length(edtCpfCnpj.Text) = 14 then
  begin
    acbrvldrcpf.Documento := edtCpfCnpj.Text;
    acbrvldrcpf.TipoDocto := docCPF;

    if not acbrvldrcpf.Validar then
    begin
      ShowMessage('CPF inválido!');
      edtCpfCnpj.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroVendedor.FormShow(Sender: TObject);
begin
  limparFormulario();

  if cbbCpfCnpj.ItemIndex = -1 then
  edtCpfCnpj.Enabled := False;
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
