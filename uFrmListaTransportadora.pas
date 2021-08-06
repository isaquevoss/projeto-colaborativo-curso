unit uFrmListaTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmListaTransportadora = class(TForm)
    dbgrdTransportadora: TDBGrid;
    btnCadastrar: TButton;
    Label1: TLabel;
    edt_BuscarRzTransp: TEdit;
    tmr_BuscaTransp: TTimer;
    lbl_qtdRegistros: TLabel;
    btnEditar: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_BuscarRzTranspChange(Sender: TObject);
    procedure tmr_BuscaTranspTimer(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
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

procedure TfrmListaTransportadora.btnEditarClick(Sender: TObject);
begin
  if DmTransportadora.qrTransportadora.FieldByName('codigo').AsInteger >0 then
  begin
    FrmTransportadora.editar(DmTransportadora.qrTransportadora.FieldByName('codigo').AsInteger);
    DmTransportadora.CarregarTransportadora;
  end;

end;

procedure TfrmListaTransportadora.CarregarLista;
begin
  DmTransportadora.CarregarTransportadora();

  lbl_qtdRegistros.Caption := 'Registros: '+ IntToStr(DmTransportadora.qrTransportadora.RecordCount);
end;

procedure TfrmListaTransportadora.edt_BuscarRzTranspChange(Sender: TObject);
begin
  if edt_BuscarRzTransp.Text <> '' then
  begin
    tmr_BuscaTransp.Enabled := False;
    tmr_BuscaTransp.Enabled := True;
  end;

  if edt_BuscarRzTransp.Text = '' then
  begin
    DmTransportadora.qrTransportadora.SQL.Clear;
    lbl_qtdRegistros.Caption := 'Registros: 0';
    Exit
  end;
end;

procedure TfrmListaTransportadora.FormShow(Sender: TObject);
begin
  CarregarLista();

end;

procedure TfrmListaTransportadora.tmr_BuscaTranspTimer(Sender: TObject);
begin
  tmr_BuscaTransp.Enabled := False;
  DmTransportadora.BuscarTransp(edt_BuscarRzTransp.Text);

  if DmTransportadora.qrTransportadora.RecordCount = 0 then
  begin
      lbl_qtdRegistros.Caption := 'Nenhum registro encontrado!';
      exit
  end;


  lbl_qtdRegistros.Caption := 'Registros: '+ IntToStr(DmTransportadora.qrTransportadora.RecordCount);
end;

end.
