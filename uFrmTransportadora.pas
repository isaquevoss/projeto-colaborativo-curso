unit uFrmTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmTransportadora;

type
  TFrmTransportadora = class(TForm)
    edtNome: TEdit;
    lblNome: TLabel;
    lblEndereco: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lblRntrc: TLabel;
    lblCnpj: TLabel;
    edtCnpj: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    cbxUF: TComboBox;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtRntrc: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparFormulario();
  end;

var
  FrmTransportadora: TFrmTransportadora;

implementation

{$R *.dfm}

procedure TFrmTransportadora.btnSalvarClick(Sender: TObject);
begin
  DmTransportadora.Cadastrar(edtNome.Text,edtEndereco.Text,edtCidade.Text,cbxUF.Text,edtTelefone.Text,edtEmail.Text,edtCnpj.Text,edtRntrc.Text);
end;

procedure TFrmTransportadora.FormShow(Sender: TObject);
begin
 LimparFormulario();
end;

procedure TFrmTransportadora.LimparFormulario;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if Components[i] is TEdit then
      TEdit(Components[i]).Text := '';

    end;


end;

end.
