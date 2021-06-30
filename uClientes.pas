unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, udmClientes;

type
  TForm2 = class(TForm)
    dbgrd1: TDBGrid;
    btnCliente: TButton;
    lblCliente: TLabel;
    edtCliente: TEdit;
    procedure btnClienteClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }


procedure TForm2.btnClienteClick(Sender: TObject);
begin
Dmclientes.buscarclientes(edtCliente.text);
end;

end.
