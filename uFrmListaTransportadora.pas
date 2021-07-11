unit uFrmListaTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmListaTransportadora = class(TForm)
    dbgrdTransportadora: TDBGrid;
    btnCadastrar: TButton;
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaTransportadora: TfrmListaTransportadora;

implementation
  uses
  uFrmTransportadora;

{$R *.dfm}

procedure TfrmListaTransportadora.btnCadastrarClick(Sender: TObject);
begin
  FrmTransportadora.ShowModal;
end;

end.
