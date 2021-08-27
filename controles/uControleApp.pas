unit uControleApp;

interface

uses
  uControle, uClientes;

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
  frmBuscaClientes.ShowModal;

end;

procedure TControleApp.showVendedorCad;
begin
  viewVendedor.showModal;
end;

end.

