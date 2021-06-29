unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uVersoesExe;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    btn_Versoes: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btn_VersoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses
    uItensVendidosPorDia;

{$R *.dfm}

procedure TForm1.btn_VersoesClick(Sender: TObject);
begin
 frmVersoesExe.ShowModal;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmItensVendidosPorDia.Show();
end;

end.

