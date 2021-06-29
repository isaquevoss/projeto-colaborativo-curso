unit uItensVendidosPorDia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, uDmItensVendidosPorDia;

type
  TfrmItensVendidosPorDia = class(TForm)
    Grid: TDBGrid;
    EdDescricaoProduto: TEdit;
    BtBuscar: TButton;
    Label1: TLabel;
    procedure BtBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItensVendidosPorDia: TfrmItensVendidosPorDia;

implementation

{$R *.dfm}

procedure TfrmItensVendidosPorDia.BtBuscarClick(Sender: TObject);
begin
  DmItensVendidosPorDia.buscarProdutos(EdDescricaoProduto.Text);
end;

end.
