unit uFrmFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, uDmFornecedor;

type
  TFrmFornecedor = class(TForm)
    Grid_Fornecedor: TDBGrid;
    edt_BuscaFornedr: TEdit;
    lbl_Busca: TLabel;
    tmr_Busca_Forncedr: TTimer;
    lbl_qtdRegistros: TLabel;
    btnNovoFornecedr: TButton;
    procedure tmr_Busca_ForncedrTimer(Sender: TObject);
    procedure edt_BuscaFornedrChange(Sender: TObject);
    procedure btnNovoFornecedrClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

{$R *.dfm}
uses
  ufrmCadastroFornecedor;

procedure TFrmFornecedor.btnNovoFornecedrClick(Sender: TObject);
begin
  frmCadastroFornecedr.ShowModal();
end;

procedure TFrmFornecedor.edt_BuscaFornedrChange(Sender: TObject);
begin
 if edt_BuscaFornedr.Text <> '' then
  begin
    tmr_Busca_Forncedr.Enabled := False;
    tmr_Busca_Forncedr.Enabled := True;
  end;

  if edt_BuscaFornedr.Text = '' then
  begin
    dmFornecedor.Qr_fornecedr.SQL.Clear;
    lbl_qtdRegistros.Caption := 'Registros: 0';
    Exit
  end;

end;

procedure TFrmFornecedor.FormShow(Sender: TObject);
begin
  dmFornecedor.carregarFornecedor();
  lbl_qtdRegistros.Caption := 'Registros: '+ IntToStr(dmFornecedor.Qr_fornecedr.RecordCount);
end;
procedure TFrmFornecedor.tmr_Busca_ForncedrTimer(Sender: TObject);
begin
  tmr_Busca_Forncedr.Enabled := False;
  dmFornecedor.buscarFornecedor(edt_BuscaFornedr.Text);

  if dmFornecedor.Qr_fornecedr.RecordCount = 0 then
  begin
      lbl_qtdRegistros.Caption := 'Nenhum registro encontrado!';
      exit
  end;


  lbl_qtdRegistros.Caption := 'Registros: '+ IntToStr(dmFornecedor.Qr_fornecedr.RecordCount);
end;

end.
