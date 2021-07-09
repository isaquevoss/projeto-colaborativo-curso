unit ufrmCadastroVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmVendedor;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

end.
