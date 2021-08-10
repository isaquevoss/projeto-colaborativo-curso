unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, udmClientes, Vcl.ExtCtrls, uCadastroCliente, uClienteClasse;

type
  TfrmBuscaClientes = class(TForm)
    dbgrd1: TDBGrid;
    btnCliente: TButton;
    lblCliente: TLabel;
    edtCliente: TEdit;
    lbqtdclientesencontrados: TLabel;
    TimerBusca: TTimer;
    btn_NovoCliente: TButton;
    btnEditar: TButton;
    procedure btnClienteClick(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumn);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure btn_NovoClienteClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

    procedure mostrarResultadosBusca();
    procedure buscar();

  end;

var
  frmBuscaClientes: TfrmBuscaClientes;

implementation

{$R *.dfm}
{ TForm2 }

procedure TfrmBuscaClientes.btnClienteClick(Sender: TObject);

begin
  buscar;

end;

procedure TfrmBuscaClientes.btnEditarClick(Sender: TObject);
begin
  if Dmclientes.qrClientes.FieldByName('codigo').AsInteger > 0 then
  begin
    frmCadastroCliente.editar(Dmclientes.qrClientes.FieldByName('codigo')
      .AsInteger);

    Dmclientes.carregarClientes();

  end;
end;

procedure TfrmBuscaClientes.btn_NovoClienteClick(Sender: TObject);
begin
  frmCadastroCliente.ShowModal;
end;

procedure TfrmBuscaClientes.buscar;
var
  cliente: TCliente;
begin
  cliente := TCliente.Create();
  cliente.nome := edtCliente.Text;
  TimerBusca.Enabled := false;
  Dmclientes.buscarclientes(cliente);
  mostrarResultadosBusca();

end;

procedure TfrmBuscaClientes.dbgrd1TitleClick(Column: TColumn);
begin
  Dmclientes.qrClientes.IndexFieldNames := Column.fieldname;
end;

procedure TfrmBuscaClientes.edtClienteChange(Sender: TObject);
begin
  TimerBusca.Enabled := false;
  TimerBusca.Enabled := true;
end;

procedure TfrmBuscaClientes.FormShow(Sender: TObject);
begin
  Dmclientes.carregarClientes;
end;

procedure TfrmBuscaClientes.mostrarResultadosBusca;
begin

  if Dmclientes.qrClientes.RecordCount = 0 then
  begin
    lbqtdclientesencontrados.Caption := 'Nenhum cliente encontrado';
    ShowMessage('Não foram encontrados clientes com esse nome ' +
      edtCliente.Text);
    exit;
  end;

  lbqtdclientesencontrados.Caption := 'Foram encontrados ' +
    IntToStr(Dmclientes.qrClientes.RecordCount);

end;

procedure TfrmBuscaClientes.TimerBuscaTimer(Sender: TObject);
begin
  buscar();
end;

end.
