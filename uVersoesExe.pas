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
    edt_buscar: TEdit;
    tmr_Buscar: TTimer;
    lbl1: TLabel;
    procedure btn_CarregarClick(Sender: TObject);
    procedure tmr_BuscarTimer(Sender: TObject);
    procedure edt_buscarChange(Sender: TObject);
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

procedure TfrmVersoesExe.edt_buscarChange(Sender: TObject);
begin
  if dmVersoes.qrVersoes.SQL.Count = 0 then
  begin
    ShowMessage('Clique em "Carregar" antes de fazer a busca!');
    edt_buscar.Text := '';
    Exit
  end;

  if edt_buscar.Text <> '' then
  begin
    tmr_Buscar.Enabled := False;
    tmr_Buscar.Enabled := True;
  end;


end;

procedure TfrmVersoesExe.tmr_BuscarTimer(Sender: TObject);
begin
    tmr_Buscar.Enabled := False;
    dmVersoes.buscarPorDescricao(edt_buscar.Text);
end;

end.
