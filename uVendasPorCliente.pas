unit uVendasPorCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids,uDmVendasPorCliente;

type
  TfrmVendasPorCliente = class(TForm)
    dbgrdVendasPorCliente: TDBGrid;
    dtpEmisaoInicial: TDateTimePicker;
    edtCliente: TEdit;
    btnBuscar: TButton;
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendasPorCliente: TfrmVendasPorCliente;

implementation

{$R *.dfm}

procedure TfrmVendasPorCliente.btnBuscarClick(Sender: TObject);
begin

  dmVendasPorCliente.buscarVendas(edtCliente.Text,dtpEmisaoInicial.DateTime);

end;

end.
