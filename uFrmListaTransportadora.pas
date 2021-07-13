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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarLista();
  end;

var
  frmListaTransportadora: TfrmListaTransportadora;

implementation
  uses
  uFrmTransportadora, uDmTransportadora,uDmConexaoFB;

{$R *.dfm}

procedure TfrmListaTransportadora.btnCadastrarClick(Sender: TObject);
begin
  FrmTransportadora.ShowModal;
end;

procedure TfrmListaTransportadora.CarregarLista;
begin
  DmConexaoFB.conectarBanco();
  DmTransportadora.CarregarTransportadora();
end;

procedure TfrmListaTransportadora.FormShow(Sender: TObject);
begin
  CarregarLista();
end;

end.
