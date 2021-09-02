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
    procedure showTransportadoraCad();
  end;
  var controleApp: TControleApp;

implementation

uses
  uViewVendedor, uViewTransportadora;

{ TControleApp }

procedure TControleApp.showClienteCad;
begin
  viewClientes.ShowModal;

end;

procedure TControleApp.showTransportadoraCad;
begin
  viewTransportadora.ShowModal;
end;

procedure TControleApp.showVendedorCad;
begin
  viewVendedor.showModal;
end;

end.

