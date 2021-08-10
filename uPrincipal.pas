unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uVersoesExe, Vcl.StdCtrls, uEstoque;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    btn_Versoes: TButton;
    Button4: TButton;
    Button5: TButton;
    Button3: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btn_VersoesClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses
    uItensVendidosPorDia, uClientes,
    uVendasPorCliente, uFrmFornecedor, uFrmListaTransportadora,
  ufrmCadastroVendedor, ufrmVendedores, uTesteValidarFormatarDados,
  uFrmValidarFormulario;


{$R *.dfm}

procedure TForm1.btn_VersoesClick(Sender: TObject);
begin
 frmVersoesExe.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmItensVendidosPorDia.Show();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  frmEstoque.Show();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  frmFornecedor.Show();
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  frmBuscaClientes.Show();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
frmVendasPorCliente.Show();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  frmListaTransportadora.Show();
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  frmVendedores.Show();
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  FrmValidarFormatarDados.Show();
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  frmValidarFormulario.Show();
end;
end.


