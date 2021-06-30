unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses
    uItensVendidosPorDia, uClientes;
    uItensVendidosPorDia,uVendasPorCliente;


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmItensVendidosPorDia.Show();
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
form2.Show();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
frmVendasPorCliente.Show();
end;

end.


