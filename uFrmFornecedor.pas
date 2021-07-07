unit uFrmFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmFornecedor = class(TForm)
    Grid_Fornecedor: TDBGrid;
    edt_BuscaFornedr: TEdit;
    lbl_Busca: TLabel;
    tmr_Busca_Forncedr: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

{$R *.dfm}

end.
