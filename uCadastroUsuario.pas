unit uCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmConexaoFB, uDmUsuario, uUsuarioClasse;

type
  TCadastroUsuario = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroUsuario: TCadastroUsuario;

implementation

{$R *.dfm}


procedure TCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TCadastroUsuario.btnGravarClick(Sender: TObject);
var
  usuario : TUsuario;
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  usuario := TUsuario.Create();
  try
    usuario.usuario := edtUsuario.Text;
    usuario.senha := edtSenha.Text;
      try
        dmUsuario.cadastrarUsuario(usuario);
      except on E: Exception do
        begin
          ShowMessage('Não foi possível salvar o usuário!'+#13+e.Message);
          Abort;
        end;
      end;

    ShowMessage('Usuário cadastrado com sucesso!');
    edtUsuario.Text := '';
    edtSenha.Text := '';
  finally
    usuario.Free();
  end;

end;

end.
