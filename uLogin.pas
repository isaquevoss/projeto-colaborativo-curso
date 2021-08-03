unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmConexaoFB, uDmUsuario, uPrincipal,
  Vcl.ExtCtrls, uUsuarioClasse, uCadastroUsuario;

type
  TfrmLogin = class(TForm)
    cbbUsuario: TComboBox;
    edtSenha: TEdit;
    btnEntrar: TButton;
    btnCancelar: TButton;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblNovoUsuario: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure validarLogin();
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblNovoUsuarioClick(Sender: TObject);
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
    ShowMessage('Preencha a senha do usuário '+cbbUsuario.Text+'.'+#13+'Dica: Caso não souber a senha tecle CTRL+T');
    edtSenha.SetFocus;
    Exit;
  end
  else
    validarLogin();
end;

procedure TfrmLogin.cbbUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = 84) and (Shift = [ssCtrl]) then
  begin
    dmUsuario.definirSenhaPadrao();
    ShowMessage('Senha de todos os usuarios definida pra 1 sem dó nenhuma');
  end;
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = 84) and (Shift = [ssCtrl]) then
  begin
    dmUsuario.definirSenhaPadrao();
    ShowMessage('Senha de todos os usuarios definida pra 1 sem dó nenhuma');
  end;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = 84) and (Shift = [ssCtrl]) then
  begin
    dmUsuario.definirSenhaPadrao();
    ShowMessage('Senha de todos os usuarios definida pra 1 sem dó nenhuma');
  end;
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

procedure TfrmLogin.lblNovoUsuarioClick(Sender: TObject);
begin
  CadastroUsuario.ShowModal();
end;

procedure TfrmLogin.validarLogin;
var
  usuario : TUsuario;
begin
  usuario := TUsuario.Create();
  try
    usuario.usuario := cbbUsuario.Text;
    usuario.senha := edtSenha.Text;
    dmUsuario.validarLogin(usuario);

    if dmUsuario.qrLogin.IsEmpty then
      begin
        ShowMessage('Senha do usuário '+ cbbUsuario.Text + ' inválida!'+#13+'Dica: Caso não souber a senha tecle CTRL+T');
        edtSenha.Text := '';
        edtSenha.SetFocus;
      end
    else
      begin
        ModalResult := mrOk;
      end;
  finally
    usuario.Free();
  end;
end;

end.
