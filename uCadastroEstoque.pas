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
    btnLimpar: TButton;
    lblDescricaoIncompleto: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure limparFormulario();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    function validarFormulario : Boolean;
  end;

var
  frmCadastroEstoque: TfrmCadastroEstoque;

implementation

{$R *.dfm}

procedure TfrmCadastroEstoque.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmCadastroEstoque.btnGravarClick(Sender: TObject);
var i : Integer;

begin
  for I := 0 to ComponentCount -1 do
  begin

    if Components[i] is TEdit then
    if TEdit( Components[I] ).Text = '' then
    begin
      ShowMessage('Existem campos em branco, verifique!'#13+ TEdit(Components[i]).TextHint);
      TEdit(Components[i]).SetFocus;
          exit
    end;

  end;

  if not validarFormulario then
    begin
      Exit;
    end
  else
    begin
      lblDescricaoIncompleto.Visible := false;
    end;

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
  limparFormulario();
end;

procedure TfrmCadastroEstoque.btnLimparClick(Sender: TObject);
begin
  limparFormulario();
end;

procedure TfrmCadastroEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (frmCadastroEstoque.edtDescricao.Text <> '') or (frmCadastroEstoque.edtprecoVenda.Text <> '')
  or (frmCadastroEstoque.edtQtd.Text <> '') then
  begin
    if MessageDlg('Deseja cancelar a operação?', mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrNo then
      begin
        Action := caNone;
        Abort;
      end
    else
      begin
        frmCadastroEstoque.limparFormulario();
        DmEstoque.qrEstoque.Close();
      end;
  end;
end;

procedure TfrmCadastroEstoque.FormShow(Sender: TObject);
var proxCodigo: string;
begin
  if not DmConexaoFB.Conexao.Connected then
    DmConexaoFB.conectarBanco();

  DmEstoque.proximoCodigo(proxCodigo);
  edtCodigo.Text := proxCodigo;
end;

procedure TfrmCadastroEstoque.limparFormulario;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      TEdit( Components[i] ).Text := '';
  end;
end;

function TfrmCadastroEstoque.validarFormulario : Boolean;
begin
  Result := True;

  if not (Length(edtDescricao.Text) > 3) then
  begin
    lblDescricaoIncompleto.Caption := 'DESCRIÇÃO DEVE CONTER MAIS QUE 3 CARACTERES';
    lblDescricaoIncompleto.Visible := True;
    edtDescricao.SetFocus;
    Result := False
  end;
end;

end.
