unit uVersoesExe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, uDmConexaoFB, uDmVersoesExe,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmVersoesExe = class(TForm)
    Grid_Exes: TDBGrid;
    btn_Carregar: TButton;
    Nav_Versoes: TDBNavigator;
    procedure btn_CarregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVersoesExe: TfrmVersoesExe;

implementation

{$R *.dfm}

procedure TfrmVersoesExe.btn_CarregarClick(Sender: TObject);
begin
  dmVersoes.carregarProdutos();
end;

end.
