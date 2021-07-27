unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmConexaoFB, uDmUsuario, uPrincipal;

type
  TfrmLogin = class(TForm)
    cbbUsuario: TComboBox;
    edtSenha: TEdit;
    btnEntrar: TButton;
    btnCancelar: TButton;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure validarLogin();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja finalizar o Sistema?', mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrNo then
    begin
      Abort;
    end
  else
    begin
      Close();
    end;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if edtSenha.Text = '' then
  begin
    ShowMessage('Preencha a senha do usu�rio '+cbbUsuario.Text+'.');
    edtSenha.SetFocus;
    Exit;
  end
  else
    validarLogin();
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    validarLogin();
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var
  i : integer;
  nomeUsuario: TStringList;
begin
   if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

   nomeUsuario := TStringList.Create();

  dmUsuario.carregarNomeUsuario(nomeUsuario);
  cbbUsuario.Items.AddStrings(nomeUsuario);

  cbbUsuario.ItemIndex := 0;
end;

procedure TfrmLogin.validarLogin;
begin
  dmUsuario.validarLogin(cbbUsuario.Text, edtSenha.Text);

  if dmUsuario.qrLogin.IsEmpty then
    begin
      ShowMessage('Senha do usu�rio '+ cbbUsuario.Text + ' inv�lida!');
      edtSenha.Text := '';
      edtSenha.SetFocus;
    end
  else
    begin
      ModalResult := mrOk;
    end;
end;

end.