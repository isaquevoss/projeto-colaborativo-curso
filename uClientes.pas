unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, udmClientes;

type
  TForm2 = class(TForm)
    dbgrd1: TDBGrid;
    btnCliente: TButton;
    lblCliente: TLabel;
    edtCliente: TEdit;
    lbqtdclientesencontrados: TLabel;
    procedure btnClienteClick(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public

   procedure mostrarResultadosBusca();

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }


procedure TForm2.btnClienteClick(Sender: TObject);
begin
Dmclientes.buscarclientes(edtCliente.text);
mostrarResultadosBusca()
end;

procedure TForm2.dbgrd1TitleClick(Column: TColumn);
begin
Dmclientes.qrClientes.IndexFieldNames := column.fieldname;
end;

procedure TForm2.mostrarResultadosBusca;
begin

  if dmClientes.qrClientes.RecordCount = 0 then
  begin
    lbqtdclientesencontrados.Caption := 'Nenhum cliente encontrado';
    ShowMessage('Não foram encontrados clientes com esse nome ' + edtCliente.Text);
    exit;
  end;


  lbqtdclientesencontrados.Caption := 'Foram encontrados ' + IntToStr(dmClientes.qrclientes.RecordCount);

end;

end.
