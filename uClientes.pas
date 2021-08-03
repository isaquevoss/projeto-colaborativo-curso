unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, udmClientes, Vcl.ExtCtrls, uCadastroCliente, uClienteClasse;

type
  TForm2 = class(TForm)
    dbgrd1: TDBGrid;
    btnCliente: TButton;
    lblCliente: TLabel;
    edtCliente: TEdit;
    lbqtdclientesencontrados: TLabel;
    TimerBusca: TTimer;
    btn_NovoCliente: TButton;
    procedure btnClienteClick(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumn);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure btn_NovoClienteClick(Sender: TObject);
  private
    { Private declarations }
  public

   procedure mostrarResultadosBusca();
   procedure buscar();

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }


procedure TForm2.btnClienteClick(Sender: TObject);

begin
buscar;

end;
procedure TForm2.btn_NovoClienteClick(Sender: TObject);
begin
    frmCadastroCliente.ShowModal;
end;

procedure TForm2.buscar;
 var
  cliente : TCliente;
begin
cliente := TCliente.Create();
cliente.nome := edtCliente.Text;
TimerBusca.Enabled := false;
Dmclientes.buscarclientes(cliente);
mostrarResultadosBusca();

end;

procedure TForm2.dbgrd1TitleClick(Column: TColumn);
begin
Dmclientes.qrClientes.IndexFieldNames := column.fieldname;
end;

procedure TForm2.edtClienteChange(Sender: TObject);
begin
TimerBusca.Enabled := false;
TimerBusca.Enabled := true;
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

procedure TForm2.TimerBuscaTimer(Sender: TObject);
begin
Buscar();
end;

end.
