unit uViewCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, ucliente ,uControleCliente;

type
  TviewClientes = class(TForm)
    btCarregarClient: TButton;
    gridClientes: TDBGrid;
    dsCliente: TDataSource;
    procedure btCarregarClientClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewClientes: TviewClientes;

implementation

{$R *.dfm}

procedure TviewClientes.btCarregarClientClick(Sender: TObject);
var
  controleCliente: TControleCliente;
begin
  controleCliente.Create;
  dsCliente.DataSet := controleCliente.getClientesQry();
end;

end.
