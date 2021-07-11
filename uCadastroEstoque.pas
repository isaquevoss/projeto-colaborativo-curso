unit uCadastroEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmEstoque, uDmConexaoFB;

type
  TfrmCadastroEstoque = class(TForm)
    edtDescricao: TEdit;
    edtQtd: TEdit;
    edtprecoVenda: TEdit;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblQtd: TLabel;
    lblPrecoVenda: TLabel;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEstoque: TfrmCadastroEstoque;

implementation

{$R *.dfm}

procedure TfrmCadastroEstoque.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close();
end;

procedure TfrmCadastroEstoque.btnGravarClick(Sender: TObject);
begin
  try
    DmEstoque.cadastrarEstoque(StrToInt(edtCodigo.Text), edtDescricao.Text, StrToFloat(edtQtd.Text), StrToFloat(edtprecoVenda.Text));
  except on E: Exception do
  begin
    ShowMessage('Não foi possível cadastrar o produto!'+#13+e.Message);
    Exit;
  end;
  end;

  ModalResult := mrOk;
  ShowMessage('Produto cadastrado com sucesso!');
end;

procedure TfrmCadastroEstoque.FormShow(Sender: TObject);
var proxCodigo: string;
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  DmEstoque.proximoCodigo(proxCodigo);
  edtCodigo.Text := proxCodigo;
end;

end.
