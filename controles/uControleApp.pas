unit uControleApp;

interface

uses
  uControle;

type
  TControleApp = class(TControle)
  private
  public
    procedure showVendedorCad();
  end;
  var controleApp: TControleApp;

implementation

uses
  uViewVendedor;

{ TControleApp }

procedure TControleApp.showVendedorCad;
begin
  viewVendedor.showModal;
end;

end.

