unit ufrmVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uDmVendedor;

type
  TfrmVendedores = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure carregarLista();
  end;

var
  frmVendedores: TfrmVendedores;

implementation

uses
  ufrmCadastroVendedor, uDmConexaoFB;

{$R *.dfm}

procedure TfrmVendedores.Button1Click(Sender: TObject);
begin
  if frmCadastroVendedor.ShowModal = mrOk then
  begin
    DmVendedor.carregarVendedores();
  end;
end;

procedure TfrmVendedores.Button2Click(Sender: TObject);
begin

  if DmVendedor.qrVendedores.FieldByName('id').AsInteger > 0 then
  begin
    frmCadastroVendedor.editar(DmVendedor.qrVendedores.FieldByName('id').AsInteger);

    DmVendedor.carregarVendedores();

  end;
end;

procedure TfrmVendedores.carregarLista;
begin
  dmConexaoFB.conectarBanco();
  DmVendedor.carregarVendedores();
end;

procedure TfrmVendedores.FormShow(Sender: TObject);
begin
  carregarLista();
end;

end.

