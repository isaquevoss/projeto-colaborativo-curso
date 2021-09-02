unit uViewTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, uTransportadora, System.Generics.Collections,uControleTransportadora;

type
  TviewTransportadora = class(TForm)
    dbgrdTransportadora: TDBGrid;
    btnCarregar: TButton;
    DsTrasportadora: TDataSource;
    strTransportadora: TStringGrid;
    procedure btnCarregarClick(Sender: TObject);
  private
    Ftransportadora: TList<TTransportadora>;
  public
    procedure carregarTransportadora();
    property transportadora: TList<TTransportadora> read Ftransportadora write Ftransportadora;

  end;

var
  viewTransportadora: TviewTransportadora;

implementation

{$R *.dfm}

procedure TviewTransportadora.btnCarregarClick(Sender: TObject);
begin
  DsTrasportadora.DataSet := controleTransportadora.getTransportadoraQry();
end;

procedure TviewTransportadora.carregarTransportadora;
var
  i: Integer;
begin
  transportadora := controleTransportadora.getTransportadora();
  for i := 0 to transportadora.Count -1 do
  begin
    strTransportadora.Cells[0,0] := transportadora[i].Frazao;
  end;

end;

end.

