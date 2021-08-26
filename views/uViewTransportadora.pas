unit uViewTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TviewTransportadora = class(TForm)
    dbgrdTransportadora: TDBGrid;
    btnCarregar: TButton;
    DsTrasportadora: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewTransportadora: TviewTransportadora;

implementation

{$R *.dfm}

end.
