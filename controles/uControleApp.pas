unit uControleApp;

interface

uses
  uControle, uViewCliente;

type
  TControleApp = class(TControle)
  private
  public
    procedure showVendedorCad();
    procedure showClienteCad();
  end;
  var controleApp: TControleApp;

implementation

uses
  uViewVendedor;

{ TControleApp }

procedure TControleApp.showClienteCad;
begin
  viewClientes.ShowModal;

end;

procedure TControleApp.showVendedorCad;
begin
  viewVendedor.showModal;
end;

end.

