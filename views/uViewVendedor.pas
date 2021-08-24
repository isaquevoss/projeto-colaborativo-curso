unit uViewVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uVendedor, uControleVendedor,
  system.Generics.collections, Vcl.StdCtrls;

type
  TviewVendedor = class(TForm)
    StringGrid1: TStringGrid;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    Fvendedores: TList<TVendedor>;
    { Private declarations }
  public
    procedure carregarVendedores();
    property vendedores: TList<TVendedor> read Fvendedores write Fvendedores;
  end;

var
  viewVendedor: TviewVendedor;

implementation

{$R *.dfm}

{ TviewVendedor }

procedure TviewVendedor.Button1Click(Sender: TObject);
begin
  DataSource1.DataSet := controleVendedor.getVendedoresQry();
end;

procedure TviewVendedor.carregarVendedores;
var
  i: Integer;
begin
  vendedores := controleVendedor.getVendedores();
  for i := 0 to vendedores.Count - 1 do
  begin
    StringGrid1.Cells[0,0] := vendedores[i].nome;
  end;
end;

end.

